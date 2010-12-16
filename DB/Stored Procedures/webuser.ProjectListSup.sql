SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [webuser].[ProjectListSup]
    @UserId AS INT
AS 
	SELECT Projects.id, SubProject FROM webuser.Projects 
	INNER JOIN ActionPlans ON ActionPlans.ProjectId = Projects.id
	WHERE (Responsible1 = @UserId OR Responsible2 = @UserId) 
	ORDER BY SubProject
GO
