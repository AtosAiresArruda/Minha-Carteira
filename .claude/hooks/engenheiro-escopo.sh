#!/bin/bash
# Hook PreToolUse (Write|Edit) do engenheiro-software: só permite escrever em
# docs/especificacao/ e na própria memória, em .claude/agent-memory/engenheiro-software/.

ARQ=$(cat | tr -d '\n' | sed -n 's/.*"file_path"[[:space:]]*:[[:space:]]*"\(\([^"\\]\|\\.\)*\)".*/\1/p' | sed 's/\\\\/\//g; s/\\/\//g')

if echo "$ARQ" | grep -q '\.\./'; then
  echo "Bloqueado: caminhos com '../' não são permitidos ao engenheiro-software." >&2
  exit 2
fi

if echo "$ARQ" | grep -Eq '(^|/)(docs/especificacao/|\.claude/agent-memory/engenheiro-software/)'; then
  exit 0
fi

echo "Bloqueado: o engenheiro-software só escreve em docs/especificacao/ e na própria memória. Mudanças no CLAUDE.md vão como proposta no relatório." >&2
exit 2
