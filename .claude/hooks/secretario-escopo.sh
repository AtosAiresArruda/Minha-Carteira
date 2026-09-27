#!/bin/bash
# Hook PreToolUse (Write|Edit) do secretario-geral: só permite escrever em
# docs/, .claude/agents/, .claude/skills/, .claude/agent-memory/, CLAUDE.md.
# .claude/hooks/ e .claude/settings.json exigem "Aprovação: usuário (<data>)"
# no pedido do diretor-geral (regra do prompt, não verificada por este script).
# Bloqueia sempre: caminhos com "../", settings.local.json e código do produto.

ARQ=$(cat | tr -d '\n' | sed -n 's/.*"file_path"[[:space:]]*:[[:space:]]*"\(\([^"\\]\|\\.\)*\)".*/\1/p' | sed 's/\\\\/\//g; s/\\/\//g')

if echo "$ARQ" | grep -q '\.\./'; then
  echo "Bloqueado: caminhos com '../' não são permitidos ao secretario-geral." >&2
  exit 2
fi

if echo "$ARQ" | grep -Eq '(^|/)\.claude/settings\.local\.json$'; then
  echo "Bloqueado: .claude/settings.local.json é configuração pessoal do usuário." >&2
  exit 2
fi

if echo "$ARQ" | grep -Eq '\.(dart|cpp|cc|c|h|hpp|mm|m|kt|java|gradle|kts)$|(^|/)pubspec\.yaml$|(^|/)CMakeLists\.txt$'; then
  echo "Bloqueado: código do produto é tarefa dos agentes de desenvolvimento: $ARQ" >&2
  exit 2
fi

if echo "$ARQ" | grep -Eq '(^|/)(docs/|\.claude/agents/|\.claude/skills/|\.claude/agent-memory/|\.claude/hooks/)|(^|/)CLAUDE\.md$|(^|/)\.claude/settings\.json$'; then
  exit 0
fi

echo "Bloqueado: o secretario-geral só escreve em docs/, .claude/agents/, .claude/skills/, .claude/agent-memory/, .claude/hooks/, CLAUDE.md e .claude/settings.json: $ARQ" >&2
exit 2
