#!/bin/bash
# Hook PreToolUse (Write|Edit) do engenheiro-requisitos: só permite escrever em
# docs/especificacao/ e na própria memória, em .claude/agent-memory/engenheiro-requisitos/.

ARQ=$(cat | tr -d '\n' | sed -n 's/.*"file_path"[[:space:]]*:[[:space:]]*"\(\([^"\\]\|\\.\)*\)".*/\1/p' | sed 's/\\\\/\//g; s/\\/\//g')

if echo "$ARQ" | grep -q '\.\./'; then
  echo "Bloqueado: caminhos com '../' não são permitidos ao engenheiro-requisitos." >&2
  exit 2
fi

if echo "$ARQ" | grep -Eq '(^|/)(docs/especificacao/|\.claude/agent-memory/engenheiro-requisitos/)'; then
  exit 0
fi

echo "Bloqueado: o engenheiro-requisitos só escreve em docs/especificacao/ e na própria memória. Mudanças no CLAUDE.md vão como proposta no relatório." >&2
exit 2
