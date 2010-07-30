
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

    Protected Sub gvMessages_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvMessages.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            If e.Row.RowState = DataControlRowState.Normal Or e.Row.RowState = DataControlRowState.Alternate Then
                For Each ctrl As System.Web.UI.Control In e.Row.Cells(0).Controls
                    Try
                        If ctrl.GetType Is GetType(ImageButton) Then
                            If CType(ctrl, ImageButton).ImageUrl.IndexOf("Remove") > 0 Then
                                CType(ctrl, ImageButton).Attributes("onclick") = "if(!confirm('Really delete this row?'))return   false;"
                            End If
                        End If
                    Catch ex As Exception
                        With CType(Master.FindControl("lblMessage"), Label)
                            .Visible = True
                            .Text = ex.Message
                        End With
                    End Try
                Next
            End If
        End If
    End Sub
End Class
