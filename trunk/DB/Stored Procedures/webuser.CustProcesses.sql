SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [webuser].[CustProcesses]
    @ProjectId AS INT
AS 
    SET NOCOUNT ON

	DECLARE @CurVersion	AS INT
	SELECT @CurVersion=MAX(VersionNo) FROM SystemVersion WHERE ProjectId = @ProjectId
	
	SELECT [Processes].[id], [Processes].[Datestamp], [SystemVersionId], [Processes].[Code]
		, [Processes].[Description], VariousTypes.[Description] AS [Status], [StatusDate]
		, users.LastName + ' ' + users.FirstName AS Responsible, [Processes].[Comments] 
	FROM [Processes] 
	INNER JOIN SystemVersion ON SystemVersion.id = Processes.SystemVersionId
	INNER JOIN Projects ON Projects.id = SystemVersion.ProjectId
	INNER JOIN VariousTypes ON Processes.[Status] = VariousTypes.id
	LEFT JOIN Users ON users.id = Processes.Responsible
	WHERE (Projects.id = @ProjectId) AND SystemVersion.VersionNo = @CurVersion
	ORDER BY [Code]
	
GO
