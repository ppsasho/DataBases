Create procedure dbo.sp_CreateOrderDetails (
  @OrderId int
, @ProductId int
, @Quantity int )
As
Begin

		   Declare @ProductPrice INT

		   Select *
		   From Products 
		   Where Id = @ProductId

	INSERT INTO [dbo].[OrderDetails]
           ([OrderId]
           ,[ProductId]
           ,[Quantity]
           ,[Price])
     VALUES
           (@OrderId
           ,@ProductId
           ,@Quantity
           ,@Quantity * @ProductPrice)

	Update Orders 
	Set TotalPrice = TotalPrice + (@Quantity * @ProductPrice)
	Where Id = @OrderId

	
	Select p.[Name],
		   od.Quantity,
		   Convert(nvarchar, od.Quantity) + N'X' +
		   Convert(nvarchar, p.Price) + N'=' +
		   Convert(nvarchar, od.Quantity * p.Price)

			
	From OrderDetails as od
	Inner join Products as p on od.ProductId = p.Id
	Where OrderId = @OrderId

	Select OrderDate,
		   TotalPrice
	From Orders 
	Where Id = @OrderId
End