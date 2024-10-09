USE ContosoRetailDW


--Questão 1
SELECT
SUM(SalesQuantity) AS 'Quantidade Vendida',
SUM(ReturnQuantity) AS 'Quantidade Devolvida'
FROM FactSales
WHERE channelKey = 1;

--Questão 2
SELECT
AVG(YearlyIncome) AS 'Média do Salário'
FROM DimCustomer
WHERE Occupation='Professional'

--Quantidade 3
--Loja com mais funcionários
SELECT TOP(1)
StoreName,
EmployeeCount
FROM DimStore
ORDER BY EmployeeCount DESC

SELECT
MAX(EmployeeCount) AS 'Quantidade de Funcionário'
FROM DimStore

--Loja com menos funcionários
SELECT TOP(1)
StoreName,
EmployeeCount
FROM DimStore
WHERE EmployeeCount IS NOT NULL
ORDER BY EmployeeCount ASC

SELECT
MIN(EmployeeCount) AS 'Quantidade de Funcionário'
FROM DimStore

--Questão 4
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

--Questão 5
SELECT
COUNT(DISTINCT ColorName) AS 'Cor do Produto',
COUNT(DISTINCT BrandName) AS 'Marca do Produto',
COUNT(DISTINCT ClassName) AS 'Classe do Produto'
FROM DimProduct
