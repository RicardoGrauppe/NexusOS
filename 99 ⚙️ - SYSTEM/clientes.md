---
type: system
status: active
---

# Playbook — Clientes

Clientes vivem em `02 🏢 - COMPANY/Clients/`:
- `Clients/Active/<Nome>/`: relacionamento rodando.
- `Clients/Former/<Nome>/`: encerrado, com `status: archived` no Overview. Não existe pasta de arquivo geral no vault.
- `Clients/_Clients.md`: índice com as seções Ativos e Antigos.

> Se a empresa usa outro termo pra quem compra (aluno, paciente, usuário), o texto dos arquivos segue o termo dela; a pasta continua `Clients/`.

## Configuração desta empresa

> Preenchido no onboarding (Fase 3b). Enquanto vazio, perguntar ao usuário quando precisar.

- **Onde ficam as gravações/atas de reunião:**
- **CRM ou lista de clientes externa (link):**
- **Onde ficam os documentos enviados ao cliente (Drive, pasta):**

## Onboarding de cliente novo

Quando o usuário indicar que há um cliente novo, seguir `99 ⚙️ - SYSTEM/onboarding-cliente.md`.

## Criar um cliente (setup mínimo)

1. Pasta `02 🏢 - COMPANY/Clients/Active/<Nome>/`.
2. `Overview.md` a partir de `98 📄 - TEMPLATES/Cliente.template.md`.
3. **Só a pasta + `Overview.md`.** Subpastas nascem sob demanda, junto com o primeiro arquivo delas. Nomes quando precisarem existir:
   - `Reports/`: relatórios e peças geradas pro cliente
   - `Assets/`: logo e identidade visual
   - Projeto do cliente com início e fim → pasta própria dentro dele, com `Overview.md` e `type: project`
4. Link em `_Clients.md` (seção Ativos) com **caminho completo**: `[[02 🏢 - COMPANY/Clients/Active/<Nome>/Overview|<Nome>]]`.

## Registrar reunião de cliente

**Se a empresa já grava reuniões numa ferramenta (Meet, Zoom, Fireflies, Gemini, etc.), essa ferramenta é a fonte da verdade. O vault não duplica ata.** Ata copiada e meio mantida é pior que nenhuma: quem lê o vault acha que está vendo tudo.

Depois da reunião:
1. Atualizar o `Overview.md` do cliente com o que **mudou** (decisão, fato novo, mudança de rumo): uma entrada no `Histórico`, não a narrativa da conversa.
2. Criar as tarefas em `01 ⚡ - TASKS` a partir dos próximos passos.
3. Linha no log com o link da gravação/ata.

Se a empresa **não** grava reuniões, aí sim usar `98 📄 - TEMPLATES/Reunião.template.md` dentro da pasta do cliente.

## Cadência de reunião por fase

Reunião semanal fixa não escala: cada cliente novo soma uma recorrência na agenda. A cadência acompanha a fase:

| Fase | Cadência | Critério de saída |
|---|---|---|
| **Onboarding** (2 a 4 primeiras semanas) | Semanal | Setup concluído, cliente sem dúvidas recorrentes |
| **Estabilização** | Quinzenal | 2 a 3 ciclos sem pendência crítica |
| **Manutenção** | Mensal | Padrão do cliente estável |
| **Gatilho** | Pontual | Resultado relevante, decisão pendente ou urgência |

- Entre reuniões, manter contato por atualização assíncrona (relatório, mensagem, vídeo curto).
- Mudança de fase vai pro `Overview.md` do cliente.

## Vencimento de contrato — avisos 30/15/5

Se o Claude tem acesso ao calendário, todo contrato com data de fim gera 3 eventos de dia inteiro: **30 dias** (planejar renovação), **15 dias** (conversa de renovação), **5 dias** (renovação fechada ou plano de encerramento). Título: `⚠️ <N> dias: contrato <Cliente> vence DD/MM`. A data de fim também fica no `Overview.md` do cliente, no formato `até YYYY-MM-DD`.

## Conversão de Lead → Cliente

Quando um prospect de `02 🏢 - COMPANY/Sales/Prospects/<Nome>/` fecha:

1. Criar `Clients/Active/<Nome>/Overview.md` a partir do template.
2. **Herdar tudo** do prospect: histórico da negociação, dores, condições fechadas entram como primeiras entradas do `Histórico`.
3. Mover os outros arquivos do prospect (proposta, contrato, anexos) pra pasta do cliente.
4. Atualizar `Sales/_Pipeline.md`: tirar de Ativos, pôr em Fechados com link pro Overview do cliente.
5. Link em `_Clients.md` (Ativos).
6. **Apagar a pasta do prospect.** Ela deixou de existir: duas fontes da verdade divergem com o tempo.

## Encerrar um cliente

- Mover a pasta de `Clients/Active/<Nome>/` para `Clients/Former/<Nome>/`.
- `status: archived` no Overview, com o motivo do encerramento no `Histórico`.
- Mover o link em `_Clients.md` de Ativos pra Antigos, com o caminho novo.

## Não fazer

- Não duplicar dado de CRM ou financeiro: contexto + estratégia + link pra fonte viva.
- Não usar `[[NomeCliente]]` solto em índice: sempre caminho completo.
- Não criar subpasta vazia "por via das dúvidas".
- Não guardar senha de cliente em nota comum: `Credenciais.md` dentro da pasta dele (fora do git).
