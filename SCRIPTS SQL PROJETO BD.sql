-- criação das tabelas do meu banco

CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY IDENTITY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(15)
);

CREATE TABLE Fornecedores (
    id_fornecedor INT PRIMARY KEY IDENTITY,
    nome_empresa VARCHAR(100) NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE Funcionarios (
    id_funcionario INT PRIMARY KEY IDENTITY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(15),
    cargo VARCHAR(50),
    salario NUMERIC(10, 2),
    data_admissao DATE
);

CREATE TABLE Produtos (
    id_produto INT PRIMARY KEY IDENTITY,
    nome VARCHAR(100) NOT NULL,
    descricao varchar(150),
    preco_unitario NUMERIC(10, 2) NOT NULL,
    quantidade_estoque INT,
    id_fornecedor INT,
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedores(id_fornecedor)
);

CREATE TABLE Pedidos (
    pedido_id INT PRIMARY KEY IDENTITY,
    cliente_id INT,
    funcionario_id INT,
    data_pedido DATE NOT NULL,
    tipo_pedido VARCHAR(20) NOT NULL,
    CHECK(tipo_pedido IN ('Presencial', 'Retirada', 'Delivery')),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
    FOREIGN KEY (funcionario_id) REFERENCES Funcionarios(id_funcionario)
);

CREATE TABLE Itens_Pedido (
    item_id INT PRIMARY KEY IDENTITY,
    pedido_id INT,
    produto_id INT,
    preco NUMERIC(10, 2) NOT NULL,
    quantidade INT NOT NULL,
    desconto NUMERIC(5, 2) DEFAULT NULL,
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(pedido_id),
    FOREIGN KEY (produto_id) REFERENCES Produtos(id_produto)
);

-- inserções

INSERT INTO Clientes (nome, endereco, telefone) VALUES 
('João Silva', 'Rua A, 123, Centro', '(11) 99999-8888'),
('Maria Oliveira', 'Rua B, 456, Jardim das Flores', '(11) 98888-7777'),
('Carlos Souza', 'Rua C, 789, Vila Nova', '(11) 97777-6666');

INSERT INTO Fornecedores (nome_empresa, endereco, telefone, email) VALUES 
('Fornecedor X', 'Av. Industrial, 1000', '(11) 5555-1234', 'contato@fornix.com'),
('Fornecedor Y', 'Rua do Comércio, 321', '(11) 5555-5678', 'contato@forny.com');

INSERT INTO Funcionarios (nome, endereco, telefone, cargo, salario, data_admissao) VALUES 
('Lucas Pereira', 'Av. Paulista, 1010', '(11) 95555-1234', 'Caixa', 2000.00, '2022-05-15'),
('Fernanda Costa', 'Rua 1, 202', '(11) 95555-6789', 'Atendente', 1500.00, '2021-11-02');

INSERT INTO Produtos (nome, descricao, preco_unitario, quantidade_estoque, id_fornecedor) VALUES 
('Arroz', 'Arroz branco tipo 1, 1kg', 4.50, 50, 1),
('Feijão', 'Feijão carioca, 1kg', 6.00, 30, 2),
('Leite', 'Leite integral, 1L', 3.20, 100, 1),
('Cerveja', 'Cerveja gelada, 350ml', 2.50, 80, 2);

INSERT INTO Pedidos (cliente_id, funcionario_id, data_pedido, tipo_pedido) VALUES 
(1, 1, '2024-01-05', 'Delivery'),
(2, 2, '2024-01-12', 'Presencial'),
(3, 1, '2024-01-20', 'Retirada');

INSERT INTO Itens_Pedido (pedido_id, produto_id, preco, quantidade, desconto) VALUES 
(1, 1, 4.50, 3, 0.00),
(1, 3, 3.20, 2, 10.00),
(2, 2, 6.00, 5, 0.00),
(3, 4, 2.50, 6, 5.00);

-- consultas

SELECT c.nome
FROM Clientes c
INNER JOIN Pedidos p ON c.cliente_id = p.cliente_id
WHERE p.tipo_pedido = 'Delivery'
AND p.data_pedido BETWEEN '2024-01-01' AND '2024-01-31';

SELECT f.nome, 
COUNT(p.pedido_id) AS quantidade_pedidos
FROM Funcionarios f
LEFT JOIN Pedidos p ON f.id_funcionario = p.funcionario_id
WHERE p.data_pedido BETWEEN '2024-01-01' AND '2024-06-30'
GROUP BY f.nome
ORDER BY quantidade_pedidos DESC;

SELECT p.tipo_pedido, 
SUM(ip.quantidade * ip.preco) AS total_valor_pedidos
FROM Pedidos p
INNER JOIN Itens_Pedido ip ON p.pedido_id = ip.pedido_id
GROUP BY p.tipo_pedido
ORDER BY total_valor_pedidos DESC;

SELECT f.nome_empresa AS nome_fornecedor, 
p.nome AS nome_produto
FROM Fornecedores f
INNER JOIN Produtos p ON f.id_fornecedor = p.id_fornecedor
ORDER BY f.nome_empresa, p.nome;

SELECT SUM(ip.quantidade * ip.preco) AS total_pedido
FROM Pedidos p
INNER JOIN Itens_Pedido ip ON p.pedido_id = ip.pedido_id;


SELECT c.nome AS nome_cliente, 
SUM(ip.quantidade) AS total_produtos
FROM Pedidos p
INNER JOIN Clientes c ON p.cliente_id = c.cliente_id
INNER JOIN Itens_Pedido ip ON p.pedido_id = ip.pedido_id
WHERE p.cliente_id = 1
GROUP BY c.nome;

SELECT nome, preco_unitario
FROM Produtos
WHERE preco_unitario = (SELECT MAX(preco_unitario) FROM Produtos);

SELECT tipo_pedido, 
COUNT(pedido_id) AS quantidade_pedidos
FROM Pedidos
GROUP BY tipo_pedido;

SELECT c.nome AS nome_cliente, ip.desconto
FROM Pedidos p
INNER JOIN Clientes c ON p.cliente_id = c.cliente_id
INNER JOIN Itens_Pedido ip ON p.pedido_id = ip.pedido_id
WHERE ip.desconto > 0
ORDER BY c.nome;

















                            



