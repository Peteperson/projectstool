
Partial Class ProjectList
    Inherits System.Web.UI.Page

    Protected Sub gvProjects_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvProjects.RowCommand
        Select Case e.CommandName
            Case "SelSubProject"
                Session("ProjectId") = e.CommandArgument
                Response.Clear()
                Response.Redirect("~/Projects.aspx")
            Case "SelCompany"
                Response.Clear()
                Response.Redirect("~/Companies.aspx?Company=" & e.CommandArgument)
        End Select
    End Sub

    Protected Sub sqldsProjects_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles sqldsProjects.Selecting
        If txtPrjId.Text = "" Then
            Dim DeleteParam As System.Data.Common.DbParameter
            DeleteParam = e.Command.Parameters("@SubProject")
            e.Command.Parameters.Remove(DeleteParam)
        End If
    End Sub

    Protected Sub btnClearFilter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClearFilter.Click
        rblStatus.SelectedIndex = -1
    End Sub
End Class
