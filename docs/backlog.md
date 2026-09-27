# Backlog — Minha Carteira

Mantido pelo diretor-geral. Status: `a fazer` · `em andamento` · `em revisão` · `concluído` · `bloqueado`.

## Objetivo atual
MVP: usuário acessa os gráficos referentes aos seus gastos (ver `CLAUDE.md`).

## Equipe
| Agente | Papel | Modelo | Situação |
|---|---|---|---|
| diretor-geral | Coordena, planeja, delega, gerencia a fila git | opus | ativo |
| revisor-git | Revisa pedidos git e devolve plano de comandos | opus | ativo |
| operador-git | Executa o plano aprovado pelo revisor | haiku | ativo |
| secretario-geral | Escreve arquivos de gestão (.md, .sh, agentes, skills, memória) a pedido do diretor | sonnet | ativo |
| engenheiro-requisitos | Entrevista o usuário e escreve a especificação em docs/especificacao/ (sessão própria) | opus | ativo |

## Tarefas

| ID | Tarefa | Status | Agente | Branch | Depende de |
|---|---|---|---|---|---|
| A-00 | Escrever o agente diretor-geral e o modelo de branches (dev-main) | concluído (521ef40) | coordenador | chore/agentes | — |
| A-04 | Criar `dev-main` a partir de `main`, publicar no GitHub e integrar `chore/agentes` nela | concluído (a3d47e3, publicado) | diretor-geral (via revisor/operador) | dev-main | A-00 |
| A-01 | Corrigir os agentes de git (ver detalhes) | em revisão (resta só a revisão contínua dos hooks) | diretor-geral | chore/agentes | A-00 |
| A-02 | Decidir se Objective C++ permanece na stack (suporte atual: só Android) | a fazer (será tratada na entrevista E-01) | diretor-geral + usuário | — | A-00 |
| A-03 | Criar agentes de desenvolvimento (dev-flutter, dev-cpp-opencv, dev-ui, testador...) com bloqueio de git | a fazer | diretor-geral | chore/agentes | A-00, A-01, A-02, E-01 |
| S-01 | Criar a skill `mostrar-status` + painel `docs/status.md` | em revisão (skill criada pelo secretario-geral) | diretor-geral | chore/agentes | — |
| A-05 | Criar o agente secretario-geral e retirar Write/Edit do diretor-geral | em revisão | diretor-geral + secretario-geral | chore/agentes | — |
| A-06 | Criar o agente engenheiro-requisitos (entrevista de especificação) | em revisão | secretario-geral | chore/agentes | — |
| E-01 | Entrevista de especificação do MVP e documentação em docs/especificacao/ | a fazer | engenheiro-requisitos (sessão própria) | docs/especificacao-mvp | A-06 |
| I-01 | Remover a cópia antiga do projeto no OneDrive | concluído (falta só apagar a pasta vazia, fora da sessão) | usuário | — | — |

### A-01 — Correções nos agentes de git
- [x] Proteção da `main`: substituída a regra `ask` por hook global `protege-main.sh`, que pede confirmação ao usuário em qualquer forma de merge/push na `main`.
- [x] revisor-git e operador-git: regras de aprovação por branch (tarefa → dev-main pelo diretor; dev-main → main pelo usuário).
- [x] revisor-git: confirmado na A-04 que ele NÃO consegue gravar memória (sem Write). Memória é versionada. Resolver com o item "liberar escrita" abaixo.
- [x] operador-git: garantir que os comandos rodem sempre na raiz do repositório (cwd é reiniciado entre chamadas; hoje depende de `cd` em cada comando).
- [ ] Hooks: revisar os padrões de bloqueio após o uso real (falsos positivos/negativos).
- [x] **Bloqueante (2026-09-27) — corrigido: o hook do diretor libera `agent_type` operador-git; validado na A-04:** com `claude --agent diretor-geral`, os hooks do frontmatter do diretor valem para a sessão inteira, inclusive para os subagentes. O `git-somente-leitura.sh` bloqueou o operador-git. Corrigir para que o hook libere quando quem chama é o operador-git (ou mover o bloqueio para outro mecanismo).
- [x] revisor-git: liberar escrita apenas em `.claude/agent-memory/revisor-git/` (usuário aprovou em 2026-09-27).
- [x] `git-somente-leitura.sh`: bloquear `branch`/`remote`/`worktree` que alteram — worktree incluído.
- [x] diretor-escrita.sh: removido (sem uso após A-05).
- [x] `protege-main.sh`: cobrir também `git branch -f main`, `git update-ref refs/heads/main` e similares (hoje só pega merge/push) — apontado pelo revisor na A-04.
