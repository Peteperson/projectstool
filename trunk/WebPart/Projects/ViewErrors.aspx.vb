
Partial Class ViewErrors
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            clndTo.SelectedDate = Today
            clndFrom.SelectedDate = Today.AddDays(-3)
        End If
    End Sub
End Class
