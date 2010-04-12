Partial Class Main
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserId") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            lblUser.Text = Session("UserFullName") & " (" & Session("UserType") & ")"
            lblLogin.Text = CType(Session("LastLogin"), DateTime).ToString("dd/MM/yyyy HH:mm")
            Dim CurrPage As String = Request.AppRelativeCurrentExecutionFilePath.ToLower
            For i As Integer = 0 To gvMenu.Rows.Count - 1
                If CType(gvMenu.Rows(i).FindControl("MenuLink"), WebControls.HyperLink).NavigateUrl.ToLower = CurrPage Then
                    gvMenu.Rows(i).Cells(0).ControlStyle.BackColor = Drawing.Color.FromArgb(&H2C, &H48, &H6E)
                    CType(gvMenu.Rows(i).FindControl("MenuLink"), WebControls.HyperLink).ForeColor = Drawing.Color.White
                    Exit For
                End If
            Next
        End If
    End Sub

    Protected Sub btnLogoff_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnLogoff.Click
        Session.Clear()
        Response.Redirect("~/Login.aspx")
    End Sub
End Class

