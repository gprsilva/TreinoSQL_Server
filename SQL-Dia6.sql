USE LojaDB
-- Criando o banco de dados chamado LojaDB
CREATE DATABASE LojaDB;

-- Usando o banco de dados LojaDB para as pr�ximas opera��es
USE LojaDB;
-- Criando a tabela Clientes que armazena os dados dos clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,  -- ClienteID � a chave prim�ria, ou seja, identifica unicamente cada cliente
    NomeCliente VARCHAR(100),   -- Nome do cliente, armazenado como uma string de at� 100 caracteres
    Cidade VARCHAR(50)          -- Cidade onde o cliente mora, armazenado como uma string de at� 50 caracteres
);

-- Criando a tabela Pedidos que armazena os pedidos feitos pelos clientes
CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY,   -- PedidoID � a chave prim�ria, identificando unicamente cada pedido
    ClienteID INT,              -- ClienteID � uma chave estrangeira, associando cada pedido a um cliente
    DataPedido DATE,            -- Data do pedido, armazenada como um valor de data
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)  -- ClienteID � uma chave estrangeira que referencia a chave prim�ria da tabela Clientes
);


-- Criando a tabela Produtos que armazena os dados dos produtos dispon�veis
CREATE TABLE Produtos (
    ProdutoID INT PRIMARY KEY,  -- ProdutoID � a chave prim�ria, identificando unicamente cada produto
    NomeProduto VARCHAR(100),   -- Nome do produto
    CategoriaID INT,            -- CategoriaID � uma chave estrangeira que referencia a tabela Categorias
    Preco DECIMAL(10, 2)        -- Pre�o do produto, com at� 10 d�gitos no total e 2 casas decimais
);


-- Criando a tabela Categorias que armazena as categorias dos produtos
CREATE TABLE Categorias (
    CategoriaID INT PRIMARY KEY,  -- CategoriaID � a chave prim�ria, identificando unicamente cada categoria
    NomeCategoria VARCHAR(100)    -- Nome da categoria
);


-- Inserindo clientes na tabela Clientes
INSERT INTO Clientes (ClienteID, NomeCliente, Cidade) VALUES
(1, 'Maria Silva', 'S�o Paulo'),  -- Cliente com ID 1
(2, 'Jo�o Santos', 'Rio de Janeiro'),  -- Cliente com ID 2
(3, 'Ana Costa', 'Belo Horizonte');  -- Cliente com ID 3


-- Inserindo pedidos na tabela Pedidos
INSERT INTO Pedidos (PedidoID, ClienteID, DataPedido) VALUES
(1, 1, '2024-01-15'),  -- Pedido ID 1 feito pelo cliente com ID 1 (Maria Silva)
(2, 2, '2024-01-20'),  -- Pedido ID 2 feito pelo cliente com ID 2 (Jo�o Santos)
(3, 1, '2024-02-10');  -- Pedido ID 3 feito pelo cliente com ID 1 (Maria Silva)


-- Inserindo categorias na tabela Categorias
INSERT INTO Categorias (CategoriaID, NomeCategoria) VALUES
(1, 'Eletr�nicos'),  -- Categoria com ID 1
(2, 'Vestu�rio');    -- Categoria com ID 2


-- Inserindo produtos na tabela Produtos
INSERT INTO Produtos (ProdutoID, NomeProduto, CategoriaID, Preco) VALUES
(1, 'Celular', 1, 1500.00),     -- Produto Celular, pertence � categoria Eletr�nicos
(2, 'Televis�o', 1, 3000.00),   -- Produto Televis�o, pertence � categoria Eletr�nicos
(3, 'Camiseta', 2, 50.00);      -- Produto Camiseta, pertence � categoria Vestu�rio


--EXERC�CIOS 

--Quest�o 1
SELECT 
NomeCliente,
PedidoID,
DataPedido
FROM dbo.Clientes INNER JOIN dbo.Pedidos
ON Dbo.Clientes.ClienteID = dbo.Pedidos.ClienteID
ORDER BY DataPedido

--Quest�o 2
SELECT 
NomeCliente,
PedidoID,
Cidade,
DataPedido
FROM dbo.Clientes LEFT JOIN dbo.Pedidos
ON dbo.Clientes.ClienteID = dbo.Pedidos.ClienteID
WHERE PedidoID IS NULL
ORDER BY DataPedido

--Quest�o 3
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

--Quest�o 4
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

--Quest�o 5
-- Selecionando o banco de dados para uso
USE LojaDB
CREATE TABLE DetalhesPedidos (
    DetalheID INT PRIMARY KEY IDENTITY(1,1),  -- Identificador �nico para cada linha
    PedidoID INT,                             -- Relaciona com a tabela Pedidos
    ProdutoID INT,                            -- Relaciona com a tabela Produtos
    Quantidade INT,                           -- Quantidade de produtos no pedido
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),  -- Chave estrangeira para Pedidos
    FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID) -- Chave estrangeira para Produtos
);


-- Inserindo detalhes dos pedidos
INSERT INTO DetalhesPedidos (PedidoID, ProdutoID, Quantidade)
VALUES
(1, 1, 2),  -- Pedido 1 cont�m 2 unidades do Produto 1
(1, 2, 1),  -- Pedido 1 cont�m 1 unidade do Produto 2
(2, 3, 5),  -- Pedido 2 cont�m 5 unidades do Produto 3
(3, 2, 2);  -- Pedido 3 cont�m 2 unidades do Produto 2

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

--Quest�o 6
SELECT
NomeCliente,
COUNT(DISTINCT DetalhesPedidos.ProdutoID)
FROM Clientes INNER JOIN Pedidos
ON dbo.Clientes.ClienteID = dbo.Pedidos.ClienteID
INNER JOIN DetalhesPedidos ON dbo.Pedidos.PedidoID = DetalhesPedidos.PedidoID
GROUP BY NomeCliente

--Quest�o 7
SELECT
dbo.Pedidos.ClienteID,
AVG(DetalhesPedidos.Quantidade) AS 'Qtd. Pedida'
FROM Pedidos INNER JOIN DetalhesPedidos
ON Pedidos.PedidoID = DetalhesPedidos.PedidoID
GROUP BY dbo.Pedidos.ClienteID

--Quest�o 8
SELECT
COUNT(Pedidos.PedidoID)'Qtd. de Pedidos',
YEAR(Pedidos.DataPedido) AS 'Ano do Pedido',
MONTH(Pedidos.DataPedido)AS 'M�s do Pedido'
FROM dbo.Pedidos
GROUP BY YEAR(Pedidos.DataPedido),
MONTH(Pedidos.DataPedido)

--Quest�o 9
SELECT
Produtos.ProdutoID,
Produtos.NomeProduto,
Categorias.CategoriaID,
NomeCategoria,
Preco,
SUM(DetalhesPedidos.Quantidade * Produtos.Preco) AS 'Pre�o do Pedido'
FROM DetalhesPedidos INNER JOIN Produtos ON DetalhesPedidos.ProdutoID = Produtos.ProdutoID
INNER JOIN Categorias ON Categorias.CategoriaID = Produtos.CategoriaID
GROUP BY Produtos.ProdutoID,
Produtos.NomeProduto,
Categorias.CategoriaID,
NomeCategoria,
Preco


--Quest�o 10
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