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

### Fluxo
1. O agente de desenvolvimento termina a tarefa na sua branch e entrega o relatório abaixo. Ele NÃO executa comandos git que alterem o repositório (commit, push, merge, checkout...).
2. O coordenador (sessão principal) guarda a fila de relatórios e envia todos os pedidos pendentes juntos ao revisor-git.
3. O revisor-git inspeciona o repositório (somente leitura), decide APROVADO/REJEITADO e a ordem, e devolve um plano de comandos.
4. O coordenador envia o plano aprovado ao operador-git, que executa exatamente esses comandos.
5. Pedidos rejeitados voltam ao agente de origem com os motivos.
Push na `main` sempre pede confirmação do usuário.

### Relatório para o revisor-git (formato obrigatório)
```
## Relatório para revisor-git
- Agente:
- Tarefa / objetivo:
- Branch:
- Arquivos alterados (e motivo de cada um):
- Testes executados e resultado:
- Pendências / riscos:
- Operação solicitada: (commit | merge na main | push | criar branch)
- Mensagem de commit sugerida: tipo(escopo): descrição
```


## Objetivo Atual
Construir o MVP do aplicativo. O MVP é definido pelas seguintes funcionalidades:
- Usuário pode acessar os gráficos referentes aos seus gastos

## Cenário
- Usuários enviam cupons fiscais referêntes a compras que fizeram. 
- O aplicativo gerência esses dados para mostrar estatísticas referentes aos cupões fiscais que o usuário enviou. 
- A infraestrutura processa os cupons e retorna apenas os dados referentes àquele cupom

## Software que estamos construindo
Vamos construir um software para servir de controle de carteira aos usuários. Os usuários poderam fazer gestão de seus gastos através desse aplicativo. Nosso objetivo é facilitar a insersão dos dados referentes aos gastos do usuário. 
- **INSERSÃO DE DADOS**O principal meio de insersão de dados do usuário deve ser através de fotografias. O usuário poderá enviar uma foto através de sua câmera de seus cupons fiscais referente as compras que fizera para a nossa infraestrutura. A infraestrutura processará os cupons e retornara uma o estado do pedido (aceito ou reprovado) e em caso de aceito uma tabela, onde os campus dessa tabela são: data_compra, tipo_compra, nome_item, preco_item, quantidade_item. Esse processamento pode demorar, então ao enviar um cupom fiscal, o estado desse envio é definido `em análise`. O usuário pode enviar fotos de má qualidade ou de outras coisas que não sejam cupons, nesse caso, o estado do pedido será definido para `reprovado`. Caso o processamento do cupom ocorra com sucesso, a infraestrutura devolverá `aceito` e a tabela contendo a descrição do cupom fiscal.

