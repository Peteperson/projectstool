
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [webuser].[LogList]
    @DateFrom DATETIME,
    @DateTo DATETIME
AS 
    SET NOCOUNT ON

	SELECT ActivityLog.id, ActivityLog.Datestamp, ActivityLog.URL, ActivityLog.ip,
			users.LastName + ' ' + users.FirstName + ' (' + VariousTypes.[Description] + ')' AS UserFullName, 
			 LogStatus.[Description] AS [Status], ActivityLog.BrowserName, ActivityLog.ExtraInfo
	FROM ActivityLog
	INNER JOIN Users ON users.id = ActivityLog.UserId
	INNER JOIN LogStatus ON LogStatus.id = ActivityLog.[Status]
	INNER JOIN VariousTypes ON VariousTypes.id = Users.UserType
	WHERE ActivityLog.Datestamp BETWEEN @DateFrom AND DATEADD(d, 1, @DateTo)


GO
