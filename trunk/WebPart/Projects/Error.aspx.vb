
Partial Class [Error]
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblError.Text = Session("ErrorMessage").ToString
    End Sub
End Class
