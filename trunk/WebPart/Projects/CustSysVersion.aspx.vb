
Partial Class CustSysVersion
    Inherits System.Web.UI.Page

    Protected Sub btnRemovePaging_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnRemovePaging.Click
        gvProcesses.AllowPaging = Not gvProcesses.AllowPaging
    End Sub
End Class
