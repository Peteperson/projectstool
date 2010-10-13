
Partial Class Meetings
    Inherits System.Web.UI.Page

    Protected Sub gvMeetings_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvMeetings.DataBound
        If gvMeetings.Rows.Count > 0 Then CType(gvMeetings.HeaderRow.FindControl("txtHeadMtFilter"), TextBox).Text = txtPrjId.Text
    End Sub

    Protected Sub gvMeetings_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvMeetings.RowCommand
        Select Case e.CommandName
            Case "Download"
                Session("DownloadFileId") = e.CommandArgument
                Session("TableName") = "Meetings"
                Response.Clear()
                Response.Redirect("~/DownloadFile.ashx")
            Case "SelSubProject"
                Session("ProjectId") = e.CommandArgument
                Response.Clear()
                Response.Redirect("~/Projects.aspx")
            Case "SelCompany"
                Response.Clear()
                Response.Redirect("~/Companies.aspx?Company=" & e.CommandArgument)
            Case "Filter"
                txtPrjId.Text = CType(gvMeetings.HeaderRow.FindControl("txtHeadMtFilter"), TextBox).Text
            Case "UpdStatus"
                UpdateStatus()
                gvMeetings.DataBind()
            Case "CheckAll"
                CheckAllRecords()
        End Select
    End Sub

    Private Sub CheckAllRecords()
        For i As Integer = 0 To gvMeetings.Rows.Count - 1
            With CType(gvMeetings.Rows(i).FindControl("chkSelected"), CheckBox)
                .Checked = Not .Checked
            End With
        Next
    End Sub

    Private Sub UpdateStatus()
        ddlValue = CType(gvMeetings.FooterRow.FindControl("ddlMeetingStatus"), DropDownList).SelectedValue
        For i As Integer = 0 To gvMeetings.Rows.Count - 1
            If CType(gvMeetings.Rows(i).FindControl("chkSelected"), CheckBox).Checked Then
                ddlId = CType(gvMeetings.Rows(i).FindControl("lblId"), Label).Text
                sqldsMeetStat.Update()
            End If
        Next
    End Sub

    Protected Sub sqldsMeetingsDet_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles sqldsMeetingsDet.Inserted
        gvMeetings.DataBind()
    End Sub

    Protected Sub sqldsMeetingsDet_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsMeetingsDet.Inserting
        e.Command.Parameters("@ProjectId").Value = gvMeetings.SelectedDataKey.Values("ProjectId")
        Dim dtFrom As DateTime = e.Command.Parameters("@TimeFrom").Value
        Dim dtTo As DateTime = e.Command.Parameters("@TimeTo").Value
        e.Command.Parameters("@TimeTo").Value = dtFrom.Date.AddHours(dtTo.Hour).AddMinutes(dtTo.Minute)

        'e.Command.Parameters("@TimeFrom").Value = CType(fvMeetings.FindControl("txtTimeFrom"), TextBox).Text
        'e.Command.Parameters("@TimeTo").Value = CType(fvMeetings.FindControl("txtTimeTo"), TextBox).Text
        e.Command.Parameters("@AttachmentName").Value = CType(fvMeetings.FindControl("fuMtngs"), FileUpload).FileName
        e.Command.Parameters("@Attachment").Value = CType(fvMeetings.FindControl("fuMtngs"), FileUpload).FileBytes
    End Sub

    Protected Sub sqldsMeetings_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles sqldsMeetings.Selecting
        Dim Statuses As String = ""
        With e.Command
            If txtPrjId.Text = "" Then .Parameters.Remove(.Parameters("@SubProject"))
            If dbFrom.Text = Nothing Then .Parameters.Remove(.Parameters("@dtFrom"))
            If dbTo.Text = Nothing Then .Parameters.Remove(.Parameters("@dtTo"))
            For Each li As ListItem In cblStatus.Items
                If li.Selected Then Statuses += li.Value & "|"
            Next
            If Statuses = "" Then
                .Parameters.Remove(.Parameters("@Status"))
            Else
                Statuses = Statuses.Remove(Statuses.Length - 1)
                .Parameters("@Status").Value = Statuses
            End If
        End With

        If Not Session("MeetingId") Is Nothing AndAlso Session("MeetingId") > -1 Then
            e.Command.Parameters("@MtngsId").Value = CInt(Session("MeetingId"))
            btnReset.Visible = True
            With CType(Master.FindControl("lblMessage"), Label)
                .Visible = True
                .Text = "Πατήστε το κουμπί 'Remove filtering' για να δείτε όλα τα data."
            End With
        End If
    End Sub

    Protected Sub sqldsMeetingsDet_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles sqldsMeetingsDet.Updated
        gvMeetings.DataBind()
    End Sub

    Protected Sub gvMeetings_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvMeetings.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            FormatDateCell("Date", 4, "Status", e)
            If CType(e.Row.FindControl("btnDown"), ImageButton).ToolTip = "" Then
                CType(e.Row.FindControl("btnDown"), ImageButton).Visible = False
            End If
            If Not Session("MeetingId") Is Nothing AndAlso Session("MeetingId") > -1 Then
                If CType(e.Row.DataItem, Data.DataRowView).Item("id") = Session("MeetingId") Then
                    gvMeetings.SelectedIndex = e.Row.RowIndex
                End If
            End If
        End If
    End Sub

    Protected Sub btnReset_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReset.Click
        Session("MeetingId") = -1
        gvMeetings.DataBind()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        btnReset.Visible = False
    End Sub

    Protected Sub sqldsMeetingsDet_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsMeetingsDet.Updating
        Dim dtFrom As DateTime = e.Command.Parameters("@TimeFrom").Value
        Dim dtTo As DateTime = e.Command.Parameters("@TimeTo").Value
        e.Command.Parameters("@TimeTo").Value = dtFrom.Date.AddHours(dtTo.Hour).AddMinutes(dtTo.Minute)
    End Sub

    Protected Sub btnClearFilter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClearFilter.Click
        Response.Redirect("~/Meetings.aspx")
    End Sub

    Private ActionId As Integer
    Protected Sub fvMeetings_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles fvMeetings.ItemCommand
        If e.CommandName = "FileUpd" Then
            ActionId = e.CommandArgument
            sqldsFiles.Update()
        End If
    End Sub

    Protected Sub sqldsFiles_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles sqldsFiles.Updated
        gvMeetings.DataBind()
        fvMeetings.DataBind()
    End Sub

    Protected Sub sqldsFiles_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsFiles.Updating
        e.Command.Parameters("@Id").Value = ActionId
        e.Command.Parameters("@AttachmentName").Value = CType(fvMeetings.FindControl("fuMtupd"), FileUpload).FileName
        e.Command.Parameters("@Attachment").Value = CType(fvMeetings.FindControl("fuMtupd"), FileUpload).FileBytes
    End Sub

    Protected Sub btnPrint_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnPrint.Click
        CType(Me.Master, Main).HideAndPrint()
    End Sub

    Protected Sub btnRemovePaging_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnRemovePaging.Click
        gvMeetings.AllowPaging = Not gvMeetings.AllowPaging
    End Sub

    Private ddlValue As Int16
    Private ddlId As Int16
    Protected Sub sqldsMeetStat_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsMeetStat.Updating
        e.Command.Parameters("@Status").Value = ddlValue
        e.Command.Parameters("@id").Value = ddlId
    End Sub

    Protected Sub ddlMeetingStatusOne_IndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        With CType(sender, DropDownList)
            ddlId = .ToolTip
            ddlValue = .SelectedValue
        End With
        sqldsMeetStat.Update()
        gvMeetings.DataBind()
    End Sub

    Protected Sub btnFindPrj_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnFindPrj.Click
        gvMeetings.DataBind()
    End Sub

    Protected Sub cblStatus_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cblStatus.SelectedIndexChanged
        gvMeetings.DataBind()
    End Sub
End Class
