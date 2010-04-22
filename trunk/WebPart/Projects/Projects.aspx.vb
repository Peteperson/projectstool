
Partial Class Projects
    Inherits System.Web.UI.Page

    Protected Sub mnuProjects_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles mnuProjects.MenuItemClick
        'For i As Integer = 0 To mnuProjects.Items.Count - 1
        '    If i = e.Item.Value Then
        '        mnuProjects.Items(i).ImageUrl = mnuProjects.Items(i).ImageUrl
        '    Else
        '        mnuProjects.Items(i).ImageUrl = ""
        '    End If
        'Next
        ShowTab(e.Item.Value)
    End Sub

    Private Sub ShowTab(ByVal TabId As Byte)
        Select Case TabId
            Case 0
                gvAP.Visible = True
                gvMeetings.Visible = False
                gvFiles.Visible = False
            Case 1
                gvAP.Visible = False
                gvMeetings.Visible = True
                gvFiles.Visible = False
            Case 2
                gvAP.Visible = False
                gvMeetings.Visible = False
                gvFiles.Visible = True
        End Select
    End Sub

    Protected Sub btnFindPrj_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnFindPrj.Click
        If Not (ddlPrjCode.Items.FindByValue(txtPrjId.Text)) Is Nothing Then
            ddlPrjCode.SelectedValue = txtPrjId.Text
        Else
            With CType(Master.FindControl("lblMessage"), Label)
                .Visible = True
                .Text = "The project does not exist!"
            End With
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        gvAP.Visible = True
        gvMeetings.Visible = False
        gvFiles.Visible = False
    End Sub

    Protected Sub gvFiles_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvFiles.RowCommand
        If e.CommandName = "Insert" Then sqldsAttachments.Insert()
        'sqldsAttachments.Select(DataSourceSelectArguments.Empty)
        gvFiles.DataBind()
        ShowTab(2)
    End Sub

    Protected Sub sqldsAttachments_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsAttachments.Inserting
        e.Command.Parameters("@ProjectId").Value = ddlPrjCode.SelectedValue
        e.Command.Parameters("@FileName").Value = CType(gvFiles.FooterRow.FindControl("fuCtrl"), FileUpload).FileName
        e.Command.Parameters("@FileData").Value = CType(gvFiles.FooterRow.FindControl("fuCtrl"), FileUpload).FileBytes
    End Sub
End Class
