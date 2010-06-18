﻿
Partial Class Projects
    Inherits System.Web.UI.Page

    Protected Sub mnuProjects_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles mnuProjects.MenuItemClick
        SetTabImage(e.Item.Value)
        ShowTab(e.Item.Value)
    End Sub

    Private Sub SetTabImage(ByVal TabId As Byte)
        Dim SelImages() As String = {"~/Images/ActionPlanSelected5.png", "~/Images/MeetingsSelected5.png", "~/Images/AttachmentsSelected5.png", "~/Images/ProgressSelected.png"}
        Dim UnselImages() As String = {"~/Images/ActionPlanUnselected5.png", "~/Images/MeetingsUnselected5.png", "~/Images/AttachmentsUnselected5.png", "~/Images/ProgressUnselected.png"}
        For i As Integer = 0 To mnuProjects.Items.Count - 1
            If i = TabId Then
                mnuProjects.Items(i).ImageUrl = SelImages(i)
            Else
                mnuProjects.Items(i).ImageUrl = UnselImages(i)
            End If
        Next
    End Sub

    Private Sub ShowTab(ByVal TabId As Byte)
        Select Case TabId
            Case 0
                gvAP.Visible = True
                btnAPins.Visible = True
                gvMeetings.Visible = False
                btnMTins.Visible = False
                gvFiles.Visible = False
                btnFlsIns.Visible = False
                gvAP.DataBind()
            Case 1
                gvAP.Visible = False
                btnAPins.Visible = False
                gvMeetings.Visible = True
                btnMTins.Visible = True
                gvFiles.Visible = False
                btnFlsIns.Visible = False
                gvMeetings.DataBind()
            Case 2
                gvAP.Visible = False
                gvMeetings.Visible = False
                btnMTins.Visible = False
                btnAPins.Visible = False
                gvFiles.Visible = True
                btnFlsIns.Visible = True
                gvFiles.DataBind()
            Case 3
                gvAP.Visible = False
                btnAPins.Visible = False
                gvMeetings.Visible = False
                btnMTins.Visible = False
                gvFiles.Visible = False
                btnFlsIns.Visible = False

        End Select
    End Sub

    Protected Sub btnFindPrj_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnFindPrj.Click
        dvProject.ChangeMode(DetailsViewMode.ReadOnly)
        If Not (ddlPrjCode.Items.FindByText(txtPrjId.Text)) Is Nothing Then
            ddlPrjCode.SelectedValue = ddlPrjCode.Items.FindByText(txtPrjId.Text).Value
            SetTabImage(0)
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
        btnAPins.Visible = True
        btnFlsIns.Visible = False
        btnMTins.Visible = False
        If Not Session("ProjectId") Is Nothing AndAlso Session("ProjectId") > -1 Then
            ddlPrjCode.SelectedValue = Session("ProjectId")
            Session("ProjectId") = -1
        End If
    End Sub

    Protected Sub gvFiles_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvFiles.DataBound
        If gvFiles.Rows.Count > 0 Then
            btnFlsIns.Visible = True
        Else
            btnFlsIns.Visible = False
        End If
    End Sub

    Protected Sub gvFiles_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvFiles.RowCommand
        Select Case e.CommandName
            Case "Insert"
                sqldsAttachments.Insert()
                gvFiles.DataBind()
            Case "Download"
                Session("DownloadFileId") = e.CommandArgument
                Session("TableName") = "Attachments"
                Response.Clear()
                Response.Redirect("~/DownloadFile.ashx")
        End Select
        ShowTab(2)
    End Sub

    Protected Sub sqldsAttachments_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsAttachments.Inserting
        If gvFiles.Rows.Count > 0 Then
            e.Command.Parameters("@ProjectId").Value = ddlPrjCode.SelectedValue
            e.Command.Parameters("@AttachmentName").Value = CType(gvFiles.FooterRow.FindControl("fuCtrl"), FileUpload).FileName
            e.Command.Parameters("@Attachment").Value = CType(gvFiles.FooterRow.FindControl("fuCtrl"), FileUpload).FileBytes
            e.Command.Parameters("@Comments").Value = CType(gvFiles.FooterRow.FindControl("txtAttachComment"), TextBox).Text
        Else
            e.Command.Parameters("@ProjectId").Value = ddlPrjCode.SelectedValue
            e.Command.Parameters("@AttachmentName").Value = CType(gvFiles.Controls(0).Controls(0).Controls(0).FindControl("fuCtrl"), FileUpload).FileName
            e.Command.Parameters("@Attachment").Value = CType(gvFiles.Controls(0).Controls(0).Controls(0).FindControl("fuCtrl"), FileUpload).FileBytes
            e.Command.Parameters("@Comments").Value = CType(gvFiles.Controls(0).Controls(0).Controls(0).FindControl("txtAttachComment"), TextBox).Text
        End If
    End Sub

    Protected Sub sqldsProjects_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles sqldsProjects.Deleted
        If e.AffectedRows = 0 Then
            Session("ErrorMessage") = "The DELETE statement conflicted with the REFERENCE constraint"
            Response.Redirect("~/Error.aspx")
        Else
            Response.Redirect("~/Projects.aspx")
        End If
    End Sub

    Protected Sub sqldsProjects_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles sqldsProjects.Inserted
        ddlPrjCode.DataBind()
        SetDdlValue(e.Command.Parameters("@SubProject").Value)
        sqldsSysVer.Insert()
    End Sub

    Private Sub SetDdlValue(ByVal text As String)
        For i As Byte = 0 To ddlPrjCode.Items.Count - 1
            If ddlPrjCode.Items(i).Text = text Then
                ddlPrjCode.SelectedIndex = i
                Exit For
            End If
        Next
    End Sub

    Protected Sub sqldsProjects_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsProjects.Inserting
        'e.Command.Parameters("@StartDate").Value = Support.ReadDate(CType(dvProject.FindControl("txtProjectSDate"), TextBox).Text)
        e.Command.Parameters("@StartDate").Value = CType(dvProject.FindControl("dbStartDate"), DateBox).Value
        'e.Command.Parameters("@InitialEndDate").Value = Support.ReadDate(CType(dvProject.FindControl("txtProjectEDate"), TextBox).Text)
        e.Command.Parameters("@InitialEndDate").Value = CType(dvProject.FindControl("dbEndDate"), DateBox).Value
        e.Command.Parameters("@Creator").Value = CType(dvProject.FindControl("ddlCreators"), DropDownList).SelectedValue
        e.Command.Parameters("@Supervisor").Value = CType(dvProject.FindControl("ddlSupervisors"), DropDownList).SelectedValue
        e.Command.Parameters("@CustomerId").Value = CType(dvProject.FindControl("ddlCompanies"), DropDownList).SelectedValue
        e.Command.Parameters("@Status").Value = CType(dvProject.FindControl("ddlProjectStatus"), DropDownList).SelectedValue
        e.Command.Parameters("@Consultant1").Value = CType(dvProject.FindControl("ddlInsConsultant1"), DropDownList).SelectedValue
        Dim cons2 As String = CType(dvProject.FindControl("ddlInsConsultant2"), DropDownList).SelectedValue
        e.Command.Parameters("@Consultant2").Value = IIf(cons2 = 0, System.DBNull.Value, cons2)
    End Sub

    Protected Sub sqldsProjects_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsProjects.Updating
        e.Command.Parameters("@ModificationDate").Value = Now
        e.Command.Parameters("@StartDate").Value = CType(dvProject.FindControl("dbStartDate"), DateBox).Value
        e.Command.Parameters("@InitialEndDate").Value = CType(dvProject.FindControl("dbEndDate"), DateBox).Value
        'e.Command.Parameters("@StartDate").Value = Support.ReadDate(CType(dvProject.FindControl("txtProjectSDate"), TextBox).Text)
        'e.Command.Parameters("@InitialEndDate").Value = Support.ReadDate(CType(dvProject.FindControl("txtProjectEDate"), TextBox).Text)
        If e.Command.Parameters("@Consultant2").Value = 0 Then e.Command.Parameters("@Consultant2").Value = System.DBNull.Value
    End Sub

    Protected Sub sqldsAP_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsAP.Inserting
        Dim resp As Integer
        If gvAP.Rows.Count > 0 Then
            e.Command.Parameters("@ProjectId").Value = ddlPrjCode.SelectedValue
            e.Command.Parameters("@ActionId").Value = CType(gvAP.FooterRow.FindControl("ddlActionType"), DropDownList).SelectedValue
            resp = CType(gvAP.FooterRow.FindControl("ddlResp1"), DropDownList).SelectedValue
            e.Command.Parameters("@Responsible1").Value = IIf(resp = 0, DBNull.Value, resp)
            resp = CType(gvAP.FooterRow.FindControl("ddlResp2"), DropDownList).SelectedValue
            e.Command.Parameters("@Responsible2").Value = IIf(resp = 0, DBNull.Value, resp)
            e.Command.Parameters("@Description").Value = CType(gvAP.FooterRow.FindControl("txtAPdesc"), TextBox).Text
            e.Command.Parameters("@AttachmentName").Value = CType(gvAP.FooterRow.FindControl("fuAP"), FileUpload).FileName
            e.Command.Parameters("@Attachment").Value = CType(gvAP.FooterRow.FindControl("fuAP"), FileUpload).FileBytes
            'e.Command.Parameters("@Deadline").Value = Support.ReadDate(CType(gvAP.FooterRow.FindControl("txtAPdead"), TextBox).Text)
            e.Command.Parameters("@Deadline").Value = CType(gvAP.FooterRow.FindControl("dbDeadline"), DateBox).Value
            e.Command.Parameters("@Status").Value = CType(gvAP.FooterRow.FindControl("ddlActionStatus"), DropDownList).SelectedValue
        Else
            e.Command.Parameters("@ProjectId").Value = ddlPrjCode.SelectedValue
            e.Command.Parameters("@ActionId").Value = CType(gvAP.Controls(0).Controls(0).Controls(0).FindControl("ddlActionType"), DropDownList).SelectedValue
            resp = CType(gvAP.Controls(0).Controls(0).Controls(0).FindControl("ddlResp1"), DropDownList).SelectedValue
            e.Command.Parameters("@Responsible1").Value = IIf(resp = 0, DBNull.Value, resp)
            resp = CType(gvAP.Controls(0).Controls(0).Controls(0).FindControl("ddlResp2"), DropDownList).SelectedValue
            e.Command.Parameters("@Responsible2").Value = IIf(resp = 0, DBNull.Value, resp)
            e.Command.Parameters("@Description").Value = CType(gvAP.Controls(0).Controls(0).Controls(0).FindControl("txtAPdesc"), TextBox).Text
            e.Command.Parameters("@AttachmentName").Value = CType(gvAP.Controls(0).Controls(0).Controls(0).FindControl("fuAP"), FileUpload).FileName
            e.Command.Parameters("@Attachment").Value = CType(gvAP.Controls(0).Controls(0).Controls(0).FindControl("fuAP"), FileUpload).FileBytes
            'e.Command.Parameters("@Deadline").Value = Support.ReadDate(CType(gvAP.Controls(0).Controls(0).Controls(0).FindControl("txtAPdead"), TextBox).Text)
            e.Command.Parameters("@Deadline").Value = CType(gvAP.Controls(0).Controls(0).Controls(0).FindControl("dbDeadline"), DateBox).Value
            e.Command.Parameters("@Status").Value = CType(gvAP.Controls(0).Controls(0).Controls(0).FindControl("ddlActionStatus"), DropDownList).SelectedValue
        End If
    End Sub

    Protected Sub sqldsAP_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsAP.Updating
        Dim ind As Integer = gvAP.EditIndex
        Dim resp As Integer
        'e.Command.Parameters("@Deadline").Value = Support.ReadDate(CType(gvAP.Rows(ind).FindControl("txtAPdead"), TextBox).Text)
        e.Command.Parameters("@Deadline").Value = CType(gvAP.Rows(ind).FindControl("dbDeadline"), DateBox).Value
        resp = e.Command.Parameters("@Responsible1").Value
        e.Command.Parameters("@Responsible1").Value = IIf(resp = 0, DBNull.Value, resp)
        resp = e.Command.Parameters("@Responsible2").Value
        e.Command.Parameters("@Responsible2").Value = IIf(resp = 0, DBNull.Value, resp)
    End Sub

    Protected Sub gvAP_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvAP.DataBound
        If gvAP.Rows.Count > 0 Then
            btnAPins.Visible = True
        Else
            btnAPins.Visible = False
        End If
    End Sub

    Protected Sub gvAP_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvAP.RowCommand
        Select Case e.CommandName
            Case "Insert"
                sqldsAP.Insert()
                gvAP.DataBind()
            Case "Download"
                Session("DownloadFileId") = e.CommandArgument
                Session("TableName") = "ActionPlan"
                Response.Clear()
                Response.Redirect("~/DownloadFile.ashx")
            Case "Details"
                Session("ActionPlanId") = e.CommandArgument
                Response.Clear()
                Response.Redirect("~/ActionPlans.aspx")
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

    Protected Sub gvMeetings_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvMeetings.DataBound
        If gvMeetings.Rows.Count > 0 Then
            btnMTins.Visible = True
        Else
            btnMTins.Visible = False
        End If
    End Sub

    Protected Sub gvMeetings_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvMeetings.RowCommand
        Select Case e.CommandName
            Case "Insert"
                sqldsMeetings.Insert()
                gvMeetings.DataBind()
            Case "Download"
                Session("DownloadFileId") = e.CommandArgument
                Session("TableName") = "Meetings"
                Response.Clear()
                Response.Redirect("~/DownloadFile.ashx")
            Case "Details"
                Session("MeetingId") = e.CommandArgument
                Response.Clear()
                Response.Redirect("~/Meetings.aspx")
        End Select
        ShowTab(1)
    End Sub

    Protected Sub sqldsMeetings_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsMeetings.Inserting
        Dim tf, tt As DateTime
        If gvMeetings.Rows.Count > 0 Then
            e.Command.Parameters("@ProjectId").Value = ddlPrjCode.SelectedValue
            tf = CType(gvMeetings.FooterRow.FindControl("dbTimeFrom"), DateBox).Value
            tt = CType(gvMeetings.FooterRow.FindControl("dbTimeTo"), DateBox).Value
            e.Command.Parameters("@TimeFrom").Value = tf
            e.Command.Parameters("@TimeTo").Value = tf.Date.AddHours(tt.Hour).AddMinutes(tt.Minute)
            e.Command.Parameters("@Kind").Value = CType(gvMeetings.FooterRow.FindControl("ddlMeetKind"), DropDownList).SelectedValue
            e.Command.Parameters("@Subject").Value = CType(gvMeetings.FooterRow.FindControl("txtMeetSubject"), TextBox).Text
            e.Command.Parameters("@Consultant").Value = CType(gvMeetings.FooterRow.FindControl("ddlMeetCons"), DropDownList).SelectedValue
            e.Command.Parameters("@Comments").Value = CType(gvMeetings.FooterRow.FindControl("txtMeetComments"), TextBox).Text
            e.Command.Parameters("@NewBusiness").Value = CType(gvMeetings.FooterRow.FindControl("txtMeetNewBus"), TextBox).Text
            e.Command.Parameters("@AttachmentName").Value = CType(gvMeetings.FooterRow.FindControl("fuAttachment"), FileUpload).FileName
            e.Command.Parameters("@Attachment").Value = CType(gvMeetings.FooterRow.FindControl("fuAttachment"), FileUpload).FileBytes
            e.Command.Parameters("@Status").Value = CType(gvMeetings.FooterRow.FindControl("ddlMeetStat"), DropDownList).SelectedValue
        Else
            e.Command.Parameters("@ProjectId").Value = ddlPrjCode.SelectedValue
            tf = CType(gvMeetings.Controls(0).Controls(0).Controls(0).FindControl("dbTimeFrom"), DateBox).Value
            tt = CType(gvMeetings.Controls(0).Controls(0).Controls(0).FindControl("dbTimeTo"), DateBox).Value
            e.Command.Parameters("@TimeFrom").Value = tf
            e.Command.Parameters("@TimeTo").Value = tf.Date.AddHours(tt.Hour).AddMinutes(tt.Minute)
            e.Command.Parameters("@Kind").Value = CType(gvMeetings.Controls(0).Controls(0).Controls(0).FindControl("ddlMeetKind"), DropDownList).SelectedValue
            e.Command.Parameters("@Subject").Value = CType(gvMeetings.Controls(0).Controls(0).Controls(0).FindControl("txtMeetSubject"), TextBox).Text
            e.Command.Parameters("@Consultant").Value = CType(gvMeetings.Controls(0).Controls(0).Controls(0).FindControl("ddlMeetCons"), DropDownList).SelectedValue
            e.Command.Parameters("@Comments").Value = CType(gvMeetings.Controls(0).Controls(0).Controls(0).FindControl("txtMeetComments"), TextBox).Text
            e.Command.Parameters("@NewBusiness").Value = CType(gvMeetings.Controls(0).Controls(0).Controls(0).FindControl("txtMeetNewBus"), TextBox).Text
            e.Command.Parameters("@AttachmentName").Value = CType(gvMeetings.Controls(0).Controls(0).Controls(0).FindControl("fuAttachment"), FileUpload).FileName
            e.Command.Parameters("@Attachment").Value = CType(gvMeetings.Controls(0).Controls(0).Controls(0).FindControl("fuAttachment"), FileUpload).FileBytes
            e.Command.Parameters("@Status").Value = CType(gvMeetings.Controls(0).Controls(0).Controls(0).FindControl("ddlMeetStat"), DropDownList).SelectedValue
        End If
    End Sub

    Protected Sub sqldsMeetings_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsMeetings.Updating
        Dim dtFrom As DateTime = e.Command.Parameters("@TimeFrom").Value
        Dim dtTo As DateTime = e.Command.Parameters("@TimeTo").Value
        e.Command.Parameters("@TimeTo").Value = dtFrom.Date.AddHours(dtTo.Hour).AddMinutes(dtTo.Minute)
    End Sub

    Protected Sub gvMeetings_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvMeetings.RowDataBound
        InsertDeleteValidation(e, 0)
    End Sub

    Protected Sub ddlPrjCode_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlPrjCode.SelectedIndexChanged
        SetTabImage(0)
    End Sub

    Protected Sub btnAPins_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAPins.Click
        gvAP.ShowFooter = Not gvAP.ShowFooter
    End Sub

    Protected Sub btnFlsIns_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnFlsIns.Click
        gvFiles.ShowFooter = Not gvFiles.ShowFooter
        ShowTab(2)
    End Sub

    Protected Sub btnMTins_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMTins.Click
        gvMeetings.ShowFooter = Not gvMeetings.ShowFooter
        ShowTab(1)
    End Sub

    Protected Sub dvProject_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles dvProject.DataBound
        If dvProject.CurrentMode = DetailsViewMode.ReadOnly Then
            If Not dvProject.FindControl("btnDeletePrj") Is Nothing Then
                CType(dvProject.FindControl("btnDeletePrj"), ImageButton).Attributes("onclick") = "if(!confirm('Really delete this row?'))return   false;"
            Else
                dvProject.ChangeMode(DetailsViewMode.Insert)
            End If
        End If
    End Sub

    Protected Sub dvProject_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewCommandEventArgs) Handles dvProject.ItemCommand
        Select Case e.CommandName
            Case "SelCompany"
                Response.Clear()
                Response.Redirect("~/Companies.aspx?Company=" & CType(dvProject.FindControl("ddlCompanies"), DropDownList).SelectedItem.Text)
            Case "SysDesign"
                Response.Clear()
                Response.Redirect("~/SystemDesign.aspx?Project=" & ddlPrjCode.SelectedValue)
        End Select
    End Sub

    Protected Sub sqldsSysVer_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsSysVer.Inserting
        e.Command.Parameters("@ProjectId").Value = ddlPrjCode.SelectedValue
    End Sub
End Class