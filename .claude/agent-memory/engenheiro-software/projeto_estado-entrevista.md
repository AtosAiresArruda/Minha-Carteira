---
name: estado-entrevista
description: Onde a entrevista E-01 e o protótipo do MVP pararam (tema atual, respostas guardadas, pendências de branch/Figma/git)
metadata:
  type: project
---

Estado ao fim da 1ª sessão (2026-10-03):
- NADA foi gravado em docs/especificacao/ (não existe). Motivo: cópia de trabalho na branch `chore/agentes`; a
  `docs/especificacao-mvp` estava em 658f317, atrás da dev-main (a0112ca). Pedido de switch + atualização com dev-main
  foi preparado (relatório para revisor-git) e entregue ao usuário para levar ao diretor-geral.
- Havia 4 arquivos de gestão não commitados na chore/agentes (settings.json, backlog, decisoes, status) — devem ser
  commitados lá antes da troca, senão viajam junto.
- Tema 1 respondido; resumo apresentado e AGUARDANDO CONFIRMAÇÃO do usuário (ver [[tema1-respostas]]).
- Próximo: confirmar Tema 1 → Tema 2 (envio da foto e estados do cupom).
- Protótipo: não iniciado. Figma: usuário vai configurar o MCP na nova sessão (I-02). GitHub MCP falhou (irrelevante).
- Usuário disse que na nova sessão terei acesso para falar com o diretor-geral sobre git.

Atualização 2ª sessão (2026-10-03):
- Tema 1 CONFIRMADO. Próximo: Tema 2.
- Diretor respondeu: cópia já em docs/especificacao-mvp = dev-main 9bc3d45 (pedido git arquivado). Ele confirma a
  proposta do CLAUDE.md com o usuário. Quer relatório para revisor-git quando houver bloco com parecer do revisor.
- GRAVADOS: docs/especificacao/README.md, entrevistas/2026-10-03.md, perguntas-abertas.md (PA-01, PA-02), glossario.md.
  Ainda sem requisitos.md, diagramas, contratos, protótipo.
- Novo Objetivo Atual do CLAUDE.md (protótipo Figma + documentação) APROVADO pelo usuário; secretario aplica e faz
  o commit dos arquivos de gestão separado (não incluir no meu relatório).
- Figma MCP autenticado e funcionando (I-02 fechada pelo diretor).
- Diretor perguntou se o HTML é entrega: respondi que é etapa de trabalho; a entrega é o Figma.
- Tema 2 FECHADO e gravado ([[tema2-respostas]]). PA-03 respondida (D23: preco_item = preço unitário).
- D24: LGPD virou Tema 11 (último), a pedido do usuário; PA-01 e PA-08 movidas para ele. Tema 8 = offline/desempenho/acessibilidade.
- Tema 3 EM ANDAMENTO. Rodada 1: infra classifica tudo (PA-05); resposta = cabeçalho (data, nome local, tipo local)
  + itens (nome, tipo, adicional, preço unit., qtd); motivo = lista fixa de códigos; infra AVISA o app (aviso
  silencioso, ex. FCM) — depende de identificar aparelho/usuário (Tema 5). Ainda não confirmado nem gravado.
  Rodadas 2-3: app também consulta ao abrir; tempo 1-3 dias; sem resposta = continua em análise (infra trata, fora do MVP);
  falha de upload = fila, 4º estado `aguardando envio`, não cancelável; motivos: ilegível, não é cupom, incompleto,
  já enviado; desconto = linha separada; item guarda valor pago e valor cheio, dois gráficos (pago/cheio), também no
  dashboard; Z é DONO da infraestrutura.
- Tema 3 FECHADO e GRAVADO (D25–D34; RF-01–RF-14, RNF-01–03; PA-02/04/05 respondidas; novas PA-11/12/13).
  3 propostas de texto para o CLAUDE.md estão na ata do Tema 3 → entregar ao diretor no fim da sessão.
- PRÓXIMO: Tema 4 (infra real ou simulada; PA-13).
- Ainda não há diagramas, contratos nem protótipo → revisor-arquitetura não foi chamado; ainda nada a commitar com parecer.
- Hook git-somente-leitura bloqueia Bash com as palavras commit/merge mesmo em heredoc: editar memória com Edit/Write.

Atualização 3ª sessão (2026-10-03):
- Status apresentado; propus Tema 4. Usuário recusou a pergunta de escolha para esclarecer algo (aguardando).
- Diretor pediu relatório para commit+push dos Temas 1–3 (docs/especificacao/** + minha memória), sem parecer
  do revisor (não há diagramas). Relatório e as 3 propostas do CLAUDE.md enviados ao diretor por SendMessage.

**Why:** a entrevista atravessa várias sessões e as respostas da 1ª sessão só existiam na conversa.
**How to apply:** no início da sessão: `git branch --show-current` deve ser docs/especificacao-mvp e conter a0112ca;
só então criar docs/especificacao/ (README, ata entrevistas/2026-10-03.md, perguntas-abertas, glossário) a partir de
[[tema1-respostas]]. Depois atualizar esta memória.
