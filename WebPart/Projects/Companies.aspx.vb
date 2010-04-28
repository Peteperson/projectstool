
Partial Class Companies
    Inherits System.Web.UI.Page

    Protected Sub gvCompanies_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvCompanies.RowCommand
        Select Case e.CommandName
            Case "Insert"
                sqldsCompanies.Insert()
            Case "Select"
                gvCompEmpl.Visible = True
        End Select
    End Sub

    Protected Sub gvCompEmpl_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvCompEmpl.RowCommand
        Select Case e.CommandName
            Case "Insert"
                sqldsCompEmployees.Insert()
        End Select
    End Sub

    Protected Sub sqldsCompanies_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsCompanies.Inserting
        e.Command.Parameters("@Name").Value = CType(gvCompanies.FooterRow.FindControl("txtCompName"), TextBox).Text
        e.Command.Parameters("@Description").Value = CType(gvCompanies.FooterRow.FindControl("txtCompDesc"), TextBox).Text
    End Sub

    Private Sub InsertDeleteValidation(ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs, ByVal col As Byte)
        If e.Row.RowType = DataControlRowType.DataRow Then
            If e.Row.RowState = DataControlRowState.Normal Or e.Row.RowState = DataControlRowState.Alternate Then
                For Each ctrl As System.Web.UI.Control In e.Row.Cells(col).Controls
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

    Protected Sub gvCompanies_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvCompanies.RowDataBound
        InsertDeleteValidation(e, 0)
    End Sub

    Protected Sub gvCompEmpl_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvCompEmpl.RowDataBound
        InsertDeleteValidation(e, 0)
    End Sub

    Protected Sub sqldsCompEmployees_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsCompEmployees.Inserting
        If gvCompEmpl.Rows.Count > 0 Then
            e.Command.Parameters("@CompanyId").Value = gvCompanies.SelectedValue
            e.Command.Parameters("@LastName").Value = CType(gvCompEmpl.FooterRow.FindControl("txt2LastName"), TextBox).Text
            e.Command.Parameters("@FirstName").Value = CType(gvCompEmpl.FooterRow.FindControl("txt2FirstName"), TextBox).Text
            e.Command.Parameters("@Position").Value = CType(gvCompEmpl.FooterRow.FindControl("ddl2Position"), DropDownList).SelectedValue
            e.Command.Parameters("@Telephone").Value = CType(gvCompEmpl.FooterRow.FindControl("txt2Tel"), TextBox).Text
            e.Command.Parameters("@Mobile").Value = CType(gvCompEmpl.FooterRow.FindControl("txt2MobTel"), TextBox).Text
            e.Command.Parameters("@Email").Value = CType(gvCompEmpl.FooterRow.FindControl("txt2Email"), TextBox).Text
        Else
            e.Command.Parameters("@CompanyId").Value = gvCompanies.SelectedValue
            e.Command.Parameters("@LastName").Value = CType(gvCompEmpl.Controls(0).Controls(0).Controls(0).FindControl("txt1LastName"), TextBox).Text
            e.Command.Parameters("@FirstName").Value = CType(gvCompEmpl.Controls(0).Controls(0).Controls(0).FindControl("txt1FirstName"), TextBox).Text
            e.Command.Parameters("@Position").Value = CType(gvCompEmpl.Controls(0).Controls(0).Controls(0).FindControl("ddl1Position"), DropDownList).SelectedValue
            e.Command.Parameters("@Telephone").Value = CType(gvCompEmpl.Controls(0).Controls(0).Controls(0).FindControl("txt1Tel"), TextBox).Text
            e.Command.Parameters("@Mobile").Value = CType(gvCompEmpl.Controls(0).Controls(0).Controls(0).FindControl("txt1MobTel"), TextBox).Text
            e.Command.Parameters("@Email").Value = CType(gvCompEmpl.Controls(0).Controls(0).Controls(0).FindControl("txt1email"), TextBox).Text
        End If
    End Sub

    Protected Sub gvCompanies_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvCompanies.SelectedIndexChanged
        lblCompName2.Text = gvCompanies.SelectedDataKey.Values("Name")
    End Sub
End Class
