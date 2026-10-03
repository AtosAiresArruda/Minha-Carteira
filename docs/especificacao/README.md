# Especificação do MVP — Minha Carteira

Versão: 0.1 · Data: 2026-10-03 · Responsável: engenheiro-software · Branch: `docs/especificacao-mvp`

Fonte única para os agentes de programação. Todo requisito vem de uma resposta do usuário (Atos) registrada
nas atas de `entrevistas/`. O que não foi respondido fica em `perguntas-abertas.md`.

## Índice
| Documento | Conteúdo | Situação |
|---|---|---|
| [requisitos.md](requisitos.md) | RF-xx e RNF-xx com critério de aceite | RF-01–RF-14, RNF-01–RNF-03 |
| [glossario.md](glossario.md) | termos do domínio | iniciado |
| [perguntas-abertas.md](perguntas-abertas.md) | pendências com ID e tema | iniciado |
| [entrevistas/](entrevistas/) | atas das sessões | 2026-10-03 |
| `contratos/` | JSON da infraestrutura, FFI Flutter↔C++/OpenCV, banco local | a criar |
| `diagramas/` | arquitetura, classes, sequência, estados, dados (Mermaid) | a criar |
| `prototipo/` | fluxos, telas HTML do MVP, `figma.md` | a criar |
| `rastreabilidade.md` | RF/RNF → tela → classe/método → diagrama → contrato | a criar |

## Status dos temas da entrevista
| # | Tema | Status |
|---|---|---|
| 1 | Visão do produto e usuários | **fechado** (2026-10-03) |
| 2 | Envio da foto do cupom e estados | **fechado** (2026-10-03) |
| 3 | Contrato com a infraestrutura | **fechado** (2026-10-03); JSON em `contratos/` depois das telas |
| 4 | Infraestrutura real ou simulada no MVP | próximo |
| 5 | Armazenamento, conta/login, sincronização | a fazer |
| 6 | Gestão da carteira de gastos | a fazer |
| 7 | Categorias (`tipo_compra`) e gráficos | a fazer |
| 8 | Requisitos não funcionais (offline, desempenho, acessibilidade) | a fazer |
| 9 | Stack e plataformas (inclui A-02: Objective C++) | a fazer |
| 10 | Fora do MVP | a fazer |
| 11 | Privacidade e LGPD (separado do Tema 8 a pedido do usuário, D24) | a fazer (último) |

## Decisões de visão (Tema 1)
Ver a ata [entrevistas/2026-10-03.md](entrevistas/2026-10-03.md), decisões D1–D9. Em resumo: o app é para pessoa
física controlar os próprios gastos a partir de fotos de cupons fiscais; a entrega desta fase é um **protótipo
clicável no Figma**, com dados de exemplo, para apresentação a Z, mais a documentação completa para os agentes de
programação. Nenhum código do app nesta fase.

> A mudança correspondente no "Objetivo Atual" do CLAUDE.md foi aprovada pelo usuário em 2026-10-03 (na sessão do
> diretor-geral) e é aplicada pelo secretario-geral.
