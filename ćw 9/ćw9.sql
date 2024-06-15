USE AdventureWorks2019; 


SELECT * FROM Person.Person;
SELECT * FROM HumanResources.Employee;
SELECT * FROM HumanResources.EmployeePayHistory;


WITH Pay_CTE (FirstName, MiddleName, LastName, BirthDate, JobTitle, Rate)  
AS  
(  
    SELECT FirstName, MiddleName, LastName, BirthDate, JobTitle, Rate
    FROM Person.Person AS pp
	INNER JOIN HumanResources.EmployeePayHistory AS eph
	ON pp.BusinessEntityID = eph.BusinessEntityID
	INNER JOIN HumanResources.Employee AS emp
	ON pp.BusinessEntityID = emp.BusinessEntityID
    WHERE pp.BusinessEntityID IS NOT NULL 
	AND eph.BusinessEntityID IS NOT NULL
	AND emp.BusinessEntityID IS NOT NULL
)  
SELECT *
INTO #TempEmployeeInfo
FROM Pay_CTE;  


SELECT * FROM TempEmployeeInfo;

-- Uzyskaj informacje na temat przychodów ze sprzedaży według firmy i kontaktu 
--   (za pomocą CTE i bazy AdventureWorksLT).

USE AdventureWorksLT2019; --wybór bazy


SELECT * FROM SalesLT.SalesOrderHeader;
SELECT * FROM SalesLT.Customer;

WITH Sale_CTE (CompanyName, FirstName, LastName, TotalDue)  
AS  
(  
    SELECT CompanyName, FirstName, LastName, SUM(TotalDue) AS TotalDue
    FROM SalesLT.SalesOrderHeader AS soh
	INNER JOIN SalesLT.Customer AS cst
	ON soh.CustomerID = cst.CustomerID
    WHERE soh.CustomerID IS NOT NULL 
	AND cst.CustomerID IS NOT NULL
	GROUP BY CompanyName, FirstName, LastName
)  
SELECT CONCAT(CompanyName, ' (', FirstName, ' ', LastName, ')') AS CompanyContact, TotalDue
FROM Sale_CTE;  

-- Napisz zapytanie, które zwróci wartość sprzedaży dla poszczególnych kategorii 
--   produktów. Wykorzystaj CTE i bazę AdventureWorksLT.

USE AdventureWorksLT2019; --wybór bazy

--eksploracja bazy
SELECT * FROM SalesLT.SalesOrderDetail;
SELECT * FROM SalesLT.Product;
SELECT * FROM SalesLT.ProductCategory;

--właściwe zapytanie
WITH Category_CTE (Name, SalesValue)  
AS  
(  
    SELECT prc.Name, CAST(SUM(LineTotal) AS decimal(16,2)) AS SalesValue
    FROM SalesLT.SalesOrderDetail AS sod
	INNER JOIN SalesLT.Product AS prd
		ON sod.ProductID = prd.ProductID
	INNER JOIN SalesLT.ProductCategory AS prc
		ON prd.ProductCategoryID = prc.ProductCategoryID
    WHERE sod.ProductID IS NOT NULL 
		AND prd.ProductID IS NOT NULL
		AND prd.ProductCategoryID IS NOT NULL
		AND prc.ProductCategoryID IS NOT NULL
	GROUP BY prc.Name
)  
SELECT Name, SalesValue
FROM Category_CTE;  