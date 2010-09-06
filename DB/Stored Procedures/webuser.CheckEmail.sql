SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

Create PROCEDURE [webuser].[CheckEmail]
    @email NVARCHAR(50)
AS 
    SET NOCOUNT ON

    SELECT id, UserName FROM Users WHERE email = @email AND IsActive = 1


GO
