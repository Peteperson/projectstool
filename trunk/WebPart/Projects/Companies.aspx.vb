
Partial Class Companies
    Inherits System.Web.UI.Page

    Protected Sub gvCompanies_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvCompanies.RowCommand
        If e.CommandName = "Insert" Then sqldsCompanies.Insert()
    End Sub

    Protected Sub gvCompanies_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvCompanies.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            If e.Row.RowState = DataControlRowState.Normal Or e.Row.RowState = DataControlRowState.Alternate Then
                For Each ctrl As System.Web.UI.Control In e.Row.Cells(0).Controls
                    Try
                        If ctrl.GetType Is GetType(ImageButton) Then
                            If CType(ctrl, ImageButton).ImageUrl.IndexOf("Remove") > 0 Then
                                CType(ctrl, ImageButton).Attributes("onclick") = "if(!confirm('Really delete this row?'))return   false;"
                            End If
                        End If
                    Catch ex As Exception
                        With CType(Master.FindControl("lblMessage"), Label)
                            .Visible = True
                            .Text = ex.Message
                        End With
                    End Try
                Next
            End If
        End If
    End Sub

    Protected Sub sqldsCompanies_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsCompanies.Inserting
        e.Command.Parameters("@Name").Value = CType(gvCompanies.FooterRow.FindControl("txtInsName"), TextBox).Text
        e.Command.Parameters("@ContactPerson").Value = CType(gvCompanies.FooterRow.FindControl("txtInsContactPerson"), TextBox).Text
        e.Command.Parameters("@TelephoneNo").Value = CType(gvCompanies.FooterRow.FindControl("txtInsTelNo"), TextBox).Text
        e.Command.Parameters("@Mobile").Value = CType(gvCompanies.FooterRow.FindControl("txtInsMobile"), TextBox).Text
        e.Command.Parameters("@Mail").Value = CType(gvCompanies.FooterRow.FindControl("txtInsMail"), TextBox).Text
    End Sub

End Class
