## Desafio técnico: Ecommerce - Checkout transparente

A popularização das vendas pela internet tem ganhado gradativamente mais relevância. E com isso, otimizações em usabilidade e facilidade no checkout têm ganhado bastante atenção, pois uma alta porcentagem de clientes desistem da compra na fase de checkout, seja por má estruturação ou por muita burocracia. Uma abordagem de checkout é o trasparente que é um recurso o qual permite que o consumidor conclua a jornada no próprio ambiente da loja virtual (diferentemente do checkout padrão e do lightbox, que transferem o usuário para o site do intermediador de pagamento através de uma nova aba ou um popup).

### Desafio Proposto

Implementar um checkout transparente de uma loja virtual que por meio de um carrinho de compras seleciona-se o endereço de entrega e a transportadora(frete) e após isso o pagamento. Considerando que o gerenciamento de pagamentos deve estar gerenciado pela própria loja virtual.

Os passos para utilizar o sistema deve ser, não necessariamente separados:

1) O cliente acessa a lista de produtos pela página inicial do site.
   ![alt text](https://github.com/Matheuspsilva/ecommerce/tree/main/src/main/resources/static/images/homepage.png?raw=true)
2) O cliente coloca produtos nesse carrinho de compras por meio do botão comprar;
   ![alt text](/src/main/resources/static/images/homepage.png?raw=true)
3) O cliente decide fazer o checkout do carrinho de compras por meio do botão finalizar compra;
   ![alt text](https://github.com/Matheuspsilva/ecommerce/tree/main/src/main/resources/static/images/carrinho.png?raw=true)
4) O cliente seleciona o endereço de entrega e o frete(Obs: considerar frete fixo por cada transportadora);
   <img src ="https://github.com/Matheuspsilva/ecommerce/tree/main/src/main/resources/static/images/carrinho.png">
5) O cliente Seleciona a forma de pagamento e confirma;
   ![alt text](https://github.com/Matheuspsilva/ecommerce/tree/main/src/main/resources/static/images/finalizar.png?raw=true)
6) Caso a venda seja concluída retornar mensagem de sucesso com número do pedido e código de rastreio;

É obrigatória uma documentação (pode ser simples) demonstrando como utilizar as chamadas webs-service.

 - Resultado do pedido pode ser acessado pela url /pedidos
 - Caso deseje buscar um pedido específico o usuários deve especificar o id do item desejado Ex: /pedido/1

0) Uso de banco de dados nesta aplicação é opcional, o conteúdo pode ser armazenado em memória e existir apenas enquanto a aplicação estiver em execução
1) Relatórios. Retornar um JSON explicitando as compras feitas pelos clientes.
2) A aplicação final deve ser dockerizada, e sua imagem deve estar disponível em um DockerHub próprio do aplicante.
3) O Banco de Dados deve estar dockerizado, o SGBD fica à escolha do aplicante. A imagem do docker do SGBD deve estar disponível no DockerHub.
4) Toda a aplicação deve ser entregue funcional, em um arquivo de declaração para docker-compose. Este docker-compose irá conter a aplicação e o banco de dados.
5) Testes automatizados
6) Funcionalidades adicionais, como cupons de desconto e vale compras. 