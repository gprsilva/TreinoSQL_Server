USE ContosoRetailDW

--Questão 1
SELECT TOP(100)
ProductKey,
SalesAmount
FROM FactSales
ORDER BY SalesAmount DESC;

--Questão 2
SELECT TOP(10)
ProductName,
UnitPrice,
Weight,
ColorName
FROM DimProduct
ORDER BY UnitPrice DESC, Weight DESC, ColorName ASC;
--ORDER BY UnitPrice DESC, Weight DESC, AvailableForSaleDate ASC;

--Questão 3
SELECT
ProductName AS 'Nome do produto',
Weight AS Peso
FROM DimProduct
WHERE Weight > 100
ORDER BY Weight DESC;

--Questão 4
SELECT
StoreName AS 'Nome da loja',
OpenDate AS 'Data de abertura',
EmployeeCount AS 'Contagem de Funcionários'
FROM DimStore
WHERE CloseDate IS NULL AND StoreType='Store';

--Questão 5
SELECT
ProductKey,
ProductName,
BrandName,
AvailableForSaleDate
FROM DimProduct
WHERE BrandName = 'Litware' AND AvailableForSaleDate = '15/03/2009';

--Questão 6
SELECT
StoreKey,
StoreName
FROM DimStore
WHERE CloseDate IS NOT NULL;

--Questão 7
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


--Questão 8
SELECT
ProductKey,
ProductName,
UnitPrice
FROM DimProduct
WHERE ProductDescription LIKE '%LCD%';


--Questão 9
SELECT
ProductKey,
ProductName,
ColorName,
BrandName
FROM DimProduct
WHERE BrandName IN ('Contoso','Litware','Fabrikam') AND ColorName IN ('Green','Orange','Black','Silver','Pink');

--Questão 10
SELECT
ProductKey,
ProductName,
ColorName,
UnitPrice,
BrandName
FROM DimProduct
WHERE BrandName ='Contoso' AND ColorName ='Silver' AND UnitPrice BETWEEN 10 AND 30
ORDER BY UnitPrice DESC;
