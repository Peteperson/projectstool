Partial Class Main
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserId") Is Nothing Then Response.Redirect("~/Login.aspx")
    End Sub

    Protected Sub btnLogoff_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnLogoff.Click
        Session.Clear()
        Response.Redirect("~/Login.aspx")
    End Sub
End Class

