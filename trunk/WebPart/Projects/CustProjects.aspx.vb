
Partial Class CustProjects
    Inherits System.Web.UI.Page

    Protected Sub mnuProjects_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles mnuProjects.MenuItemClick
        SetTabImage(e.Item.Value)
        ShowTab(e.Item.Value)
    End Sub

    Private Sub SetTabImage(ByVal TabId As Byte)
        Dim SelImages() As String = {"~/Images/ActionPlanSelected5.png", "~/Images/MeetingsSelected5.png", "~/Images/AttachmentsSelected5.png"}
        Dim UnselImages() As String = {"~/Images/ActionPlanUnselected5.png", "~/Images/MeetingsUnselected5.png", "~/Images/AttachmentsUnselected5.png"}
        For i As Integer = 0 To mnuProjects.Items.Count - 1
            If i = TabId Then
                mnuProjects.Items(i).ImageUrl = SelImages(i)
            Else
                mnuProjects.Items(i).ImageUrl = UnselImages(i)
            End If
        Next
    End Sub

    Private Sub ShowTab(ByVal TabId As Byte)
        Select Case TabId
            Case 0
                gvAP.Visible = True
                gvAP.DataBind()
                gvMeetings.Visible = False
                gvAttachments.Visible = False
            Case 1
                gvAP.Visible = False
                gvMeetings.Visible = True
                gvMeetings.DataBind()
                gvAttachments.Visible = False
            Case 2
                gvAP.Visible = False
                gvMeetings.Visible = False
                gvAttachments.Visible = True
                gvAttachments.DataBind()
        End Select
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        gvAP.Visible = True
        gvMeetings.Visible = False
        gvAttachments.Visible = False
    End Sub

    Protected Sub gvProjects_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvProjects.SelectedIndexChanged
        SetTabImage(0)
    End Sub

    Protected Sub gvMeetings_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvMeetings.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            If e.Row.RowState = DataControlRowState.Normal Or e.Row.RowState = DataControlRowState.Alternate Or e.Row.RowState = DataControlRowState.Selected Then
                If CType(e.Row.FindControl("btnDown"), ImageButton).ToolTip = "" Then
                    CType(e.Row.FindControl("btnDown"), ImageButton).Visible = False
                End If
            End If
        End If
    End Sub

    Protected Sub gvAP_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvAP.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            If e.Row.RowState = DataControlRowState.Normal Or e.Row.RowState = DataControlRowState.Alternate Or e.Row.RowState = DataControlRowState.Selected Then
                If CType(e.Row.FindControl("btnDown"), ImageButton).ToolTip = "" Then
                    CType(e.Row.FindControl("btnDown"), ImageButton).Visible = False
                End If
            End If
        End If
    End Sub
End Class
