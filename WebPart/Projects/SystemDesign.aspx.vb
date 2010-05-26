
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
            e.Command.Parameters("@StatusDate").Value = Today
            e.Command.Parameters("@Responsible").Value = CType(gvProcesses.FooterRow.FindControl("ddlResp"), DropDownList).SelectedValue
            e.Command.Parameters("@Comments").Value = CType(gvProcesses.FooterRow.FindControl("txtComm"), TextBox).Text
        Else
            e.Command.Parameters("@SystemVersionId").Value = ddlSysVersions.SelectedValue
            e.Command.Parameters("@Code").Value = CType(gvProcesses.Controls(0).Controls(0).Controls(0).FindControl("txtCode"), TextBox).Text
            e.Command.Parameters("@Description").Value = CType(gvProcesses.Controls(0).Controls(0).Controls(0).FindControl("txtDescr"), TextBox).Text
            e.Command.Parameters("@Status").Value = CType(gvProcesses.Controls(0).Controls(0).Controls(0).FindControl("ddlProcStat"), DropDownList).SelectedValue
            e.Command.Parameters("@StatusDate").Value = Today
            e.Command.Parameters("@Responsible").Value = CType(gvProcesses.Controls(0).Controls(0).Controls(0).FindControl("ddlResp"), DropDownList).SelectedValue
            e.Command.Parameters("@Comments").Value = CType(gvProcesses.Controls(0).Controls(0).Controls(0).FindControl("txtComm"), TextBox).Text
        End If
    End Sub

    Protected Sub sqldsProcesses_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsProcesses.Updating
        e.Command.Parameters("@SystemVersionId").Value = ddlSysVersions.SelectedValue
    End Sub

    Protected Sub gvProcesses_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvProcesses.RowCommand
        Select Case e.CommandName
            Case "Insert"
                sqldsProcesses.Insert()
        End Select
    End Sub

    Protected Sub gvProcesses_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvProcesses.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            If e.Row.RowState = DataControlRowState.Normal Or e.Row.RowState = DataControlRowState.Alternate Then
                For Each ctrl As System.Web.UI.Control In e.Row.Cells(0).Controls
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

    Protected Sub ddlPrjCode_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlPrjCode.SelectedIndexChanged
        ddlSysVersions.DataBind()
    End Sub

    Protected Sub ddlSysVersions_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlSysVersions.DataBound
        gvProcesses.DataBind()
    End Sub
End Class
