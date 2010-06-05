
Partial Class ChangePass
    Inherits System.Web.UI.Page

    Protected Sub btnChangePass_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnChangePass.Click
        Dim msg As String = ""
        If txtOldPass.Text = txtNewPass.Text Then
            msg = "The new password must be different than the old one"
        ElseIf txtNewPass.Text <> txtReNewPass.Text Then
            msg = "The 'New password' fields are not identical"
        Else
            Dim OldPassword = SecCrypto.Hash(txtOldPass.Text)
            Dim NewPassword = SecCrypto.Hash(txtNewPass.Text)
            Dim res As CngPassResult = Database.ChangePassword(Session("UserId"), OldPassword, NewPassword)
            Select Case res
                Case CngPassResult.Success
                    msg = "You have successfully changed your password"
                Case CngPassResult.WrongOldPass
                    msg = "Invalid old password"
                Case CngPassResult.WrongOldPass
                    msg = "Other error..."
            End Select
        End If

        With CType(Master.FindControl("lblMessage"), Label)
            .Visible = True
            .Text = msg
        End With
    End Sub

    Protected Sub pnl1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles pnl1.Load
        txtOldPass.Text = ""
    End Sub
End Class
