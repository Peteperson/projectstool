
Partial Class Messages
    Inherits System.Web.UI.Page

    Protected Sub gvMessages_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvMessages.RowCommand
        Select Case e.CommandName
            Case "Insert"
                sqldsMessages.Insert()
        End Select
    End Sub

    Protected Sub sqldsMessages_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsMessages.Inserting
        If gvMessages.Rows.Count > 0 Then
            e.Command.Parameters("@Writer").Value = Session("UserId")
            e.Command.Parameters("@Message").Value = CType(gvMessages.FooterRow.FindControl("txtMessage"), TextBox).Text
            e.Command.Parameters("@ToUserId").Value = CType(gvMessages.FooterRow.FindControl("ddlUsers"), DropDownList).SelectedValue
            e.Command.Parameters("@ToCompanyId").Value = CType(gvMessages.FooterRow.FindControl("ddlCompanies"), DropDownList).SelectedValue
            e.Command.Parameters("@ToEveryone").Value = CType(gvMessages.FooterRow.FindControl("cbAll"), CheckBox).Checked
        Else
            e.Command.Parameters("@Writer").Value = Session("UserId")
            e.Command.Parameters("@Message").Value = CType(gvMessages.Controls(0).Controls(0).Controls(0).FindControl("txtMessage"), TextBox).Text
            e.Command.Parameters("@ToUserId").Value = CType(gvMessages.Controls(0).Controls(0).Controls(0).FindControl("ddlUsers"), DropDownList).SelectedValue
            e.Command.Parameters("@ToCompanyId").Value = CType(gvMessages.Controls(0).Controls(0).Controls(0).FindControl("ddlCompanies"), DropDownList).SelectedValue
            e.Command.Parameters("@ToEveryone").Value = CType(gvMessages.Controls(0).Controls(0).Controls(0).FindControl("cbAll"), CheckBox).Checked
        End If
    End Sub
End Class
