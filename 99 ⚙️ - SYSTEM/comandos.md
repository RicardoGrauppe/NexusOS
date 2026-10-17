---
type: system
status: active
---

# Playbook — Prefixos e Comandos

Prefixos são opcionais: deixam o pedido mais claro, mas pedido em linguagem natural vale igual. Os comandos `/...` existem de verdade no Claude Code (`.claude/commands/`) e cada um aponta pra uma seção daqui.

## Prefixos

| Prefixo | O que o Claude faz |
|---|---|
| `[CRIAR]` | Cria no lugar certo, a partir do template, com frontmatter e link no índice |
| `[EDITAR]` | Lê o arquivo atual e altera só o pedido |
| `[GERAR]` | Gera peça (ver `/generate`) |
| `[MOVER]` | Move, ajusta `status:`/índices e confirma antes se for em massa |
| `[DELETAR]` | Lista o que vai apagar, pede confirmação, registra a exclusão no log |
| `[BUSCAR]` | Ver `/search` |
| `[RESUMIR]` | Resume com link pros arquivos de origem |
| `[ESTRUTURA]` | Propõe a mudança, espera aprovação, aplica e atualiza o `CLAUDE.md` da pasta |

## /audit

Varre o vault e devolve relatório (sem alterar nada):
- Pastas vazias ou subpastas fora da estrutura prevista nos `CLAUDE.md`
- Arquivos fora do padrão de nome (data `YYYY-MM-DD`, Title Case)
- Arquivos sem frontmatter ou com `type`/`status`/`area` faltando
- Itens parados no Inbox há mais de 7 dias
- Tarefas com `status:` diferente do estágio onde estão
- Arquivos sem link no índice da área
- Links quebrados e arquivos vazios criados por link solto na raiz
- Possível senha ou chave de API em nota comum

## /cleanup

Executa as correções do último `/audit`. Lista tudo antes, pede confirmação, aplica e registra no log. Exclusões seguem a regra de exclusão do `CLAUDE.md` raiz.

## /status

Lê o vault e atualiza `99 ⚙️ - SYSTEM/Status Operacional.md`: por pasta, o que tem conteúdo real, o que está vazio, pendências do setup. Mostra o resumo no chat.

## /inbox

Segue `99 ⚙️ - SYSTEM/inbox.md`.

## /semana

Segue "Planejar a semana" em `01 ⚡ - TASKS/CLAUDE.md`.

## /generate <tipo> <descrição>

Gera dashboard, relatório, HTML, apresentação ou análise.
1. Ler `tom-de-voz.md` se a peça vai sair do vault.
2. Buscar os dados no vault; o que faltar, perguntar. Separar dado de hipótese.
3. Salvar junto do dono, em `Reports/` da área ou do cliente: `YYYY-MM-DD - <Tipo> - <Título>.<ext>`. Atualização = arquivo novo com a data do dia.
4. HTML é autocontido (abre sozinho, sem servidor).
5. Link no índice da área + log.

## /archive <arquivo ou cliente>

- Arquivo: `status: archived` no frontmatter, link movido pra seção de arquivados do índice. Não move de pasta.
- Cliente: segue "Encerrar um cliente" em `clientes.md`.

## /search <termo>

Busca em todo o vault (nome e conteúdo) e devolve os arquivos com o trecho relevante, agrupados por pasta.

## /onboarding

Segue `99 ⚙️ - SYSTEM/onboarding-empresa.md`, retomando do primeiro bloco pendente.
