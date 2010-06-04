Partial Class Main
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        form1.Attributes.Add("onsubmit", "ShowPleaseWait()")
        Dim CurrPage As String = Request.AppRelativeCurrentExecutionFilePath.ToLower
        Dim Authorized As Boolean = False
        If Session("UserId") Is Nothing Then
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
                    Session("ErrorMessage") = "You do not have permission to view this page."
                    Try
                        Database.InsertActivity(Request.UserHostAddress, Session("UserId"), Request.Url.ToString, LogStatus.DenyAccess)
                    Catch ex As Exception
                        Session("ErrorMessage") = ex.Message
                    End Try
                    Response.Redirect("~/error.aspx")
                Else
                    Try
                        Database.InsertActivity(Request.UserHostAddress, Session("UserId"), Request.Url.ToString, LogStatus.Normal)
                    Catch ex As Exception
                        Session("ErrorMessage") = ex.Message
                        Response.Redirect("~/error.aspx")
                    End Try
                End If
            End If
        End If
        lblMessage.Visible = False
    End Sub

    Protected Sub btnLogoff_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnLogoff.Click
        Session.Clear()
        Response.Redirect("~/Login.aspx")
    End Sub
End Class

