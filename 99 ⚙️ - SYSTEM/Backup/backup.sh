#!/bin/bash
#
# Backup semanal do vault Nexus OS.
#
# Duas camadas, no mesmo repositório PRIVADO do GitHub:
#   1. CLARO   → conteúdo do vault + memórias do Claude. Texto versionado.
#   2. CIFRADO → arquivos Credenciais.md (bloqueados no .gitignore). Vai como .gpg, ilegível sem a senha.
#
# A senha NUNCA fica neste arquivo. Ela mora no Keychain do macOS.
# Setup e restauração: ver RESTAURAR.md nesta mesma pasta.
#
# Uso:  ./backup.sh            → backup completo
#       ./backup.sh --dry-run  → mostra o que faria, sem commitar nem enviar
#
set -uo pipefail

DRY_RUN=0
[ "${1:-}" = "--dry-run" ] && DRY_RUN=1 && printf "%s\n\n" "▸ MODO TESTE: nada será commitado nem enviado"

BK="$(cd "$(dirname "$0")" && pwd)"
VAULT="$(cd "$BK/../.." && pwd)"
COFRE="$BK/cofre"
STATUS="$BK/ultimo-backup.txt"
KEYCHAIN_ITEM="nexus-os-backup"

# o Claude Code guarda as memórias do projeto numa pasta com o caminho do vault "achatado"
MEM_DIR="$HOME/.claude/projects/$(printf '%s' "$VAULT" | sed 's/[^A-Za-z0-9]/-/g')/memory"

erros=()
aviso() { echo "  ⚠️  $1"; erros+=("$1"); }
ok()    { echo "  ✓  $1"; }

notificar() {
  osascript -e "display notification \"$2\" with title \"Backup Nexus OS\" subtitle \"$1\"" 2>/dev/null || true
}

echo "═══ Backup do vault — $(date '+%d/%m/%Y %H:%M') ═══"
echo "    $VAULT"
echo ""

# ─────────────────────────────────────────────────────────────
# 1. Memórias do Claude (ficam fora do vault, precisam ser copiadas)
# ─────────────────────────────────────────────────────────────
echo "1. Memórias do Claude"
if [ -d "$MEM_DIR" ]; then
  mkdir -p "$BK/memory"
  rsync -a --delete "$MEM_DIR/" "$BK/memory/" && \
    ok "$(ls -1 "$BK/memory" | wc -l | tr -d ' ') arquivos sincronizados" || \
    aviso "rsync das memórias falhou"
else
  ok "nenhuma memória do Claude ainda (normal num vault novo)"
fi
echo ""

# ─────────────────────────────────────────────────────────────
# 2. Cofre cifrado (Credenciais.md)
# ─────────────────────────────────────────────────────────────
echo "2. Cofre cifrado"
n_cred=$(find "$VAULT" -name "Credenciais.md" -not -path "*/.git/*" 2>/dev/null | wc -l | tr -d ' ')
if [ "$n_cred" = "0" ]; then
  ok "nenhum Credenciais.md no vault, cofre não necessário"
else
  SENHA=$(security find-generic-password -s "$KEYCHAIN_ITEM" -w 2>/dev/null)
  if [ -z "$SENHA" ]; then
    aviso "senha não encontrada no Keychain (item '$KEYCHAIN_ITEM'). $n_cred Credenciais.md FORA do backup. Ver RESTAURAR.md"
  elif ! command -v gpg >/dev/null 2>&1; then
    aviso "gpg não instalado. Cofre NÃO atualizado. Rode: brew install gnupg"
  else
    TMP=$(mktemp -d)
    while IFS= read -r c; do
      rel="${c#$VAULT/}"
      mkdir -p "$TMP/cofre/$(dirname "$rel")"
      cp "$c" "$TMP/cofre/$rel"
    done < <(find "$VAULT" -name "Credenciais.md" -not -path "*/.git/*" 2>/dev/null)
    tar -czf "$TMP/cofre.tar.gz" -C "$TMP" cofre

    # só re-cifra se o conteúdo mudou (evita inchar o histórico do git toda semana)
    HASH_NOVO=$(shasum -a 256 "$TMP/cofre.tar.gz" | cut -d' ' -f1)
    HASH_ANT=$(cat "$BK/.cofre-hash" 2>/dev/null || echo "")
    if [ "$HASH_NOVO" = "$HASH_ANT" ]; then
      ok "cofre inalterado ($n_cred arquivos)"
    elif printf '%s' "$SENHA" | gpg --batch --yes --quiet \
           --passphrase-fd 0 --pinentry-mode loopback \
           --symmetric --cipher-algo AES256 \
           --output "$COFRE.tar.gz.gpg" "$TMP/cofre.tar.gz" 2>/dev/null; then
      echo "$HASH_NOVO" > "$BK/.cofre-hash"
      ok "cofre cifrado com $n_cred arquivos"
    else
      aviso "gpg falhou ao cifrar o cofre"
    fi
    rm -rf "$TMP"
    unset SENHA
  fi
fi
echo ""

# ─────────────────────────────────────────────────────────────
# 3. Guarda de segurança: nada em claro que pareça segredo
# ─────────────────────────────────────────────────────────────
echo "3. Verificação de segredo em claro"
cd "$VAULT" || exit 1
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "FALHA $(date '+%Y-%m-%d %H:%M') — o vault não é um repositório git. Ver RESTAURAR.md" > "$STATUS"
  notificar "FALHA" "O vault não é um repositório git"
  exit 1
fi
vazou=$(git add -A --dry-run 2>/dev/null | sed "s/^add '//;s/'$//" | while IFS= read -r f; do
  [ -f "$f" ] || continue
  case "$f" in (*.png|*.jpg|*.jpeg|*.webp|*.gif|*.pdf|*.mp4|*.mov|*.zip|*.gpg) continue ;; esac
  grep -lIE "sk-[A-Za-z0-9_-]{20}|AIza[A-Za-z0-9_-]{30}|ghp_[A-Za-z0-9]{30}|-----BEGIN [A-Z ]*PRIVATE KEY|\"refresh_token\"|\"client_secret\"|xox[baprs]-[A-Za-z0-9-]{20}|AKIA[0-9A-Z]{16}" "$f" 2>/dev/null
done | head -5)

if [ -n "$vazou" ]; then
  echo "  🚨 ABORTADO: segredo em texto claro detectado em:"
  echo "$vazou" | sed 's/^/       /'
  notificar "ABORTADO" "Segredo em texto claro detectado. Nada foi commitado."
  { echo "FALHA $(date '+%Y-%m-%d %H:%M') — abortado: segredo em claro"; echo "$vazou"; } > "$STATUS"
  exit 1
fi
ok "nenhum segredo em texto claro"
echo ""

# ─────────────────────────────────────────────────────────────
# 4. Commit e push
# ─────────────────────────────────────────────────────────────
echo "4. Commit e push"
RAMO=$(git branch --show-current)
if [ "$DRY_RUN" = "1" ]; then
  ok "[teste] $(git add -A --dry-run 2>/dev/null | wc -l | tr -d ' ') arquivo(s) entrariam no commit"
else
  git add -A
  if git diff --cached --quiet; then
    ok "nada mudou desde o último backup"
  else
    n=$(git diff --cached --numstat | wc -l | tr -d ' ')
    git commit -q -m "Backup automático — $(date '+%d/%m/%Y')" && ok "commit de $n arquivos" || aviso "commit falhou"
  fi
  if GIT_TERMINAL_PROMPT=0 git push -q origin "$RAMO" 2>/dev/null; then
    ok "push concluído"
  else
    aviso "PUSH FALHOU — o backup está só nesta máquina"
  fi
fi
echo ""

# ─────────────────────────────────────────────────────────────
# 5. Status (é isto que denuncia falha silenciosa)
# ─────────────────────────────────────────────────────────────
if [ ${#erros[@]} -eq 0 ]; then
  echo "OK $(date '+%Y-%m-%d %H:%M') — backup completo" > "$STATUS"
  echo "═══ Backup OK ═══"
else
  { echo "ATENÇÃO $(date '+%Y-%m-%d %H:%M') — backup com ${#erros[@]} problema(s):"
    printf '  - %s\n' "${erros[@]}"; } > "$STATUS"
  notificar "Backup com problemas" "${#erros[@]} item(ns) precisam de atenção. Ver ultimo-backup.txt"
  echo "═══ Backup terminou com ${#erros[@]} problema(s) ═══"
fi
