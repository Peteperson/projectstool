
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [webuser].[UsersList]
    @LastName NVARCHAR(200) = '',
    @UserName NVARCHAR(200) = ''
AS 
	SELECT [Users].*, t1.Description as UserTypeText, pages.Description AS DefaultPageText
	FROM [webuser].[Users] 
	INNER JOIN webuser.VariousTypes t1 ON Users.UserType = t1.id
	INNER JOIN webuser.Pages ON users.DefaultPage = pages.id
	WHERE LastName LIKE ('%'+ IsNull(@LastName, '') +'%') 
		AND UserName LIKE ('%'+ IsNull(@UserName, '') +'%') AND UserType <> 38
GO
