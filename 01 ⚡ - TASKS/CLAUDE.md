# 01 ⚡ - TASKS

Tarefas por estágio. O Claude mantém esta pasta viva, movendo arquivos entre os estágios conforme o status muda.

## Estrutura

```
Dashboard.md    ← visão rápida da semana (manter atualizado ao mover tarefas)
Backlog/        ← capturado, sem prazo
This Week/      ← compromisso da semana
Today/          ← foco do dia
Waiting/        ← bloqueado por terceiro (anotar por quem/o quê)
Done/           ← concluídas (histórico)
```

Cada estágio nasce junto com a primeira tarefa dele.

## Regras

- Uma tarefa = um arquivo, a partir de `98 📄 - TEMPLATES/Tarefa.template.md`. Nome: `Título Curto - Contexto.md` (ex.: `Enviar Proposta - Cliente X.md`); prefixo `YYYY-MM-DD - ` quando a data importa.
- Frontmatter: `type: task`, `status: active | waiting | done`, `area:` da empresa.
- **`first_planned: YYYY-MM-DD`**: data em que a tarefa entrou num plano semanal pela **primeira** vez. Grava na primeira vez que ela aparece no Dashboard e **nunca altera depois**, mesmo que ela arraste por semanas (é justamente o que mede o arrasto).
- Mover = mover o arquivo entre as pastas de estágio **e** atualizar `status:` no frontmatter.
- Ao mover pra `Waiting/`: registrar no corpo o que está bloqueando e desde quando.
- Tarefa concluída vai pra `Done/`, nunca é apagada (é histórico).
- Tarefa que depende de terceiro ganha **data real** de cobrança, nunca "essa semana".
- Toda mudança aqui entra no log do dia (`99 ⚙️ - SYSTEM/Logs/`).

## Planejar a semana (reescrever o Dashboard)

1. Ler `This Week/`, `Today/`, `Waiting/` e o Backlog com prazo.
2. Seção **"⏳ Arrastadas"** primeiro: tudo com `first_planned` anterior à segunda-feira desta semana, com o selo `🕐 desde DD/MM · Nª semana` e o motivo de ainda não ter saído. A semana conta de segunda a domingo, incluindo a atual.
3. Depois a ordem de ataque e o plano por dia.
4. Padrão visível (o mesmo tipo de tarefa sempre arrastando) vira uma linha de alerta no topo, sem julgamento.
