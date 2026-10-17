---
tags: [onboarding, setup]
---

# Bem-vindo ao Nexus OS

> [!tip] Este vault é o sistema operacional da sua empresa, e quem opera é o Claude.
> Você conversa; ele escreve, organiza, salva no lugar certo e registra o que fez.

---

## Passo 1 — Abrir no Obsidian

No Obsidian: **Abrir pasta como vault** → selecione esta pasta.

Ative as cores das pastas: **Settings → Appearance → CSS snippets → folder-colors**.

## Passo 2 — Abrir o Claude Code nesta pasta

No Terminal, dentro da pasta do vault:

```bash
claude
```

## Passo 3 — Configurar a empresa

Envie ao Claude:

```
Iniciar Onboarding
```

Ele faz as perguntas em blocos curtos, mostra o que vai salvar e pede sua confirmação antes de gravar. Leva de 30 a 60 minutos e pode ser pausado: depois é só mandar `/onboarding` pra continuar de onde parou.

## Passo 4 — Ligar o backup

Envie: **"configura o backup do vault"**. Guia completo em [[99 ⚙️ - SYSTEM/Backup/RESTAURAR|RESTAURAR]].

---

## O dia a dia

| Você quer... | Faça |
|---|---|
| Anotar algo rápido | Peça "anota no inbox: ..." ou crie a nota em `00 📥 - INBOX` |
| Organizar o que foi anotado | `/inbox` |
| Planejar a semana | `/semana` |
| Criar uma tarefa | "cria tarefa: ..." |
| Registrar um cliente novo | "fechei um cliente novo: ..." |
| Gerar um relatório ou dashboard | `/generate relatório de vendas do mês` |
| Achar alguma coisa | `/search termo` |
| Ver como está o vault | `/status` |
| Conferir se está tudo organizado | `/audit` |

Você não precisa decorar nada: pedir em linguagem natural funciona igual.

## Como o vault é organizado

| Pasta | Pra quê |
|---|---|
| `00 📥 - INBOX` | Tudo que chega, antes de organizar |
| `01 ⚡ - TASKS` | Tarefas e o Dashboard da semana |
| `02 🏢 - COMPANY` | A empresa inteira: identidade, vendas, clientes, finanças, time... |
| `03 🧠 - KNOWLEDGE` | O que vale saber daqui a um ano |
| `04 📋 - SOPS` | Como a empresa faz as coisas, passo a passo |
| `98 📄 - TEMPLATES` | Modelos de arquivo |
| `99 ⚙️ - SYSTEM` | Regras do Claude, logs e backup |

As pastas começam vazias de propósito: cada uma ganha conteúdo quando a sua empresa precisar dele.

Manual do Claude → [[CLAUDE]]
