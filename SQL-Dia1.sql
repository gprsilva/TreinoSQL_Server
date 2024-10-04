
USE ContosoRetailDW

--1-)a-Continuou a mesma quantidade de produtos.
--SELECT TOP(100) PERCENT ProductName
--FROM DimProduct;

--1-)b-Diminuiu a quantidade de clientes.
--SELECT FirstName,CustomerKey
--FROM DimCustomer;

--2-)a-
--SELECT CustomerKey, FirstName, EmailAddress, BirthDate
--FROM DimCustomer;

--2-)b-
--SELECT 
--CustomerKey AS 'Chave do cliente', 
--FirstName AS 'Primeiro nome do cliente', 
--EmailAddress AS 'Email do cliente', 
--BirthDate AS 'Data de nascimento'
--FROM DimCustomer;


--3-)a-
--SELECT TOP(100) *
--FROM DimCustomer;

--3-)b-
--SELECT TOP(20) PERCENT *
--FROM DimCustomer;

--3-)c-
--SELECT TOP(100) FirstName, EmailAddress, BirthDate
--FROM DimCustomer;

--3-)d-
--SELECT TOP(100) 
--FirstName AS 'Primeiro nome',
--EmailAddress AS 'Endereço de cliente',
--BirthDate AS 'Data de nascimento'
--FROM DimCustomer;

--4-)
--SELECT 
--Manufacturer AS Fornecedor
--FROM DimProduct;

--5-)Sim, possui um produto que não foi vendido.
----SELECT DISTINCT *
----FROM DimProduct;
--SELECT DISTINCT ProductKey
--FROM FactSales
