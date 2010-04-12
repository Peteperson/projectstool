
Partial Class MainPanel
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        With CType(Master.FindControl("gvMenu"), WebControls.GridView)
            If .Rows.Count > 1 Then
                .Rows(2).Cells(0).ControlStyle.BackColor = Drawing.Color.FromArgb(&H35, &H53, &H79)
                'CType(.Rows(2).Cells(0).Controls(0), Web.UI.LiteralControl).ForeColor = Drawing.Color.White
            End If
        End With
    End Sub
End Class
