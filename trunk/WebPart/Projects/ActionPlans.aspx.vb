
Partial Class ActionPlans
    Inherits System.Web.UI.Page

    Protected Sub gvAP_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvAP.RowCommand
        Select Case e.CommandName
            Case "Download"
                Session("DownloadFileId") = e.CommandArgument
                Session("TableName") = "ActionPlan"
                Response.Clear()
                Response.Redirect("~/DownloadFile.ashx")
            Case "SelSubProject"
                Session("ProjectId") = e.CommandArgument
                Response.Clear()
                Response.Redirect("~/Projects.aspx")
        End Select
    End Sub

    Protected Sub gvAP_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvAP.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            If e.Row.RowState = DataControlRowState.Normal Or e.Row.RowState = DataControlRowState.Alternate Then
                FormatDateCell("Deadline", 9, e)
                If CType(e.Row.FindControl("btnDown"), ImageButton).ToolTip = "" Then
                    CType(e.Row.FindControl("btnDown"), ImageButton).Visible = False
                End If
            End If
        End If
    End Sub

    Protected Sub sqldsAP_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles sqldsAP.Selecting
        If txtPrjId.Text = "" Then
            Dim DeleteParam As System.Data.Common.DbParameter
            DeleteParam = e.Command.Parameters("@SubProject")
            e.Command.Parameters.Remove(DeleteParam)
        End If
    End Sub

    Protected Sub sqldsAPdet_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles sqldsAPdet.Inserted
        gvAP.DataBind()
    End Sub

    Protected Sub sqldsAPdet_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsAPdet.Inserting
        e.Command.Parameters("@ProjectId").Value = gvAP.SelectedDataKey.Values("ProjectId")
        e.Command.Parameters("@AttachmentName").Value = CType(fvAction.FindControl("fuAP"), FileUpload).FileName
        e.Command.Parameters("@Attachment").Value = CType(fvAction.FindControl("fuAP"), FileUpload).FileBytes
    End Sub

    Protected Sub sqldsAPdet_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles sqldsAPdet.Updated
        gvAP.DataBind()
    End Sub
End Class
