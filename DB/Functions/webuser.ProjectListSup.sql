
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [webuser].[ProjectListSup]
(	
	@UserId AS INT
)
RETURNS @RtnValue table (
	Id INT,
	SubProject NVARCHAR(15) COLLATE SQL_Latin1_General_CP1_CI_AS, 
	Title NVARCHAR(50) COLLATE SQL_Latin1_General_CP1_CI_AS
)
AS
BEGIN
	INSERT INTO @RtnValue
		SELECT DISTINCT Projects.id, SubProject, Title FROM webuser.Projects 
		INNER JOIN ActionPlans ON ActionPlans.ProjectId = Projects.id
		WHERE (Responsible1 = @UserId OR Responsible2 = @UserId) 		
    RETURN
END
GO
