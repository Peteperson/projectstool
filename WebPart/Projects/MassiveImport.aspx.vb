
Partial Class MassiveImport
    Inherits System.Web.UI.Page

    Protected Sub ddlStatus_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlStatus.DataBound
        ddlStatus.Items.Insert(0, " ")
    End Sub

    Protected Sub ddlProjects_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlProjects.DataBound
        Dim li As ListItem = New ListItem(" ", "-1")
        ddlProjects.Items.Insert(0, li)
    End Sub

    Private MIprojectId, MIstatus, MIresponsible1, MIresponsible2 As Integer
    Private MIdeadline As Date
    Private MIdescription, MIcomments As String

    Protected Sub btnImport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnImport.Click
        If ImportData(True) Then ImportData(False) Else lblResults.InnerHtml += "Process aborted. All records <U>were not imported<U/>.<br/>"
    End Sub

    Private Function ImportData(ByVal PerformCheck As Boolean) As Boolean
        lblResults.InnerHtml = IIf(PerformCheck, "Check results:<br />", "Import results:<br />")
        Dim ret As Boolean = True
        Dim line() As String = txtData.Text.Split(vbCrLf.ToCharArray, StringSplitOptions.RemoveEmptyEntries)
        Dim items() As String
        For i As Integer = 0 To line.Length - 1
            MIprojectId = Nothing
            MIstatus = Nothing
            MIdeadline = Nothing
            MIdescription = Nothing
            MIcomments = Nothing
            MIresponsible1 = Nothing
            MIresponsible2 = Nothing
            items = line(i).Split(vbTab)
            If items.Length = 7 Or items.Length = 6 Then
                Try
                    If Not ddlProjects.Items.FindByValue(items(0)) Is Nothing Then
                        MIprojectId = items(0)
                    Else
                        lblResults.InnerHtml += "Line " & i + 1 & " <b>error:</b>Wrong ProjectId.<br/>"
                        ret = False
                        Exit Try
                    End If
                    MIdescription = items(1)
                    If Not ddlUsers.Items.FindByValue(items(2)) Is Nothing Then
                        MIresponsible1 = items(2)
                    Else
                        lblResults.InnerHtml += "Line " & i + 1 & " <b>error:</b>Wrong User1Id.<br/>"
                        ret = False
                        Exit Try
                    End If
                    If Not ddlUsers.Items.FindByValue(items(3)) Is Nothing Then
                        MIresponsible2 = items(3)
                    Else
                        lblResults.InnerHtml += "Line " & i + 1 & " <b>error:</b>Wrong User2Id.<br/>"
                        ret = False
                        Exit Try
                    End If
                    MIdeadline = items(4)
                    If Not ddlStatus.Items.FindByValue(items(5)) Is Nothing Then
                        MIstatus = items(5)
                    Else
                        lblResults.InnerHtml += "Line " & i + 1 & " <b>error:</b>Wrong StatusId.<br/>"
                        ret = False
                        Exit Try
                    End If
                    If items.Length = 7 Then MIcomments = items(6) Else MIcomments = ""
                    If Not PerformCheck Then sqldsAP.Insert()
                    lblResults.InnerHtml += "Line " & i + 1 & " <b>Ok</b>.<br/>"
                Catch ex As Exception
                    lblResults.InnerHtml += "Line " & i + 1 & " <b>error:</b>" & ex.Message & "<br/>"
                    ret = False
                End Try
            Else
                lblResults.InnerHtml += "Line " & i + 1 & " <b>error:</b> Wrong line format.<br/>"
                ret = False
            End If
        Next
        Return ret
    End Function

    Protected Sub sqldsAP_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsAP.Inserting
        e.Command.Parameters("@ProjectId").Value = MIprojectId
        e.Command.Parameters("@Description").Value = MIdescription
        e.Command.Parameters("@Responsible1").Value = MIresponsible1
        e.Command.Parameters("@Responsible2").Value = MIresponsible2
        e.Command.Parameters("@Deadline").Value = MIdeadline
        e.Command.Parameters("@Status").Value = MIstatus
        e.Command.Parameters("@Comments").Value = MIcomments
    End Sub

    Protected Sub ddlProjects_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlProjects.SelectedIndexChanged
        lblProjectId.Value = IIf(ddlProjects.SelectedValue <> -1, ddlProjects.SelectedValue, "")
    End Sub
End Class
