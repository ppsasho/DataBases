Create view MaleEmployees
as
Select *
From Employees
Where [Gender] <> 'F'

Select * From MaleEmployees
Order by HireDate DESC

Create view vv_CustomerOrders
as
select c.Id, Sum(o.TotalPrice) as Total
from Orders as o
inner join Customers as c ON c.Id = o.CustomerId
Group by c.Id

Alter view vv_CustomerOrders
as
select c.Id, c.[Name], Sum(o.TotalPrice) as Total
from Orders as o
inner join Customers as c ON c.Id = o.CustomerId
Group by c.Id, c.[Name]

Select * from vv_CustomerOrders
Order by TotalCustomerPrice DESC

Create view vv_EmployeeOrders
As
Select e.FirstName, e.LastName, p.[Name] , Sum(od.Quantity) as Quantity
From Orders o
Inner join Employees as e ON e.Id = o.EmployeeId
Inner join OrderDetails as od ON od.OrderId = o.Id
Inner join Products as p ON od.ProductId = p.Id
Inner join BusinessEntities as be ON BusinessEntityId = o.BusinessEntityId
Group by e.FirstName, e.LastName, p.[Name] , od.Quantity
