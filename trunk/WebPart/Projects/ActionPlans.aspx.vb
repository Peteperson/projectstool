
Partial Class ActionPlans
    Inherits System.Web.UI.Page

    Protected Sub gvAP_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvAP.DataBound
        If gvAP.Rows.Count > 0 Then CType(gvAP.HeaderRow.FindControl("txtHeadAPFilter"), TextBox).Text = txtPrjId.Text
    End Sub

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
            Case "SelCompany"
                Response.Clear()
                Response.Redirect("~/Companies.aspx?Company=" & e.CommandArgument)
            Case "Filter"
                txtPrjId.Text = CType(gvAP.HeaderRow.FindControl("txtHeadAPFilter"), TextBox).Text
            Case "UpdStatus"
                UpdateStatus()
                gvAP.DataBind()
            Case "CheckAll"
                CheckAllRecords()
        End Select
    End Sub

    Private Sub CheckAllRecords()
        For i As Integer = 0 To gvAP.Rows.Count - 1
            With CType(gvAP.Rows(i).FindControl("chkSelected"), CheckBox)
                .Checked = Not .Checked
            End With
        Next
    End Sub

    Private Sub UpdateStatus()
        ddlValue = CType(gvAP.FooterRow.FindControl("ddlActionStatus"), DropDownList).SelectedValue
        For i As Integer = 0 To gvAP.Rows.Count - 1
            If CType(gvAP.Rows(i).FindControl("chkSelected"), CheckBox).Checked Then
                ddlId = CType(gvAP.Rows(i).FindControl("lblId"), Label).Text
                sqldsActionStatus.Update()
            End If
        Next
    End Sub

    Protected Sub gvAP_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvAP.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            FormatDateCell("Deadline", 8, "Status", e)
            If CType(e.Row.FindControl("btnDown"), ImageButton).ToolTip = "" Then
                CType(e.Row.FindControl("btnDown"), ImageButton).Visible = False
            End If
            If Not Session("ActionPlanId") Is Nothing AndAlso Session("ActionPlanId") > -1 Then
                If CType(e.Row.DataItem, Data.DataRowView).Item("id") = Session("ActionPlanId") Then
                    gvAP.SelectedIndex = e.Row.RowIndex
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

        If Not Session("ActionPlanId") Is Nothing AndAlso Session("ActionPlanId") > -1 Then
            e.Command.Parameters("@APId").Value = CInt(Session("ActionPlanId"))
            btnReset.Visible = True
            With CType(Master.FindControl("lblMessage"), Label)
                .Visible = True
                .Text = "The results are filtered. Press 'Remove filtering' to view all data"
            End With
        End If
    End Sub

    Protected Sub sqldsAPdet_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles sqldsAPdet.Inserted
        gvAP.DataBind()
    End Sub

    Protected Sub sqldsAPdet_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsAPdet.Inserting
        e.Command.Parameters("@ProjectId").Value = gvAP.SelectedDataKey.Values("ProjectId")
        e.Command.Parameters("@AttachmentName").Value = CType(fvAction.FindControl("fuAP"), FileUpload).FileName
        e.Command.Parameters("@Attachment").Value = CType(fvAction.FindControl("fuAP"), FileUpload).FileBytes
        Dim resp As Integer
        resp = e.Command.Parameters("@Responsible1").Value
        e.Command.Parameters("@Responsible1").Value = IIf(resp = 0, DBNull.Value, resp)
        resp = e.Command.Parameters("@Responsible2").Value
        e.Command.Parameters("@Responsible2").Value = IIf(resp = 0, DBNull.Value, resp)
    End Sub

    Protected Sub sqldsAPdet_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles sqldsAPdet.Updated
        gvAP.DataBind()
    End Sub

    Protected Sub btnReset_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReset.Click
        Session("ActionPlanId") = -1
        gvAP.DataBind()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        btnReset.Visible = False
    End Sub

    Protected Sub btnClearFilter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClearFilter.Click
        rblStatus.SelectedIndex = -1
    End Sub

    Private ActionId As Integer
    Protected Sub fvAction_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles fvAction.ItemCommand
        If e.CommandName = "FileUpd" Then
            ActionId = e.CommandArgument
            sqldsFile.Update()
        End If
    End Sub

    Protected Sub sqldsFile_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles sqldsFile.Updated
        gvAP.DataBind()
        fvAction.DataBind()
    End Sub

    Protected Sub sqldsFile_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsFile.Updating
        e.Command.Parameters("@Id").Value = ActionId
        e.Command.Parameters("@AttachmentName").Value = CType(fvAction.FindControl("fuAPupd"), FileUpload).FileName
        e.Command.Parameters("@Attachment").Value = CType(fvAction.FindControl("fuAPupd"), FileUpload).FileBytes
    End Sub

    Protected Sub sqldsAPdet_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsAPdet.Updating
        Dim resp As Integer
        resp = e.Command.Parameters("@Responsible1").Value
        e.Command.Parameters("@Responsible1").Value = IIf(resp = 0, DBNull.Value, resp)
        resp = e.Command.Parameters("@Responsible2").Value
        e.Command.Parameters("@Responsible2").Value = IIf(resp = 0, DBNull.Value, resp)
    End Sub

    Protected Sub btnPrint_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnPrint.Click
        CType(Me.Master, Main).HideAndPrint()
    End Sub

    Protected Sub btnRemovePaging1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnRemovePaging1.Click
        gvAP.AllowPaging = Not gvAP.AllowPaging
    End Sub

    Private ddlValue As Int16
    Private ddlId As Int16

    Protected Sub ddlActionStatusOne_IndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        With CType(sender, DropDownList)
            ddlId = .ToolTip
            ddlValue = .SelectedValue
        End With
        sqldsActionStatus.Update()
        gvAP.DataBind()
    End Sub

    Protected Sub sqldsActionStatus_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsActionStatus.Updating
        e.Command.Parameters("@Status").Value = ddlValue
        e.Command.Parameters("@id").Value = ddlId
    End Sub
End Class
