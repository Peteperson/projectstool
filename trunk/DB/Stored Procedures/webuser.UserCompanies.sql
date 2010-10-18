SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [webuser].[UserCompanies]
    @UserId INT 
AS 
 
	SELECT ucmp.*, vt.Description AS PositionText, cmp.Name AS CompanyText 
	FROM webuser.UsersCompanies ucmp
	INNER JOIN webuser.VariousTypes vt ON ucmp.Position = vt.id
	INNER JOIN webuser.Companies cmp ON ucmp.CompanyId = cmp.Id
	WHERE UserId = @UserId
	ORDER BY cmp.Name
	
GO
