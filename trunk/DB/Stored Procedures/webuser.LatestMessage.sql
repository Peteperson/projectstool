
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [webuser].[LatestMessage]
    @UserId INT 
AS 
	DECLARE @CompanyIds TABLE (
		id int
	)
	
	INSERT INTO @CompanyIds(id)
		SELECT CompanyId FROM webuser.UsersCompanies 
		WHERE UserId=@UserId
    
    SELECT ISNULL(usrs.FirstName + ' ' +usrs.LastName + ': ' + [message], '') AS [Message] 
    FROM [Messages]
    INNER JOIN webuser.Users usrs ON usrs.id = webuser.Messages.Writer
    WHERE [Messages].datestamp > DATEADD(d, -3, GETDATE()) 
		AND (Writer = @UserId OR ToUserId = @UserId 
			OR ToCompanyId IN (SELECT id FROM @CompanyIds) OR ToEveryone = 1)
	ORDER BY [Messages].id
GO
