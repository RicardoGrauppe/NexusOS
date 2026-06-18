# 🧠 Empresa OS — O Segundo Cérebro da Sua Empresa

> **Um sistema completo de gestão do conhecimento empresarial, construído no Obsidian e orquestrado por Inteligência Artificial.**

![Version](https://img.shields.io/badge/versão-v1.4-blue)
![Built with Obsidian](https://img.shields.io/badge/built%20with-Obsidian-7C3AED)
![Powered by Claude](https://img.shields.io/badge/powered%20by-Claude%20AI-FF6B35)
![License](https://img.shields.io/badge/licença-MIT-green)

---

## O problema que isso resolve

Toda empresa acumula conhecimento — mas a maioria deixa esse conhecimento espalhado em e-mails, planilhas desatualizadas, documentos no Drive de ninguém, e na cabeça de pessoas-chave.

Quando alguém sai da empresa, o conhecimento vai junto.
Quando a equipe cresce, os processos se perdem.
Quando o CEO precisa de um número, ninguém sabe onde está.

**O Empresa OS resolve isso de uma vez por todas.**

---

## O que é o Empresa OS

O **Empresa OS** é um vault do Obsidian pré-estruturado que funciona como o sistema operacional da sua empresa — centralizando estratégia, operações, finanças, pessoas, clientes e conhecimento em um único lugar organizado, pesquisável e vivo.

A grande diferença: **o Claude AI atua como orquestrador de toda a base de conhecimento.** Você conversa com o Claude como conversaria com um assistente executivo inteligente — e ele cria documentos, gera dashboards, reorganiza estruturas, registra logs e mantém tudo coeso.

Não é um template estático. É um sistema que aprende e cresce com a sua empresa.

---

## Como funciona na prática

```
Você digita:  [GERAR] Dashboard financeiro do Q2 comparando receita e despesas
Claude faz:   Cria um arquivo HTML interativo em 18 🎨 - Generated Assets/Dashboards/
              Registra a ação no CHANGELOG do dia
              Confirma com você antes de salvar
```

```
Você digita:  /audit
Claude faz:   Escaneia todo o vault
              Detecta pastas duplicadas, arquivos vazios, nomes fora do padrão
              Retorna relatório completo com o que precisa de atenção
```

```
Você digita:  Iniciar Onboarding
Claude faz:   Conduz você por um roteiro guiado de 3 fases
              Faz as perguntas certas sobre sua empresa
              Preenche automaticamente todos os arquivos do vault
              Confirma cada bloco antes de salvar
```

---

## Estrutura — 18 seções cobrindo toda a empresa

```
📁 EMPRESA OS
│
├── 00 📥 - INBOX                  ← Captura rápida. Processe depois.
├── 01 📊 - Dashboard              ← Visão geral e métricas vivas
│
├── 02 🧠 - Company Core           ← Missão, visão, valores, cultura
├── 03 🎯 - Strategy               ← OKRs, modelo de negócio, roadmap
├── 04 🚀 - Projects               ← Projetos ativos, concluídos e em pausa
│
├── 05 👥 - Customers & Market     ← ICP, personas, jornada, feedbacks
├── 06 📢 - Marketing              ← Marca, campanhas, SEO, redes sociais
├── 07 💰 - Sales                  ← Pipeline, scripts, objeções, propostas
├── 08 🛠️ - Products & Services   ← Catálogo, entrega, roadmap de produto
│
├── 09 ⚙️ - Operations            ← SOPs, processos, checklists, automações
├── 10 👨‍💼 - People & Team        ← Organograma, contratação, onboarding, RH
├── 11 💵 - Finance               ← Receita, despesas, fluxo de caixa, KPIs
├── 12 ⚖️ - Legal & Compliance    ← Contratos, políticas, compliance, riscos
├── 13 🤝 - Vendors & Partners    ← Fornecedores, parceiros, negociações
│
├── 14 🤖 - AI & Automation       ← Agentes, prompts, automações, workflows
├── 15 📈 - Analytics             ← Dashboards, relatórios, experimentos
├── 16 📚 - Knowledge & Learning  ← Mercado, concorrentes, aprendizados internos
├── 17 🔭 - Future & Innovation   ← Ideias, novos mercados, visão de longo prazo
│
└── 18 🎨 - Generated Assets      ← Tudo gerado pelo Claude (HTMLs, reports, docs)
```

Cada seção vem com um `Index.md` pré-formatado pronto para receber o conteúdo da sua empresa.

---

## O fluxo de Onboarding guiado

Ao clonar o vault, você não começa do zero — você começa com uma conversa.

Envie `Iniciar Onboarding` para o Claude e ele conduzirá você por **3 fases estruturadas**:

| Fase | O que cobre | Onde salva |
|---|---|---|
| **Fase 1 — Identidade** | Nome, setor, missão, visão, valores, proposta de valor, tom de voz | `02 🧠 - Company Core` |
| **Fase 2 — Mercado e Operação** | Cliente ideal, dores, pipeline de vendas, produtos/serviços | `05`, `07`, `08` |
| **Fase 3 — Estrutura Interna** | Time, finanças, estratégia e OKRs dos próximos 3 meses | `10`, `11`, `03` |

O Claude **faz uma seção por vez**, mostra o que vai escrever, pede confirmação e só então salva. Nada é gravado sem sua aprovação.

---

## Comandos disponíveis

### Prefixos de solicitação

Use estes prefixos para qualquer ação dentro do vault:

| Prefixo | O que faz |
|---|---|
| `[CRIAR]` | Cria um novo documento, pasta ou conteúdo |
| `[EDITAR]` | Modifica um documento existente |
| `[GERAR]` | Gera um asset — dashboard, relatório, HTML, análise |
| `[MOVER]` | Move ou reorganiza estrutura |
| `[DELETAR]` | Remove conteúdo (Claude pede confirmação antes) |
| `[BUSCAR]` | Localiza informação dentro do vault |
| `[RESUMIR]` | Resume um conjunto de notas ou seção |
| `[ESTRUTURA]` | Propõe ou aplica alteração na estrutura do vault |

**Exemplos:**
```
[GERAR] Dashboard HTML dos últimos 3 meses de finanças comparando receita e despesas
[CRIAR] SOP de onboarding para novos clientes
[BUSCAR] Todas as menções ao cliente Acme Corp
```

### Slash Commands — atalhos rápidos

| Comando | O que faz |
|---|---|
| `/audit` | Escaneia o vault e retorna relatório de inconsistências |
| `/cleanup` | Executa a limpeza detectada pelo `/audit` (com confirmação) |
| `/status` | Resumo do preenchimento do vault — o que tem conteúdo real vs. template |
| `/onboarding` | Reinicia ou retoma o fluxo de onboarding |
| `/generate <tipo> <descrição>` | Gera um asset. Ex: `/generate report análise de churn Q2` |
| `/archive <arquivo>` | Move um asset para `Archive/` com data de arquivamento |
| `/search <termo>` | Busca o termo em todo o vault |

---

## Generated Assets — tudo que o Claude produz, organizado

Toda vez que o Claude gera um arquivo para você, ele vai automaticamente para a pasta `18 🎨 - Generated Assets`, organizado por tipo:

```
18 🎨 - Generated Assets/
├── Dashboards/    ← Dashboard financeiro Q1, Overview de vendas
├── Reports/       ← Relatório mensal, Análise de churn
├── HTML/          ← Visualizações interativas standalone
├── Documents/     ← Propostas, SOPs formatados, apresentações
└── Archive/       ← Versões anteriores com data de arquivamento
```

**Convenção de nomenclatura:**
```
2026-06-18 — Dashboard — Financeiro Q1 2026.html
2026-06-18 — Report — Análise de Vendas Maio 2026.md
```

Quando um asset é atualizado, a versão antiga vai para `Archive/` com o prefixo `[ARCHIVED YYYY-MM-DD]`. Nada se perde.

---

## Sistema de Log — CHANGELOG diário

Toda ação relevante é registrada automaticamente. A pasta `CHANGELOG/` contém um arquivo por dia no formato `YYYY-MM-DD.md`.

```
[14:32] [ASSET] Dashboard financeiro Q2 gerado — Solicitado por: @ricardo
[15:10] [CONTEÚDO] SOP de onboarding criado em 08 - Products & Services
[16:45] [ESTRUTURA] Nova subpasta "Partnerships" adicionada em 17 - Future
```

O índice `CHANGELOG/CHANGELOG.md` funciona como navegação histórica de tudo que aconteceu no vault.

---

## Como começar

### Pré-requisitos

- [Obsidian](https://obsidian.md) instalado
- Conta no [Claude.ai](https://claude.ai) ou acesso à API da Anthropic
- Claude Code CLI (recomendado) ou Claude Projects

### Setup em 3 passos

**1. Clone o repositório**
```bash
git clone https://github.com/RicardoGrauppe/empresa-os.git
```

**2. Abra como vault no Obsidian**

No Obsidian: `Abrir pasta como vault` → selecione a pasta clonada.

**3. Inicie o onboarding**

Abra o Claude Code na pasta do vault e envie:
```
Iniciar Onboarding
```

O Claude vai guiar você por todo o processo de configuração.

### Ativando as cores das pastas

O vault já vem com um CSS snippet que colore os grupos de pastas visualmente. Para ativar:

1. No Obsidian, vá em **Settings** (ícone de engrenagem no canto inferior esquerdo)
2. No menu lateral, clique em **Appearance**
3. Role até a seção **CSS snippets**
4. Clique no ícone de pasta para abrir a pasta de snippets — o arquivo `folder-colors.css` já estará lá
5. Ative o toggle ao lado de **folder-colors**

As pastas ganharão fundo colorido por grupo imediatamente:

| Cor | Grupo |
|---|---|
| 🩵 Teal | INBOX e Dashboard (visão geral) |
| 🟣 Roxo | Identidade & Direção (02–04) |
| 🟢 Verde | Mercado & Receita (05–08) |
| 🟡 Âmbar | Operações Internas (09–13) |
| 🔵 Azul | Inteligência & Futuro (14–17) |
| 🔴 Rosa | Generated Assets (18) |
| ⬜ Cinza | Arquivos de sistema (CHANGELOG, CLAUDE.md, README) |

> Se as cores não aparecerem, clique no ícone de atualização (🔄) ao lado da seção CSS snippets para forçar o recarregamento.

---

## Por que Obsidian?

- **Local-first**: seus dados ficam no seu computador, em arquivos `.md` legíveis por qualquer editor
- **Sem lock-in**: saia quando quiser, seus arquivos vão junto
- **Grafo de conhecimento**: links entre documentos criam uma rede viva de informação
- **Extensível**: plugins para quase tudo
- **Rápido**: mesmo com milhares de arquivos

---

## Por que Claude como orquestrador?

Qualquer ferramenta pode armazenar documentos. O diferencial do Empresa OS é que **o Claude entende o contexto do vault inteiro** — e age como um assistente executivo que conhece a estrutura, as convenções, o histórico de mudanças e as regras do sistema.

Ele não apenas gera texto. Ele **salva no lugar certo**, **registra o log**, **aplica as convenções de nome**, **pede confirmação antes de ações destrutivas** e **mantém o CLAUDE.md atualizado** quando a estrutura muda.

É a diferença entre ter um assistente e ter um sistema.

---

## Portabilidade — use para qualquer empresa

Este vault é um **template universal**. A estrutura é genérica; o conteúdo é específico de cada empresa.

Para adaptar para uma nova empresa:
1. Clone o repositório
2. Envie `Iniciar Onboarding` ao Claude
3. Responda as perguntas sobre a empresa
4. O vault estará configurado e pronto para uso

Não há nada para instalar, configurar manualmente ou programar.

---

## Versões

| Versão | Data | O que mudou |
|---|---|---|
| v1.0 | 2026-06-18 | Estrutura inicial — 17 seções + INBOX + Generated Assets |
| v1.1 | 2026-06-18 | Renomeação das pastas para formato `NN 🎨 - Nome` |
| v1.2 | 2026-06-18 | Onboarding comercial, questionários guiados, 6 templates |
| v1.3 | 2026-06-18 | Auditoria estrutural, slash commands, INBOX renomeado |
| v1.4 | 2026-06-18 | CHANGELOG convertido para pasta com arquivos diários |

---

## Licença

MIT — use, adapte, distribua. Se construir algo em cima disso, adoraria saber.

---

<div align="center">

**Feito com Obsidian + Claude AI**

*A empresa que documenta, escala. A que não documenta, depende de pessoas específicas para sempre.*

</div>
