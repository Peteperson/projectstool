
Partial Class MassiveImport
    Inherits System.Web.UI.Page

    Protected Sub ddlStatus_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlStatus.DataBound
        ddlStatus.Items.Insert(0, " ")
    End Sub

    Protected Sub ddlProjects_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlProjects.DataBound
        ddlProjects.Items.Insert(0, " ")
    End Sub

    Private MIprojectId, MIstatus As Integer
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
            items = line(i).Trim.Split(vbTab)
            If items.Length = 5 Then
                Try
                    If Not ddlProjects.Items.FindByValue(items(0)) Is Nothing Then
                        MIprojectId = items(0)
                    Else
                        lblResults.InnerHtml += "Line " & i + 1 & " <b>error:</b>Wrong ProjectId.<br/>"
                        Exit Try
                    End If
                    MIdescription = items(1)
                    MIdeadline = items(2)
                    If Not ddlStatus.Items.FindByValue(items(3)) Is Nothing Then
                        MIstatus = items(3)
                    Else
                        lblResults.InnerHtml += "Line " & i + 1 & " <b>error:</b>Wrong StatusId.<br/>"
                        Exit Try
                    End If
                    MIcomments = items(4)
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
        e.Command.Parameters("@Deadline").Value = MIdeadline
        e.Command.Parameters("@Status").Value = MIstatus
        e.Command.Parameters("@Comments").Value = MIcomments
    End Sub
End Class
