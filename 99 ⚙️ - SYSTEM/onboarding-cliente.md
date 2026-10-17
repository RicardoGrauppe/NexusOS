---
type: system
status: active
---

# Playbook — Onboarding de Cliente Novo

> Executado quando o usuário indicar que há um cliente novo ("fechei um cliente", "novo cliente: X", "onboarding de X").
> Objetivo: entender o cliente, configurar o vault e deixar o começo do trabalho em tarefas.

## Fase 1 — Diagnóstico (perguntar ao usuário)

Em blocos de 2 a 3 perguntas, esperando a resposta antes de avançar.

**Bloco A — Identificação**
1. Nome do cliente (pessoa ou empresa) e nome legal, se for empresa.
2. O que ele comprou/contratou (usar o catálogo em `02 🏢 - COMPANY/Products/` como referência).
3. É recorrente ou pontual? Tem data de fim?

**Bloco B — Contexto**
4. Qual o objetivo principal dele com isso?
5. Qual a maior dor ou problema que ele quer resolver?
6. Já tentou resolver antes? Com quem e como foi?

**Bloco C — Relacionamento**
7. Quem decide e quem é o contato do dia a dia? Canal preferido?
8. Valor do contrato: **perguntar se é pra registrar no financeiro** (regra do dinheiro).

Se o cliente ainda era prospect em `Sales/Prospects/`, ler o que já existe lá antes de perguntar: não repetir pergunta respondida.

## Fase 2 — Setup no vault

1. Pasta `02 🏢 - COMPANY/Clients/Active/<Nome>/` com `Overview.md` (de `Cliente.template.md`), preenchido com o diagnóstico. Se veio de prospect, seguir a conversão de `clientes.md`.
2. Se o serviço exige coletar acessos, documentos ou materiais: copiar `98 📄 - TEMPLATES/Intake Cliente.template.md` pra `Intake.md` dentro da pasta.
3. Link em `Clients/_Clients.md` (Ativos).
4. Contrato com data de fim → avisos 30/15/5 (`clientes.md`).
5. Valor confirmado pra registro → `financas.md`.

**Não criar subpastas vazias.** `Reports/` e `Assets/` nascem com o primeiro arquivo.

## Fase 3 — Tarefas de início

Em `01 ⚡ - TASKS/Backlog/` (ou `This Week/`), cada uma com data real quando depender do cliente:
- Coletar o que falta do Intake
- Marcar a reunião de início (`agendamento.md`)
- Entregar o plano dos primeiros 30 dias

Se existir SOP de onboarding do serviço específico em `04 📋 - SOPS/`, seguir ele depois deste playbook (só o delta).

## Fase 4 — Log

`- HH:MM — Onboarding de <Nome> concluído (Overview criado, _Clients atualizado, N tarefas)`

## Checklist de conclusão

- [ ] Diagnóstico coletado
- [ ] Pasta do cliente com `Overview.md`
- [ ] Link em `_Clients.md`
- [ ] Intake criado (se aplicável)
- [ ] Valor perguntado / registrado (se confirmado)
- [ ] Tarefas de início criadas
- [ ] Log do dia atualizado
