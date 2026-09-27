#!/bin/bash
# Hook PreToolUse do operador-git: bloqueia operações git destrutivas.
# Exit 2 bloqueia o comando e devolve a mensagem de stderr ao agente.

CMD=$(cat | tr -d '\n' | sed -n 's/.*"command"[[:space:]]*:[[:space:]]*"\(\([^"\\]\|\\.\)*\)".*/\1/p')

bloquear() {
  echo "Bloqueado: $1. Pare e reporte ao revisor-git." >&2
  exit 2
}

echo "$CMD" | grep -Eq 'git[[:space:]].*push.*([[:space:]]-f([[:space:]]|$)|--force|[[:space:]]\+[^[:space:]]+)' && bloquear "push forçado"
echo "$CMD" | grep -Eq 'git[[:space:]].*reset[[:space:]].*--hard' && bloquear "reset --hard"
echo "$CMD" | grep -Eq 'git[[:space:]].*(clean|rebase|filter-branch)([[:space:]]|$)' && bloquear "clean/rebase/filter-branch"
echo "$CMD" | grep -Eq 'git[[:space:]].*branch[[:space:]]+-D' && bloquear "exclusão forçada de branch"
echo "$CMD" | grep -Eq 'git[[:space:]].*push[[:space:]].*--delete' && bloquear "exclusão de branch remota"
echo "$CMD" | grep -Eq '(^|[;&|[:space:]])rm[[:space:]]+-[a-zA-Z]*r' && bloquear "remoção recursiva de arquivos"

exit 0
