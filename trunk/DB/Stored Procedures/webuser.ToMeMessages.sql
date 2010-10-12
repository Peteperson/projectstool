
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [webuser].[ToMeMessages]
    @UserId INT 
AS 
	DECLARE @CompanyId INT 
	SELECT @CompanyId = company FROM users WHERE id=@UserId
    
    SELECT [Messages].*, Users.LastName + ' ' + users.FirstName AS Fullname
    FROM webuser.Messages
    INNER JOIN webuser.Users ON [Messages].Writer = Users.id
    WHERE (ToUserId = @UserId OR ToCompanyId = @UserId OR ToEveryone = 1) AND writer <> @UserId
    ORDER BY id DESC 


GO
