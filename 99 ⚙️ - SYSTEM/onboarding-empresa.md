---
type: system
status: active
---

# Playbook — Onboarding da Empresa

> Executado quando o usuário envia **`Iniciar Onboarding`** ou `/onboarding`, ou quando o bloco "A empresa" do `CLAUDE.md` raiz ainda está vazio.
> Objetivo: sair de um vault vazio para um vault com a identidade, o mercado e a operação da empresa documentados, numa conversa.

## Comportamento

1. **O usuário não abre arquivo nenhum.** O Claude pergunta, escreve e salva.
2. **Um bloco por vez**, 2 a 4 perguntas por mensagem. Nunca despejar o questionário inteiro.
3. **Mostrar o que vai salvar e pedir confirmação** antes de gravar cada bloco.
4. Resposta "não sei" ou "depois" é válida: o item fica como pendência no fim, sem travar o fluxo.
5. Cada arquivo criado ganha frontmatter padrão e link em `02 🏢 - COMPANY/_Company.md`.
6. Cada bloco concluído vira uma linha no log do dia.
7. Retomar: se já existe parte preenchida, ler o que existe e continuar do primeiro bloco pendente.

## Fase 0 — Preferências do sistema

1. "Qual o nome da empresa e, em uma frase, o que ela faz?"
2. "Como vocês chamam quem compra de vocês? (cliente, aluno, paciente, usuário...)"
3. "Em que idioma os documentos devem ser escritos? Qual moeda e qual fuso horário vocês usam?"

Salvar: bloco **"A empresa"** do `CLAUDE.md` raiz (editar só esse bloco).

## Fase 1 — Identidade

Arquivo: `02 🏢 - COMPANY/Core/Identidade.md`

1. Nome legal e nome comercial; setor; cidade/região de atuação; site.
2. **Missão:** por que existe, pra quem e que resultado entrega.
3. **Visão:** onde quer chegar em 5 a 10 anos.
4. **Valores:** de 3 a 7, cada um com uma frase de como aparece na prática.
5. **Proposta de valor:** por que alguém escolhe vocês e não um concorrente.

Depois: **Tom de voz.** Perguntar como a marca fala (formal, próximo, técnico, direto), palavras ou temas proibidos e um exemplo de texto que eles acham que "soa como a gente". Salvar na seção "Regras da marca" de `99 ⚙️ - SYSTEM/tom-de-voz.md`.

## Fase 2 — Mercado e oferta

### 2a — Cliente ideal
Arquivo: `02 🏢 - COMPANY/Marketing/ICP.md`
1. Vendem pra empresas, pessoas ou os dois?
2. Quem é o cliente ideal (perfil, porte/setor ou perfil de pessoa)?
3. As 3 maiores dores e os 3 maiores desejos dele.
4. Objeções que aparecem antes da compra.
5. Os 3 melhores clientes que já tiveram e por que foram os melhores.

### 2b — O que vendem
Arquivo: `02 🏢 - COMPANY/Products/Catálogo.md`
1. Lista de produtos/serviços/planos, com preço ou faixa de preço.
2. Qual é o carro-chefe e qual dá mais margem.

### 2c — Como vendem
Arquivos: `02 🏢 - COMPANY/Sales/Processo de Vendas.md` e `02 🏢 - COMPANY/Sales/_Pipeline.md`
1. De onde vêm os leads hoje.
2. Etapas do funil, do primeiro contato ao fechamento.
3. Ticket médio e tempo médio pra fechar.
4. Onde os leads ficam registrados hoje (CRM, planilha, WhatsApp). O vault guarda o link, não a cópia.

Criar `_Pipeline.md` com as etapas informadas e as seções Ativos / Fechados / Perdidos, mesmo sem nenhum lead ainda.

## Fase 3 — Estrutura interna

### 3a — Time
Arquivo: `02 🏢 - COMPANY/People/Time.md`
1. Quantas pessoas, quais papéis e quem decide o quê.

### 3b — Ferramentas
Arquivo: `02 🏢 - COMPANY/Operations/Ferramentas.md`
1. Ferramentas usadas no dia a dia (e-mail, calendário, CRM, financeiro, armazenamento de arquivos, comunicação) e pra que serve cada uma.
2. Qual calendário usar pra reuniões, se o Claude tiver acesso a ele. Salvar os padrões em `99 ⚙️ - SYSTEM/agendamento.md` (seção "Configuração desta empresa").
3. Onde ficam as gravações ou atas de reunião, se existirem. Salvar em `99 ⚙️ - SYSTEM/clientes.md` (seção "Configuração desta empresa").

### 3c — Finanças
1. "Querem controlar receitas e despesas aqui no vault, ou isso já fica num sistema financeiro?"
   - **No vault:** criar `02 🏢 - COMPANY/Finance/_Finance.md` e o ledger do ano atual (`<ano>.md`) conforme `financas.md`. Não cadastrar nenhum valor agora sem confirmação item a item.
   - **Fora:** criar só `_Finance.md` com o link e a regra "fonte da verdade é <sistema>".
2. Faturamento mensal aproximado e principais custos fixos, **só se o usuário quiser registrar** (regra do dinheiro).

### 3d — Estratégia
Arquivo: `02 🏢 - COMPANY/Strategy/Metas.md`
1. Os 3 objetivos principais dos próximos 3 meses.
2. Pra cada um, o número que diz que deu certo.

Transformar o que for acionável em tarefas em `01 ⚡ - TASKS/Backlog/`.

## Encerramento

1. Listar o que foi preenchido (✅) e o que ficou pendente (⬜), com o motivo.
2. Atualizar `99 ⚙️ - SYSTEM/Status Operacional.md`.
3. Criar tarefa `Configurar Backup do Vault` em `01 ⚡ - TASKS/Backlog/`, se o backup ainda não roda.
4. Sugerir o próximo passo: capturar tudo que está na cabeça no Inbox e rodar `/inbox`, ou planejar a semana.
