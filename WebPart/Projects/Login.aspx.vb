Partial Class Login
    Inherits System.Web.UI.Page

    Protected Sub ctrlLogin_Authenticate(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.AuthenticateEventArgs) Handles ctrlLogin.Authenticate
        Dim username = ctrlLogin.UserName
        Dim passwordText As String = ctrlLogin.Password
        Dim password = SecCrypto.Hash(passwordText)

        e.Authenticated = False
        Dim lr As LgnResult
        Try
            lr = Database.DoLogin(username, password, Request.UserHostAddress)
        Catch ex As Exception
            ctrlLogin.FailureText = ex.Message
            Exit Sub
        End Try
        Select Case lr.Status
            Case LoginResultStatus.Success ', LoginResultStatus.PasswordExpired, LoginResultStatus.ChangePassword
                Session.Add("UserId", lr.Id)
                Session.Add("LastLogin", lr.LastLogin)
                Session.Add("UserFullName", lr.UserFullName)
                Session.Add("UserName", lr.UserName)
                Session.Add("UserType", lr.UserType)
                e.Authenticated = True
                Response.Redirect(lr.DefPage) 'FormsAuthentication.GetRedirectUrl(username, False)
            Case LoginResultStatus.InvalidCredentials
                ctrlLogin.FailureText = "Invalid Credentials"
                'Case LoginResultStatus.LockedUser, LoginResultStatus.AlreadyLoggedIn
                '    ctrlLogin.FailureText = "User is locked"
                'Case LoginResultStatus.ExpiredUser
                '    ctrlLogin.FailureText = "Expired user"
            Case Else
                ctrlLogin.FailureText = "Unknown result. Contact your system administrator"
        End Select
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ctrlLogin.Focus()
    End Sub

    Protected Sub btnResetMail_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim res As ChkEmailResult = Database.CheckEmail(CType(ctrlLogin.FindControl("txtemail"), TextBox).Text)
        If res.UserId > 0 Then
            Response.Redirect("~ResetPassword.aspx?UserId=" & res.UserId)
        End If
    End Sub
End Class
