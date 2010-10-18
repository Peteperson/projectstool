
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [webuser].[ProjectList]
    @UserId AS INT
AS 
    SET NOCOUNT ON
	
	DECLARE @UserType AS NVARCHAR(50)
	SELECT @UserType = [Description] FROM webuser.VariousTypes 
		WHERE id = (SELECT UserType FROM webuser.Users WHERE id = @UserId)

	IF @UserType = 'Consultant' 
		Begin
			SELECT id, SubProject FROM webuser.Projects 
			WHERE (Consultant1 = @UserId OR Consultant2 = @UserId OR Creator = @UserId)  
				OR CustomerId IN (SELECT Companyid FROM webuser.UsersCompanies WHERE userid = @userId)
			UNION
			SELECT Projects.id, SubProject FROM webuser.Projects 
			INNER JOIN ActionPlans ON ActionPlans.ProjectId = Projects.id
			WHERE (Responsible1 = @UserId OR Responsible2 = @UserId)
			ORDER BY SubProject
		END
	ELSE IF @UserType = 'ProjectManager' 
		BEGIN
			SELECT id, SubProject FROM webuser.Projects 
			WHERE (Consultant1 = @UserId OR Consultant2 = @UserId OR ProjectManager = @userId OR Creator = @UserId) 
				OR CustomerId IN (SELECT Companyid FROM webuser.UsersCompanies WHERE userid = @userId)
			UNION
			SELECT Projects.id, SubProject FROM webuser.Projects 
			INNER JOIN ActionPlans ON ActionPlans.ProjectId = Projects.id
			WHERE (Responsible1 = @UserId OR Responsible2 = @UserId)
			ORDER BY SubProject
		END
	ELSE IF @UserType = 'FoodDirector' 
		BEGIN
			SELECT id, SubProject FROM webuser.Projects 
			WHERE [Type] = (SELECT id FROM webuser.VariousTypes WHERE [Description] = (N'Τρόφιμα')) 
				OR CustomerId IN (SELECT Companyid FROM webuser.UsersCompanies WHERE userid = @userId)
			UNION
			SELECT Projects.id, SubProject FROM webuser.Projects 
			INNER JOIN ActionPlans ON ActionPlans.ProjectId = Projects.id
			WHERE (Responsible1 = @UserId OR Responsible2 = @UserId)
			ORDER BY SubProject
		END
	ELSE IF @UserType = 'OrgDirector' 
		BEGIN
			SELECT id, SubProject FROM webuser.Projects 
			WHERE [Type] = (SELECT id FROM webuser.VariousTypes WHERE [Description] = (N'Οργάνωση')) 
				OR CustomerId IN (SELECT Companyid FROM webuser.UsersCompanies WHERE userid = @userId)
			UNION
			SELECT Projects.id, SubProject FROM webuser.Projects 
			INNER JOIN ActionPlans ON ActionPlans.ProjectId = Projects.id
			WHERE (Responsible1 = @UserId OR Responsible2 = @UserId)  
			ORDER BY SubProject
		END
	ELSE IF @UserType = 'Admin' OR @UserType = 'DataEntry' OR @UserType = 'ITDirector'
		BEGIN
			SELECT id, SubProject FROM webuser.Projects ORDER BY SubProject
		END
	ELSE 
		BEGIN
			SELECT id, SubProject FROM webuser.Projects 
			WHERE CustomerId IN (SELECT CompanyId FROM webuser.UsersCompanies WHERE userid = @userId)
			UNION
			SELECT Projects.id, SubProject FROM webuser.Projects 
			INNER JOIN ActionPlans ON ActionPlans.ProjectId = Projects.id
			WHERE (Responsible1 = @UserId OR Responsible2 = @UserId) 
			ORDER BY SubProject
		END
GO
