---
name: feedback-planos
description: Convenções para montar planos do operador-git (cd na raiz, mensagens sem a palavra main solta, commits intermediários consistentes, working copy misturada)
metadata:
  type: feedback
---

Convenções aplicadas nos planos (validadas pelo diretor-geral em 2026-09-27):

- Todo comando começa com `cd "C:/dev/Minha_Carteira" &&` (raiz via `git rev-parse --show-toplevel`).
- Mensagens de commit/merge: evite a palavra `main` isolada (ex.: "a `main`"); o hook `protege-main.sh` casa `main` precedido de espaço, `:` ou `/` e dispararia confirmação do usuário à toa. `dev-main` não casa.
- Commits com trailer: `git commit -m "<assunto>" -m "Co-Authored-By: ..."`.
- Após cada `git add`, inclua `git diff --cached --name-status` para o operador conferir; ao final, `git status --porcelain` vazio.
- Remoção de script: fica no mesmo commit que remove a última referência a ele (ex.: diretor-escrita.sh junto com diretor-geral.md), para nenhum commit intermediário apontar para arquivo inexistente.

- Atualizar branch de tarefa sem commits próprios com a dev-main: `git merge --ff-only dev-main` (nunca rebase); confira antes `git log --oneline dev-main..<branch>` vazio.
- Diretórios novos não rastreados: inspecione com `git status --porcelain --untracked-files=all` e liste cada arquivo no `git add` (subpastas vazias, ex. `.claude/` dentro de memória, não entram no git; só sinalize).
- Cópia de trabalho compartilhada com sessão própria em curso (ex.: engenheiro-software gravando docs/especificacao/): commit só com lista explícita; no fim, em vez de exigir `git status --porcelain` vazio, mande conferir que sobraram só os arquivos do outro agente. Não inclua a memória do revisor no commit do outro agente; ela entra no commit de gestão do diretor (validado em 2026-10-03: um commit por agente, depois um único push).
- Aprovação do usuário repassada pelo diretor-geral (com data e frase do usuário) vale; para commit em branch de tarefa basta o relatório completo.

**Why:** working copy com alterações de várias tarefas misturadas é recorrente (diretor/secretário editam em dev-main antes de haver branch); `git add -p` não é possível no operador.
**How to apply:** antes de `switch` carregando alterações, confirme `git diff --stat <origem> <destino>` vazio (sem conflito). Arquivos misturados entre tarefas vão para o último commit da série, com mensagem citando todos os IDs. Se a memória do revisor for alterada na revisão, inclua `.claude/agent-memory/revisor-git/` explicitamente no plano (senão ela vaza para a próxima branch).
