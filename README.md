# 🧠 Nexus OS — O Segundo Cérebro da Sua Empresa

> **Um sistema de gestão do conhecimento empresarial, construído no Obsidian e operado pelo Claude.**

![Version](https://img.shields.io/badge/versão-v2.0-blue)
![Built with Obsidian](https://img.shields.io/badge/built%20with-Obsidian-7C3AED)
![Powered by Claude](https://img.shields.io/badge/powered%20by-Claude-FF6B35)
![License](https://img.shields.io/badge/licença-MIT-green)

---

## O problema que isso resolve

Toda empresa acumula conhecimento, e a maioria deixa ele espalhado em e-mails, planilhas desatualizadas, documentos no Drive de ninguém e na cabeça de pessoas-chave.

Quando alguém sai, o conhecimento vai junto. Quando a equipe cresce, os processos se perdem. Quando o dono precisa de um número, ninguém sabe onde está.

## O que é o Nexus OS

Um vault do Obsidian com estrutura, regras e playbooks prontos, em que **o Claude é o operador**. Você conversa com ele como conversaria com um assistente executivo: ele cria documentos, mantém as tarefas da semana, registra clientes, gera relatórios, salva cada coisa no lugar certo e anota tudo num log diário.

O template vem **limpo**: nenhuma pasta vazia, nenhum dado de exemplo. Ele cresce com a empresa, a partir de uma conversa de onboarding.

---

## Como funciona na prática

```
Você:    Iniciar Onboarding
Claude:  Faz as perguntas em blocos curtos (identidade, mercado, oferta, time, metas),
         mostra o que vai salvar, pede confirmação e cria os documentos da empresa.
```

```
Você:    fechei um cliente novo, a Acme
Claude:  Faz o diagnóstico, cria a pasta e o Overview do cliente, abre as tarefas de início,
         pergunta se é pra registrar o valor no financeiro e anota no log.
```

```
Você:    /semana
Claude:  Lê as tarefas, mostra o que está arrastando há semanas e monta o plano por dia.
```

---

## Estrutura — 7 pastas

```
📁 NEXUS OS
├── ! 🚀 START HERE.md      ← primeiros passos
├── CLAUDE.md               ← orquestração: mapa, regras e roteamento (lido em toda sessão)
│
├── 00 📥 - INBOX           ← captura rápida, processada até esvaziar
├── 01 ⚡ - TASKS           ← Backlog → This Week → Today → Waiting → Done + Dashboard
├── 02 🏢 - COMPANY         ← a empresa: Core, Strategy, Marketing, Sales, Products,
│                             Clients, Operations, People, Finance, Legal, Vendors
├── 03 🧠 - KNOWLEDGE       ← conhecimento perpétuo de referência
├── 04 📋 - SOPS            ← processos repetíveis (a empresa cria os dela)
├── 98 📄 - TEMPLATES       ← modelos de arquivo
└── 99 ⚙️ - SYSTEM          ← playbooks do Claude, logs diários, backup, status
```

**Cada pasta tem um `CLAUDE.md` próprio** com o mapa e as regras dela. O `CLAUDE.md` da raiz fica enxuto e aponta pros playbooks, que o Claude lê só quando a tarefa pede. Resultado: menos contexto gasto por sessão e regras que não se contradizem.

## Os princípios

- **Subpasta só nasce junto com o primeiro arquivo dela.** Nada de esqueleto vazio.
- **Projeto vive dentro do dono** (área ou cliente). Peça gerada vive junto do assunto. Arquivar é `status: archived`, não uma pasta de arquivo morto.
- **Frontmatter padrão** em todo arquivo (`type`, `status`, `area`, `created`, `updated`), pra busca e dashboards funcionarem.
- **Dinheiro nunca é registrado sem perguntar.**
- **Tudo vai pro log** em `99 ⚙️ - SYSTEM/Logs/`, inclusive o que foi apagado e por decisão de quem.
- **O Claude aprende com as correções:** regra que vale sempre entra em "Preferências aprendidas" no `CLAUDE.md`.
- **Dado vivo fica na fonte** (CRM, banco, Drive): o vault guarda contexto, decisão e link.

## Playbooks incluídos (`99 ⚙️ - SYSTEM/`)

| Playbook | Quando o Claude usa |
|---|---|
| `onboarding-empresa.md` | Configurar o vault pela primeira vez |
| `inbox.md` | Esvaziar o Inbox, mandando cada item pro destino certo |
| `onboarding-cliente.md` | Cliente novo: diagnóstico, pasta, tarefas de início |
| `clientes.md` | Criar, converter lead em cliente, cadência de reunião, avisos de vencimento, encerrar |
| `financas.md` | Ledger de receitas e despesas por ano, conciliação |
| `agendamento.md` | Padrões pra criar evento no calendário |
| `tom-de-voz.md` | Qualquer texto que sai do vault |
| `comandos.md` | Prefixos e comandos |

## Comandos

Funcionam de verdade no Claude Code (`.claude/commands/`):

| Comando | O que faz |
|---|---|
| `/onboarding` | Inicia ou retoma o onboarding da empresa |
| `/inbox` | Processa o Inbox até esvaziar |
| `/semana` | Planeja a semana e reescreve o Dashboard |
| `/generate <tipo> <descrição>` | Gera dashboard, relatório, HTML ou análise |
| `/search <termo>` | Busca em todo o vault |
| `/status` | O que tem conteúdo e o que está vazio |
| `/audit` · `/cleanup` | Encontra inconsistências · corrige com confirmação |
| `/archive <item>` | Arquiva um arquivo ou cliente |

Os prefixos `[CRIAR]`, `[EDITAR]`, `[GERAR]`, `[MOVER]`, `[DELETAR]`, `[BUSCAR]`, `[RESUMIR]` e `[ESTRUTURA]` continuam valendo. Pedido em linguagem natural também.

## Backup

`99 ⚙️ - SYSTEM/Backup/` traz um backup semanal pro seu repositório **privado** no GitHub (macOS), com as memórias do Claude junto e os arquivos de credencial cifrados. Ele avisa quando falha e aborta se encontrar chave de API em texto claro. Guia: `RESTAURAR.md`.

---

## Como começar

### Pré-requisitos

- [Obsidian](https://obsidian.md)
- [Claude Code](https://claude.com/claude-code) (recomendado) ou Claude com acesso à pasta

### Setup

```bash
git clone https://github.com/RicardoGrauppe/NexusOS.git "Minha Empresa OS"
```

1. No Obsidian: **Abrir pasta como vault** → selecione a pasta clonada.
2. Ative as cores: **Settings → Appearance → CSS snippets → folder-colors**.
3. Abra o Claude Code na pasta e envie `Iniciar Onboarding`.
4. Peça "configura o backup do vault". Ele aponta o vault pro **seu** repositório privado, nunca pro template.

---

## Por que Obsidian?

- **Local:** os dados ficam no seu computador, em arquivos `.md` legíveis por qualquer editor.
- **Sem prisão:** saiu, os arquivos vão junto.
- **Grafo de conhecimento:** links entre documentos viram uma rede de informação.

## Por que o Claude como operador?

Qualquer ferramenta armazena documento. A diferença aqui é que o Claude conhece a estrutura, as convenções e o histórico do vault: **salva no lugar certo, aplica os nomes, registra o log, pede confirmação antes de apagar e atualiza as regras quando a estrutura muda.**

---

## Atualizando um vault da v1.x

A v2.0 troca as 18 pastas por 7. Peça ao Claude: *"migra este vault pra estrutura da v2.0 do Nexus OS"*, com esta tabela como guia:

| v1.x | v2.0 |
|---|---|
| `01 📊 - Dashboard` | `01 ⚡ - TASKS/Dashboard.md` |
| `02 🧠 - Company Core` | `02 🏢 - COMPANY/Core/` |
| `03 🎯 - Strategy` | `02 🏢 - COMPANY/Strategy/` |
| `04 🚀 - Projects` | Pasta do projeto dentro da área ou do cliente dono |
| `05 👥 - Customers & Market` | `02 🏢 - COMPANY/Marketing/` (ICP, personas) e `02 🏢 - COMPANY/Clients/` (clientes) |
| `06 📢 - Marketing` | `02 🏢 - COMPANY/Marketing/` |
| `07 💰 - Sales` | `02 🏢 - COMPANY/Sales/` |
| `08 🛠️ - Products & Services` | `02 🏢 - COMPANY/Products/` |
| `09 ⚙️ - Operations` | `02 🏢 - COMPANY/Operations/`; templates em `98 📄 - TEMPLATES`; SOPs em `04 📋 - SOPS` |
| `10 👨‍💼 - People & Team` | `02 🏢 - COMPANY/People/` |
| `11 💵 - Finance` | `02 🏢 - COMPANY/Finance/` |
| `12 ⚖️ - Legal & Compliance` | `02 🏢 - COMPANY/Legal/` |
| `13 🤝 - Vendors & Partners` | `02 🏢 - COMPANY/Vendors/` |
| `14 🤖 - AI & Automation` | `02 🏢 - COMPANY/Operations/` |
| `15 📈 - Analytics` | `Reports/` dentro da área |
| `16 📚 - Knowledge & Learning` | `03 🧠 - KNOWLEDGE/` |
| `17 🔭 - Future & Innovation` | `00 📥 - INBOX/Ideias/` ou `02 🏢 - COMPANY/Strategy/` |
| `18 🎨 - Generated Assets` | `Reports/` da área ou do cliente |
| `CHANGELOG/` | `99 ⚙️ - SYSTEM/Logs/` |

## Versões

| Versão | Data | O que mudou |
|---|---|---|
| v1.0 | 2026-06-18 | Estrutura inicial: 17 seções + INBOX + Generated Assets |
| v1.1 | 2026-06-18 | Pastas no formato `NN 🎨 - Nome` |
| v1.2 | 2026-06-18 | Onboarding guiado, questionários, 6 templates |
| v1.3 | 2026-06-18 | Auditoria estrutural, slash commands |
| v1.4 | 2026-06-18 | CHANGELOG em arquivos diários |
| v2.0 | 2026-10-17 | 18 pastas viram 7; `CLAUDE.md` enxuto + um por pasta + playbooks sob demanda; gestão de tarefas; comandos reais do Claude Code; backup semanal; template sem nenhuma pasta vazia |

---

## Licença

MIT. Use, adapte, distribua.

<div align="center">

**Feito com Obsidian + Claude**

*A empresa que documenta, escala. A que não documenta depende de pessoas específicas pra sempre.*

</div>
