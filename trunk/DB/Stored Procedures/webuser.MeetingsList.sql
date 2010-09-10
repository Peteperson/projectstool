
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [webuser].[MeetingsList]
    @UserId INT,
    @SubProject NVARCHAR(15) = '',
    @MtngsId INT = 0,
	@Status INT = 0,
	@DtFrom DATETIME = '20010101',
	@DtTo DATETIME = '20991231'
AS 
    SET NOCOUNT ON
	
	DECLARE @tmp TABLE (
		id int,
		SubProject NVARCHAR(15)
	)

	INSERT INTO @tmp
	exec Projectlist @UserId
	
	SELECT [A/A] = ROW_NUMBER() OVER (ORDER BY Meetings.TimeFrom)
		  ,Meetings.[id]
		  ,Projects.id AS ProjectId
		  ,Projects.SubProject
		  ,Companies.Name AS Customer
		  ,Meetings.TimeFrom AS [Date]
		  ,Meetings.TimeFrom AS [From]
		  ,Meetings.TimeTo AS [To]
		  ,vt1.[Description] AS Kind
		  ,Meetings.[Subject]
		  ,Users.LastName + ' ' + users.FirstName AS Consultant
		  ,Meetings.Comments
		  ,Meetings.NewBusiness
		  ,Meetings.AttachmentName AS [File]
		  ,vt2.[Description] AS [Status]
		  ,Meetings.[Status] AS StatusNo
	FROM Meetings
	INNER JOIN Projects ON Meetings.ProjectId = Projects.id
	INNER JOIN @tmp t1 ON t1.id = Projects.id
	INNER JOIN Companies ON Companies.id = Projects.CustomerId
	INNER JOIN Users ON users.id = Meetings.Consultant
	INNER JOIN VariousTypes vt1 ON vt1.id = Meetings.Kind
	INNER JOIN VariousTypes vt2 ON vt2.id = Meetings.[Status]
	WHERE Projects.SubProject LIKE ('%'+ @SubProject +'%') AND (Meetings.Id = @MtngsId OR @MtngsId=0) AND (Meetings.Status = @Status OR @Status = 0)
		AND Meetings.TimeFrom BETWEEN @DtFrom AND @DtTo
	ORDER BY Meetings.TimeFrom DESC 
GO
