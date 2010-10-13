SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [webuser].[PrjMeetlist]
    @ProjectId INT 
AS 
 
	SELECT mt.[id], mt.[Datestamp], mt.[ProjectId], mt.[TimeFrom], mt.[TimeTo], mt.[Kind]
		, mt.[Subject], mt.[Consultant], mt.[Comments], mt.[NewBusiness], mt.[AttachmentName], mt.[Status] 
		, vt.Description AS StatusText, usr.LastName + ' ' + usr.FirstName AS ConsultantText
	FROM webuser.Meetings mt
	INNER JOIN webuser.VariousTypes vt ON mt.Status = vt.id
	INNER JOIN webuser.Users usr ON mt.Consultant = usr.id
	WHERE (mt.[ProjectId] = @ProjectId) 
	ORDER BY mt.[TimeFrom] DESC
GO
