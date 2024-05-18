USE SEDC

SELECT *
FROM Employees
WHERE FirstName = 'Goran'

SELECT *
FROM Employees
WHERE LastName LIKE 'S%'

SELECT *
FROM Employees
WHERE DateOfBirth > '01-01-1988'

SELECT *
FROM Employees
WHERE Gender <> 'F'

SELECT *
FROM Employees
WHERE HireDate >= '01-01-1998'
	AND HireDate <= '01-31-1998'

SELECT *
FROM Employees
WHERE LastName LIKE 'A%'
	AND HireDate >= '01-01-2019'
	AND HireDate <= '01-31-2019'

SELECT *
FROM Employees
WHERE FirstName = 'Aleksandar'
ORDER BY LastName ASC

SELECT *
FROM Employees
ORDER BY FirstName ASC

SELECT *
FROM Employees
WHERE Gender <> 'F'
ORDER BY HireDate DESC

SELECT Region
FROM BusinessEntities

UNION

SELECT RegionName
FROM Customers
WHERE IsActive = 1

Alter table Products 
Add constraint DF_Products_Price 
Default 1 for Price
GO

--Select * from Products

--Insert into Products([Name], [Description], [Weight], [Cost], [Price], [Code])

Alter table Products WITH CHECK
Add constraint CHK_Products_Price
CHECK (Price <= 2*Cost)
GO

Alter table Products 
Add constraint UC_Products_Name
Unique ([Name])
