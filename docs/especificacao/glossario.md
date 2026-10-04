# Glossário

| Termo | Definição | Origem |
|---|---|---|
| Cupom fiscal | Comprovante impresso de uma compra, fotografado pelo usuário para registrar o gasto. | CLAUDE.md |
| Infraestrutura | Serviço externo que recebe a foto do cupom, processa e devolve o estado e, se aceito, a tabela de itens. | CLAUDE.md |
| `em análise` | Estado do envio logo após a foto ser enviada, enquanto a infraestrutura processa. | CLAUDE.md |
| `aceito` | Estado do envio quando o cupom foi processado com sucesso; vem acompanhado do cabeçalho e dos itens do cupom. | CLAUDE.md; 2026-10-03 (D26) |
| `reprovado` | Estado do envio quando a foto tem má qualidade ou não é um cupom. | CLAUDE.md |
| Tabela do cupom | Dados devolvidos no estado `aceito`: data_compra, tipo_compra, nome_item, preco_item, quantidade_item. | CLAUDE.md |
| Painel (dashboard) de gastos | Tela com os gráficos dos gastos do usuário, objetivo do MVP. | CLAUDE.md; 2026-10-03 (D2) |
| Z | Pessoa que analisará a proposta do produto; interessada em tendências de mercado extraídas na infraestrutura. | 2026-10-03 (D3, D5) |
| Protótipo clicável | Telas no Figma, com dados de exemplo, que simulam a navegação do MVP sem código do app. | 2026-10-03 (D5) |
| MVP | Produto mínimo: o usuário acessa os gráficos dos seus gastos. | CLAUDE.md |
| `aguardando envio` | Estado do envio cuja foto ainda não saiu do aparelho (sem internet ou erro); sobe sozinho quando houver conexão. | 2026-10-03 (D31) |
| `tipo_compra` | Tipo do local da compra, no cabeçalho do cupom (ex.: mercado, restaurante, desconhecido). | CLAUDE.md; 2026-10-03 (D26) |
| `tipo_item` | Tipo de cada item do cupom (ex.: comida, bebida). | 2026-10-03 (D26) |
| Cabeçalho do cupom | Parte da resposta de um aceito com data da compra, nome do local e tipo do local. | 2026-10-03 (D26) |
| Desconto | Linha separada da resposta, ligada a um item, que reduz o valor pago daquele item. | 2026-10-03 (D32) |
| Valor cheio | `preco_item` × `quantidade_item` de um item, sem descontos. | 2026-10-03 (D33) |
| Valor pago | Valor cheio do item menos os descontos ligados a ele; o total do cupom exibido é a soma dos valores pagos. | 2026-10-03 (D33) |
| Aviso silencioso | Mensagem da infraestrutura ao app que atualiza o estado de um envio sem mostrar notificação. Fora do MVP (RF-17). | 2026-10-03 (D28); 2026-10-04 (D40) |
| Código de motivo | Valor da lista fixa de motivos de reprovação: foto ilegível, não é cupom fiscal, cupom incompleto, cupom já enviado. | 2026-10-03 (D27) |
| `preco_item` | Preço de uma unidade do item (3 shampoos por R$ 30,00 → `preco_item` = 10,00, `quantidade_item` = 3). | 2026-10-03 (D23) |
| Envio | Uma foto de cupom enviada à infraestrutura, com o seu estado. Um envio = uma foto = um cupom. | 2026-10-03 (D11) |
| Lista de envios | Tela com todos os envios (data, estado, total se aceito), sem miniaturas. | 2026-10-03 (D15, D16) |
| Detalhe do envio | Tela aberta ao tocar num envio; mostra a miniatura (ampliável) e os dados conforme o estado. | 2026-10-03 (D17–D19) |
| Local | Estabelecimento onde a compra foi feita (ex.: Max Atacadista, Hamburgueria do Carlinhos). | 2026-10-03 (D20) |
| Tipo do local | Categoria do local/cupom (ex.: mercado, restaurante, desconhecido). | 2026-10-03 (D20) |
| Tipo do item | Categoria de cada item do cupom (ex.: comida, bebida, limpeza). | 2026-10-03 (D20) |
| Adicional | Marcação de um item que acompanha o principal (ex.: batata e refrigerante num pedido de hambúrguer). | 2026-10-03 (D20) |
| Motivo da reprovação | Explicação mostrada no detalhe de um envio `reprovado` (ex.: foto ilegível, não é cupom). | 2026-10-03 (D19) |
| Simulador da infraestrutura | Servidor separado, nosso, que imita a infraestrutura de Z no MVP: recebe a foto, espera um atraso ajustável e devolve aceito com dados de exemplo ou reprovado com um motivo. | 2026-10-04 (D35, D39) |
| Contrato provisório | Formato de troca com a infraestrutura proposto por nós; será substituído pelo formato da API de Z. | 2026-10-04 (D37) |
| Banco local | Banco de dados no próprio celular com envios, estados e dados dos cupons; no MVP é o único lugar onde esses dados ficam. | 2026-10-04 (D41) |
| Código do envio | Identificador que a infraestrutura (simulador) devolve ao receber a foto; o app usa para consultar o estado. | 2026-10-04 (D42) |
| Busca de gastos | Consulta por texto (item, local ou tipos) e período que soma o valor pago dos itens de cupons aceitos e lista esses itens. | 2026-10-04 (D50–D52) |
| Desconto total | Diferença entre o valor cheio total e o valor pago total de um conjunto de itens. | 2026-10-04 (D53) |
