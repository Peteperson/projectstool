Partial Class Main
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim CurrPage As String = Request.AppRelativeCurrentExecutionFilePath.ToLower
        If Not Session("CurrPage") Is Nothing Then
            If Session("CurrPage").EndsWith("actionplans.aspx") Then
                RemoveFilters(1)
            ElseIf Session("CurrPage").EndsWith("meetings.aspx") Then
                RemoveFilters(2)
            ElseIf Session("CurrPage").EndsWith("projects.aspx") Then
                RemoveFilters(3)
            End If
        End If
        Session("CurrPage") = CurrPage.ToLower
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

    Private Sub RemoveFilters(ByVal ind As Byte)
        Select Case ind
            Case 1
                Session("ActionPlanId") = -1
            Case 2
                Session("MeetingId") = -1
            Case 3
                Session("ProjectId") = -1
        End Select
    End Sub
End Class

