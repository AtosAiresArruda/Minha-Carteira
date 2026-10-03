# Requisitos — MVP Minha Carteira

IDs nunca são reutilizados. Requisito alterado registra a mudança e a data na sua linha "Histórico".
Origem = data da entrevista e decisão da ata em `entrevistas/`. Prioridade: MVP / depois.

## Requisitos funcionais

### RF-01 — Enviar foto do cupom pela câmera
- **Descrição:** o usuário fotografa um cupom fiscal com a câmera do aparelho e envia para a infraestrutura.
- **Origem:** 2026-10-03 (D10, D11) · **Prioridade:** MVP
- **Critério de aceite:** a partir da tela inicial, o usuário abre a câmera, tira uma foto e confirma o envio; um novo envio aparece na lista de envios. Cada envio contém exatamente uma foto.

### RF-02 — Enviar foto do cupom pela galeria
- **Descrição:** o usuário escolhe uma foto já existente na galeria do aparelho e envia para a infraestrutura.
- **Origem:** 2026-10-03 (D10, D11) · **Prioridade:** MVP
- **Critério de aceite:** o usuário abre a galeria, seleciona uma única imagem e confirma o envio; um novo envio aparece na lista de envios.

### RF-03 — Envio sem checagem no aparelho
- **Descrição:** no MVP, a foto é enviada como está, sem conferência de qualidade no aparelho; a infraestrutura decide se aceita ou reprova.
- **Origem:** 2026-10-03 (D12, D13) · **Prioridade:** MVP (a checagem no aparelho pode voltar depois)
- **Critério de aceite:** nenhuma foto é barrada pelo app antes do envio, seja escura, borrada ou de outro objeto.

### RF-04 — Estados do envio, sem cancelamento
- **Descrição:** o envio tem quatro estados: `aguardando envio` (a foto ainda não saiu do aparelho), `em análise` (a infraestrutura recebeu e processa), `aceito` e `reprovado`. Nenhum envio pode ser cancelado. Se a infraestrutura não responder, o envio continua `em análise`; o tratamento de envios parados é da infraestrutura, fora do app.
- **Origem:** 2026-10-03 (D14, D30, D31) · **Prioridade:** MVP
- **Critério de aceite:** um envio feito com internet aparece como `em análise`; feito sem internet aparece como `aguardando envio`; as únicas transições são `aguardando envio → em análise → aceito | reprovado`; não há ação de cancelar em nenhuma tela; o app não muda sozinho o estado de um envio `em análise`, por mais tempo que passe.
- **Histórico:** 2026-10-03 — incluído o estado `aguardando envio` (D31) e a regra de envio sem resposta (D30); título era "Estado inicial `em análise`, sem cancelamento".

### RF-05 — Lista de envios
- **Descrição:** o app mostra a lista de envios; cada linha traz a data do envio, o estado e, se aceito, o valor pago total do cupom. A lista não mostra miniaturas. Não há notificação visível de mudança de estado.
- **Origem:** 2026-10-03 (D15, D16, D33) · **Prioridade:** MVP
- **Critério de aceite:** cada envio aparece com data, estado e (só se `aceito`) o total pago; nenhuma imagem é exibida ou carregada na lista; nenhuma notificação visível é emitida quando o estado muda.
- **Histórico:** 2026-10-03 — "total" passou a ser o valor pago (com descontos), após o Tema 3.

### RF-06 — Detalhe do envio com miniatura ampliável
- **Descrição:** tocar num envio da lista abre a tela "Detalhe do envio", que mostra a miniatura da foto; tocar na miniatura amplia a foto.
- **Origem:** 2026-10-03 (D17) · **Prioridade:** MVP
- **Critério de aceite:** a partir da lista, tocar num envio de qualquer estado abre o detalhe com a miniatura; tocar nela exibe a foto ampliada; há como voltar à lista.

### RF-07 — Dados do cupom aceito
- **Descrição:** no detalhe de um envio `aceito`, o app mostra a data da compra, o nome e o tipo do local, a tabela de itens (nome, quantidade, preço unitário, descontos) e o total pago do cupom.
- **Origem:** 2026-10-03 (D18, D20, D23, D26, D32, D33) · **Prioridade:** MVP
- **Critério de aceite:** com um cupom de exemplo aceito, todos os itens e descontos devolvidos pela infraestrutura aparecem; o total pago é a soma dos valores pagos dos itens, ou seja, Σ(`preco_item` × `quantidade_item`) − Σ(descontos). Ex.: 3 shampoos com `preco_item` = 10,00 e desconto de 5,00 somam 25,00 pagos.
- **Histórico:** 2026-10-03 — critério ajustado após PA-03 (D23: `preco_item` é unitário); 2026-10-03 — total passa a ser o valor pago, com descontos (D32, D33).

### RF-08 — Gráficos do cupom por tipo de item
- **Descrição:** no detalhe de um envio `aceito`, uma seção de gráficos mostra o percentual de cada tipo de item no cupom em três visões: pelo valor pago (com descontos), pelo valor cheio (sem descontos) e pela quantidade.
- **Origem:** 2026-10-03 (D18, D33) · **Prioridade:** MVP
- **Critério de aceite:** com um cupom de exemplo (hambúrguer, batata e refrigerante, com um desconto na batata), o app mostra três visões cujos percentuais por tipo somam 100% cada: valor pago (soma do valor pago dos itens do tipo ÷ total pago), valor cheio (soma de `preco_item` × `quantidade_item` do tipo ÷ total cheio) e quantidade (soma de `quantidade_item` do tipo ÷ soma de todas as quantidades). Linhas de desconto não contam na quantidade.
- **Histórico:** 2026-10-03 — fórmula explicitada após PA-03 (D23); 2026-10-03 — de duas para três visões (valor pago, valor cheio, quantidade) (D33).

### RF-09 — Classificação do cupom e dos itens
- **Descrição:** cada cupom tem o nome do local e o tipo do local (`tipo_compra`; ex.: mercado, restaurante, desconhecido); cada item tem o seu tipo (`tipo_item`; ex.: comida, bebida) e pode ter a marcação "adicional". Toda a classificação vem pronta da infraestrutura; o app só exibe.
- **Origem:** 2026-10-03 (D20, D25, D26) · **Prioridade:** MVP
- **Critério de aceite:** com o exemplo da Hamburgueria do Carlinhos, o cupom aparece como tipo "restaurante"; hambúrguer e batata como comida, refrigerante como bebida; batata e refrigerante marcados como adicionais; o app não altera nenhuma classificação recebida. Lista de tipos: PA-06.
- **Histórico:** 2026-10-03 — definido que a infraestrutura classifica (D25; PA-05 respondida).

### RF-10 — Envio reprovado mostra o motivo
- **Descrição:** no detalhe de um envio `reprovado`, o app mostra apenas o motivo da reprovação, que vem como código de uma lista fixa: foto ilegível, não é cupom fiscal, cupom incompleto, cupom já enviado. Não há reenvio a partir dele; uma nova tentativa é um envio novo pelo fluxo normal. O envio reprovado permanece no histórico.
- **Origem:** 2026-10-03 (D19, D27) · **Prioridade:** MVP
- **Critério de aceite:** para cada um dos 4 códigos, o detalhe exibe o texto correspondente; não há botão de reenviar nem de apagar; o envio continua na lista.
- **Histórico:** 2026-10-03 — incluída a lista fixa de motivos (D27).

### RF-11 — Envios não podem ser apagados
- **Descrição:** no MVP, o usuário não pode apagar nem cancelar nenhum envio, em qualquer estado (`aguardando envio`, `em análise`, `aceito`, `reprovado`).
- **Origem:** 2026-10-03 (D14, D22, D31; substitui D21 removida) · **Prioridade:** MVP
- **Critério de aceite:** nenhuma tela oferece ação de apagar ou cancelar envio. Pendências: PA-08 (LGPD, Tema 11) e PA-09 (crescimento da lista).
- **Histórico:** 2026-10-03 — estendido ao estado `aguardando envio` (D31).

### RF-12 — Fila de envio sem internet
- **Descrição:** se a foto não puder subir (sem internet ou erro no envio), o envio entra na lista como `aguardando envio` e é enviado automaticamente quando a conexão voltar.
- **Origem:** 2026-10-03 (D31) · **Prioridade:** MVP
- **Critério de aceite:** com o aparelho sem internet, confirmar um envio cria um item `aguardando envio` na lista; ao restabelecer a conexão, sem ação do usuário, o envio sobe e passa a `em análise`.

### RF-13 — Atualização do estado dos envios
- **Descrição:** a infraestrutura avisa o app quando um envio muda de estado, por um aviso silencioso (sem notificação visível). Como reserva, o app consulta a infraestrutura sobre os envios `em análise` ao ser aberto e ao abrir a lista.
- **Origem:** 2026-10-03 (D15, D28) · **Prioridade:** MVP
- **Critério de aceite:** com o app aberto, um aviso da infraestrutura atualiza o estado na lista sem ação do usuário; com o aviso perdido (app fechado), ao abrir o app a lista mostra o estado atual vindo da consulta. Identificação do aparelho/usuário para o aviso: PA-12 (Tema 5).

### RF-14 — Descontos, valor pago e valor cheio
- **Descrição:** descontos chegam como linhas separadas, cada uma ligada ao item a que se refere. Para cada item, o app guarda o valor cheio (`preco_item` × `quantidade_item`) e o valor pago (valor cheio − descontos daquele item). Os dois valores são guardados também para o painel de gastos.
- **Origem:** 2026-10-03 (D32, D33) · **Prioridade:** MVP
- **Critério de aceite:** com um cupom de exemplo com desconto de 5,00 em 3 shampoos de 10,00, o item guarda valor cheio 30,00 e valor pago 25,00; os dois valores ficam disponíveis para o detalhe do cupom e para o painel. Desconto geral do cupom (sem item): PA-11.

## Requisitos não funcionais

### RNF-01 — Lista de envios leve
- **Descrição:** a lista de envios não acessa nem carrega as imagens enviadas; imagens só são carregadas no detalhe de um envio.
- **Origem:** 2026-10-03 (D16, D17) · **Prioridade:** MVP
- **Critério de aceite:** ao abrir a lista, nenhuma imagem é lida do armazenamento ou da rede; a imagem é lida somente ao abrir o detalhe.

### RNF-02 — Sem C++/OpenCV no MVP
- **Descrição:** o MVP não usa C++ nem OpenCV (não há processamento de imagem no aparelho).
- **Origem:** 2026-10-03 (D12, D13) · **Prioridade:** MVP
- **Critério de aceite:** a especificação do MVP não tem contratos FFI Flutter↔C++. Mudança no CLAUDE.md: PA-10.

### RNF-03 — Tempo de processamento da infraestrutura
- **Descrição:** a infraestrutura (de Z) responde um envio em 1 a 3 dias. O app não impõe prazo nem trata envios parados.
- **Origem:** 2026-10-03 (D29, D30, D34) · **Prioridade:** MVP
- **Critério de aceite:** o protótipo e os dados de exemplo mostram envios `em análise` há até 3 dias como situação normal; o app não exibe erro nem muda o estado por demora.
