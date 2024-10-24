## Sistema de Gerenciamento de Loja

Este repositório contém o modelo relacional e scripts SQL para um sistema de gerenciamento de loja. 

### Modelo Relacional

O modelo relacional do sistema é composto pelas seguintes tabelas:

- **Clientes:** Armazena informações básicas dos clientes, como nome, endereço e telefone.
- **Fornecedores:** Armazena informações dos fornecedores, incluindo nome da empresa, endereço, telefone e email.
- **Funcionarios:** Armazena informações dos funcionários, como nome, endereço, telefone, cargo, salário e data de admissão.
- **Produtos:** Armazena informações sobre os produtos, incluindo nome, descrição, preço unitário, quantidade em estoque e o fornecedor.
- **Pedidos:** Armazena informações sobre os pedidos, incluindo cliente, funcionário, data do pedido e o tipo de pedido (presencial, retirada ou delivery).
- **Itens_Pedido:** Detalhe dos itens em cada pedido, com informações sobre o produto, preço, quantidade e desconto aplicado.

### Scripts SQL

O repositório contém scripts SQL para:

- **Criar as tabelas** do banco de dados.
- **Inserir dados** nas tabelas.
- **Realizar consultas** diversas, incluindo:
    - Buscar clientes que fizeram pedidos delivery em um determinado período.
    - Listar funcionários e quantidade de pedidos realizados.
    - Verificar o tipo de pedido e o total de valor dos pedidos.
    - Listar fornecedores e seus produtos.
    - Consultar o total de um pedido.
    - Consultar o total de produtos comprados por um cliente.
    - Encontrar o produto mais caro.
    - Contar a quantidade de pedidos por tipo.
    - Listar clientes que receberam desconto em algum pedido.

### Utilização

Os scripts SQL podem ser utilizados para:

- Criar o banco de dados e as tabelas do sistema.
- Inserir dados no banco de dados.
- Consultar informações sobre clientes, fornecedores, funcionários, produtos e pedidos.
- Realizar análises e relatórios sobre as vendas da loja.

### Observações

- Este repositório serve como exemplo de um sistema de gerenciamento de loja e pode ser adaptado para atender às necessidades específicas de cada negócio.
- Os scripts SQL podem ser modificados e expandidos para adicionar novas funcionalidades ao sistema.
