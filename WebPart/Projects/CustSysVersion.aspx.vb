
Partial Class CustSysVersion
    Inherits System.Web.UI.Page

    Protected Sub btnRemovePaging1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnRemovePaging1.Click
        gvProcesses.AllowPaging = Not gvProcesses.AllowPaging
    End Sub

    Protected Sub btnPrint_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnPrint.Click
        CType(Me.Master, Main).HideAndPrint()
    End Sub
End Class
