
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        SqlDataSource1.Insert()
    End Sub

    Protected Sub SqlDataSource1_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Inserted
        GridView1.DataBind()
    End Sub

    Protected Sub SqlDataSource1_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource1.Inserting
        e.Command.Parameters("@Name").Value = TextBox1.Text
        e.Command.Parameters("@Description").Value = TextBox2.Text
    End Sub
End Class
