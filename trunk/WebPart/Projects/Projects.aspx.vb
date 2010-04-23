
Partial Class Projects
    Inherits System.Web.UI.Page

    Protected Sub mnuProjects_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles mnuProjects.MenuItemClick
        Dim SelImages() As String = {"~/Images/ActionPlanSelected.png", "~/Images/MeetingsSelected.png", "~/Images/AttachmentsSelected.png"}
        Dim UnselImages() As String = {"~/Images/ActionPlanUnselected.png", "~/Images/MeetingsUnselected.png", "~/Images/AttachmentsUnselected.png"}
        For i As Integer = 0 To mnuProjects.Items.Count - 1
            If i = e.Item.Value Then
                mnuProjects.Items(i).ImageUrl = SelImages(i)
            Else
                mnuProjects.Items(i).ImageUrl = UnselImages(i)
            End If
        Next
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

    Protected Sub sqldsProjects_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsProjects.Updating
        e.Command.Parameters("@ModificationDate").Value = Now
    End Sub

    Protected Sub sqldsAP_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsAP.Inserting
        If gvAP.Rows.Count > 0 Then
            e.Command.Parameters("@ProjectId").Value = ddlPrjCode.SelectedValue
            e.Command.Parameters("@ActionId").Value = CType(gvAP.FooterRow.FindControl("ddlActionType"), DropDownList).SelectedValue
            e.Command.Parameters("@Responsible1").Value = CType(gvAP.FooterRow.FindControl("ddlResp1"), DropDownList).SelectedValue
            e.Command.Parameters("@Responsible2").Value = CType(gvAP.FooterRow.FindControl("ddlResp2"), DropDownList).SelectedValue
            e.Command.Parameters("@Comments").Value = CType(gvAP.FooterRow.FindControl("txtAPcomments"), TextBox).Text
            e.Command.Parameters("@AttachmentName").Value = CType(gvAP.FooterRow.FindControl("fuAP"), FileUpload).FileName
            e.Command.Parameters("@Attachment").Value = CType(gvAP.FooterRow.FindControl("fuAP"), FileUpload).FileBytes
            e.Command.Parameters("@Deadline").Value = CType(gvAP.FooterRow.FindControl("txtAPdead"), TextBox).Text
            e.Command.Parameters("@Status").Value = CType(gvAP.FooterRow.FindControl("ddlActionStatus"), DropDownList).SelectedValue
        Else
            e.Command.Parameters("@ProjectId").Value = ddlPrjCode.SelectedValue
            e.Command.Parameters("@ActionId").Value = CType(gvAP.Controls(0).Controls(0).Controls(0).FindControl("ddlActionType"), DropDownList).SelectedValue
            e.Command.Parameters("@Responsible1").Value = CType(gvAP.Controls(0).Controls(0).Controls(0).FindControl("ddlResp1"), DropDownList).SelectedValue
            e.Command.Parameters("@Responsible2").Value = CType(gvAP.Controls(0).Controls(0).Controls(0).FindControl("ddlResp2"), DropDownList).SelectedValue
            e.Command.Parameters("@Comments").Value = CType(gvAP.Controls(0).Controls(0).Controls(0).FindControl("txtAPcomments"), TextBox).Text
            e.Command.Parameters("@AttachmentName").Value = CType(gvAP.Controls(0).Controls(0).Controls(0).FindControl("fuAP"), FileUpload).FileName
            e.Command.Parameters("@Attachment").Value = CType(gvAP.Controls(0).Controls(0).Controls(0).FindControl("fuAP"), FileUpload).FileBytes
            e.Command.Parameters("@Deadline").Value = CType(gvAP.Controls(0).Controls(0).Controls(0).FindControl("txtAPdead"), TextBox).Text
            e.Command.Parameters("@Status").Value = CType(gvAP.Controls(0).Controls(0).Controls(0).FindControl("ddlActionStatus"), DropDownList).SelectedValue
        End If
    End Sub

    Protected Sub sqldsAP_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsAP.Updating
        'e.Command.Parameters("@Attachment").Value = System.DBNull.Value
    End Sub

    Protected Sub gvAP_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvAP.RowCommand
        Select Case e.CommandName
            Case "Insert"
                sqldsAP.Insert()
                gvAP.DataBind()
            Case "Download"
                'Session("DownloadFileId") = e.CommandArgument
                'Response.Clear()
                'Response.Redirect("~/DownloadFile.ashx")
        End Select
    End Sub

    Private Sub InsertDeleteValidation(ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs, ByVal col As Byte)
        If e.Row.RowType = DataControlRowType.DataRow Then
            If e.Row.RowState = DataControlRowState.Normal Or e.Row.RowState = DataControlRowState.Alternate Then
                For Each ctrl As System.Web.UI.Control In e.Row.Cells(col).Controls
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

    Protected Sub gvAP_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvAP.RowDataBound
        InsertDeleteValidation(e, 0)
    End Sub

    Protected Sub gvFiles_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvFiles.RowDataBound
        InsertDeleteValidation(e, 0)
    End Sub

    Protected Sub gvMeetings_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvMeetings.RowCommand
        Select Case e.CommandName
            Case "Insert"
                sqldsMeetings.Insert()
                gvMeetings.DataBind()
            Case "Download"
                'Session("DownloadFileId") = e.CommandArgument
                'Response.Clear()
                'Response.Redirect("~/DownloadFile.ashx")
        End Select
        ShowTab(1)
    End Sub
End Class
