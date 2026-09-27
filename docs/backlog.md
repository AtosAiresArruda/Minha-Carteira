# Backlog — Minha Carteira

Mantido pelo diretor-geral. Status: `a fazer` · `em andamento` · `em revisão` · `concluído` · `bloqueado`.

## Objetivo atual
MVP: usuário acessa os gráficos referentes aos seus gastos (ver `CLAUDE.md`).

## Equipe
| Agente | Papel | Modelo | Situação |
|---|---|---|---|
| diretor-geral | Coordena, planeja, delega, gerencia a fila git | opus | em construção (`chore/agentes`) |
| revisor-git | Revisa pedidos git e devolve plano de comandos | opus | ativo — precisa de ajustes (A-01) |
| operador-git | Executa o plano aprovado pelo revisor | haiku | ativo — precisa de ajustes (A-01) |

## Tarefas

| ID | Tarefa | Status | Agente | Branch | Depende de |
|---|---|---|---|---|---|
| A-00 | Escrever o agente diretor-geral e o modelo de branches (dev-main) | em revisão | coordenador | chore/agentes | — |
| A-04 | Criar `dev-main` a partir de `main`, publicar no GitHub e integrar `chore/agentes` nela | em andamento | diretor-geral (via revisor/operador) | dev-main | A-00 |
| A-01 | Corrigir os agentes de git (ver detalhes) | a fazer | diretor-geral | chore/agentes | A-00 |
| A-02 | Decidir se Objective C++ permanece na stack (suporte atual: só Android) | a fazer | diretor-geral + usuário | — | A-00 |
| A-03 | Criar agentes de desenvolvimento (dev-flutter, dev-cpp-opencv, dev-ui, testador...) com bloqueio de git | a fazer | diretor-geral | chore/agentes | A-00, A-01, A-02 |
| I-01 | Remover a cópia antiga do projeto no OneDrive | concluído (falta só apagar a pasta vazia, fora da sessão) | usuário | — | — |

### A-01 — Correções nos agentes de git
- [x] Proteção da `main`: substituída a regra `ask` por hook global `protege-main.sh`, que pede confirmação ao usuário em qualquer forma de merge/push na `main`.
- [x] revisor-git e operador-git: regras de aprovação por branch (tarefa → dev-main pelo diretor; dev-main → main pelo usuário).
- [ ] revisor-git: confirmar que a memória de projeto (`.claude/agent-memory/revisor-git/`) é gravada mesmo com `Write` bloqueado, e se deve ser versionada.
- [ ] operador-git: garantir que os comandos rodem sempre na raiz do repositório (cwd é reiniciado entre chamadas; hoje depende de `cd` em cada comando).
- [ ] Hooks: revisar os padrões de bloqueio após o uso real (falsos positivos/negativos).
- [~] **Bloqueante (2026-09-27) — correção aplicada no frontmatter do diretor (libera `agent_type` operador-git); falta validar no uso real (A-04):** com `claude --agent diretor-geral`, os hooks do frontmatter do diretor valem para a sessão inteira, inclusive para os subagentes. O `git-somente-leitura.sh` bloqueou o operador-git. Corrigir para que o hook libere quando quem chama é o operador-git (ou mover o bloqueio para outro mecanismo).
- [ ] revisor-git: liberar escrita apenas em `.claude/agent-memory/revisor-git/` (usuário aprovou em 2026-09-27).
- [~] `git-somente-leitura.sh`: bloquear `branch`/`remote`/`worktree` que alteram — `branch`/`remote` feitos; falta `worktree`.
- [ ] `diretor-escrita.sh`: ancorar caminhos permitidos em `$CLAUDE_PROJECT_DIR` (sugestão do revisor).
