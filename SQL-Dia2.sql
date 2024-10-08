USE ContosoRetailDW

--Quest�o 1
SELECT TOP(100)
ProductKey,
SalesAmount
FROM FactSales
ORDER BY SalesAmount DESC;

--Quest�o 2
SELECT TOP(10)
ProductName,
UnitPrice,
Weight,
ColorName
FROM DimProduct
ORDER BY UnitPrice DESC, Weight DESC, ColorName ASC;

--Quest�o 3
SELECT
ProductName AS 'Nome do produto',
Weight AS Peso
FROM DimProduct
WHERE Weight > 100
ORDER BY Weight DESC;

--Quest�o 4
SELECT
StoreName AS 'Nome da loja',
OpenDate AS 'Data de abertura',
EmployeeCount AS 'Contagem de Funcion�rios'
FROM DimStore
WHERE CloseDate IS NULL;

--Quest�o 5
SELECT
ProductKey,
ProductName,
BrandName,
AvailableForSaleDate
FROM DimProduct
WHERE BrandName = 'Litware' AND AvailableForSaleDate = '15/03/2009';

--Quest�o 6
SELECT
StoreKey,
StoreName
FROM DimStore
WHERE CloseDate IS NULL;

--Quest�o 7
--CATEGORIA 1
SELECT
StoreKey,
StoreName,
EmployeeCount
FROM DimStore
WHERE EmployeeCount BETWEEN 1 AND 20;

----CATEGORIA 2
SELECT
StoreKey,
StoreName,
EmployeeCount
FROM DimStore
WHERE EmployeeCount BETWEEN 21 AND 50;

----CATEGORIA 3
SELECT
StoreKey,
StoreName,
EmployeeCount
FROM DimStore
WHERE EmployeeCount >= 51;


--Quest�o 8
SELECT
ProductKey,
ProductName,
UnitPrice
FROM DimProduct
WHERE ProductName LIKE '%LCD%';


--Quest�o 9
SELECT
ProductKey,
ProductName,
ColorName,
BrandName
FROM DimProduct
WHERE BrandName IN ('Contoso','Litware','Fabrikam') AND ColorName IN('Green','Orange','Black','Silver','Pink');

--Quest�o 10
SELECT
ProductKey,
ProductName,
ColorName,
UnitPrice,
BrandName
FROM DimProduct
WHERE BrandName ='Contoso' AND ColorName ='Silver' AND UnitPrice BETWEEN 10 AND 30
ORDER BY UnitPrice DESC;
