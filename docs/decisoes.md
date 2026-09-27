# Decisões do projeto

Registro mantido pelo diretor-geral. Uma entrada por decisão, mais recente no topo.

## 2026-09-27 — Agente engenheiro-requisitos
**Decisão:** a especificação do produto é definida em entrevistas conduzidas pelo agente engenheiro-requisitos (opus), em sessão própria (`claude --agent engenheiro-requisitos`), e registrada em `docs/especificacao/` (requisitos numerados com critérios de aceite, contratos, glossário, perguntas abertas, atas). O agente não altera o CLAUDE.md: propõe as mudanças e o diretor-geral aplica com aprovação do usuário. Os temas incluem as funcionalidades de gestão da carteira de gastos.
**Motivo:** o usuário quer requisitos definidos com precisão para que os agentes futuros trabalhem a partir da documentação, sem inconsistências.

## 2026-09-27 — Ajustes de hooks e agentes de git (A-01)
**Decisão:** o revisor-git pode escrever apenas na própria memória (hook `revisor-memoria.sh`). `git-somente-leitura.sh` passa a bloquear alterações de worktree. `protege-main.sh` pede confirmação do usuário também para `branch -f/-m/-d`, `update-ref`, `checkout -B`/`switch -C` na `main`. `diretor-escrita.sh` foi removido. Os planos do revisor começam cada comando com `cd "<raiz do repositório>" &&`.
**Motivo:** fechar brechas apontadas pelo revisor na A-04 e tornar o operador independente do diretório de trabalho; aprovado pelo usuário.

## 2026-09-27 — Agente secretario-geral
**Decisão:** o diretor-geral não escreve arquivos (Write/Edit retirados). Toda escrita de gestão (.md, .sh, agentes, skills, docs, memória, settings) é feita pelo secretario-geral (sonnet), a pedido do diretor. Hooks e `settings.json` só com aprovação do usuário registrada no pedido. Código do produto é bloqueado pelo hook `secretario-escopo.sh`.
**Motivo:** o usuário quer que o diretor apenas gerencie o projeto, sem escrever código nem arquivos.

## 2026-09-27 — Skill `mostrar-status` e painel `docs/status.md`
**Decisão:** o status do projeto é apresentado pela skill `mostrar-status` (`.claude/skills/mostrar-status/SKILL.md`), que lê o painel `docs/status.md` (seções: em andamento, interrompidas, bloqueado / precisa de você, sugestões de próximos passos) e confere com git e backlog. A skill é escrita e mantida pelo secretario-geral.
**Motivo:** o usuário aprovou o formato de status usado e quer recebê-lo sempre igual, sob demanda.

## 2026-09-27 — Branch de integração `dev-main` e aprovação da `main`
**Decisão:** fluxo `tipo/tarefa → dev-main → main`. Os agentes tratam `dev-main` como a main do projeto. Merge em `dev-main` exige só a aprovação do diretor-geral. Merge na `main` só vem de `dev-main` e exige que o diretor-geral apresente ao usuário o que foi feito e o que muda, e que o usuário aprove explicitamente. Um hook global (`protege-main.sh`) pede confirmação ao usuário em qualquer merge/push na `main`.
**Motivo:** o usuário quer controle sobre o que chega à `main` sem precisar aprovar cada tarefa.

## 2026-09-27 — Projeto fora do OneDrive
**Decisão:** a cópia de trabalho oficial é `C:\dev\Minha_Carteira`, clonada do GitHub.
**Motivo:** a sincronização do OneDrive pode corromper a pasta `.git`.

## 2026-09-27 — Branch dedicada a agentes
**Decisão:** criação e ajuste de agentes acontecem na branch `chore/agentes`.
**Motivo:** separar a configuração da equipe do código do produto.

## 2026-09-27 — Fluxo git com revisor e operador
**Decisão:** nenhum agente altera o repositório diretamente. O revisor-git revisa e planeja, o operador-git executa. Push na `main` exige confirmação do usuário.
**Motivo:** controle e rastreabilidade do que entra no repositório.

## 2026-09-27 — Repositório no GitHub
**Decisão:** `git@github.com:AtosAiresArruda/Minha-Carteira.git`, branch principal `main`. Agentes, hooks e `CLAUDE.md` são versionados para que colaboradores recebam a mesma equipe.
