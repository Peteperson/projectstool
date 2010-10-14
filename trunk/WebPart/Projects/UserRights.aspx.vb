
Partial Class UserRights
    Inherits System.Web.UI.Page

    Protected Sub gvRights_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvRights.RowCommand
        If e.CommandName = "Insert" Then sqldsRights.Insert()
    End Sub

    Protected Sub gvRights_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvRights.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            If e.Row.RowState = DataControlRowState.Normal Or e.Row.RowState = DataControlRowState.Alternate Then
                For Each ctrl As System.Web.UI.Control In e.Row.Cells(0).Controls
                    Try
                        If ctrl.GetType Is GetType(ImageButton) Then
                            If CType(ctrl, ImageButton).ImageUrl.IndexOf("Remove") > 0 Then
                                CType(ctrl, ImageButton).Attributes("onclick") = "if(!confirm('Να διαγράψω την εγγραφή;'))return   false;"
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

    Protected Sub sqldsRights_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsRights.Inserting
        e.Command.Parameters("@UserType").Value = CType(gvRights.FooterRow.FindControl("ddlInsUserType"), DropDownList).SelectedValue
        e.Command.Parameters("@PageId").Value = CType(gvRights.FooterRow.FindControl("ddlInsPages"), DropDownList).SelectedValue
        e.Command.Parameters("@Description").Value = CType(gvRights.FooterRow.FindControl("txtInsDesc"), TextBox).Text
        e.Command.Parameters("@Ordering").Value = CType(gvRights.FooterRow.FindControl("txtInsOrd"), TextBox).Text
    End Sub

    Protected Sub btnRemovePaging_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnRemovePaging.Click
        gvRights.AllowPaging = Not gvRights.AllowPaging
    End Sub

    Protected Sub btnPrint_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnPrint.Click
        CType(Me.Master, Main).HideAndPrint()
    End Sub
End Class
