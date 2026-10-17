# 99 ⚙️ - SYSTEM

Cérebro operacional do Claude: playbooks detalhados (lidos sob demanda pela tabela de roteamento do `CLAUDE.md` raiz), logs diários, backup e status do vault.

## Estrutura

```
onboarding-empresa.md · inbox.md · onboarding-cliente.md · clientes.md · financas.md · agendamento.md · tom-de-voz.md · comandos.md
                       ← playbooks (a tabela de roteamento do CLAUDE.md raiz diz quando ler cada um)
Status Operacional.md  ← o que está ativo, vazio ou em construção no vault
Backup/                ← backup semanal no GitHub + guia de restauração (RESTAURAR.md)
Logs/                  ← um arquivo por dia: YYYY-MM-DD.md (nasce com o primeiro log)
```

## Regras

- **Log obrigatório:** após qualquer tarefa que altere o vault, anexar linha em `Logs/<hoje>.md` (criar se não existir): `- HH:MM — o que foi feito (arquivos/áreas afetados)`.
- Logs são histórico imutável: nunca reescrever dias passados.
- Correção do usuário que vale sempre → "Preferências aprendidas" no `CLAUDE.md` raiz; específica de um workflow → no playbook correspondente. Registrar a mudança no log.
- Playbook novo: nome minúsculo-com-hífen (`novo-fluxo.md`) + linha na tabela de roteamento do `CLAUDE.md` raiz.
- `Status Operacional.md` é atualizado a cada mudança estrutural e quando o usuário roda `/status`.
