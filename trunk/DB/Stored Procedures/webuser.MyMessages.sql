SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [webuser].[MyMessages]
    @UserId INT 
AS 
	DECLARE @CompanyId INT 
	SELECT @CompanyId = company FROM users WHERE id=@UserId
    
    SELECT [Messages].*, Users.LastName + ' ' + users.FirstName AS Fullname FROM [Messages] 
    INNER JOIN Users ON [Messages].Writer = Users.id
    WHERE Writer = @UserId OR ToUserId = @UserId OR ToCompanyId = @CompanyId OR ToEveryone = 1
    ORDER BY id DESC 
GO
