
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

    Protected Sub sqldsMeetings_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles sqldsMeetings.Selecting
        If txtPrjId.Text = "" Then
            Dim DeleteParam As System.Data.Common.DbParameter
            DeleteParam = e.Command.Parameters("@SubProject")
            e.Command.Parameters.Remove(DeleteParam)
        End If
    End Sub
End Class
