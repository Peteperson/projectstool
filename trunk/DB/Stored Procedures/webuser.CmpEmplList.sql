SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [webuser].[CmpEmplList]
    @CompanyId INT 
AS 
	SELECT usr.*, vt.Description AS PositionText
	FROM webuser.Users usr
	INNER JOIN webuser.VariousTypes vt ON usr.Position = vt.id
	WHERE [Company] = @CompanyId 
	ORDER BY [LastName], [FirstName]
GO
