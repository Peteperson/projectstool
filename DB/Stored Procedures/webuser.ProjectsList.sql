
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [webuser].[ProjectsList]
    @UserId INT,    
    @SubProject NVARCHAR(15) = '',
    @Title NVARCHAR(50) = '', 
	@Status INT = 0,
	@DtFrom DATETIME = '20010101',
	@DtTo DATETIME = '20991231'
AS 
    SET NOCOUNT ON
	
	DECLARE @tmp TABLE (
		id INT,
		SubProject NVARCHAR(15)
	)

	INSERT INTO @tmp
	EXEC Projectlist @UserId
	
	SELECT [A/A] = ROW_NUMBER() OVER (ORDER BY prj.InitialEndDate), prj.id AS ProjectId
		, prj.Code, prj.SubProject, prj.Title
		, Companies.[Name] as Customer
		, usr1.Lastname + ' ' + usr1.firstName AS ProjectManager
		, usr2.Lastname + ' ' + usr2.firstName AS Consultant
		, prj.InitialEndDate, prj.CompletionPercentage, prj.EndDate, prj.[type]
		, vt.[Description] AS [Status]
		,prj.[Status] AS StatusNo
	FROM Projects prj
	INNER JOIN @tmp t1 ON t1.id = prj.id
	INNER JOIN users usr1 ON usr1.id = prj.ProjectManager
	INNER JOIN users usr2 ON usr2.id = prj.Consultant1
	INNER JOIN VariousTypes vt ON vt.id = prj.[Status]
	INNER JOIN Companies on Companies.id = prj.CustomerId
	WHERE prj.SubProject LIKE ('%'+ @SubProject +'%') AND (prj.Status = @Status OR @Status = 0)
		AND prj.Title LIKE ('%'+ @Title +'%') AND prj.EndDate BETWEEN @DtFrom AND @DtTo
	ORDER BY prj.InitialEndDate DESC 
GO
