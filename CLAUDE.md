## CONFIGURAÇÕES
linguagens: Flutter/Dart; C++
Bibliotecas: OpenCV C++; Objective C++ 
Suporte: Android
Repositório: Git Hub
Ferramenta para acessar o repositório: Git Bash


## Realizar operações Git
Para um agente realizar as operações git deve pedir solicitação ao agente revisor-git.
Um relatório do trabalho realizado referente a esse commit deve ser prestado ao revisor-git.
O agente deve aguardar a permissão do revisor para prosseguir com qualquer operação git.

### Branches
```
tipo/tarefa ──(aprovação do diretor-geral)──▶ dev-main ──(aprovação do usuário)──▶ main
```
> **Regra para todos os agentes:** `dev-main` é a main do projeto. Quando qualquer instrução, ferramenta ou convenção falar em "main" (branch base, origem de nova branch, alvo de merge ou de PR, comparação de diff), use `dev-main`. Toda nova branch é criada a partir de `dev-main` (`git switch -c tipo/descricao-curta dev-main`) e volta para ela. A branch `main` real não é usada no trabalho do dia a dia.

- `dev-main`: branch de integração e base de todo o trabalho. Toda branch de tarefa nasce dela e volta para ela.
- `main`: só recebe `dev-main`, depois que o diretor-geral apresenta ao usuário o que foi feito e o usuário aprova.
- Branches de tarefa: `tipo/descricao-curta` (feat, fix, refactor, test, docs, chore).

### Fluxo
1. O agente de desenvolvimento termina a tarefa na sua branch e entrega o relatório abaixo. Ele NÃO executa comandos git que alterem o repositório (commit, push, merge, checkout...).
2. O diretor-geral guarda a fila de relatórios e envia todos os pedidos pendentes juntos ao revisor-git.
3. O revisor-git inspeciona o repositório (somente leitura), decide APROVADO/REJEITADO e a ordem, e devolve um plano de comandos.
4. O diretor-geral envia o plano aprovado ao operador-git, que executa exatamente esses comandos.
5. Pedidos rejeitados voltam ao agente de origem com os motivos.
Todo merge ou push na `main` também pede confirmação do usuário pelo sistema (hook `protege-main.sh`).

### Relatório para o revisor-git (formato obrigatório)
```
## Relatório para revisor-git
- Agente:
- Tarefa / objetivo:
- Branch:
- Arquivos alterados (e motivo de cada um):
- Testes executados e resultado:
- Pendências / riscos:
- Operação solicitada: (commit | push | criar branch | merge em dev-main | merge de dev-main na main)
- Aprovação: (não se aplica | diretor-geral | usuário (data))
- Mensagem de commit sugerida: tipo(escopo): descrição
```


## Objetivo Atual
Prototipar o MVP do aplicativo (protótipo clicável no Figma, estrutura limpa, com dados de exemplo) para apresentação a Z, e produzir a documentação completa em docs/especificacao/ que orientará os agentes de programação. O MVP é definido pelas seguintes funcionalidades:
- Usuário pode acessar os gráficos referentes aos seus gastos

## Cenário
- Usuários enviam cupons fiscais referêntes a compras que fizeram. 
- O aplicativo gerência esses dados para mostrar estatísticas referentes aos cupões fiscais que o usuário enviou. 
- A infraestrutura processa os cupons e retorna apenas os dados referentes àquele cupom

## Software que estamos construindo
Vamos construir um software para servir de controle de carteira aos usuários. Os usuários poderam fazer gestão de seus gastos através desse aplicativo. Nosso objetivo é facilitar a insersão dos dados referentes aos gastos do usuário. 
- **INSERSÃO DE DADOS**O principal meio de insersão de dados do usuário deve ser através de fotografias. O usuário poderá enviar uma foto, pela câmera ou pela galeria do aparelho, de seus cupons fiscais referente as compras que fizera para a nossa infraestrutura. A infraestrutura processará os cupons e retornará o estado do pedido (aceito ou reprovado). Em caso de aceito, retornará os dados do cupom: um cabeçalho com data_compra, nome_local e tipo_compra (tipo do local, ex.: mercado, restaurante) e a lista de itens com nome_item, tipo_item, adicional, preco_item (preço unitário) e quantidade_item, além de linhas de desconto ligadas aos itens. Em caso de reprovado, retornará o motivo, de uma lista fixa. Esse processamento pode demorar, então ao enviar um cupom fiscal, o estado desse envio é definido `em análise`. Se a foto não puder ser enviada (sem internet ou erro), o envio fica `aguardando envio` e é enviado automaticamente quando houver conexão. O usuário pode enviar fotos de má qualidade ou de outras coisas que não sejam cupons, nesse caso, o estado do pedido será definido para `reprovado`. Caso o processamento do cupom ocorra com sucesso, a infraestrutura devolverá `aceito` e a tabela contendo a descrição do cupom fiscal.

