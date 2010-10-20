
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [webuser].[ToMeMessages]
    @UserId INT 
AS 
	DECLARE @CompanyIds TABLE (
		id int
	)
	
	INSERT INTO @CompanyIds(id)
		SELECT companyid FROM webuser.users 
		INNER JOIN webuser.UsersCompanies ON Users.id = UsersCompanies.UserId
		WHERE id=@UserId
    
    SELECT [Messages].*, Users.LastName + ' ' + users.FirstName AS Fullname
    FROM webuser.Messages
    INNER JOIN webuser.Users ON [Messages].Writer = Users.id
    WHERE (ToUserId = @UserId OR ToCompanyId in (SELECT id FROM [@CompanyIds]) OR ToEveryone = 1) AND writer <> @UserId
    ORDER BY id DESC 
GO
