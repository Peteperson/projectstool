SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [webuser].[MenuItems]
    @UserType NVARCHAR(105)
AS 
    SET NOCOUNT ON
    SELECT t2.[Description], t2.[Path], t2.[Image] FROM UserPages t1
    INNER JOIN Pages t2 ON t1.PageId = t2.id
    INNER join VariousTypes t3 ON t3.id = t1.UserType
    WHERE t3.[Description] = @UserType ORDER BY Ordering


GO
