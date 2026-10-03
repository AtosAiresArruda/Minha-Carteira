# Decisões do projeto

Registro mantido pelo diretor-geral. Uma entrada por decisão, mais recente no topo.

## 2026-10-03 — Agentes de sessão própria falam direto com o diretor-geral (A-10)
**Decisão:** agentes que rodam em sessão própria (hoje, o engenheiro-software) recebem as ferramentas SendMessage e ListAgents e enviam relatórios, pedidos de operações git e dúvidas de coordenação direto à sessão do diretor-geral, sem o usuário repassar. O diretor-geral ganha ListAgents e responde pela mesma via. As sessões são abertas com nome fixo: `claude --agent diretor-geral --name diretor-geral` e `claude --agent engenheiro-software --name engenheiro-software`. Todo agente futuro que rode em sessão própria recebe as mesmas duas ferramentas. Os subagentes não mudam, porque já respondem dentro da sessão do diretor. O recebimento de mensagens segue o padrão do Claude Code (`crossSessionInbound` não configurado).
**Motivo:** o usuário quer que os agentes trabalhem com fluidez sem precisar repassar mensagens entre sessões.

## 2026-10-03 — Figma MCP liberado para o engenheiro-software (I-02)
**Decisão:** o plugin `figma@claude-plugins-official` fica habilitado no projeto (`.claude/settings.json`) e o engenheiro-software recebe as ferramentas de leitura e escrita do Figma MCP (criar arquivos, gerar design e diagramas, enviar assets, ler contexto, metadados e capturas). As ferramentas de Code Connect ficam de fora.
**Motivo:** o usuário pediu acesso ao Figma para prototipar o MVP com o engenheiro-software.

## 2026-10-03 — engenheiro-software e revisor-arquitetura
**Decisão:** o engenheiro-requisitos passa a se chamar engenheiro-software e amplia o papel: análise de requisitos, prototipação do MVP (fluxos e diagramas em Mermaid, contratos técnicos e telas no Figma via Figma MCP, com apoio da skill impeccable só para estrutura e usabilidade) e documentação do sistema em docs/especificacao/, fonte para os agentes de programação. Os diagramas devem ser completos. Cada alteração é revisada pelo novo agente revisor-arquitetura (opus, somente leitura), que busca inconsistências de comunicação entre classes, e o parecer é apresentado ao usuário a cada alteração. O protótipo Figma representa só o MVP; o refinamento visual fica para depois do software pronto. O Figma MCP oficial foi aprovado como serviço externo.
**Motivo:** o usuário quer prototipar o sistema e ter uma documentação consistente para orientar os agentes de programação.

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
