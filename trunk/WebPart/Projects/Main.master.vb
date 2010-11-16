Partial Class Main
    Inherits System.Web.UI.MasterPage

    Private CurrPage As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        form1.Attributes.Add("onsubmit", "ShowPleaseWait()")
        CurrPage = Request.AppRelativeCurrentExecutionFilePath.ToLower
        Dim Authorized As Boolean = True
        If Session("UserId") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        Else
            lblUser.Text = Session("UserFullName") & " (" & Session("UserType") & ")"
            lblLogin.Text = CType(Session("LastLogin"), DateTime).ToString("dd/MM/yyyy HH:mm")
            For i As Integer = 0 To rptMenu.Items.Count - 1
                If CType(rptMenu.Items(i).FindControl("MenuLink"), WebControls.HyperLink).NavigateUrl.ToLower = CurrPage Then
                    Authorized = True
                    'rptMenu.Items(i).Cells(0).ControlStyle.BackColor = Drawing.Color.FromArgb(&H2C, &H48, &H6E)
                    CType(rptMenu.Items(i).FindControl("MenuLink"), WebControls.HyperLink).ForeColor = Drawing.Color.White
                    Exit For
                End If
            Next
            If Not IsPostBack Then
                If Not Authorized And Not CurrPage.EndsWith("error.aspx") And Not CurrPage.EndsWith("mainpanel.aspx") Then
                    Session("ErrorMessage") = "You do not have permission to view this page."
                    Try
                        Database.InsertActivity(Request.UserHostAddress, Session("UserId"), Request.Url.ToString, LogStatus.DenyAccess, Request.Browser.Browser)
                    Catch ex As Exception
                        Session("ErrorMessage") = ex.Message
                    End Try
                    Response.Redirect("~/error.aspx")
                Else
                    Try
                        Database.InsertActivity(Request.UserHostAddress, Session("UserId"), Request.Url.ToString, LogStatus.Normal, Request.Browser.Browser)
                    Catch ex As Exception
                        Session("ErrorMessage") = ex.Message
                        Response.Redirect("~/error.aspx")
                    End Try
                End If
            End If
        End If
        lblMessage.Visible = False
        ltrMessage.Text = "<marquee scrolldelay='150' style='width:100%; color: black'>" & Session("Message") & "</marquee>"
    End Sub

    Protected Sub btnLogoff_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnLogoff.Click
        Session.Clear()
        Response.Redirect("~/Login.aspx")
    End Sub

    Public Sub HideAndPrint()
        tdMenu.Style.Add("display", "none")
        'CType(FindControlRecursively(form1, id), GridView).AllowPaging = False
        FindControlRecursively(form1, "btnPrint").Visible = False
        FindControlRecursively(form1, "btnRemovePaging").Visible = False
        form1.Style.Add("background-color", "white")

        Page.ClientScript.RegisterStartupScript(Me.GetType(), "Javascript", "javascript: PrintPage(); ", True)
    End Sub

    Public Function FindControlRecursively(ByVal ParentControl As Control, ByVal ControlTobeSearched As String) As Control
        Dim FoundControl As New Control
        For Each CurrentControl As Control In ParentControl.Controls
            Diagnostics.Debug.WriteLine(CurrentControl.ID)
            If (CurrentControl.ID = ControlTobeSearched) Then
                FoundControl = CurrentControl
                Exit For
            End If
            If (CurrentControl.HasControls) Then
                FoundControl = FindControlRecursively(CurrentControl, ControlTobeSearched)
            End If
        Next
        Return FoundControl
    End Function

    Public Function CheckSelection(ByVal CurrentLink As String) As String
        Return IIf(CurrPage = CurrentLink.ToLower, "MenuItemSelected", "MenuItem")
    End Function
End Class

