Imports System.Net.Mail

Partial Class ViewLogs
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            clndTo.SelectedDate = Today
            clndFrom.SelectedDate = Today
        End If
    End Sub

    Protected Sub btnEmail_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEmail.Click
        Dim mMailMessage As New MailMessage()
        mMailMessage.From = New MailAddress(txtEmailFrom.Text)
        Dim tolist() As String = txtEmailTo.Text.Split(";")
        For Each s As String In tolist
            mMailMessage.To.Add(New MailAddress(s))
        Next
        'If Not bcc Is Nothing And bcc <> String.Empty Then
        '    mMailMessage.Bcc.Add(New MailAddress(bcc))
        'End If
        'If Not cc Is Nothing And cc <> String.Empty Then
        '    mMailMessage.CC.Add(New MailAddress(cc))
        'End If
        mMailMessage.Subject = txtEmailSbj.Text
        mMailMessage.Body = txtEmailBody.Text
        mMailMessage.IsBodyHtml = True
        mMailMessage.Priority = MailPriority.Normal
        Dim mSmtpClient As New SmtpClient()
        mSmtpClient.Send(mMailMessage)
    End Sub
End Class
