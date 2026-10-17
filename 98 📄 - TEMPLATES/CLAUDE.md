# 98 📄 - TEMPLATES

Modelos pra criar arquivos novos. Arquivo: `Nome.template.md` na raiz. Os campos `{{date:YYYY-MM-DD}}` e `{{title}}` são preenchidos pelo plugin Templates do Obsidian (pasta já configurada) ou pelo Claude ao criar o arquivo.

## Templates e quando usar

| Template | Uso | Destino |
|---|---|---|
| `Tarefa.template.md` | Uma tarefa | `01 ⚡ - TASKS/<Estágio>/` |
| `Cliente.template.md` | Overview de cliente novo | `02 🏢 - COMPANY/Clients/Active/<Nome>/Overview.md` |
| `Intake Cliente.template.md` | Coleta única de dados, acessos e materiais no início do cliente | `.../Clients/Active/<Nome>/Intake.md` |
| `Overview.template.md` | Overview de projeto ou de área | `<Área ou Cliente>/<Projeto>/Overview.md` |
| `Projeto.template.md` | Projeto grande com escopo, cronograma, orçamento e riscos | idem |
| `Reunião.template.md` | Ata, só quando a reunião não é gravada em outra ferramenta | `Operations/Reviews/` ou pasta do cliente |
| `Entrevista com Cliente.template.md` | Pesquisa com cliente | pasta do cliente ou `Marketing/Pesquisa/` |
| `Review Semanal.template.md` | Revisão da semana | `02 🏢 - COMPANY/Operations/Reviews/` |
| `Review Mensal.template.md` | Revisão do mês | `02 🏢 - COMPANY/Operations/Reviews/` |
| `SOP.template.md` | Processo repetível | `04 📋 - SOPS/` |

## Regras

- Template novo só nasce quando o mesmo tipo de arquivo for criado pela **2ª vez**. Ganha linha na tabela acima.
- Template não leva dado de nenhuma empresa ou cliente: só campos e exemplos genéricos.
- Template de código (site, página, e-mail em HTML) é **pasta** `Nome/` com `README.md` explicando os campos a preencher, sem sufixo `.template`.
- Contrato não mora aqui como texto pronto: cada empresa cria o seu com o advogado dela e guarda em `02 🏢 - COMPANY/Legal/`.
