---
name: mostrar-status
description: Mostra ao usuário o status do projeto Minha Carteira (concluído, em andamento, interrompidas, bloqueado / precisa de você, próximos passos). Use sempre que o usuário pedir status, situação, andamento ou "onde estamos".
---

# mostrar-status

Uso exclusivo do diretor-geral. Apresenta o painel do projeto ao usuário, sempre no mesmo formato.

## Fontes
1. `docs/status.md`: painel mantido pelo diretor-geral (fonte principal).
2. `docs/backlog.md`: status oficial de cada tarefa.
3. Git (somente leitura): `git status -sb`, `git log --oneline --graph --all -8`, `git ls-remote --heads origin`.
4. Agentes em execução nesta sessão (notificações pendentes).

## Processo
1. Leia `docs/status.md` e `docs/backlog.md`.
2. Rode os comandos git acima.
3. Confira as fontes entre si. Se houver divergência (tarefa "em andamento" no painel mas já commitada, agente que terminou, branch que não existe), apresente o estado REAL e peça ao secretario-geral para corrigir `docs/status.md` e o backlog.
4. Tarefa que estava em andamento e parou sem terminar (sessão encerrada, agente falhou, aguardando algo que não é o usuário) vai para "Interrompidas", com onde parou e como retomar.
5. Responda no formato abaixo, em português, direto, sem repetir o backlog inteiro.

## Formato da resposta
~~~
## Status
**Concluído**
- <ID>: <resultado em linguagem do usuário> (<commit>, se houver)

**Em andamento**
- <ID> — <agente> — <situação>

**Interrompidas**
- <ID> — <onde parou> — <motivo> — <como retomar>

**Bloqueado / precisa de você**
- <ID>: <decisão ou ação necessária, com opções quando houver>

## Próximos passos
1. <sugestão, em ordem de prioridade>
~~~
Seções vazias: escreva "- nada no momento". "Concluído" mostra só o que terminou desde o último status apresentado.
