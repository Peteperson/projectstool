
Partial Class Employees
    Inherits System.Web.UI.Page

    Protected Sub gvEmployees_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvEmployees.RowCommand
        If e.CommandName = "Insert" Then sqldsEmployees.Insert()
    End Sub

    Protected Sub gvEmployees_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvEmployees.RowDataBound
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

    Protected Sub sqldsemployees_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsEmployees.Inserting
        e.Command.Parameters("@EmployeeType").Value = CType(gvEmployees.FooterRow.FindControl("ddlInsEmpType"), DropDownList).SelectedValue
        e.Command.Parameters("@FirstName").Value = CType(gvEmployees.FooterRow.FindControl("txtInsFirstName"), TextBox).Text
        e.Command.Parameters("@LastName").Value = CType(gvEmployees.FooterRow.FindControl("txtInsLastName"), TextBox).Text
        e.Command.Parameters("@Hired").Value = CType(gvEmployees.FooterRow.FindControl("txtInsHired"), TextBox).Text
        e.Command.Parameters("@Active").Value = CType(gvEmployees.FooterRow.FindControl("cbInsActive"), CheckBox).Checked
    End Sub
End Class
