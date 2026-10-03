# Status do projeto — Minha Carteira

Mantido pelo diretor-geral. Painel do momento: é atualizado ao fim de cada ciclo e lido pela skill `mostrar-status`.
A lista completa de tarefas fica em `docs/backlog.md`; aqui só entra o que importa agora.

Última atualização: 2026-10-03

## Concluído recentemente
- I-02: Figma MCP autenticado; o engenheiro-software já tem as ferramentas de leitura e escrita do Figma.
- G-02: novo Objetivo Atual commitado (279de53) na branch docs/especificacao-mvp.
- A-10: comunicação direta entre as sessões diretor-geral e engenheiro-software validada.
- Objetivo atual redefinido com aprovação do usuário: protótipo clicável no Figma + documentação completa; sem código do app nesta fase.
- A-01, A-05, A-06 e S-01 integrados na `dev-main` (merge 658f317) e publicados. A `main` continua no commit inicial (80dd33b).
- A-08 / A-09: engenheiro-software e revisor-arquitetura criados (9df1f62).
- A equipe de gestão está completa: diretor-geral, revisor-git, operador-git, secretario-geral e engenheiro-software.

## Em andamento
<!-- formato: - <ID> — <agente> — <situação> -->
- E-01 — engenheiro-software — Temas 1–3 fechados e gravados (RF-01–RF-14, RNF-01–03); 1º bloco de docs/especificacao/ enviado ao revisor-git para commit/push; próximo: Tema 4 (infraestrutura real ou simulada).

## Interrompidas
<!-- formato: - <ID> — <agente> — <onde parou> — <motivo> — <como retomar> -->
- nada no momento

## Bloqueado / precisa de você
<!-- formato: - <ID>: <o que precisa ser decidido/feito pelo usuário> -->
- A-02: decidir se Objective C++ permanece na stack (será tratada na entrevista E-01).
- E-01: perguntas abertas que dependem do usuário/Z (docs/especificacao/perguntas-abertas.md): PA-13 (infra real ou simulada; quem leva o contrato a Z), PA-12 (conta/login para aviso), PA-06 (categorias), PA-07 (onde fica a foto), PA-09 (filtros/edição de envios), PA-11 (desconto geral), PA-01/PA-08 (LGPD, Tema 11), PA-10 (stack C++).
- E-01: 3 propostas de texto para o CLAUDE.md (ata do Tema 3) aguardam aprovação do usuário.

## Sugestões de próximos passos
1. Retomar a entrevista no Tema 4 (responder PA-13 e PA-12 primeiro).
2. Protótipo clicável no Figma + diagramas e contratos, revisados pelo revisor-arquitetura.
3. Integrar o 1º bloco de docs/especificacao/ na dev-main após o commit.
4. A-07: revisar os hooks conforme o uso real.
5. Depois da documentação: A-03 (equipe de desenvolvimento) e proposta de atualização da main.
6. Opcional: corrigir o token do GitHub MCP (falha 'Authorization header is badly formatted'); o git normal não é afetado.
