
Partial Class Types
    Inherits System.Web.UI.Page

    Protected Sub gvTypes_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvTypes.RowCommand
        If e.CommandName = "Insert" Then sqldsTypes.Insert()
    End Sub

    Protected Sub gvTypes_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvTypes.RowDataBound
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

    Protected Sub sqldsTypes_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsTypes.Inserting
        e.Command.Parameters("@Category").Value = CType(gvTypes.FooterRow.FindControl("txtInsCategory"), TextBox).Text
        e.Command.Parameters("@Description").Value = CType(gvTypes.FooterRow.FindControl("txtInsDesc"), TextBox).Text
    End Sub

End Class
