
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
            Case "UpdStatus"
                UpdateStatus()
                gvProjects.DataBind()
            Case "CheckAll"
                CheckAllRecords()
        End Select
    End Sub

    Private Sub CheckAllRecords()
        For i As Integer = 0 To gvProjects.Rows.Count - 1
            With CType(gvProjects.Rows(i).FindControl("chkSelected"), CheckBox)
                .Checked = Not .Checked
            End With
        Next
    End Sub

    Private Sub UpdateStatus()
        ddlValue = CType(gvProjects.FooterRow.FindControl("ddlPrjStatus"), DropDownList).SelectedValue
        For i As Integer = 0 To gvProjects.Rows.Count - 1
            If CType(gvProjects.Rows(i).FindControl("chkSelected"), CheckBox).Checked Then
                ddlId = CType(gvProjects.Rows(i).FindControl("lblId"), Label).Text
                sqldsPrjStatus.Update()
            End If
        Next
    End Sub

    Protected Sub sqldsProjects_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles sqldsProjects.Selecting
        With e.Command
            If txtPrjId.Text = "" Then .Parameters.Remove(.Parameters("@SubProject"))
            If txtTitle.Text = "" Then .Parameters.Remove(.Parameters("@Title"))
            If dbFrom.Text = Nothing Then .Parameters.Remove(.Parameters("@dtFrom"))
            If dbTo.Text = Nothing Then .Parameters.Remove(.Parameters("@dtTo"))
        End With
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

    Protected Sub btnFindPrj_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnFindPrj.Click
        gvProjects.DataBind()
    End Sub

    Private ddlValue As Int16
    Private ddlId As Int16

    Protected Sub ddlPrjStatusOne_IndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        With CType(sender, DropDownList)
            ddlId = .ToolTip
            ddlValue = .SelectedValue
        End With
        sqldsPrjStatus.Update()
        gvProjects.DataBind()
    End Sub

    Protected Sub sqldsPrjStatus_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsPrjStatus.Updating
        e.Command.Parameters("@Status").Value = ddlValue
        e.Command.Parameters("@id").Value = ddlId
    End Sub
End Class
