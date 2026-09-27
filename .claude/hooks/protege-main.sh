#!/bin/bash
# Hook PreToolUse (Bash) global: qualquer merge ou push que atinja a branch `main`
# exige confirmação explícita do usuário, seja qual for a forma do comando
# (git -C, cd && git, refspec HEAD:main, push sem argumentos estando na main...).
# Não bloqueia: devolve "ask", e o Claude Code pergunta ao usuário.

CMD=$(cat | tr -d '\n' | sed -n 's/.*"command"[[:space:]]*:[[:space:]]*"\(\([^"\\]\|\\.\)*\)".*/\1/p')

echo "$CMD" | grep -Eq '(^|[;&|[:space:]])git([[:space:]]|$)' || exit 0

TOKEN_MAIN='(^|[[:space:]:/])main([[:space:]"]|$)'
BRANCH_ATUAL=$(git -C "${CLAUDE_PROJECT_DIR:-.}" symbolic-ref --short HEAD 2>/dev/null)

perguntar() {
  printf '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"ask","permissionDecisionReason":"%s"}}\n' "$1"
  exit 0
}

if echo "$CMD" | grep -Eq '(^|[[:space:]])push([[:space:]]|$)'; then
  echo "$CMD" | grep -Eq "$TOKEN_MAIN" && perguntar "Push na main: exige aprovação do usuário."
  [ "$BRANCH_ATUAL" = "main" ] && perguntar "Push estando na branch main: exige aprovação do usuário."
fi

if echo "$CMD" | grep -Eq '(^|[[:space:]])merge([[:space:]]|$)'; then
  echo "$CMD" | grep -Eq "$TOKEN_MAIN" && perguntar "Merge envolvendo a main: exige aprovação do usuário."
  [ "$BRANCH_ATUAL" = "main" ] && perguntar "Merge na branch main: exige aprovação do usuário."
fi

if echo "$CMD" | grep -Eq '(^|[[:space:]])branch([[:space:]]|$)' && echo "$CMD" | grep -Eq '[[:space:]](-f|--force|-m|-M|-c|-C|-d|-D|--delete|--move)([[:space:]]|$)' && echo "$CMD" | grep -Eq "$TOKEN_MAIN"; then
  perguntar "Alterar a branch main: exige aprovação do usuário."
fi

if echo "$CMD" | grep -Eq '(^|[[:space:]])update-ref([[:space:]]|$)' && echo "$CMD" | grep -Eq 'refs/heads/main'; then
  perguntar "Alterar a branch main: exige aprovação do usuário."
fi

if echo "$CMD" | grep -Eq '(^|[[:space:]])checkout[[:space:]]+-B[[:space:]]+main([[:space:]]|$)'; then
  perguntar "Alterar a branch main: exige aprovação do usuário."
fi

if echo "$CMD" | grep -Eq '(^|[[:space:]])switch[[:space:]]+(-C|--force-create)[[:space:]]+main([[:space:]]|$)'; then
  perguntar "Alterar a branch main: exige aprovação do usuário."
fi

exit 0
