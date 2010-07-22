Imports System.Data.SqlClient
Imports System.Data

Partial Class Files
    Inherits System.Web.UI.Page

    Protected Sub gvFiles_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvFiles.DataBound
        If gvFiles.Rows.Count > 0 Then CType(gvFiles.HeaderRow.FindControl("txtHeadFFilter"), TextBox).Text = txtPrjId.Text
    End Sub

    Protected Sub gvFiles_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvFiles.RowCommand
        Select Case e.CommandName
            Case "Insert"
                sqldsFiles.Insert()
            Case "Download"
                Session("DownloadFileId") = e.CommandArgument
                Session("TableName") = "Attachments"
                Response.Clear()
                Response.Redirect("~/DownloadFile.ashx")
            Case "SelSubProject"
                Session("ProjectId") = e.CommandArgument
                Response.Clear()
                Response.Redirect("~/Projects.aspx")
            Case "Filter"
                txtPrjId.Text = CType(gvFiles.HeaderRow.FindControl("txtHeadFFilter"), TextBox).Text
        End Select
    End Sub

    Protected Sub sqldsFiles_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsFiles.Inserting
        e.Command.Parameters("@ProjectId").Value = CType(gvFiles.FooterRow.FindControl("ddlPrjCode"), DropDownList).SelectedValue
        e.Command.Parameters("@AttachmentName").Value = CType(gvFiles.FooterRow.FindControl("fuCtrl"), FileUpload).FileName
        e.Command.Parameters("@Attachment").Value = CType(gvFiles.FooterRow.FindControl("fuCtrl"), FileUpload).FileBytes
        e.Command.Parameters("@Comments").Value = CType(gvFiles.FooterRow.FindControl("txtAttachComment"), TextBox).Text
    End Sub

    Protected Sub sqldsFiles_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles sqldsFiles.Selecting
        If txtPrjId.Text = "" Then
            Dim DeleteParam As System.Data.Common.DbParameter
            DeleteParam = e.Command.Parameters("@SubProject")
            e.Command.Parameters.Remove(DeleteParam)
        End If
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

    Protected Sub gvFiles_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvFiles.RowDataBound
        InsertDeleteValidation(e, 0)
    End Sub

    'Protected Sub sqldsFiles_Deleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsFiles.Deleting
    '    Response.Write("<hr/>")

    '    Response.Write(e.Command.Parameters.Count)
    '    Response.Write("<br/>")
    '    Response.Write(e.Command.CommandText)
    '    Response.Write("<br/>")
    '    For Each p As SqlClient.SqlParameter In e.Command.Parameters
    '        Response.Write(p.ParameterName)
    '        Response.Write(":")
    '        Response.Write(p.DbType.ToString)
    '        Response.Write("=")
    '        Response.Write(p.Value)
    '        Response.Write("<br/>")
    '    Next

    '    Response.End()

    'End Sub


    Protected Sub sqldsFiles_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles sqldsFiles.Updating
        'Response.Write(sqldsFiles.UpdateParameters.Count)
        'Response.Write("<br/>")
        'For i = 0 To 1
        '    Response.Write(sqldsFiles.UpdateParameters(i).Name)
        '    Response.Write(":")
        '    Response.Write(sqldsFiles.UpdateParameters(i).Type.ToString)
        '    Response.Write("<br/>")
        'Next

        'Response.Write("<hr/>")

        'Response.Write(e.Command.Parameters.Count)
        'Response.Write("<br/>")
        'Response.Write(e.Command.CommandText)
        'Response.Write("<br/>")
        'For Each p As SqlClient.SqlParameter In e.Command.Parameters
        '    Response.Write(p.ParameterName)
        '    Response.Write(":")
        '    Response.Write(p.DbType.ToString)
        '    Response.Write("=")
        '    Response.Write(p.Value)
        '    Response.Write("<br/>")
        'Next


        'Response.End()

        Dim id As Integer = e.Command.Parameters("@id").Value
        Dim comments As String = e.Command.Parameters("@Comments").Value

        e.Command.Parameters.Clear()
        With e.Command.Parameters
            .Add(New SqlParameter("@id", SqlDbType.Int))
            .Add(New SqlParameter("@Comments", SqlDbType.NVarChar, 500))
            .Item("@id").Value = id
            .Item("@Comments").Value = comments
        End With
    End Sub

    Protected Sub btnPrint_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnPrint.Click
        CType(Me.Master, Main).HideAndPrint()
    End Sub

    Protected Sub btnRemovePaging1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnRemovePaging1.Click
        gvFiles.AllowPaging = Not gvFiles.AllowPaging
    End Sub
End Class
