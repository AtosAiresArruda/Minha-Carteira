#!/bin/bash
# Hook PreToolUse (Bash) de agentes sem permissão de escrita no git (revisor-git, diretor-geral):
# permite apenas comandos git de leitura.
# Exit 2 bloqueia o comando e devolve a mensagem de stderr ao agente.

CMD=$(cat | tr -d '\n' | sed -n 's/.*"command"[[:space:]]*:[[:space:]]*"\(\([^"\\]\|\\.\)*\)".*/\1/p')

MUTANTES='(commit|push|pull|merge|rebase|reset|checkout|switch|add|rm|mv|tag|stash|cherry-pick|revert|clean|restore|init|am|apply|gc|prune|filter-branch|update-ref|config)'

if echo "$CMD" | grep -Eq "(^|[;&|[:space:]])git([[:space:]]+[^;&|[:space:]]+)*[[:space:]]+worktree[[:space:]]+(add|remove|move|prune|lock|unlock|repair)([[:space:]]|$)"; then
  echo "Bloqueado: alterar worktrees é tarefa do operador-git." >&2
  exit 2
fi

if echo "$CMD" | grep -Eq "(^|[;&|[:space:]])git([[:space:]]+[^;&|[:space:]]+)*[[:space:]]+$MUTANTES([[:space:]]|$)"; then
  echo "Bloqueado: este agente só pode usar comandos git de leitura (status, diff, log, show, branch, ls-remote, fetch). Operações que alteram o repositório passam pelo revisor-git e são executadas pelo operador-git." >&2
  exit 2
fi

if echo "$CMD" | grep -Eq "(^|[;&|[:space:]])git([[:space:]]+[^;&|[:space:]]+)*[[:space:]]+(branch|remote)[[:space:]]+(-[dDmMcC]|--delete|--move|--copy|add|remove|rm|rename|set-url)"; then
  echo "Bloqueado: alterar branches ou remotos é tarefa do operador-git." >&2
  exit 2
fi

exit 0
