--CRUD

--QUESTÃO 1
CREATE DATABASE BD_TESTE

DROP DATABASE BD_TESTE

CREATE DATABASE Exercici

--QUESTÃO 2
USE Exercicios
CREATE TABLE dCliente(
	ID_Cliente INT,
	Nome_Cliente VARCHAR(100), 
	Data_de_Nascimento DATE
)

CREATE TABLE dGerente(
	ID_Gerente INT, 
	Nome_Gerente VARCHAR(100), 
	Data_de_Contratacao DATE,
	Salario FLOAT
)

CREATE TABLE fContratos(
	ID_Contrato INT, 
	Data_de_Assinatura DATE, 
	ID_Cliente INT,
	ID_Gerente INT, 
	Valor_do_Contrato FLOAT
)

--QUESTÃO 3

INSERT INTO dCliente (ID_Cliente, Nome_Cliente, Data_de_Nascimento)
VALUES
(1, 'André Martins', '1989-02-12'),
(2, 'Bárbara Campos', '1992-05-07'),
(3, 'Carol Freitas', '1985-04-23'),
(4, 'Diego Cardoso', '1994-10-11'),
(5, 'Eduardo Pereira', '1988-11-09'),
(6, 'Fabiana Silva', '1989-09-02'),
(7, 'Gustavo Barbosa', '1993-06-27'),
(8, 'Helen Viana', '1990-02-11');

INSERT INTO dGerente (ID_Gerente, Nome_Gerente, Data_de_Contratacao, Salario)
VALUES
(1, 'Lucas Sampaio', '2015-03-21 00:00:00', 6700),
(2, 'Mariana Padilha', '2011-01-10 00:00:00', 9900),
(3, 'Nathália Santos', '2018-10-03 00:00:00', 7200),
(4, 'Otávio Costa', '2017-04-18 00:00:00', 11000);

INSERT INTO fContratos (ID_Contrato, Data_de_Assinatura, ID_Cliente, ID_Gerente, Valor_do_Contrato)
VALUES
(1, '2019-01-12 00:00:00', 8, 1, 23000),
(2, '2019-02-10 00:00:00', 3, 2, 15500),
(3, '2019-03-07 00:00:00', 7, 2, 6500),
(4, '2019-03-15 00:00:00', 1, 3, 33000),
(5, '2019-03-21 00:00:00', 5, 4, 11100),
(6, '2019-03-23 00:00:00', 4, 2, 5500),
(7, '2019-03-28 00:00:00', 9, 3, 55000),
(8, '2019-04-04 00:00:00', 2, 1, 31000),
(9, '2019-04-05 00:00:00', 10, 4, 3400),
(10, '2019-04-05 00:00:00', 6, 2, 9200);

--QUESTÃO 4

INSERT INTO dCliente (ID_Cliente, Nome_Cliente, Data_de_Nascimento)
VALUES
(9, 'Pablo Marçal', '1899-12-04'),
(10, 'Emily Lane', '2007-08-19')

SELECT * FROM dCliente
-------------------------------------

INSERT INTO dGerente (ID_Gerente, Nome_Gerente, Data_de_Contratacao, Salario)
VALUES
(5, 'GPR ', '2012-12-12 00:00:00', 30050.50)

SELECT * FROM dGerente
----------------------------

INSERT INTO fContratos (ID_Contrato, Data_de_Assinatura, ID_Cliente, ID_Gerente, Valor_do_Contrato)
VALUES
(11, '2020-11-01 00:00:00', 10, 5, 29603.54)

SELECT * FROM fContratos

--QUESTÃO 5
UPDATE fContratos
SET
Data_de_Assinatura ='17/03/2019',
ID_Gerente = 2,
Valor_do_Contrato = '33500'
WHERE ID_Contrato = 4

--QUESTÃO 6
DELETE
FROM fContratos
WHERE ID_Contrato=11