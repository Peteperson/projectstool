
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
        If txtPrjId.Text = "" Then e.Command.Parameters.Remove(e.Command.Parameters("@SubProject"))
        If txtTitle.Text = "" Then e.Command.Parameters.Remove(e.Command.Parameters("@Title"))
    End Sub

    Protected Sub btnClearFilter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClearFilter.Click
        rblStatus.SelectedIndex = -1
        txtPrjId.Text = ""
        txtTitle.Text = ""
    End Sub

    Protected Sub btnRemovePaging1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnRemovePaging1.Click
        gvProjects.AllowPaging = Not gvProjects.AllowPaging
    End Sub

    Protected Sub btnPrint_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnPrint.Click
        CType(Me.Master, Main).HideAndPrint()
    End Sub
End Class
