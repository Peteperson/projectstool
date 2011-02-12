
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [webuser].[ActionPlanList]
    @UserId INT,
    @SubProject NVARCHAR(15) = '',
    @APId INT = 0,
	@Status NVARCHAR(1000) = '',
	@DtFrom DATETIME = '20010101',
	@DtTo DATETIME = '20991231',
	@UserIdFilter INT = 0
AS 
    SET NOCOUNT ON

	DECLARE @tmp TABLE (
		id int,
		SubProject NVARCHAR(15), 
		Title NVARCHAR(50)
	)

	INSERT INTO @tmp
	exec webuser.Projectlist @UserId

	SELECT [A/A] = ROW_NUMBER() OVER (ORDER BY ActionPlans.[Deadline] DESC)
		  ,ActionPlans.[id]
		  ,Projects.id AS ProjectId
		  ,Projects.SubProject
		  ,Companies.Name AS Customer
		  ,ActionPlans.[DateStamp]
		  ,vt1.[Description] AS ActionType
		  ,usr1.LastName + ' ' + usr1.FirstName AS Responsible1
		  ,usr2.LastName + ' ' + usr2.FirstName AS Responsible2
		  ,ActionPlans.Description
		  ,ActionPlans.[AttachmentName]
		  ,ActionPlans.[Deadline]
		  ,vt2.[Description] AS [Status]
		  ,ActionPlans.[Status] AS StatusNo
	FROM [ActionPlans] 
	INNER JOIN Projects ON ActionPlans.ProjectId = Projects.id
	INNER JOIN @tmp t1 ON t1.id = projects.id
	INNER JOIN Companies ON Companies.id = Projects.CustomerId
	LEFT  JOIN VariousTypes vt1 ON vt1.id = ActionPlans.ActionId
	INNER JOIN VariousTypes vt2 ON vt2.id = ActionPlans.[Status]
	LEFT  JOIN Users usr1 ON usr1.[id] = ActionPlans.Responsible1
	LEFT  JOIN Users usr2 ON usr2.[id] = ActionPlans.Responsible2
	WHERE Projects.SubProject LIKE ('%'+ @SubProject +'%') AND (ActionPlans.Id = @APId OR @APId=0) 
			AND (ActionPlans.Status IN (SELECT VALUE FROM webuser.SplitDelimitedStr(@Status, '|')) OR @Status = '')
			AND Deadline BETWEEN @DtFrom AND @DtTo AND (ActionPlans.Responsible1 = @UserIdFilter OR @UserIdFilter = 0)
	ORDER BY ActionPlans.Deadline DESC

GO
