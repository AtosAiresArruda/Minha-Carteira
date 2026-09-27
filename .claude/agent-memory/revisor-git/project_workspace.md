---
name: project-workspace
description: Cópia de trabalho oficial migrou do OneDrive para C:\dev\Minha_Carteira; identidade git local e remoto SSH
metadata:
  type: project
---
Em 2026-09-27 o diretor-geral aprovou migrar a cópia de trabalho do OneDrive para /c/dev/Minha_Carteira (clone do GitHub), com branch `chore/agentes` para criação/ajuste de agentes.

**Why:** OneDrive sincronizando .git causa riscos de corrupção/conflito.
**How to apply:** leituras git futuras devem usar `git -C /c/dev/Minha_Carteira` depois que o clone existir; a cópia do OneDrive fica obsoleta. Remoto: git@github.com:AtosAiresArruda/Minha-Carteira.git (SSH). Identidade local por repositório: "Atos Aires Arruda" <atos.a.arruda@gmail.com> — configurar em todo clone novo. Hook bloqueia `git config` para o revisor; ler `.git/config` com Read.
