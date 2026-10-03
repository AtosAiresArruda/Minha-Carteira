# Status do projeto — Minha Carteira

Mantido pelo diretor-geral. Painel do momento: é atualizado ao fim de cada ciclo e lido pela skill `mostrar-status`.
A lista completa de tarefas fica em `docs/backlog.md`; aqui só entra o que importa agora.

Última atualização: 2026-10-03

## Concluído recentemente
- A-01, A-05, A-06 e S-01 integrados na `dev-main` (merge 658f317) e publicados. A `main` continua no commit inicial (80dd33b).
- A equipe de gestão está completa: diretor-geral, revisor-git, operador-git, secretario-geral e engenheiro-software.

## Em andamento
<!-- formato: - <ID> — <agente> — <situação> -->
- A-08 / A-09 — secretario-geral — agentes engenheiro-software e revisor-arquitetura escritos; aguardando commit via revisor-git.
- E-01 — engenheiro-software — branch `docs/especificacao-mvp` criada e publicada; a entrevista ainda não começou.

## Interrompidas
<!-- formato: - <ID> — <agente> — <onde parou> — <motivo> — <como retomar> -->
- nada no momento

## Bloqueado / precisa de você
<!-- formato: - <ID>: <o que precisa ser decidido/feito pelo usuário> -->
- I-02: instalar o plugin Figma (/plugin install figma@claude-plugins-official, escopo project) e autenticar.
- E-01: fazer a entrevista de especificação do MVP (sessão própria: `claude --agent engenheiro-software`).
- A-02: decidir se Objective C++ permanece na stack (será tratada na entrevista E-01).

## Sugestões de próximos passos
1. Entrevista E-01 com o engenheiro-software, para gerar `docs/especificacao/`.
2. A-03: propor a equipe de desenvolvimento (Flutter, C++/OpenCV, UI, testes) com base na especificação.
3. Dividir o MVP (gráficos de gastos) em tarefas, definindo primeiro os contratos (formato do retorno do cupom, interface FFI Flutter↔C++).
4. A-07: revisar os hooks conforme o uso real.
5. Quando a `dev-main` estiver estável, apresentar ao usuário a proposta de atualização da `main`.
