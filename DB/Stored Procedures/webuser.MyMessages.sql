
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [webuser].[MyMessages]
    @UserId INT 
AS 
    SELECT [Messages].*, Users.LastName + ' ' + users.FirstName AS Fullname 
		, ISNULL(t2.LastName + ' ' + t2.FirstName, '') AS ToUserText
		, ISNULL(companies.Name, '') AS ToCompanyText
    FROM webuser.[Messages] 
    INNER JOIN webuser.Users ON [Messages].Writer = Users.id
    LEFT JOIN webuser.Users t2 ON [Messages].ToUserId = t2.id
    LEFT JOIN webuser.companies ON webuser.Companies.Id = webuser.Messages.ToCompanyId
    WHERE Writer = @UserId
    ORDER BY id DESC 
GO
