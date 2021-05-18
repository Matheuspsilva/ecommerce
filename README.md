# Ecommerce - Checkout transparente

## Descrição do Projeto
<p align="center">Ecommerce Desenvolvido utilizando a linguagem Java em conjunto do framework Spring e Banco de dados MySql</p>

<h4 align="center"> 
	🚧  Ecommerce Spring 🚀 Em construção...  🚧
</h4>

### Features

- [x] Cadastro de cliente
- [x] Cadastro de produtos
- [x] checkout transparente
- [x] Relatórios de Pedidos


### 🛠 Tecnologias

As seguintes ferramentas foram usadas na construção do projeto:

- [Spring](https://spring.io/)
- [Bootstrap](https://getbootstrap.com/)
- [MySql](https://www.mysql.com/)

###  Demonstração 

1) O cliente acessa a lista de produtos pela página inicial do site.
   ![alt text](/src/main/resources/static/images/homepage.png?raw=true)
2) O cliente coloca produtos nesse carrinho de compras por meio do botão comprar;
3) O cliente decide fazer o checkout do carrinho de compras por meio do botão finalizar compra;
4) O cliente deve realizar login no sistema para prosseguir por meio da url /login ou do botão presente no menu de navegação.
5) Caso não esteja logado, será automaticamente redirecionado para a página de login.
6) Se o cliente não possuir cadastro, pode realizar o mesmo por meio da url cliente/cadastrar ou do botão presente no menu de navegação.
   
   ![alt text](/src/main/resources/static/images/carrinho.png?raw=true)
7) O cliente seleciona o endereço de entrega, o frete e a forma de pagamento e confirma;
   ![alt text](/src/main/resources/static/images/finalizar.png?raw=true)
8) Caso a venda seja concluída retornar mensagem de sucesso com número do pedido e código de rastreio;
   ![alt text](/src/main/resources/static/images/pedidoRealizado.png?raw=true)

### Relatório de pedidos

- Caso o usuário deseje relatórios sobre todos pedidos realizados, ele deve acessar o endpoint /pedido
- Caso o usuário deseje buscar um pedido específico o usuário deve especificar o id do item desejado Ex: /pedido/1
