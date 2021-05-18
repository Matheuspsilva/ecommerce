## Desafio técnico: Ecommerce - Checkout transparente

A popularização das vendas pela internet tem ganhado gradativamente mais relevância. E com isso, otimizações em usabilidade e facilidade no checkout têm ganhado bastante atenção, pois uma alta porcentagem de clientes desistem da compra na fase de checkout, seja por má estruturação ou por muita burocracia. Uma abordagem de checkout é o trasparente que é um recurso o qual permite que o consumidor conclua a jornada no próprio ambiente da loja virtual (diferentemente do checkout padrão e do lightbox, que transferem o usuário para o site do intermediador de pagamento através de uma nova aba ou um popup).

### Desafio Proposto

Implementar um checkout transparente de uma loja virtual que por meio de um carrinho de compras seleciona-se o endereço de entrega e a transportadora(frete) e após isso o pagamento. Considerando que o gerenciamento de pagamentos deve estar gerenciado pela própria loja virtual.

Os passos para utilizar o sistema deve ser, não necessariamente separados:

1) O cliente acessa a lista de produtos pela página inicial do site.
   ![alt text](/src/main/resources/static/images/homepage.png?raw=true)
2) O cliente coloca produtos nesse carrinho de compras por meio do botão comprar;
3) O cliente decide fazer o checkout do carrinho de compras por meio do botão finalizar compra;
   ![alt text](/src/main/resources/static/images/carrinho.png?raw=true)
4) O cliente seleciona o endereço de entrega e o frete(Obs: considerar frete fixo por cada transportadora);
5) O cliente Seleciona a forma de pagamento e confirma;
   ![alt text](/src/main/resources/static/images/finalizar.png?raw=true)
6) Caso a venda seja concluída retornar mensagem de sucesso com número do pedido e código de rastreio;

É obrigatória uma documentação (pode ser simples) demonstrando como utilizar as chamadas webs-service.

 - Resultado do pedido pode ser acessado pela url /pedidos
 - Caso deseje buscar um pedido específico o usuários deve especificar o id do item desejado Ex: /pedido/1

### Relatório de pedidps

- Caso o usuário deseje relatórios sobre todos pedidos realizados, ele deve acessar a url /pedidos
- Caso o usuário deseje buscar um pedido específico o usuário deve especificar o id do item desejado Ex: /pedido/1
