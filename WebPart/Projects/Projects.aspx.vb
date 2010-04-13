
Partial Class Projects
    Inherits System.Web.UI.Page

    Protected Sub mnuProjects_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles mnuProjects.MenuItemClick
        For i As Integer = 0 To mnuProjects.Items.Count - 1
            If i = e.Item.Value Then
                'mnuProjects.Items(i).ImageUrl = mnuProjects.Items(i).ImageUrl
            Else
                'mnuProjects.Items(i).ImageUrl = ""
            End If
        Next
    End Sub
End Class
