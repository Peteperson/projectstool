
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [webuser].[FileList]
    @UserId INT,
    @SubProject NVARCHAR(15) = ''     
AS 
    SET NOCOUNT ON

	DECLARE @tmp TABLE (
		id int,
		SubProject NVARCHAR(15), 
		Title NVARCHAR(50)
	)

	INSERT INTO @tmp
	exec Projectlist @UserId

	SELECT [A/A] = ROW_NUMBER() OVER (ORDER BY ProjectFiles.id)
		  ,ProjectFiles.[id]
		  ,Projects.id AS ProjectId
		  ,ProjectFiles.Datestamp
		  ,Projects.SubProject
		  ,ProjectFiles.AttachmentName AS [File]
		  ,ProjectFiles.Comments
	FROM ProjectFiles
	INNER JOIN Projects ON ProjectFiles.ProjectId = Projects.id
	INNER JOIN @tmp t1 ON t1.id = projects.id
	WHERE Projects.SubProject LIKE ('%'+ @SubProject +'%')
	ORDER BY ProjectFiles.id


GO
