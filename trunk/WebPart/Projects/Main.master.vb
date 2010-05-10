Partial Class Main
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim CurrPage As String = Request.AppRelativeCurrentExecutionFilePath.ToLower
        Dim Authorized As Boolean = False
        If Session("UserId") Is Nothing Then
            'If Not CurrPage.ToLower.EndsWith("error.aspx") Then Response.Redirect("~/Login.aspx")
            Response.Redirect("~/Login.aspx")
        Else
            lblUser.Text = Session("UserFullName") & " (" & Session("UserType") & ")"
            lblLogin.Text = CType(Session("LastLogin"), DateTime).ToString("dd/MM/yyyy HH:mm")
            For i As Integer = 0 To gvMenu.Rows.Count - 1
                If CType(gvMenu.Rows(i).FindControl("MenuLink"), WebControls.HyperLink).NavigateUrl.ToLower = CurrPage Then
                    Authorized = True
                    gvMenu.Rows(i).Cells(0).ControlStyle.BackColor = Drawing.Color.FromArgb(&H2C, &H48, &H6E)
                    CType(gvMenu.Rows(i).FindControl("MenuLink"), WebControls.HyperLink).ForeColor = Drawing.Color.White
                    Exit For
                End If
            Next
            If Not IsPostBack Then
                If Not Authorized And Not CurrPage.ToLower.EndsWith("error.aspx") Then
                    Database.InsertActivity(Request.UserHostAddress, Session("UserId"), Request.Url.ToString, LogStatus.DenyAccess)
                    Session("ErrorMessage") = "You do not have permission to view this page."
                    Response.Redirect("~/error.aspx")
                Else
                    RemoveFilters()
                    Database.InsertActivity(Request.UserHostAddress, Session("UserId"), Request.Url.ToString, LogStatus.Normal)
                End If
            End If
        End If
        lblMessage.Visible = False
    End Sub

    Protected Sub btnLogoff_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnLogoff.Click
        Session.Clear()
        Response.Redirect("~/Login.aspx")
    End Sub

    Private Sub RemoveFilters()

    End Sub
End Class

