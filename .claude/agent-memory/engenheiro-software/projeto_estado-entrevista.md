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

Atualização 4ª sessão (2026-10-04):
- Temas 1–3 já commitados (ef20ff0, a72e6e9) na docs/especificacao-mvp. G-03 (3 propostas no CLAUDE.md) aplicada
  pelo diretor/secretario, ainda não commitada (arquivos de gestão, não são meus).
- Tema 4 FECHADO e GRAVADO (ata entrevistas/2026-10-04.md; D35–D40; RF-13 alterado, RF-15/16/17(depois), RNF-04;
  PA-13 respondida, PA-12 → depois, PA-14 nova). Simulador separado; Z já tem API mas docs só após apresentação;
  app adota formato de Z → contrato PROVISÓRIO; aviso silencioso fora do MVP.
- Tema 5 FECHADO e GRAVADO (D41–D46; RF-18/19/20; PA-07 respondida; PA-15 nova): tudo no aparelho, sem conta,
  foto copiada inteira, perda do histórico aceitável.
- Tema 6 FECHADO e GRAVADO (D47–D54; RF-21/22/23; PA-09 respondida; PA-16 nova): sem edição, filtro por estado,
  BUSCA de gastos (texto em item/local/tipos, só aceitos, atalhos+intervalo de meses, total pago + itens, opção
  valor cheio/desconto). Sem orçamento/exportação/lançamento manual.
- Próximo: Tema 7 (categorias e gráficos; PA-06, PA-11, PA-16). Próximo ID livre: D55, RF-24, RNF-05, PA-18.
- Diretor aprovou Temas 4–6 com 2 ajustes (PA-12 reescrita; PA-17 = tecnologia/local/autor do simulador, Tema 9,
  dependência nova → decisão usuário+diretor). Feitos; pedido de commit enviado ao diretor em 2026-10-04.
  Arquivos de gestão (CLAUDE.md, backlog, decisoes, status) vão num pedido separado do diretor.
- Ainda nada a commitar com parecer; Tema 4 não commitado (enviar no próximo relatório ao diretor).

**Why:** a entrevista atravessa várias sessões e as respostas da 1ª sessão só existiam na conversa.
**How to apply:** no início da sessão: `git branch --show-current` deve ser docs/especificacao-mvp e conter a0112ca;
só então criar docs/especificacao/ (README, ata entrevistas/2026-10-03.md, perguntas-abertas, glossário) a partir de
[[tema1-respostas]]. Depois atualizar esta memória.
