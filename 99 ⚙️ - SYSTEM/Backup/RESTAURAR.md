---
type: system
status: active
area: operations
tags: [backup, restauracao]
---

# Backup e restauração do vault

> **Objetivo:** perder o computador e voltar a operar em outra máquina clonando um repositório e digitando uma senha.

## Como funciona

Um repositório **privado** no GitHub recebe, todo domingo às 20h:

| Camada | O que tem | Formato |
|---|---|---|
| **Claro** | O vault inteiro + as memórias do Claude deste vault | texto, versionado |
| **Cifrado** | Os arquivos `Credenciais.md` (que o `.gitignore` bloqueia) | `cofre.tar.gz.gpg`, AES-256 |

O cofre pode morar no mesmo repositório porque está cifrado: sem a senha ele é um arquivo inútil. A senha nunca entra no repositório nem no script, ela fica no **Keychain do macOS** e no seu gerenciador de senhas.

O script também **aborta sozinho** se encontrar chave de API em texto claro prestes a ser enviada. Melhor um backup que não roda do que um que vaza segredo.

> Este backup é pra macOS. Em Windows ou Linux, o mesmo princípio vale (git privado + agendamento semanal), com outra ferramenta de agendamento.

---

## Setup (uma vez, nesta máquina)

Peça ao Claude: **"configura o backup do vault"**. Ele roda os passos abaixo com você. Pra fazer à mão, no Terminal, de dentro da pasta do vault:

### 1. Apontar o vault pro seu repositório privado

Crie um repositório **privado** vazio no GitHub e:

```bash
git remote set-url origin https://github.com/<seu-usuario>/<seu-repositorio>.git
```

(Se o vault não veio de um `git clone`, rode `git init` antes e use `git remote add origin ...`.) **Nunca** aponte pro repositório público do template.

### 2. Senha do cofre (só se for guardar `Credenciais.md`)

```bash
brew install gnupg
security add-generic-password -a "$USER" -s "nexus-os-backup" -w
```

O terminal pede a senha sem mostrar. Guarde a mesma senha no gerenciador de senhas. **Perdeu a senha, perdeu o cofre.**

### 3. Testar

```bash
"99 ⚙️ - SYSTEM/Backup/backup.sh" --dry-run
"99 ⚙️ - SYSTEM/Backup/backup.sh"
```

### 4. Agendar (todo domingo às 20h)

```bash
sed "s|CAMINHO_DO_VAULT|$PWD|g" "99 ⚙️ - SYSTEM/Backup/com.nexusos.backup.plist" > ~/Library/LaunchAgents/com.nexusos.backup.plist
launchctl load ~/Library/LaunchAgents/com.nexusos.backup.plist
```

Se o Mac estiver desligado na hora, o agendamento roda assim que ele voltar.

---

## Restaurar em outra máquina

```bash
git clone https://github.com/<seu-usuario>/<seu-repositorio>.git "<pasta-do-vault>"
cd "<pasta-do-vault>"
```

Pronto: todo o conteúdo voltou. Faltam as memórias do Claude e o cofre.

**Memórias do Claude:**

```bash
DEST="$HOME/.claude/projects/$(printf '%s' "$PWD" | sed 's/[^A-Za-z0-9]/-/g')"
mkdir -p "$DEST" && cp -R "99 ⚙️ - SYSTEM/Backup/memory" "$DEST/"
```

**Cofre** (se existir `cofre.tar.gz.gpg`):

```bash
cd "99 ⚙️ - SYSTEM/Backup"
gpg --decrypt cofre.tar.gz.gpg > cofre.tar.gz && tar -xzf cofre.tar.gz
cp -R cofre/* ../../ && rm -rf cofre cofre.tar.gz
```

Depois, refazer os passos 2 e 4 do setup nesta máquina nova.

---

## Como saber que está funcionando

O risco de backup automático não é falhar, é **falhar em silêncio**. A cada execução o script grava `ultimo-backup.txt` nesta pasta:

- `OK` + data → tudo certo
- `ATENÇÃO` ou `FALHA` → problema listado logo abaixo, e o Mac mostra uma notificação

**Hábito:** uma vez por mês, conferir se a data em `ultimo-backup.txt` é recente. **Uma vez por semestre**, clonar o repositório numa pasta temporária e seguir a restauração até o fim. Backup nunca restaurado não é backup, é esperança.

## O que não entra no backup

- Repositórios git próprios dentro do vault (sites, apps): cada um tem o seu remoto.
- `node_modules/` e builds: recuperáveis com `npm install`.
- Conexões do Claude com Gmail, Drive, Calendar etc.: ficam na conta Claude e voltam ao entrar nela.
