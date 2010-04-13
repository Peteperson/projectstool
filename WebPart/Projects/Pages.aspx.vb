
Partial Class Pages
    Inherits System.Web.UI.Page

    Protected Sub gvPages_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvPages.RowCommand
        If e.CommandName = "Insert" Then sqldsPages.Insert()
    End Sub

    Protected Sub gvPages_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvPages.RowDataBound
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

    Protected Sub sqldsPages_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsPages.Inserting
        e.Command.Parameters("@id").Value = CType(gvPages.FooterRow.FindControl("txtInsId"), TextBox).Text
        e.Command.Parameters("@Path").Value = CType(gvPages.FooterRow.FindControl("txtInsPath"), TextBox).Text
        e.Command.Parameters("@Description").Value = CType(gvPages.FooterRow.FindControl("txtInsDesc"), TextBox).Text
    End Sub
End Class
