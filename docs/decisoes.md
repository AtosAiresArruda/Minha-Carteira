# Decisões do projeto

Registro mantido pelo diretor-geral. Uma entrada por decisão, mais recente no topo.

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
