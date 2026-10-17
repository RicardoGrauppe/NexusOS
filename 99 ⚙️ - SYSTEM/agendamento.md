---
type: system
status: active
---

# Playbook — Agendamento

Como o Claude cria evento no calendário: reunião de cliente, call de venda, compromisso interno.

## Configuração desta empresa

> Preenchido no onboarding (Fase 3b). Enquanto vazio, perguntar antes do primeiro evento.

| Campo | Valor |
|---|---|
| Calendário principal (reuniões e tarefas) | |
| Calendário financeiro (opcional: pagamentos, cobranças, vencimentos) | |
| Fuso | |
| Ferramenta de videochamada | |

Sempre pela integração de calendário conectada ao Claude. Se ela não estiver disponível, dizer isso ao usuário em vez de usar outro calendário por conta própria.

## Padrão de criação

| Campo | Padrão |
|---|---|
| Duração | 1 hora, salvo pedido diferente |
| Videochamada | sempre que a ferramenta permitir |
| Lembretes | 1 dia, 1 hora e 10 minutos antes |
| Convidados | **nenhum por padrão** |
| Título | nome de quem está do outro lado + assunto |
| Descrição | **uma linha** com o objetivo da reunião |

### Título

Do jeito que o cliente leria sem constrangimento. **Nada de palavra interna:** "fechamento", "cobrança", "salvar o cliente" ficam fora, mesmo quando é disso que se trata. Ex.: `Cliente X e <Empresa>: Alinhamento do Projeto`.

Reunião interna do time: `Time | <assunto> (<quem>)`. O assunto vem antes do nome; com o time todo, sem parênteses.

### Descrição

Uma linha dizendo pra que serve a reunião. Fora dela: pendências, histórico, dado faltando. No dia em que o cliente for convidado, é ele quem lê.

O contexto levantado no vault (Overview, última reunião, pendências) vai **pro chat**, pra quem vai conduzir a reunião decidir o que fazer com ele.

### Convidados

Criar sem convidado e devolver o link pra ser enviado por mensagem. Só adicionar e-mail quando o usuário pedir na hora.

## Depois de criar

1. Devolver no chat o link da videochamada, pronto pra enviar.
2. Linha no log: horário, quem, calendário usado e se teve convidado.

## Não fazer

- Não inventar data nem horário.
- Não convidar ninguém por conta própria.
- Não encher a descrição.
- Não pôr evento de dinheiro no calendário principal quando existir um calendário financeiro.
