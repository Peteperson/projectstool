
Partial Class Users
    Inherits System.Web.UI.Page

    Private Password As String

    Protected Sub gvUsers_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvUsers.DataBound
        CType(gvUsers.HeaderRow.FindControl("txtHeadUsrFilter"), TextBox).Text = txtUNameFilter.Text
    End Sub
    Protected Sub gvUsers_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvUsers.RowCommand
        Select Case e.CommandName
            Case "Insert"
                sqldsUsers.Insert()
            Case "Filter"
                txtUNameFilter.Text = CType(gvUsers.HeaderRow.FindControl("txtHeadUsrFilter"), TextBox).Text
        End Select
    End Sub

    Protected Sub sqldsUsers_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles sqldsUsers.Inserted
        With CType(Master.FindControl("lblMessage"), Label)
            .Visible = True
            .Text = "New user's password: " & Password
        End With
    End Sub

    Protected Sub sqldsUser_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsUsers.Inserting
        Password = SecCrypto.GeneratePassword(8)
        e.Command.Parameters("@UserName").Value = CType(gvUsers.FooterRow.FindControl("txtInsUserName"), TextBox).Text
        e.Command.Parameters("@Password").Value = SecCrypto.Hash(Password)
        e.Command.Parameters("@Company").Value = CType(gvUsers.FooterRow.FindControl("ddlCompanies"), DropDownList).SelectedValue
        e.Command.Parameters("@Position").Value = CType(gvUsers.FooterRow.FindControl("ddlPosition"), DropDownList).SelectedValue
        e.Command.Parameters("@UserType").Value = CType(gvUsers.FooterRow.FindControl("ddlInsUserType"), DropDownList).SelectedValue
        e.Command.Parameters("@FirstName").Value = CType(gvUsers.FooterRow.FindControl("txtInsFirstName"), TextBox).Text
        e.Command.Parameters("@LastName").Value = CType(gvUsers.FooterRow.FindControl("txtInsLastName"), TextBox).Text
        e.Command.Parameters("@Telephone").Value = CType(gvUsers.FooterRow.FindControl("txtInsTelephone"), TextBox).Text
        e.Command.Parameters("@Mobile").Value = CType(gvUsers.FooterRow.FindControl("txtInsMobile"), TextBox).Text
        e.Command.Parameters("@Email").Value = CType(gvUsers.FooterRow.FindControl("txtInsEmail"), TextBox).Text
        e.Command.Parameters("@DefaultPage").Value = CType(gvUsers.FooterRow.FindControl("ddlInsDefPage"), DropDownList).SelectedValue
        e.Command.Parameters("@IsUser").Value = CType(gvUsers.FooterRow.FindControl("chkIsUser"), CheckBox).Checked
    End Sub

    Protected Sub sqldsUsers_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles sqldsUsers.Selecting
        If txtUNameFilter.Text = "" Then e.Command.Parameters("@UserName").Value = System.DBNull.Value
    End Sub
End Class
