
Partial Class ChangePass
    Inherits System.Web.UI.Page

    Protected Sub btnChangePass_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnChangePass.Click
        Dim msg As String = ""
        If txtOldPass.Text = txtNewPass.Text Then
            msg = "Ο νέος κωδικός πρέπει να είναι διαφορετικός από τον παλιό."
            txtNewPass.Focus()
        ElseIf txtNewPass.Text <> txtReNewPass.Text Then
            msg = "Τα πεδία που αφορούν στο 'Νέο κωδικό' δεν είναι ίδια."
            txtReNewPass.Focus()
        Else
            Dim OldPassword = SecCrypto.Hash(txtOldPass.Text)
            Dim NewPassword = SecCrypto.Hash(txtNewPass.Text)
            Dim res As CngPassResult = Database.ChangePassword(Session("UserId"), OldPassword, NewPassword)
            Select Case res
                Case CngPassResult.Success
                    msg = "Ο κωδικός σας άλλαξε επιτυχώς"
                Case CngPassResult.WrongOldPass
                    msg = "Ο προηγούμενος κωδικός είναι λανθασμένος"
                    txtOldPass.Focus()
                Case CngPassResult.OtherError
                    msg = "Error..."
            End Select
        End If

        With CType(Master.FindControl("lblMessage"), Label)
            .Visible = True
            .Text = msg
            .ForeColor = Drawing.Color.LightGreen
        End With
    End Sub

    Protected Sub pnl1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles pnl1.Load
        If Not IsPostBack Then
            txtOldPass.Text = ""
            txtOldPass.Focus()
        End If
    End Sub
End Class
