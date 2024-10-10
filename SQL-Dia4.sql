USE ContosoRetailDW

--Questão 1
--a
SELECT
channelKey,
SUM(SalesQuantity) AS 'Quantidade Vendida'
FROM FactSales
GROUP BY channelKey
ORDER BY channelKey

--b
SELECT
StoreKey,
SUM(SalesQuantity) AS 'Total Vendido',
SUM(ReturnQuantity) AS 'Total Retornado'
FROM FactSales
GROUP BY StoreKey
ORDER BY StoreKey

--c
SELECT
channelKey,
SUM(SalesAmount) AS 'Total Produto'
FROM FactSales
WHERE DateKey = '2007'
GROUP BY channelKey
ORDER BY channelKey



--Questão 2
--a
SELECT
ProductKey,
SUM(SalesAmount) AS 'Total Produto'
FROM FactSales
GROUP BY ProductKey
HAVING SUM (SalesAmount) > 5000000
ORDER BY SUM(SalesAmount)

--b
SELECT TOP (10)
ProductKey,
SUM(SalesAmount) AS 'Total Produto'
FROM FactSales
GROUP BY ProductKey
ORDER BY SUM(SalesAmount) DESC

--Questão 3
--a
SELECT TOP (1)
CustomerKey,
SUM(SalesQuantity) AS 'Quantidade Comprada'
FROM FactOnlineSales
GROUP BY CustomerKey
ORDER BY SUM(SalesQuantity) DESC

--b
SELECT TOP (3)
ProductKey,
SUM(SalesQuantity) AS 'Quantidade Comprada'
FROM FactOnlineSales
WHERE CustomerKey = '19037'
GROUP BY ProductKey
ORDER BY SUM(SalesQuantity) DESC

--Questão 4
--a
SELECT
BrandName,
COUNT(ProductName) AS 'Nome do Produto'
FROM DimProduct
GROUP BY BrandName
ORDER BY COUNT(ProductName)

--b
SELECT
ClassName,
AVG(UnitPrice) AS 'Preço Unitário'
FROM DimProduct
GROUP BY ClassName
ORDER BY AVG(UnitPrice)

--c
SELECT
ColorName,
SUM(weight)
FROM DimProduct
GROUP BY ColorName
ORDER BY SUM(weight)

--Questão 5
SELECT
StockTypeName,
SUM(Weight)
FROM DimProduct
WHERE BrandName ='Contoso'
GROUP BY StockTypeName 
ORDER BY SUM(Weight)


--Questão 6
SELECT
BrandName,
COUNT(DISTINCT ColorID) AS 'Quantidade de Cores'
FROM DimProduct
GROUP BY BrandName
ORDER BY COUNT(DISTINCT ColorID)

--Questão 7
SELECT
Gender,
COUNT(CustomerKey),
AVG(YearlyIncome) AS 'Média Salarial'
FROM DimCustomer
WHERE Gender IS NOT NULL
GROUP BY Gender
ORDER BY COUNT(CustomerKey)

--Questão 8
SELECT
Education,
COUNT(CustomerKey) AS 'Quantidade de Clientes',
AVG(YearlyIncome) AS 'Média Salarial'
FROM DimCustomer
WHERE Education IS NOT NULL
GROUP BY Education
ORDER BY COUNT(CustomerKey)

--Questão 9
SELECT
DepartmentName,
COUNT(EmployeeKey) AS 'Quantidade de Funcionários'
FROM DimEmployee
WHERE EndDate IS NULL
GROUP BY DepartmentName
ORDER BY COUNT(EmployeeKey)

--Questão 10
 SELECT
 Title,
 SUM(VacationHours) AS 'Hora de Férias'
 FROM DimEmployee
 WHERE
 Gender = 'F' AND
 DepartmentName IN ('Production','Marketing','Engineering','Finance') AND
 HireDate BETWEEN '01/01/1999' AND '31/12/2000'
 GROUP BY Title 