---
type: system
status: active
---

# Playbook — Processar o Inbox

Objetivo: `00 📥 - INBOX` deve voltar a ficar vazio (menos a subpasta `Ideias/`). Nada mora aqui.

## Passos

1. Liste todos os arquivos na raiz de `00 📥 - INBOX/`.
2. Para cada item, decida o destino:
   - É uma **tarefa**? → `01 ⚡ - TASKS/Backlog/` (ou o estágio certo). `type: task`.
   - É um **projeto** (objetivo + início + fim)? → pasta dentro do dono: área em `02 🏢 - COMPANY/<Área>/<Projeto>/` ou cliente em `Clients/Active/<Nome>/<Projeto>/`, com `Overview.md`. `type: project`.
   - É sobre a **empresa** (decisão, dado, documento de uma área)? → `02 🏢 - COMPANY/<Área>/`. `type: business`.
   - É sobre um **cliente**? → pasta dele em `02 🏢 - COMPANY/Clients/Active/<Nome>/`, normalmente como entrada no `Histórico` do `Overview.md`.
   - É **conhecimento** perpétuo? → `03 🧠 - KNOWLEDGE/<tema>/`. `type: knowledge`.
   - É **processo repetível**? → `04 📋 - SOPS/` (raiz). `type: sop`.
   - É **ideia solta** sem destino óbvio? → `00 📥 - INBOX/Ideias/`.
   - Envolve **dinheiro**? → perguntar se é pra cadastrar (`financas.md`) antes de mover.
3. Ao mover: aplique o frontmatter padrão, renomeie conforme as regras de nome e linke no índice da área.
4. Lixo ou duplicado: proponha descartar e só apague com confirmação (exclusão vai pro log).
5. No fim, confirme: Inbox vazio. Registre no log o que foi pra onde.

## Regra de ouro

Na dúvida entre dois destinos, escolha o mais específico e registre a decisão no `area:`. Não crie pasta nova sem necessidade real: subpasta só nasce junto com o primeiro arquivo dela.
