#!/bin/bash
# Hook PreToolUse (Write|Edit) do revisor-git: só permite escrever na própria
# memória, em .claude/agent-memory/revisor-git/.

ARQ=$(cat | tr -d '\n' | sed -n 's/.*"file_path"[[:space:]]*:[[:space:]]*"\(\([^"\\]\|\\.\)*\)".*/\1/p' | sed 's/\\\\/\//g; s/\\/\//g')

if echo "$ARQ" | grep -q '\.\./'; then
  echo "Bloqueado: caminhos com '../' não são permitidos ao revisor-git." >&2
  exit 2
fi

if echo "$ARQ" | grep -Eq '(^|/)\.claude/agent-memory/revisor-git/'; then
  exit 0
fi

echo "Bloqueado: o revisor-git só escreve na própria memória (.claude/agent-memory/revisor-git/)." >&2
exit 2
