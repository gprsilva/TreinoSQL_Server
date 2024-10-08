USE ContosoRetailDW


--Quest�o 1
SELECT
COUNT(SalesQuantity) AS 'Quantidade Vendida'
FROM FactSales

SELECT
COUNT(ReturnQuantity) AS 'Quantidade Devolvida'
FROM FactSales

--Quest�o 2
SELECT
AVG(YearlyIncome) AS 'M�dia do Sal�rio'
FROM DimCustomer
WHERE Occupation='Professional'

--Quantidade 3
--Loja com mais funcion�rios
SELECT TOP(1)
StoreName,
EmployeeCount
FROM DimStore
ORDER BY EmployeeCount DESC

SELECT
MAX(EmployeeCount) AS 'Quantidade de Funcion�rio'
FROM DimStore

--Loja com menos funcion�rios
SELECT TOP(1)
StoreName,
EmployeeCount
FROM DimStore
WHERE EmployeeCount IS NOT NULL
ORDER BY EmployeeCount ASC

SELECT
MIN(EmployeeCount) AS 'Quantidade de Funcion�rio'
FROM DimStore

--Quest�o 4
--HOMENS
SELECT
COUNT(EmployeeKey) AS 'Qtd. Homens'
FROM DimEmployee
WHERE Gender = 'M' AND EndDate IS NULL

SELECT TOP(1)
FirstName,
EmailAddress,
HireDate
FROM DimEmployee
WHERE Gender = 'M'AND EndDate IS NULL
ORDER BY HireDate

--MULHERES
SELECT
COUNT(EmployeeKey) AS 'Qtd. Mulheres'
FROM DimEmployee
WHERE Gender = 'F' AND EndDate IS NULL

SELECT TOP(1)
FirstName,
EmailAddress,
HireDate
FROM DimEmployee
WHERE Gender = 'F'AND EndDate IS NULL
ORDER BY HireDate

--Quest�o 5
--a
SELECT
COUNT(DISTINCT ColorName) AS 'Cor do Produto'
FROM DimProduct

--b
SELECT
COUNT(DISTINCT BrandName) AS 'Marca do Produto'
FROM DimProduct

--c
SELECT
COUNT(DISTINCT ClassName) AS 'Classe do Produto'
FROM DimProduct