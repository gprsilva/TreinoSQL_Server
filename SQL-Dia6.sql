USE LojaDB
-- Criando o banco de dados chamado LojaDB
CREATE DATABASE LojaDB;

-- Usando o banco de dados LojaDB para as próximas operações
USE LojaDB;
-- Criando a tabela Clientes que armazena os dados dos clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,  -- ClienteID é a chave primária, ou seja, identifica unicamente cada cliente
    NomeCliente VARCHAR(100),   -- Nome do cliente, armazenado como uma string de até 100 caracteres
    Cidade VARCHAR(50)          -- Cidade onde o cliente mora, armazenado como uma string de até 50 caracteres
);

-- Criando a tabela Pedidos que armazena os pedidos feitos pelos clientes
CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY,   -- PedidoID é a chave primária, identificando unicamente cada pedido
    ClienteID INT,              -- ClienteID é uma chave estrangeira, associando cada pedido a um cliente
    DataPedido DATE,            -- Data do pedido, armazenada como um valor de data
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)  -- ClienteID é uma chave estrangeira que referencia a chave primária da tabela Clientes
);


-- Criando a tabela Produtos que armazena os dados dos produtos disponíveis
CREATE TABLE Produtos (
    ProdutoID INT PRIMARY KEY,  -- ProdutoID é a chave primária, identificando unicamente cada produto
    NomeProduto VARCHAR(100),   -- Nome do produto
    CategoriaID INT,            -- CategoriaID é uma chave estrangeira que referencia a tabela Categorias
    Preco DECIMAL(10, 2)        -- Preço do produto, com até 10 dígitos no total e 2 casas decimais
);


-- Criando a tabela Categorias que armazena as categorias dos produtos
CREATE TABLE Categorias (
    CategoriaID INT PRIMARY KEY,  -- CategoriaID é a chave primária, identificando unicamente cada categoria
    NomeCategoria VARCHAR(100)    -- Nome da categoria
);


-- Inserindo clientes na tabela Clientes
INSERT INTO Clientes (ClienteID, NomeCliente, Cidade) VALUES
(1, 'Maria Silva', 'São Paulo'),  -- Cliente com ID 1
(2, 'João Santos', 'Rio de Janeiro'),  -- Cliente com ID 2
(3, 'Ana Costa', 'Belo Horizonte');  -- Cliente com ID 3


-- Inserindo pedidos na tabela Pedidos
INSERT INTO Pedidos (PedidoID, ClienteID, DataPedido) VALUES
(1, 1, '2024-01-15'),  -- Pedido ID 1 feito pelo cliente com ID 1 (Maria Silva)
(2, 2, '2024-01-20'),  -- Pedido ID 2 feito pelo cliente com ID 2 (João Santos)
(3, 1, '2024-02-10');  -- Pedido ID 3 feito pelo cliente com ID 1 (Maria Silva)


-- Inserindo categorias na tabela Categorias
INSERT INTO Categorias (CategoriaID, NomeCategoria) VALUES
(1, 'Eletrônicos'),  -- Categoria com ID 1
(2, 'Vestuário');    -- Categoria com ID 2


-- Inserindo produtos na tabela Produtos
INSERT INTO Produtos (ProdutoID, NomeProduto, CategoriaID, Preco) VALUES
(1, 'Celular', 1, 1500.00),     -- Produto Celular, pertence à categoria Eletrônicos
(2, 'Televisão', 1, 3000.00),   -- Produto Televisão, pertence à categoria Eletrônicos
(3, 'Camiseta', 2, 50.00);      -- Produto Camiseta, pertence à categoria Vestuário


--EXERCÍCIOS 

--Questão 1
SELECT 
NomeCliente,
PedidoID,
DataPedido
FROM dbo.Clientes INNER JOIN dbo.Pedidos
ON Dbo.Clientes.ClienteID = dbo.Pedidos.ClienteID
ORDER BY DataPedido

--Questão 2
SELECT 
NomeCliente,
PedidoID,
Cidade,
DataPedido
FROM dbo.Clientes LEFT JOIN dbo.Pedidos
ON dbo.Clientes.ClienteID = dbo.Pedidos.ClienteID
WHERE PedidoID IS NULL
ORDER BY DataPedido

--Questão 3
SELECT DISTINCT 
NomeCliente,
Cidade
FROM dbo.Clientes
UNION
SELECT 
dbo.Clientes.NomeCliente,
dbo.Clientes.Cidade
FROM dbo.Pedidos INNER JOIN dbo.Clientes
ON dbo.Clientes.ClienteID = dbo.Pedidos.ClienteID

--Questão 4
SELECT
NomeCliente,
Cidade
FROM dbo.Clientes
UNION ALL
SELECT 
dbo.Clientes.NomeCliente,
dbo.Clientes.Cidade
FROM dbo.Pedidos INNER JOIN dbo.Clientes
ON dbo.Clientes.ClienteID = dbo.Pedidos.ClienteID

--Questão 5
-- Selecionando o banco de dados para uso
USE LojaDB
CREATE TABLE DetalhesPedidos (
    DetalheID INT PRIMARY KEY IDENTITY(1,1),  -- Identificador único para cada linha
    PedidoID INT,                             -- Relaciona com a tabela Pedidos
    ProdutoID INT,                            -- Relaciona com a tabela Produtos
    Quantidade INT,                           -- Quantidade de produtos no pedido
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),  -- Chave estrangeira para Pedidos
    FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID) -- Chave estrangeira para Produtos
);


-- Inserindo detalhes dos pedidos
INSERT INTO DetalhesPedidos (PedidoID, ProdutoID, Quantidade)
VALUES
(1, 1, 2),  -- Pedido 1 contém 2 unidades do Produto 1
(1, 2, 1),  -- Pedido 1 contém 1 unidade do Produto 2
(2, 3, 5),  -- Pedido 2 contém 5 unidades do Produto 3
(3, 2, 2);  -- Pedido 3 contém 2 unidades do Produto 2

SELECT
Clientes.NomeCliente,
Produtos.NomeProduto,
DetalhesPedidos.Quantidade,
Pedidos.DataPedido

FROM dbo.Clientes 
INNER JOIN dbo.Pedidos ON dbo.Clientes.ClienteID = dbo.Pedidos.ClienteID
INNER JOIN dbo.DetalhesPedidos ON dbo.Pedidos.PedidoID = dbo.DetalhesPedidos.PedidoID
INNER JOIN dbo.Produtos ON dbo.DetalhesPedidos.ProdutoID = dbo.Produtos.ProdutoID
ORDER BY DataPedido DESC

--Questão 6
SELECT
NomeCliente,
COUNT(DISTINCT DetalhesPedidos.ProdutoID)
FROM Clientes INNER JOIN Pedidos
ON dbo.Clientes.ClienteID = dbo.Pedidos.ClienteID
INNER JOIN DetalhesPedidos ON dbo.Pedidos.PedidoID = DetalhesPedidos.PedidoID
GROUP BY NomeCliente

--Questão 7
SELECT
dbo.Pedidos.ClienteID,
AVG(DetalhesPedidos.Quantidade) AS 'Qtd. Pedida'
FROM Pedidos INNER JOIN DetalhesPedidos
ON Pedidos.PedidoID = DetalhesPedidos.PedidoID
GROUP BY dbo.Pedidos.ClienteID

--Questão 8
SELECT
COUNT(Pedidos.PedidoID)'Qtd. de Pedidos',
YEAR(Pedidos.DataPedido) AS 'Ano do Pedido',
MONTH(Pedidos.DataPedido)AS 'Mês do Pedido'
FROM dbo.Pedidos
GROUP BY YEAR(Pedidos.DataPedido),
MONTH(Pedidos.DataPedido)

--Questão 9
SELECT
Produtos.ProdutoID,
Produtos.NomeProduto,
Categorias.CategoriaID,
NomeCategoria,
Preco,
SUM(DetalhesPedidos.Quantidade * Produtos.Preco) AS 'Preço do Pedido'
FROM DetalhesPedidos INNER JOIN Produtos ON DetalhesPedidos.ProdutoID = Produtos.ProdutoID
INNER JOIN Categorias ON Categorias.CategoriaID = Produtos.CategoriaID
GROUP BY Produtos.ProdutoID,
Produtos.NomeProduto,
Categorias.CategoriaID,
NomeCategoria,
Preco


--Questão 10
ALTER TABLE Pedidos ADD Total DECIMAL(10, 2);

UPDATE Pedidos
SET Total = (
    SELECT SUM(DetalhesPedidos.Quantidade * Produtos.Preco)
    FROM DetalhesPedidos
    INNER JOIN Produtos ON DetalhesPedidos.ProdutoID = Produtos.ProdutoID
    WHERE DetalhesPedidos.PedidoID = Pedidos.PedidoID
);

SELECT
Clientes.NomeCliente,
MAX(Pedidos.Total) AS 'Total'
FROM dbo.Clientes INNER JOIN dbo.Pedidos
ON dbo.Clientes.ClienteID=dbo.Pedidos.ClienteID
GROUP BY Clientes.NomeCliente