# 02 🏢 - COMPANY

A operação inteira da empresa. Começa com só este arquivo e o `_Company.md`: as áreas nascem no onboarding (`Iniciar Onboarding`) ou junto com o primeiro arquivo delas.

## Estrutura (áreas previstas)

```
_Company.md   ← índice: lista cada documento que existe, por área
Core/         ← identidade: Identidade.md (missão, visão, valores, proposta de valor), princípios de decisão
Strategy/     ← metas, OKRs, modelo de negócio, roadmap, concorrentes
Marketing/    ← marca, ICP/personas, campanhas, canais
Sales/        ← _Pipeline.md (funil) + Prospects/<Nome>/ (leads em negociação), processo, preços, propostas
Products/     ← catálogo do que a empresa vende: Catálogo.md + um arquivo por produto/serviço quando crescer
Clients/      ← _Clients.md + Active/<Nome>/ e Former/<Nome>/ (ver 99 ⚙️ - SYSTEM/clientes.md)
Operations/   ← ferramentas e sistemas usados, padrões operacionais, automações
People/       ← time, papéis e responsabilidades, contratação
Finance/      ← _Finance.md + ledger por ano (<ano>.md); regra em 99 ⚙️ - SYSTEM/financas.md
Legal/        ← documentos da empresa, contratos, políticas, licenças
Vendors/      ← fornecedores e parceiros
```

## Regras locais

- **Área só nasce com o primeiro arquivo dela.** Não criar `Legal/` vazio "porque está previsto".
- Projeto da empresa (objetivo + início + fim) vira pasta dentro da área dona, com `Overview.md` (de `Overview.template.md`) e `type: project`. Projeto de cliente vive dentro do cliente.
- Peça gerada (dashboard, relatório, HTML, apresentação) mora em `Reports/` dentro da área ou do cliente a que se refere, com nome `YYYY-MM-DD - Tipo - Título.ext`. Nova versão = arquivo novo com a data do dia; a anterior fica como histórico, nunca sobrescrita.
- Reunião, revisão semanal e revisão mensal: `Operations/Reviews/` quando for da empresa toda; dentro do cliente quando for de cliente.
- `Sales/_Pipeline.md` é a fonte da verdade do funil: atualizar etapa e próximo passo a cada avanço real. Prospect que fecha vira cliente conforme `99 ⚙️ - SYSTEM/clientes.md`.
- Login e senha nunca ficam em nota comum: vão em `Credenciais.md` (bloqueado no `.gitignore`).
- `Legal/` não se altera sem pedido explícito.
- Todo arquivo novo ganha link em `_Company.md` (ou no índice da área: `_Clients`, `_Pipeline`, `_Finance`).
