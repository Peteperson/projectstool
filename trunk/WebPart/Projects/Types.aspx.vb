
Partial Class Types
    Inherits System.Web.UI.Page

    Protected Sub gvTypes_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvTypes.DataBound
        CType(gvTypes.HeaderRow.FindControl("txtHeadCatFilter"), TextBox).Text = txtCatFilter.Text
    End Sub

    Protected Sub gvTypes_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvTypes.RowCommand
        If e.CommandName = "Insert" Then sqldsTypes.Insert()
        If e.CommandName = "Filter" Then txtCatFilter.Text = CType(gvTypes.HeaderRow.FindControl("txtHeadCatFilter"), TextBox).Text
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

    Protected Sub sqldsTypes_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles sqldsTypes.Selecting
        If txtCatFilter.Text = "" Then e.Command.Parameters("@CatName").Value = System.DBNull.Value
    End Sub

    Protected Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        txtCatFilter.Text = ""
    End Sub

    Protected Sub btnRemovePaging_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnRemovePaging.Click
        gvTypes.AllowPaging = Not gvTypes.AllowPaging
    End Sub

    Protected Sub btnPrint_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnPrint.Click
        CType(Me.Master, Main).HideAndPrint()
    End Sub
End Class
