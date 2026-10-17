# CLAUDE.md — Orquestrador do Nexus OS

> Este vault é o **Segundo Cérebro + Sistema Operacional da empresa + Base de Conhecimento para IA**, operado principalmente pelo Claude. Prioridade nº 1: previsibilidade. Caminhos e nomes precisam ser adivinháveis.
>
> Este arquivo é só orquestração e é carregado em toda sessão: mantenha-o enxuto. **Cada pasta-raiz tem um `CLAUDE.md` próprio** com mapa e regras locais (carregado automaticamente ao trabalhar nela). Procedimentos detalhados ficam em `99 ⚙️ - SYSTEM/` e são lidos só quando a tarefa exige (tabela de roteamento abaixo).

## A empresa

> Preenchido pelo Claude no fim do onboarding (`Iniciar Onboarding`). Enquanto estiver vazio, o vault ainda não foi configurado: ofereça o onboarding antes de qualquer outra coisa.

| | |
|---|---|
| **Nome** | |
| **O que faz** | |
| **Quem compra** (clientes/alunos/usuários: use o termo que a empresa usa) | |
| **Idioma dos documentos** | |
| **Moeda** | |
| **Fuso horário** | |

## Mapa das pastas

> Detalhes, estrutura interna e regras locais: no `CLAUDE.md` de cada pasta.

| Pasta | O que mora aqui |
|---|---|
| `00 📥 - INBOX` | Captura crua, tudo na raiz. Só entrada, nada permanente. |
| `01 ⚡ - TASKS` | Tarefas: Backlog → This Week → Today → Waiting → Done + `Dashboard.md`. |
| `02 🏢 - COMPANY` | A operação inteira: identidade, estratégia, marketing, vendas, produtos, clientes, operação, time, finanças, jurídico, fornecedores. |
| `03 🧠 - KNOWLEDGE` | Conhecimento perpétuo de referência. Sem tarefas, sem projetos. |
| `04 📋 - SOPS` | Processos repetíveis, um arquivo por SOP na raiz. Começa vazia: a empresa cria os dela. |
| `98 📄 - TEMPLATES` | Modelos (`.template.md`) para arquivos novos. |
| `99 ⚙️ - SYSTEM` | Playbooks do Claude, logs diários, backup e status do vault. |

Não existem pastas de Projects, Generated Assets nem Archive:
- **Projeto** (objetivo + início + fim) vive dentro do dono: a área da empresa ou o cliente. `type: project`.
- **Peça gerada** (HTML, relatório, dashboard) vive junto do assunto, nunca numa pasta genérica de "gerados".
- **Arquivar** = `status: archived` no frontmatter. Cliente encerrado vai pra `Clients/Former/`.

## Regras de nomenclatura

- Datas sempre `YYYY-MM-DD`. Itens datados: `YYYY-MM-DD - Título.md`. Itens perpétuos: `Título.md` em Title Case.
- Pastas estruturais em inglês; conteúdo dos arquivos no idioma da empresa.
- Pastas-raiz: `NN <emoji> - NOME`. Referencie sempre com o nome completo.
- **Subpasta só nasce junto com o primeiro arquivo dela.** Nunca criar esqueleto de pastas vazias.
- Link interno com caminho completo quando o nome puder repetir: `[[02 🏢 - COMPANY/Clients/Active/<Nome>/Overview|<Nome>]]`. `[[Nome]]` solto cria arquivo vazio na raiz.

## Frontmatter padrão (mínimo)

```yaml
---
type:     # inbox | task | client | business | project | knowledge | sop | meeting | note | report
status:   # idea | active | waiting | done | draft | published | archived
area:     # área da empresa (core, strategy, marketing, sales, products, clients, operations, people, finance, legal, vendors) ou pessoal
created: YYYY-MM-DD
updated: YYYY-MM-DD
tags: []
---
```

## Tabela de roteamento — leia o playbook só quando a tarefa pedir

| Quando a tarefa for... | Leia primeiro |
|---|---|
| Configurar o vault pela primeira vez (`Iniciar Onboarding`, `/onboarding`) | `99 ⚙️ - SYSTEM/onboarding-empresa.md` |
| Processar / esvaziar o Inbox | `99 ⚙️ - SYSTEM/inbox.md` |
| Novo cliente / onboarding de cliente | `99 ⚙️ - SYSTEM/onboarding-cliente.md` |
| Criar, converter lead em, ou encerrar um cliente | `99 ⚙️ - SYSTEM/clientes.md` |
| Registrar dinheiro (receita, despesa, pagamento, contrato) | `99 ⚙️ - SYSTEM/financas.md` |
| Marcar reunião / criar evento no calendário | `99 ⚙️ - SYSTEM/agendamento.md` |
| Escrever texto que vai sair do vault (site, e-mail, proposta, post, roteiro, HTML) | `99 ⚙️ - SYSTEM/tom-de-voz.md` |
| Prefixo (`[CRIAR]`, `[GERAR]`...) ou comando (`/audit`, `/status`...) | `99 ⚙️ - SYSTEM/comandos.md` |
| Backup ou restauração do vault | `99 ⚙️ - SYSTEM/Backup/RESTAURAR.md` |

## Como pedir

| Prefixo | Comando | O que faz |
|---|---|---|
| `[CRIAR]` | | Cria documento ou conteúdo |
| `[EDITAR]` | | Modifica documento existente |
| `[GERAR]` | `/generate` | Gera peça (dashboard, relatório, HTML, análise) |
| `[MOVER]` | | Move ou reorganiza |
| `[DELETAR]` | | Remove (sempre com confirmação) |
| `[BUSCAR]` | `/search` | Localiza informação no vault |
| `[RESUMIR]` | | Resume notas ou uma área |
| `[ESTRUTURA]` | | Propõe ou aplica mudança de estrutura |
| | `/audit` · `/cleanup` | Varre o vault atrás de inconsistência · corrige com confirmação |
| | `/status` | O que tem conteúdo real e o que ainda está vazio |
| | `/inbox` | Processa o Inbox até esvaziar |
| | `/semana` | Planeja a semana e reescreve o Dashboard de tarefas |
| | `/archive` | Arquiva um arquivo ou cliente |
| | `/onboarding` | Inicia ou retoma o onboarding da empresa |

Prefixo é opcional: pedido em linguagem natural vale igual. Detalhes de cada um em `99 ⚙️ - SYSTEM/comandos.md`.

## Princípios de operação (sempre válidos)

1. **Captura sempre cai em `00 📥 - INBOX`.** Nunca peça ao usuário pra escolher pasta na hora de capturar.
2. **Arquivo padrão nasce do template** correspondente em `98 📄 - TEMPLATES`.
3. **Índices vivos:** criou item novo → link no índice da área (`_Company`, `_Clients`, `_Pipeline`, `_Finance`, `_Knowledge`).
4. **O Claude mantém `01 ⚡ - TASKS` viva**, movendo tarefas entre estágios e atualizando o Dashboard.
5. **Dado vivo fica na fonte.** CRM, banco, Drive, planilha de controle: o vault guarda contexto, decisão e link, não cópia que envelhece. Exceção: o ledger financeiro, que mora em `02 🏢 - COMPANY/Finance/` quando a empresa escolhe isso no onboarding.
6. **Dinheiro nunca é cadastrado em silêncio.** O usuário mencionou dinheiro, pagamento ou valor → **pergunte se é pra cadastrar** antes de gravar; se sim, siga `99 ⚙️ - SYSTEM/financas.md`.
7. **Sempre registre no log.** Após qualquer tarefa que altere o vault: linha em `99 ⚙️ - SYSTEM/Logs/<hoje>.md` no formato `- HH:MM — o que foi feito (arquivos/áreas afetados)`.
8. **Aprenda com as correções.** Regra geral → "Preferências aprendidas" abaixo; regra de um workflow → no playbook ou no `CLAUDE.md` da pasta. Depois registre no log.
9. **Confirme antes de destruir.** Apagar, sobrescrever ou mover em massa só com confirmação. A exclusão vai pro log com o que foi apagado e que foi decisão do usuário. Apagar significa "ficou ruim": nunca reconstruir o mesmo conteúdo depois.
10. **`CLAUDE.md` reflete estrutura e regras, nunca conteúdo.** Mudou estrutura, regra ou workflow de uma pasta → atualize o `CLAUDE.md` dela na mesma hora. Item novo de conteúdo → atualize o índice da área, não o `CLAUDE.md`. Nenhum `CLAUDE.md` recebe "nota de atualização" ou changelog: histórico vai nos Logs.
11. **Arquivos compartilhados nunca são sobrescritos por inteiro.** `CLAUDE.md`, `.gitignore` e configs são lidos por várias sessões ao mesmo tempo. Leia o conteúdo atual e edite só a parte necessária. Toda alteração neles vai pro log.
12. **Pergunta não é pedido de edição.** Quando o usuário pergunta ou pede investigação, apresente o achado e deixe a decisão com ele. Só altere o entregável quando ele pedir.
13. **Medido vs. inferido.** Em análise e relatório, deixe claro o que é dado e o que é hipótese. Na dúvida, meça em vez de teorizar.

## Preferências aprendidas

> Regras gerais que o usuário ensinou. O Claude adiciona aqui quando recebe uma correção que vale sempre, uma linha por regra com a data (`(YYYY-MM-DD)` no fim). Preferência de um workflow específico vai no playbook ou no `CLAUDE.md` da pasta, não aqui.

- (vazio até a primeira correção)
