
Partial Class SystemDesign
    Inherits System.Web.UI.Page

    Protected Sub btnFindPrj_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnFindPrj.Click
        If Not (ddlPrjCode.Items.FindByText(txtPrjId.Text)) Is Nothing Then
            ddlPrjCode.SelectedValue = ddlPrjCode.Items.FindByText(txtPrjId.Text).Value
        Else
            With CType(Master.FindControl("lblMessage"), Label)
                .Visible = True
                .Text = "The project does not exist!"
            End With
        End If
    End Sub
End Class
