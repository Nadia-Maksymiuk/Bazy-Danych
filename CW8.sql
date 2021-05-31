

BEGIN
	SELECT HumanResources.EmployeePayHistory.BusinessEntityID, FirstName, LastName, Rate
	FROM HumanResources.EmployeePayHistory INNER JOIN Person.Person
	ON HumanResources.EmployeePayHistory.BusinessEntityID = Person.Person.BusinessEntityID
	WHERE Rate < (SELECT AVG(Rate)FROM HumanResources.EmployeePayHistory);
END;


GO


CREATE OR ALTER FUNCTION Shipment(@id INT)
RETURNS DATETIME
AS
BEGIN
	DECLARE @ship_date DATETIME;
	SELECT @ship_date = ShipDate FROM Sales.SalesOrderHeader WHERE SalesOrderID = @id;

	RETURN @ship_date
END;

GO

DECLARE @SalesID INT = 44444;
SELECT @SalesID AS SalesID, dbo.Shipment(@SalesID) AS shipment_date;


GO



CREATE OR ALTER PROCEDURE product_showcase(@name VARCHAR(50))
AS
BEGIN
    DECLARE @id INT= (SELECT ProductID FROM Production.Product WHERE Name = @name);
    DECLARE @quantity INT = (SELECT SUM(Quantity) FROM Production.ProductInventory WHERE ProductID = @id);
	IF @quantity > 0
		SELECT  Name, ProductID, ProductNumber, 'Product available' AS product_availability
		FROM Production.Product WHERE Name = @name;
	ELSE
		SELECT  Name, ProductID, ProductNumber, 'Product unavailable' AS product_availability
		FROM Production.Product  WHERE Name = @name;
END;

GO

DECLARE @name VARCHAR(50) = 'Metal Bar 1';
EXEC product_showcase @name;


GO



CREATE OR ALTER FUNCTION credit_card(@order_num INT)
RETURNS VARCHAR(20)
AS
BEGIN
	DECLARE @number VARCHAR(20);

	SELECT @number = Sales.CreditCard.CardNumber 
	FROM Sales.CreditCard INNER JOIN Sales.SalesOrderHeader 
	ON Sales.CreditCard.CreditCardID = Sales.SalesOrderHeader.CreditCardID 
	WHERE Sales.SalesOrderHeader.SalesOrderID = @order_num;

	RETURN @number
END;

GO

DECLARE @order_num INT = 44444;
SELECT @order_num AS order_number, dbo.credit_card(@order_num) AS card_number;


GO


CREATE OR ALTER PROCEDURE division(@num1 FLOAT, @num2 FLOAT)
AS 
BEGIN
	DECLARE @output FLOAT;

	IF @num1 < @num2
	SELECT 'Niewłaściwie zdefiniowałeś dane wejściowe' AS WARNING;
	ELSE
	BEGIN
		SET @output = @num1/@num2 
		SELECT @num1 AS num1, @num2 AS num2, @output AS division_result
	END;
END;

GO

DECLARE @num1 FLOAT = 96;
DECLARE @num2 FLOAT = 2;
EXEC division @num1, @num2;

GO

CREATE OR ALTER PROCEDURE free_days(@id VARCHAR(20))
AS
BEGIN
	SELECT JobTitle, VacationHours / 8 AS Vacation_days, SickLeaveHours / 8 AS SickLeave_days
	FROM AdventureWorks2019.HumanResources.Employee
	WHERE NationalIDNumber = @id; 
END;

GO

DECLARE @id VARCHAR(20);
SET @id = 410742000
EXEC free_days @id;


GO


CREATE OR ALTER PROCEDURE currency_calc(@cash_amount FLOAT, @Currency_from VARCHAR(10), @Currency_to VARCHAR(10), @rate_date DATETIME)
AS
BEGIN
	DECLARE @rate FLOAT;
	DECLARE @result FLOAT;
	IF @Currency_from = 'USD'
		BEGIN
			SELECT @rate = AverageRate FROM Sales.CurrencyRate WHERE ToCurrencyCode = @Currency_to AND CurrencyRateDate = @rate_date;
			SET @result = @rate * @cash_amount;
		END;
	ELSE
		BEGIN
			SELECT @rate = AverageRate FROM Sales.CurrencyRate WHERE ToCurrencyCode = @Currency_from AND CurrencyRateDate = @rate_date;
			SET @result = @cash_amount/@rate;
		END;
	SELECT @Currency_from AS currency_from, @Currency_to AS currency_to, @cash_amount AS amount, @rate AS rate, @result AS amount_after;
END;

GO

DECLARE @currency1 VARCHAR(5) = 'USD';
DECLARE @currency2 VARCHAR(5) = 'EUR';
DECLARE @cash_amount FLOAT = 100;
DECLARE @rate_date DATETIME = '2014-05-31 00:00:00.000'
EXEC currency_calc @cash_amount, @currency1, @currency2, @rate_date;