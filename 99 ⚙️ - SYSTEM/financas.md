---
type: system
status: active
---

# Playbook — Finanças (receitas e despesas)

> Leia quando a tarefa envolver receita, despesa, pagamento ou valor de contrato.

## Regra de ouro

**Nunca cadastre dinheiro sem perguntar.** Sempre que o usuário mencionar dinheiro, pagamento, receita, despesa ou valor de contrato, pergunte primeiro se é pra cadastrar. Só grava com confirmação.

## Onde mora

Definido no onboarding (Fase 3c) e anotado em `02 🏢 - COMPANY/Finance/_Finance.md`:
- **Ledger no vault:** um arquivo por ano, `02 🏢 - COMPANY/Finance/<ano>.md`. Caminho adivinhável pelo ano.
- **Sistema externo:** o vault não registra movimento; `_Finance.md` guarda o link e o Claude só consulta/resume quando pedirem.

## Estrutura do ledger

Tabela que só cresce, uma linha por movimento, no fim da seção certa (Receitas / Despesas):

```
| Data | Tipo | Descrição | Cliente/Categoria | Valor | Moeda | Status |
```

- **Data:** `YYYY-MM-DD`, real (quando recebeu/pagou) ou prevista.
- **Tipo:** `receita` | `despesa`.
- **Cliente/Categoria:** nome do cliente (receita) ou categoria (ferramentas, salários, anúncios, impostos...).
- **Valor:** número sem símbolo. **Moeda:** a da empresa (bloco "A empresa" do `CLAUDE.md`).
- **Status:** `previsto` | `recebido` | `pago`.

## Como registrar

1. Confirmar que é pra cadastrar.
2. Pegar **a data** de cada movimento. Sem data, perguntar: nunca inventar.
3. Contrato recorrente = **uma linha por pagamento**, cada uma com a sua data. Nunca um valor único somado.
4. Pagamento futuro entra como `previsto`; vira `recebido`/`pago` quando acontecer.
5. Receita de cliente cita o cliente; se útil, linka o Overview dele.
6. Ano novo → criar `<ano>.md` e o link em `_Finance.md`.
7. Linha no log.

## Conciliação

Se a empresa usa um meio de pagamento com histórico (Stripe, banco, maquininha) e o Claude tem acesso:
1. Puxar os recebimentos do período.
2. Casar com as linhas `previsto` → atualizar pra `recebido` (o extrato é a prova).
3. Recebimento que não casa com nada → **listar e perguntar** antes de criar linha nova.
4. O nome do pagador pode não ser o nome do cliente: confirmar na primeira vez e anotar no Overview do cliente.

## Não fazer

- Não inventar datas nem valores.
- Não registrar o mesmo dinheiro em dois lugares: o ledger do ano é a fonte única dentro do vault.
- Não executar nenhuma ação de escrita em ferramenta financeira (estorno, cobrança, transferência) sem pedido explícito.
