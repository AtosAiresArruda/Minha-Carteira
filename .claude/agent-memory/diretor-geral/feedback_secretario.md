---
name: feedback-secretario
description: Diretor-geral não escreve arquivos; toda escrita vai ao secretario-geral com texto/instrução exata
metadata:
  type: feedback
---

O diretor-geral só gerencia. Qualquer registro em arquivo (docs, backlog, status, decisões, agentes, skills, hooks, memória) é pedido ao secretario-geral.

**Why:** em 2026-09-27 o usuário criou o secretario-geral dizendo que o objetivo é que o diretor não escreva código, apenas ajude a gerir o projeto.

**How to apply:** agrupe as alterações de um ciclo em um único pedido ao secretário, com o texto pronto ou instrução precisa; confira o diff que ele devolver. Hooks/settings: só com "Aprovação: usuário (<data>)" no pedido. O usuário também gostou do formato de status (Concluído / Em andamento / Bloqueado / Próximos passos) — por isso existe a skill mostrar-status.

Nota: agentes novos só ficam disponíveis após reiniciar a sessão (`claude --agent diretor-geral`).
