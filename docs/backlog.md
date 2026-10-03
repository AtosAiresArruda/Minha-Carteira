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
| engenheiro-software | Análise de requisitos, prototipação (fluxos, diagramas, contratos, Figma) e documentação do sistema em docs/especificacao/ (sessão própria) | opus | ativo |
| revisor-arquitetura | Revisa diagramas/contratos/protótipo a cada alteração (somente leitura), chamado pelo engenheiro-software | opus | ativo |

## Tarefas

| ID | Tarefa | Status | Agente | Branch | Depende de |
|---|---|---|---|---|---|
| A-00 | Escrever o agente diretor-geral e o modelo de branches (dev-main) | concluído (521ef40) | coordenador | chore/agentes | — |
| A-04 | Criar `dev-main` a partir de `main`, publicar no GitHub e integrar `chore/agentes` nela | concluído (a3d47e3, publicado) | diretor-geral (via revisor/operador) | dev-main | A-00 |
| A-01 | Corrigir os agentes de git (ver detalhes) | concluído (370e9dd, 45f69e3; em dev-main 658f317) | diretor-geral | chore/agentes | A-00 |
| A-02 | Decidir se Objective C++ permanece na stack (suporte atual: só Android) | a fazer (será tratada na entrevista E-01) | diretor-geral + usuário | — | A-00 |
| A-03 | Criar agentes de desenvolvimento (dev-flutter, dev-cpp-opencv, dev-ui, testador...) com bloqueio de git | a fazer | diretor-geral | chore/agentes | A-00, A-01, A-02, E-01 |
| S-01 | Criar a skill `mostrar-status` + painel `docs/status.md` | concluído (71b4bcc; em dev-main 658f317) | diretor-geral | chore/agentes | — |
| A-05 | Criar o agente secretario-geral e retirar Write/Edit do diretor-geral | concluído (71b4bcc, 45f69e3; em dev-main 658f317) | diretor-geral + secretario-geral | chore/agentes | — |
| A-06 | Criar o agente engenheiro-requisitos (entrevista de especificação) | concluído (45f69e3; em dev-main 658f317) | secretario-geral | chore/agentes | — |
| A-07 | Revisar os padrões de bloqueio dos hooks após o uso real (falsos positivos/negativos) — contínua | a fazer | diretor-geral + secretario-geral (mudanças só com aprovação do usuário) | chore/agentes | A-01 |
| E-01 | Entrevista de especificação do MVP e documentação em docs/especificacao/ | em andamento (entrevista iniciada em 2026-10-03; branch sendo atualizada com dev-main para o engenheiro escrever) | engenheiro-software (sessão própria) | docs/especificacao-mvp | A-06, A-08, A-09, I-02 |
| A-08 | Renomear e ampliar o engenheiro-requisitos para engenheiro-software (prototipação + documentação do sistema) | concluído (9df1f62) | secretario-geral | chore/agentes | A-06 |
| A-09 | Criar o agente revisor-arquitetura | concluído (9df1f62) | secretario-geral | chore/agentes | A-08 |
| I-02 | Instalar e autenticar o Figma MCP (plugin figma@claude-plugins-official, escopo project) e liberar as ferramentas no engenheiro-software | em andamento (ferramentas liberadas; falta validar a autenticação na sessão do engenheiro) | usuário + diretor-geral | chore/agentes | A-08 |
| A-10 | Comunicação direta entre sessões: diretor-geral ganha ListAgents; engenheiro-software ganha SendMessage e ListAgents e passa a enviar relatórios e pedidos git direto à sessão diretor-geral; sessões abertas com --name fixo; regra para agentes futuros de sessão própria | em andamento (edições aplicadas; falta reabrir as sessões e validar a troca de mensagens) | usuário + diretor-geral | chore/agentes | A-08 |
| I-01 | Remover a cópia antiga do projeto no OneDrive | concluído (falta só apagar a pasta vazia, fora da sessão) | usuário | — | — |

### A-01 — Correções nos agentes de git
- [x] Proteção da `main`: substituída a regra `ask` por hook global `protege-main.sh`, que pede confirmação ao usuário em qualquer forma de merge/push na `main`.
- [x] revisor-git e operador-git: regras de aprovação por branch (tarefa → dev-main pelo diretor; dev-main → main pelo usuário).
- [x] revisor-git: confirmado na A-04 que ele NÃO consegue gravar memória (sem Write). Memória é versionada. Resolver com o item "liberar escrita" abaixo.
- [x] operador-git: garantir que os comandos rodem sempre na raiz do repositório (cwd é reiniciado entre chamadas; hoje depende de `cd` em cada comando).
- [x] Hooks: revisão contínua movida para a tarefa A-07.
- [x] **Bloqueante (2026-09-27) — corrigido: o hook do diretor libera `agent_type` operador-git; validado na A-04:** com `claude --agent diretor-geral`, os hooks do frontmatter do diretor valem para a sessão inteira, inclusive para os subagentes. O `git-somente-leitura.sh` bloqueou o operador-git. Corrigir para que o hook libere quando quem chama é o operador-git (ou mover o bloqueio para outro mecanismo).
- [x] revisor-git: liberar escrita apenas em `.claude/agent-memory/revisor-git/` (usuário aprovou em 2026-09-27).
- [x] `git-somente-leitura.sh`: bloquear `branch`/`remote`/`worktree` que alteram — worktree incluído.
- [x] diretor-escrita.sh: removido (sem uso após A-05).
- [x] `protege-main.sh`: cobrir também `git branch -f main`, `git update-ref refs/heads/main` e similares (hoje só pega merge/push) — apontado pelo revisor na A-04.
