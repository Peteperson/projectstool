SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [webuser].[PrjAPlist]
    @ProjectId INT 
AS 
 
	SELECT ap.[id], ap.[ProjectId], ap.[DateStamp], ap.[ActionId], ISNULL([Responsible1], 0) AS Responsible1
		, ISNULL(usr1.LastName + ' ' + usr1.FirstName, '') AS Responsible1Text
		, ISNULL([Responsible2], 0) AS Responsible2 
		, ISNULL(usr2.LastName + ' ' + usr2.FirstName, '') AS Responsible2Text
		, ap.[Description], ap.[Comments], ap.[AttachmentName], ap.[Deadline], ap.[Status], vt.Description AS StatusText 
	FROM webuser.ActionPlans ap
	LEFT JOIN webuser.Users usr1 ON ap.Responsible1 = usr1.id
	LEFT JOIN webuser.Users usr2 ON ap.Responsible2 = usr2.id
	INNER JOIN webuser.VariousTypes vt ON ap.Status = vt.id
	WHERE ([ProjectId] = @ProjectId) 
	ORDER BY [Deadline] DESC
GO
