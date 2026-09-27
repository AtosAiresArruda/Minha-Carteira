---
name: feedback-automacao
description: Usuário quer o fluxo git totalmente automático entre agentes; só o merge para a main exige a participação dele
metadata:
  type: feedback
---

O fluxo tarefa → revisor-git → operador-git → dev-main deve rodar sem o usuário no dia a dia. A única operação que exige a participação dele é o merge de dev-main na main (a forma desse merge ainda vai ser definida).

**Why:** em 2026-09-27 o operador-git foi bloqueado por um hook herdado do diretor-geral, e a solução sugerida ("você roda os comandos") foi recusada: "é para isso que estamos dividindo as tarefas entre agentes".

**How to apply:** não proponha que o usuário execute comandos git ou abra outras sessões como solução de rotina. Se algo travar o fluxo, corrija a configuração (com o aval dele para mudanças de hooks e permissões). Fora do merge na main, só peça a ele o que o sistema exige.

Nota técnica: com `claude --agent diretor-geral`, os hooks do frontmatter do diretor valem para os subagentes. O JSON do hook traz `agent_type`/`agent_id` para identificar quem chama. O diretor não consegue editar os próprios hooks: o classificador bloqueia a auto-modificação, e o usuário precisa aplicar a mudança.
