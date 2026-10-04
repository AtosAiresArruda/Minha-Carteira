# Status do projeto — Minha Carteira

Mantido pelo diretor-geral. Painel do momento: é atualizado ao fim de cada ciclo e lido pela skill `mostrar-status`.
A lista completa de tarefas fica em `docs/backlog.md`; aqui só entra o que importa agora.

Última atualização: 2026-10-04

## Concluído recentemente
- E-01: Temas 4–6 fechados (simulador da infraestrutura, dados só no aparelho e sem conta, filtro por estado e busca de gastos).
- G-03: CLAUDE.md atualizado com o contrato do cupom, câmera/galeria e o estado `aguardando envio` (aprovado pelo usuário; commit pendente).
- I-02: Figma MCP autenticado; o engenheiro-software já tem as ferramentas de leitura e escrita do Figma.
- G-02: novo Objetivo Atual commitado (279de53) na branch docs/especificacao-mvp.
- A-10: comunicação direta entre as sessões diretor-geral e engenheiro-software validada.
- Objetivo atual redefinido com aprovação do usuário: protótipo clicável no Figma + documentação completa; sem código do app nesta fase.
- A-01, A-05, A-06 e S-01 integrados na `dev-main` (merge 658f317) e publicados. A `main` continua no commit inicial (80dd33b).
- A-08 / A-09: engenheiro-software e revisor-arquitetura criados (9df1f62).
- A equipe de gestão está completa: diretor-geral, revisor-git, operador-git, secretario-geral e engenheiro-software.

## Em andamento
<!-- formato: - <ID> — <agente> — <situação> -->
- E-01 — engenheiro-software — Temas 1–6 fechados (RF-01–RF-23, RNF-01–04); Temas 4–6 aguardando commit; próximo: Tema 7 (categorias).

## Interrompidas
<!-- formato: - <ID> — <agente> — <onde parou> — <motivo> — <como retomar> -->
- nada no momento

## Bloqueado / precisa de você
<!-- formato: - <ID>: <o que precisa ser decidido/feito pelo usuário> -->
- A-02: decidir se Objective C++ permanece na stack (será tratada na entrevista E-01).
- E-01: perguntas abertas (docs/especificacao/perguntas-abertas.md): PA-06/PA-16 (categorias e busca — Tema 7), PA-11 (desconto geral), PA-01/PA-08 (LGPD, Tema 11), PA-10 (stack C++), PA-14 (comparar com a API de Z quando chegar), tecnologia do simulador (PA nova).

## Sugestões de próximos passos
1. Retomar a entrevista no Tema 7 (categorias: PA-06 e PA-16).
2. Protótipo clicável no Figma + diagramas e contratos, revisados pelo revisor-arquitetura.
3. Commitar G-03 e os Temas 4–6 e integrar o bloco de docs/especificacao/ na dev-main.
4. A-07: revisar os hooks conforme o uso real.
5. Depois da documentação: A-03 (equipe de desenvolvimento) e proposta de atualização da main.
6. Opcional: corrigir o token do GitHub MCP (falha 'Authorization header is badly formatted'); o git normal não é afetado.
