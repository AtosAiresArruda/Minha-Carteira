---
name: feedback-sessoes
description: Agentes de sessão própria devem falar direto com o diretor via SendMessage; usuário não quer repassar mensagens
metadata:
  type: feedback
---

Agentes que rodam em sessão própria (engenheiro-software e futuros) conversam direto com a sessão diretor-geral por SendMessage/ListAgents. O usuário não deve servir de mensageiro.

**Why:** em 2026-10-03 o engenheiro-software precisou de operações git e o diretor não conseguiu alcançá-lo; o usuário disse que isso "está errado" e que os agentes devem trabalhar com fluidez sem ele repassar.

**How to apply:** todo agente novo de sessão própria recebe SendMessage e ListAgents no `tools:` (o allowlist do frontmatter esconde essas ferramentas se não estiverem listadas). Sessões abertas com `--name <agente>`. Se um agente de sessão não for alcançável, verificar primeiro o `tools:` e o `--name`. Edições em `.claude/agents/*.md` são bloqueadas pelo classificador (self-modification) mesmo para o secretário: preparar o texto exato e pedir ao usuário que aplique. Relacionado: [[feedback-automacao]].
