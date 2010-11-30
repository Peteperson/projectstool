
Partial Class Users
    Inherits System.Web.UI.Page

    Private Password As String
    Private UsrId As Integer

    Protected Sub gvUsers_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvUsers.DataBound
        If gvUsers.Rows.Count > 0 Then
            CType(gvUsers.HeaderRow.FindControl("txtHeadUsrFilter"), TextBox).Text = txtUNameFilter.Text
            CType(gvUsers.HeaderRow.FindControl("txtHeadLstFilter"), TextBox).Text = txtLastNameFilter.Text
        End If
    End Sub
    Protected Sub gvUsers_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvUsers.RowCommand
        Select Case e.CommandName
            Case "Insert"
                sqldsUsers.Insert()
            Case "Filter"
                txtUNameFilter.Text = CType(gvUsers.HeaderRow.FindControl("txtHeadUsrFilter"), TextBox).Text
            Case "FilterLN"
                txtLastNameFilter.Text = CType(gvUsers.HeaderRow.FindControl("txtHeadLstFilter"), TextBox).Text
            Case "ResetPass"
                UsrId = e.CommandArgument
                sqldsUserTypes.Update()
        End Select
    End Sub

    Protected Sub sqldsUsers_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles sqldsUsers.Deleted
        gvUsers.SelectedIndex = -1
    End Sub

    Protected Sub sqldsUsers_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles sqldsUsers.Inserted
        With CType(Master.FindControl("lblMessage"), Label)
            .Visible = True
            .Text = "New user's password: " & Password
        End With
    End Sub

    Protected Sub sqldsUser_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsUsers.Inserting
        Password = SecCrypto.GeneratePassword(8)
        Dim un As String = CType(gvUsers.FooterRow.FindControl("txtInsUserName"), TextBox).Text
        Dim ut = CType(gvUsers.FooterRow.FindControl("ddlInsUserType"), DropDownList)
        e.Command.Parameters("@UserName").Value = IIf(un = "" And ut.SelectedItem.Text.ToLower = "client", "emp_" & SecCrypto.GeneratePasswordNoSpecialChrs(10), un)
        e.Command.Parameters("@Password").Value = SecCrypto.Hash(Password)
        e.Command.Parameters("@UserType").Value = ut.SelectedValue
        e.Command.Parameters("@FirstName").Value = CType(gvUsers.FooterRow.FindControl("txtInsFirstName"), TextBox).Text
        e.Command.Parameters("@LastName").Value = CType(gvUsers.FooterRow.FindControl("txtInsLastName"), TextBox).Text
        e.Command.Parameters("@Telephone").Value = CType(gvUsers.FooterRow.FindControl("txtInsTelephone"), TextBox).Text
        e.Command.Parameters("@Mobile").Value = CType(gvUsers.FooterRow.FindControl("txtInsMobile"), TextBox).Text
        e.Command.Parameters("@Email").Value = CType(gvUsers.FooterRow.FindControl("txtInsEmail"), TextBox).Text
        e.Command.Parameters("@DefaultPage").Value = CType(gvUsers.FooterRow.FindControl("ddlInsDefPage"), DropDownList).SelectedValue
        e.Command.Parameters("@IsUser").Value = CType(gvUsers.FooterRow.FindControl("chkIsUser"), CheckBox).Checked
    End Sub

    Protected Sub sqldsUsers_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles sqldsUsers.Selecting
        If txtUNameFilter.Text = "" Then e.Command.Parameters("@UserName").Value = System.DBNull.Value
        If txtLastNameFilter.Text = "" Then e.Command.Parameters("@LastName").Value = System.DBNull.Value
        If txtCompNameFilter.Text = "" Then e.Command.Parameters("@CompName").Value = System.DBNull.Value
    End Sub

    Protected Sub sqldsUserTypes_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles sqldsUserTypes.Updated
        With CType(Master.FindControl("lblMessage"), Label)
            .Visible = True
            .Text = "New user's password: " & Password
        End With
        gvUsers.DataBind()
    End Sub

    Protected Sub sqldsUserTypes_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsUserTypes.Updating
        Password = SecCrypto.GeneratePassword(8)
        e.Command.Parameters("@Password").Value = SecCrypto.Hash(Password)
        e.Command.Parameters("@Id").Value = UsrId
    End Sub

    Protected Sub btnclearFilters_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnclearFilters.Click
        txtLastNameFilter.Text = ""
        txtUNameFilter.Text = ""
        txtCompNameFilter.Text = ""
    End Sub

    Protected Sub gvUsers_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvUsers.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            If e.Row.RowState <> DataControlRowState.Insert Then
                For Each ctrl As System.Web.UI.Control In e.Row.Cells(0).Controls
                    Try
                        If ctrl.GetType Is GetType(ImageButton) Then
                            If CType(ctrl, ImageButton).ImageUrl.IndexOf("Remove") > 0 Then
                                CType(ctrl, ImageButton).Attributes("onclick") = "if(!confirm('Να διαγράψω την εγγραφή;'))return   false;"
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

    Protected Sub btnRemovePaging_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnRemovePaging.Click
        gvUsers.AllowPaging = Not gvUsers.AllowPaging
    End Sub

    Protected Sub sqldsCompanies_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsCompanies.Inserting
        If gvCompanies.Rows.Count > 0 Then
            e.Command.Parameters("@UserId").Value = gvUsers.SelectedValue
            e.Command.Parameters("@CompanyId").Value = CType(gvCompanies.FooterRow.FindControl("ddlUsrCompany"), DropDownList).SelectedValue
            e.Command.Parameters("@Position").Value = CType(gvCompanies.FooterRow.FindControl("ddlUsrPosition"), DropDownList).SelectedValue
            e.Command.Parameters("@Telephone").Value = CType(gvCompanies.FooterRow.FindControl("txtCmpTel"), TextBox).Text
            e.Command.Parameters("@Mobile").Value = CType(gvCompanies.FooterRow.FindControl("txtCmpMob"), TextBox).Text
            e.Command.Parameters("@Email").Value = CType(gvCompanies.FooterRow.FindControl("txtCmpMail"), TextBox).Text
        Else
            e.Command.Parameters("@UserId").Value = gvUsers.SelectedValue
            e.Command.Parameters("@CompanyId").Value = CType(gvCompanies.Controls(0).Controls(0).Controls(0).FindControl("ddlUsrCompany"), DropDownList).SelectedValue
            e.Command.Parameters("@Position").Value = CType(gvCompanies.Controls(0).Controls(0).Controls(0).FindControl("ddlUsrPosition"), DropDownList).SelectedValue
            e.Command.Parameters("@Telephone").Value = CType(gvCompanies.Controls(0).Controls(0).Controls(0).FindControl("txtCmpTel"), TextBox).Text
            e.Command.Parameters("@Mobile").Value = CType(gvCompanies.Controls(0).Controls(0).Controls(0).FindControl("txtCmpMob"), TextBox).Text
            e.Command.Parameters("@Email").Value = CType(gvCompanies.Controls(0).Controls(0).Controls(0).FindControl("txtCmpMail"), TextBox).Text
        End If
    End Sub

    Protected Sub sqldsCompanies_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsCompanies.Updating
        Dim ind As Integer = gvCompanies.EditIndex
        e.Command.Parameters("@CompanyNewId").Value = CType(gvCompanies.Rows(ind).FindControl("ddlUsrCompany"), DropDownList).SelectedValue
    End Sub

    Protected Sub gvCompanies_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvCompanies.RowCommand
        Select Case e.CommandName
            Case "Insert"
                sqldsCompanies.Insert()
        End Select
    End Sub

    Protected Sub gvCompanies_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvCompanies.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            If e.Row.RowState = DataControlRowState.Normal Or e.Row.RowState = DataControlRowState.Alternate Then
                For Each ctrl As System.Web.UI.Control In e.Row.Cells(0).Controls
                    Try
                        If ctrl.GetType Is GetType(ImageButton) Then
                            If CType(ctrl, ImageButton).ImageUrl.IndexOf("Remove") > 0 Then
                                CType(ctrl, ImageButton).Attributes("onclick") = "return ConfirmDelete()"
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

    Protected Sub Page_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete
        If gvUsers.SelectedIndex < 0 Then gvCompanies.Visible = False Else gvCompanies.Visible = True
        If Not IsPostBack Then
            If Request.Params("Company") <> "" Then txtCompNameFilter.Text = Request.Params("Company")
        End If
    End Sub

    Protected Sub btnSetCmp_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSetCmp.Click
        txtCompNameFilter.Text = ""
        If ddlCompanies.SelectedIndex > 0 Then txtCompNameFilter.Text = ddlCompanies.SelectedItem.Text
    End Sub

    Protected Sub ddlCompanies_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlCompanies.DataBound
        ddlCompanies.Items.Insert(0, "- Όλα -")
    End Sub
End Class
