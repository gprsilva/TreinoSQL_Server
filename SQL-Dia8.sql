USE ContosoRetailDW

--QUEST�O 1
DECLARE @VALOR1 INT
SET @VALOR1 = 10

DECLARE @VALOR2 INT
SET @VALOR2 = 5

DECLARE @VALOR3 INT
SET @VALOR3 = 34

DECLARE @VALOR4 INT
SET @VALOR4 = 7

--A-)

DECLARE @VALOR1 INT
SET @VALOR1 = 10
DECLARE @VALOR2 INT
SET @VALOR2 = 5
DECLARE @SOMA INT
SET @SOMA = @VALOR1 + @VALOR2

SELECT @SOMA AS 'SOMA'

--B-)
DECLARE @VALOR3 INT
SET @VALOR3 = 34
DECLARE @VALOR4 INT
SET @VALOR4 = 7
DECLARE @SUBTRA��O INT
SET @SUBTRA��O = @VALOR3 - @VALOR4
SELECT @SUBTRA��O AS 'SUBTRA��O'

--C-)
DECLARE @VALOR1 INT
SET @VALOR1 = 10
DECLARE @VALOR4 INT
SET @VALOR4 = 7
DECLARE @MULTIPLICA��O INT
SET @MULTIPLICA��O = @VALOR1 * @VALOR4 
SELECT @MULTIPLICA��O AS 'MULTIPLICA��O'

--D-)
DECLARE @VALOR3 INT
SET @VALOR3 = 34
DECLARE @VALOR4 INT
SET @VALOR4 = 7
DECLARE @DIVIS�O FLOAT 
SET @DIVIS�O = CAST(@VALOR3 AS FLOAT) / CAST(@VALOR4 AS FLOAT)
SELECT ROUND(@DIVIS�O,2) AS 'DIVIS�O'

--QUEST�O 2

DECLARE @PRODUTO VARCHAR(20)
SET @PRODUTO = 'Celular'

DECLARE @QUANTIDADE INT
SET @QUANTIDADE = 12

DECLARE @PRE�O FLOAT
SET @PRE�O = 9.99

DECLARE @FATURAMENTO FLOAT
SET @FATURAMENTO = @QUANTIDADE * @PRE�O

SELECT 
	@PRODUTO AS 'Produto',
	@QUANTIDADE AS 'Quantidade',
	@PRE�O AS 'Pre�o',
	@FATURAMENTO AS 'Faturamento'

--QUEST�O 3
DECLARE @NOME_DONO CHAR(5)
SET @NOME_DONO = 'Andr�'

DECLARE @NASCIMENTO_DONO DATE
SET @NASCIMENTO_DONO = '10-02-1998'

DECLARE @NUM_PETS INT
SET @NUM_PETS = 2

SELECT
 FRASE= 'Meu nome � '+ @NOME_DONO +', nasci em'+ FORMAT(CAST(@NASCIMENTO_DONO AS datetime),'dd/MM/yyyy') +' e tenho '+CAST(@NUM_PETS AS varchar(MAX)) +' pets.'

 --QUEST�O 4
 DECLARE @LOJAS VARCHAR (MAX)
 SET @LOJAS = ''
 SELECT @LOJAS = @LOJAS + StoreName +', '+CHAR(10)
 FROM DimStore
 WHERE CloseDate IS NOT  NULL  AND CloseDate BETWEEN '01/01/2008' AND '31/12/2008'
 PRINT 'As lojas fechadas no ano de 2008 foram: '+ LEFT(@LOJAS,DATALENGTH(@LOJAS)-3)

 --QUEST�O 5
 DECLARE @PRODUTOS VARCHAR (MAX)
 SET @PRODUTOS = ''
 SELECT @PRODUTOS = @PRODUTOS + ProductName +', '+CHAR(10)
 FROM DimProduct INNER JOIN DimProductSubcategory ON DimProductSubcategory.ProductSubcategoryKey= DimProduct.ProductSubcategoryKey
 WHERE ProductSubcategoryName = 'Lamps'
 PRINT LEFT(@PRODUTOS,DATALENGTH(@PRODUTOS)-3)