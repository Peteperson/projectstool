
Partial Class ViewErrors
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            clndTo.SelectedDate = Today
            clndFrom.SelectedDate = Today
        End If
    End Sub

    Protected Sub Page_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete
        Dim out As String = ""
        Dim t As Type = Session.GetType
        Dim pi() As System.Reflection.PropertyInfo = t.GetProperties
        For Each propinfo In pi
            Try
                out &= propinfo.Name.ToString & " = " & propinfo.GetValue(Session, Nothing).ToString & "<br/>"
            Catch ex As Exception
                out &= "error<br/>"
            End Try
        Next
        litInfo.Text = out
    End Sub
End Class
