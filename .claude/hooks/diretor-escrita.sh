#!/bin/bash
# Hook PreToolUse (Write|Edit) do diretor-geral: só permite escrever em
# docs/, .claude/agents/, .claude/agent-memory/ e CLAUDE.md.
# Exit 2 bloqueia a escrita e devolve a mensagem de stderr ao agente.

ARQ=$(cat | tr -d '\n' | sed -n 's/.*"file_path"[[:space:]]*:[[:space:]]*"\(\([^"\\]\|\\.\)*\)".*/\1/p' | sed 's/\\\\/\//g; s/\\/\//g')

if echo "$ARQ" | grep -q '\.\./'; then
  echo "Bloqueado: caminhos com '../' não são permitidos ao diretor-geral." >&2
  exit 2
fi

if echo "$ARQ" | grep -Eq '(^|/)(docs/|\.claude/agents/|\.claude/agent-memory/)|(^|/)CLAUDE\.md$'; then
  exit 0
fi

echo "Bloqueado: o diretor-geral só escreve em docs/, .claude/agents/, .claude/agent-memory/ e CLAUDE.md. Código do produto deve ser delegado a um agente especialista: $ARQ" >&2
exit 2
