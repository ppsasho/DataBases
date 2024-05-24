--WORKSHOP 02
--Declare scalar function (fn_FormatProductName) for retrieving the
--Product description for specific ProductId in the following format:
--Second and Third character from the Code
--Last three characters from the Name
--Product Price

Create function fn_FormatProductName(@ProductId int)
returns nvarchar(100)
as
Begin

	Declare @Description nvarchar(100)

	Select @Description = SUBSTRING(p.Code, 2, 2)
						+ '-'
						+ RIGHT(p.[Name], 3)
						+ '-'
						+ Convert(nvarchar(50), p.Price) 
	From Products as p where p.Id = @ProductId

	Return @Description

End

Select dbo.fn_FormatProductName(10)

