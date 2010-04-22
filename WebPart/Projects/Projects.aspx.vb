
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
                gvAP.DataBind()
                gvMeetings.Visible = False
                gvFiles.Visible = False
            Case 1
                gvAP.Visible = False
                gvMeetings.Visible = True
                gvMeetings.DataBind()
                gvFiles.Visible = False
            Case 2
                gvAP.Visible = False
                gvMeetings.Visible = False
                gvFiles.Visible = True
                gvFiles.DataBind()
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
        Select Case e.CommandName
            Case "Insert"
                sqldsAttachments.Insert()
                gvFiles.DataBind()
            Case "Download"
                Session("DownloadFileId") = e.CommandArgument
                Response.Clear()
                Response.Redirect("~/DownloadFile.ashx")
        End Select
        ShowTab(2)
    End Sub

    Protected Sub sqldsAttachments_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsAttachments.Inserting
        If gvFiles.Rows.Count > 0 Then
            e.Command.Parameters("@ProjectId").Value = ddlPrjCode.SelectedValue
            e.Command.Parameters("@FileName").Value = CType(gvFiles.FooterRow.FindControl("fuCtrl"), FileUpload).FileName
            e.Command.Parameters("@FileData").Value = CType(gvFiles.FooterRow.FindControl("fuCtrl"), FileUpload).FileBytes
        Else
            e.Command.Parameters("@ProjectId").Value = ddlPrjCode.SelectedValue
            e.Command.Parameters("@FileName").Value = CType(gvFiles.Controls(0).Controls(0).Controls(0).FindControl("fuCtrl"), FileUpload).FileName
            e.Command.Parameters("@FileData").Value = CType(gvFiles.Controls(0).Controls(0).Controls(0).FindControl("fuCtrl"), FileUpload).FileBytes
        End If
    End Sub
End Class
