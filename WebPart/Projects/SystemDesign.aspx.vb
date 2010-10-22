
Partial Class SystemDesign
    Inherits System.Web.UI.Page

    Protected Sub btnFindPrj_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnFindPrj.Click
        If Not (ddlPrjCode.Items.FindByText(txtPrjId.Text)) Is Nothing Then
            ddlPrjCode.SelectedValue = ddlPrjCode.Items.FindByText(txtPrjId.Text).Value
        Else
            With CType(Master.FindControl("lblMessage"), Label)
                .Visible = True
                .Text = "The project does not exist!"
            End With
        End If
    End Sub

    Protected Sub sqldsProcesses_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsProcesses.Inserting
        If gvProcesses.Rows.Count > 0 Then
            e.Command.Parameters("@SystemVersionId").Value = ddlSysVersions.SelectedValue
            e.Command.Parameters("@Code").Value = CType(gvProcesses.FooterRow.FindControl("txtCode"), TextBox).Text
            e.Command.Parameters("@Description").Value = CType(gvProcesses.FooterRow.FindControl("txtDescr"), TextBox).Text
            e.Command.Parameters("@Status").Value = CType(gvProcesses.FooterRow.FindControl("ddlProcStat"), DropDownList).SelectedValue
            e.Command.Parameters("@StatusDate").Value = CType(gvProcesses.FooterRow.FindControl("dbStatDate"), DateBox).Value
            Dim resp As Integer = CType(gvProcesses.FooterRow.FindControl("ddlResp"), DropDownList).SelectedValue
            e.Command.Parameters("@Responsible").Value = IIf(resp = 0, System.DBNull.Value, resp)
            e.Command.Parameters("@Comments").Value = CType(gvProcesses.FooterRow.FindControl("txtComm"), TextBox).Text
        Else
            e.Command.Parameters("@SystemVersionId").Value = ddlSysVersions.SelectedValue
            e.Command.Parameters("@Code").Value = CType(gvProcesses.Controls(0).Controls(0).Controls(0).FindControl("txtCode"), TextBox).Text
            e.Command.Parameters("@Description").Value = CType(gvProcesses.Controls(0).Controls(0).Controls(0).FindControl("txtDescr"), TextBox).Text
            e.Command.Parameters("@Status").Value = CType(gvProcesses.Controls(0).Controls(0).Controls(0).FindControl("ddlProcStat"), DropDownList).SelectedValue
            e.Command.Parameters("@StatusDate").Value = CType(gvProcesses.Controls(0).Controls(0).Controls(0).FindControl("dbStatDate"), DateBox).Value
            Dim resp As Integer = CType(gvProcesses.Controls(0).Controls(0).Controls(0).FindControl("ddlResp"), DropDownList).SelectedValue
            e.Command.Parameters("@Responsible").Value = IIf(resp = 0, System.DBNull.Value, resp)
            e.Command.Parameters("@Comments").Value = CType(gvProcesses.Controls(0).Controls(0).Controls(0).FindControl("txtComm"), TextBox).Text
        End If
    End Sub

    Protected Sub sqldsProcesses_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsProcesses.Updating
        e.Command.Parameters("@SystemVersionId").Value = ddlSysVersions.SelectedValue
        If StatusChanged Then e.Command.Parameters("@StatusDate").Value = Now
        If e.Command.Parameters("@Responsible").Value = 0 Then e.Command.Parameters("@Responsible").Value = System.DBNull.Value
    End Sub

    Protected Sub gvProcesses_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvProcesses.DataBound
        If Not gvProcesses.Rows.Count > 0 Then btnAddVersion.Enabled = False Else btnAddVersion.Enabled = True
        lblCompany.Text = Database.CompanyName(ddlPrjCode.SelectedValue)
    End Sub

    Protected Sub gvProcesses_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvProcesses.RowCommand
        Select Case e.CommandName
            Case "Insert"
                sqldsProcesses.Insert()
            Case "UpdStatus"
                UpdateStatus()
                gvProcesses.DataBind()
            Case "CheckAll"
                CheckAllRecords()
        End Select
    End Sub

    Private Sub CheckAllRecords()
        For i As Integer = 0 To gvProcesses.Rows.Count - 1
            With CType(gvProcesses.Rows(i).FindControl("chkSelected"), CheckBox)
                .Checked = Not .Checked
            End With
        Next
    End Sub

    Private Sub UpdateStatus()
        ddlValue = CType(gvProcesses.FooterRow.FindControl("ddlProcStat"), DropDownList).SelectedValue
        For i As Integer = 0 To gvProcesses.Rows.Count - 1
            If CType(gvProcesses.Rows(i).FindControl("chkSelected"), CheckBox).Checked Then
                ddlId = CType(gvProcesses.Rows(i).FindControl("lblId"), Label).Text
                sqldsProcStat.Update()
            End If
        Next
    End Sub

    Protected Sub gvProcesses_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvProcesses.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            If e.Row.RowState = DataControlRowState.Normal Or e.Row.RowState = DataControlRowState.Alternate Then
                For Each ctrl As System.Web.UI.Control In e.Row.Cells(0).Controls
                    Try
                        If ctrl.GetType Is GetType(ImageButton) Then
                            If CType(ctrl, ImageButton).ImageUrl.IndexOf("Remove") > 0 Then
                                CType(ctrl, ImageButton).Attributes("onclick") = "if(!confirm('Να διαγράψω την εγγραφή;'))return   false;"
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

    Protected Sub ddlPrjCode_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlPrjCode.SelectedIndexChanged
        ddlSysVersions.DataBind()
    End Sub

    Protected Sub ddlSysVersions_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlSysVersions.DataBound
        gvProcesses.DataBind()
        If ddlSysVersions.Items.Count < 2 Then btnDelVersion.Visible = False Else btnDelVersion.Visible = True
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        btnAddVersion.Attributes("onclick") = "if(!confirm('Θέλετε να δημιουργήσετε νέα έκδοση με τις παρακάτω διαδικασίες;'))return   false;"
        btnDelVersion.Attributes("onclick") = "if(!confirm('Θέλετε να διαγράψετε την παρακάτω έκδοση;'))return   false;"
        If Not IsPostBack Then
            If Request.Params("Project") <> "" Then ddlPrjCode.SelectedValue = Request.Params("Project")
        End If
    End Sub

    Private StatusChanged As Boolean
    Protected Sub gvProcesses_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles gvProcesses.RowUpdating
        If e.OldValues("Status") <> e.NewValues("Status") Then StatusChanged = True Else StatusChanged = False
    End Sub

    Protected Sub btnAddVersion_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnAddVersion.Click
        sqldsSysVersions.Insert()
        ddlSysVersions.DataBind()
    End Sub

    Protected Sub btnDelVersion_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnDelVersion.Click
        sqldsSysVersions.Delete()
        ddlSysVersions.DataBind()
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        sqldsSysVersions.Update()
        ddlPrjCode.SelectedIndex = ddlCopyProjects.SelectedIndex
        ddlSysVersions.DataBind()
    End Sub

    Protected Sub btnPrint_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnPrint.Click
        CType(Me.Master, Main).HideAndPrint()
    End Sub

    Protected Sub btnRemovePaging_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnRemovePaging.Click
        gvProcesses.AllowPaging = Not gvProcesses.AllowPaging
    End Sub

    Private ddlValue As Int16
    Private ddlId As Int16
    Protected Sub sqldsProcStat_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsProcStat.Updating
        e.Command.Parameters("@Status").Value = ddlValue
        e.Command.Parameters("@id").Value = ddlId
    End Sub

    Protected Sub btnInsert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsert.Click
        gvProcesses.ShowFooter = Not gvProcesses.ShowFooter
    End Sub

    Protected Sub ddlResp_IndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        With CType(sender, DropDownList)
            ddlId = .ToolTip
            ddlValue = .SelectedValue
        End With
        sqldsResponsibles.Update()
        gvProcesses.DataBind()
    End Sub

    Protected Sub sqldsResponsibles_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsResponsibles.Updating
        e.Command.Parameters("@Responsible").Value = ddlValue
        e.Command.Parameters("@id").Value = ddlId
    End Sub
End Class
