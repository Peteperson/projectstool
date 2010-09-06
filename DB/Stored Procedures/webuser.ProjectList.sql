SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [webuser].[ProjectList]
    @UserId AS INT
AS 
    SET NOCOUNT ON
	
	DECLARE @UserType AS NVARCHAR(50)
	SELECT @UserType = [Description] FROM VariousTypes WHERE id = (SELECT UserType FROM Users WHERE id = @UserId)

	IF @UserType = 'Consultant' 
		Begin
			SELECT id, SubProject FROM Projects 
			WHERE (Consultant1 = @UserId OR Consultant2 = @UserId OR Creator = @UserId) 
			UNION
			SELECT Projects.id, SubProject FROM Projects 
			INNER JOIN ActionPlans ON ActionPlans.ProjectId = Projects.id
			WHERE (Responsible1 = @UserId OR Responsible2 = @UserId) 
			ORDER BY SubProject
		END
	ELSE IF @UserType = 'ProjectManager' 
		BEGIN
			SELECT id, SubProject FROM Projects 
			WHERE (Consultant1 = @UserId OR Consultant2 = @UserId OR ProjectManager = @userId OR Creator = @UserId)
			UNION
			SELECT Projects.id, SubProject FROM Projects 
			INNER JOIN ActionPlans ON ActionPlans.ProjectId = Projects.id
			WHERE (Responsible1 = @UserId OR Responsible2 = @UserId) 
			ORDER BY SubProject
		END
	ELSE IF @UserType = 'FoodDirector' 
		BEGIN
			SELECT id, SubProject FROM Projects 
			WHERE [Type] = (SELECT id FROM VariousTypes WHERE [Description] = (N'Τρόφιμα'))
			UNION
			SELECT Projects.id, SubProject FROM Projects 
			INNER JOIN ActionPlans ON ActionPlans.ProjectId = Projects.id
			WHERE (Responsible1 = @UserId OR Responsible2 = @UserId) 
			ORDER BY SubProject
		END
	ELSE IF @UserType = 'OrgDirector' 
		BEGIN
			SELECT id, SubProject FROM Projects 
			WHERE [Type] = (SELECT id FROM VariousTypes WHERE [Description] = (N'Οργάνωση'))
			UNION
			SELECT Projects.id, SubProject FROM Projects 
			INNER JOIN ActionPlans ON ActionPlans.ProjectId = Projects.id
			WHERE (Responsible1 = @UserId OR Responsible2 = @UserId) 
			ORDER BY SubProject
		END
	ELSE IF @UserType = 'Admin' OR @UserType = 'DataEntry' OR @UserType = 'ITDirector'
		BEGIN
			SELECT id, SubProject FROM Projects ORDER BY SubProject
		END
	ELSE 
		BEGIN
			SELECT id, SubProject FROM Projects 
			WHERE CustomerId = (SELECT Company FROM Users WHERE id = @userId)
			UNION
			SELECT Projects.id, SubProject FROM Projects 
			INNER JOIN ActionPlans ON ActionPlans.ProjectId = Projects.id
			WHERE (Responsible1 = @UserId OR Responsible2 = @UserId) 
			ORDER BY SubProject
		END
GO
