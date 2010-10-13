SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [webuser].[ProcessesList]
    @SystemVersionId INT 
AS 
 
	SELECT t1.[id], t1.[Datestamp], t1.[SystemVersionId], t1.[Code], t1.[Description]
		, t1.[Status], t3.Description as StatusText, t1.[StatusDate], t1.[Comments] 
		, ISNULL([Responsible], 0) AS Responsible, ISNULL(t2.LastName + ' ' + t2.FirstName, '') AS ResponsibleText
	FROM webuser.Processes t1
	LEFT JOIN webuser.Users t2 ON t1.Responsible = t2.id
	LEFT JOIN webuser.VariousTypes t3 ON t1.Status = t3.id
	WHERE ([SystemVersionId] = @SystemVersionId) 
	ORDER BY [Code]
	
	
GO
