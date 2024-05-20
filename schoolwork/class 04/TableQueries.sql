CREATE TABLE Receipts
(
	Id uniqueidentifier not null
)

Alter table Orders
Add constraint FK_Orders_Customers
Foreign key (CustomerId)
References Customers (Id)

Select *
from Orders

Select *
from Customers as c
Cross Join Orders as o

Select * 
From Customers as c
Inner Join Orders as o
ON o.CustomerId = c.Id
Where c.[Name] = 'Zegin Radovis'

Select *
From Customers as c
Left Join Orders as o ON o.CustomerId = c.Id

