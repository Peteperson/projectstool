﻿
Partial Class Meetings
    Inherits System.Web.UI.Page

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
        End Select
    End Sub

    Protected Sub sqldsMeetingsDet_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles sqldsMeetingsDet.Inserted
        gvMeetings.DataBind()
    End Sub

    Protected Sub sqldsMeetingsDet_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsMeetingsDet.Inserting
        e.Command.Parameters("@ProjectId").Value = gvMeetings.SelectedDataKey.Values("ProjectId")
        e.Command.Parameters("@TimeFrom").Value = CType(fvMeetings.FindControl("txtTimeFrom"), TextBox).Text
        e.Command.Parameters("@TimeTo").Value = CType(fvMeetings.FindControl("txtTimeTo"), TextBox).Text
        e.Command.Parameters("@AttachmentName").Value = CType(fvMeetings.FindControl("fuMtngs"), FileUpload).FileName
        e.Command.Parameters("@Attachment").Value = CType(fvMeetings.FindControl("fuMtngs"), FileUpload).FileBytes
    End Sub

    Protected Sub sqldsMeetings_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles sqldsMeetings.Selecting
        If txtPrjId.Text = "" Then
            Dim DeleteParam As System.Data.Common.DbParameter
            DeleteParam = e.Command.Parameters("@SubProject")
            e.Command.Parameters.Remove(DeleteParam)
        End If
    End Sub

    Protected Sub sqldsMeetingsDet_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles sqldsMeetingsDet.Updated
        gvMeetings.DataBind()
    End Sub

    Protected Sub gvMeetings_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvMeetings.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            If e.Row.RowState = DataControlRowState.Normal Or e.Row.RowState = DataControlRowState.Alternate Then
                If CType(e.Row.FindControl("btnDown"), ImageButton).ToolTip = "" Then
                    CType(e.Row.FindControl("btnDown"), ImageButton).Visible = False
                End If
            End If
        End If
    End Sub
End Class
