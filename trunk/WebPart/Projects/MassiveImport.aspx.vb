
Partial Class MassiveImport
    Inherits System.Web.UI.Page

    Protected Sub ddlStatus_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlStatus.DataBound
        ddlStatus.Items.Insert(0, " ")
    End Sub

    Protected Sub ddlProjects_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlProjects.DataBound
        Dim li As ListItem = New ListItem(" ", "-1")
        ddlProjects.Items.Insert(0, li)
    End Sub

    Private MIprojectId, MIstatus, MIresponsible As Integer
    Private MIdeadline As Date
    Private MIdescription, MIcomments As String

    Protected Sub btnImport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnImport.Click
        Dim line() As String = txtData.Text.Split(vbCrLf)
        Dim items() As String
        For i As Integer = 0 To line.Length - 1
            MIprojectId = Nothing
            MIstatus = Nothing
            MIdeadline = Nothing
            MIdescription = Nothing
            MIcomments = Nothing
            MIresponsible = Nothing
            items = line(i).Trim.Split(vbTab)
            If items.Length = 6 Then
                Try
                    If Not ddlProjects.Items.FindByValue(items(0)) Is Nothing Then
                        MIprojectId = items(0)
                    Else
                        lblResults.InnerHtml += "Line " & i + 1 & " <b>error:</b>Wrong ProjectId.<br/>"
                        Exit Try
                    End If
                    MIdescription = items(1)
                    If Not ddlUsers.Items.FindByValue(items(2)) Is Nothing Then
                        MIresponsible = items(2)
                    Else
                        lblResults.InnerHtml += "Line " & i + 1 & " <b>error:</b>Wrong UserId.<br/>"
                        Exit Try
                    End If
                    MIdeadline = items(3)
                    If Not ddlStatus.Items.FindByValue(items(4)) Is Nothing Then
                        MIstatus = items(4)
                    Else
                        lblResults.InnerHtml += "Line " & i + 1 & " <b>error:</b>Wrong StatusId.<br/>"
                        Exit Try
                    End If
                    MIcomments = items(5)
                    sqldsAP.Insert()
                    lblResults.InnerHtml += "Line " & i + 1 & " <b>Ok</b>.<br/>"
                Catch ex As Exception
                    lblResults.InnerHtml += "Line " & i + 1 & " <b>error:</b>" & ex.Message & "<br/>"
                End Try
            Else
                lblResults.InnerHtml += "Line " & i + 1 & " <b>error:</b> Wrong line format.<br/>"
            End If
        Next
    End Sub

    Protected Sub sqldsAP_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsAP.Inserting
        e.Command.Parameters("@ProjectId").Value = MIprojectId
        e.Command.Parameters("@Description").Value = MIdescription
        e.Command.Parameters("@Responsible").Value = MIresponsible
        e.Command.Parameters("@Deadline").Value = MIdeadline
        e.Command.Parameters("@Status").Value = MIstatus
        e.Command.Parameters("@Comments").Value = MIcomments
    End Sub

    Protected Sub ddlProjects_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlProjects.SelectedIndexChanged
        lblProjectId.Value = IIf(ddlProjects.SelectedValue <> -1, ddlProjects.SelectedValue, "")
    End Sub
End Class
