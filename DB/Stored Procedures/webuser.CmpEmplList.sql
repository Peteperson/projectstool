
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [webuser].[CmpEmplList]
    @CompanyId INT 
AS 
	SELECT *, vt.Description AS PositionText
	FROM webuser.Users usr
	INNER JOIN webuser.UsersCompanies ucmp ON usr.id = ucmp.UserId
	INNER JOIN webuser.VariousTypes vt ON ucmp.Position = vt.id
	WHERE ucmp.CompanyId = @CompanyId 
	ORDER BY [LastName], [FirstName]
GO
