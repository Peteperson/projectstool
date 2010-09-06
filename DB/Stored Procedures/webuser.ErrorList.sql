SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [webuser].[ErrorList]
    @DateFrom DATETIME,
    @DateTo DATETIME
AS 
    SET NOCOUNT ON

	SELECT ErrorLog.id, ErrorLog.Datestamp, ErrorLog.URL, ErrorLog.IP,
			users.LastName + ' ' + users.FirstName AS UserFullName, 
			ErrorLog.ServerName, ErrorLog.Error
	FROM ErrorLog
	LEFT JOIN Users ON users.id = ErrorLog.UserId
	WHERE ErrorLog.Datestamp BETWEEN @DateFrom AND DATEADD(d, 1, @DateTo)


GO
