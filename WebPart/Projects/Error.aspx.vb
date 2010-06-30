
Partial Class [Error]
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Session("ErrorMessage") Is Nothing Then
            Dim msg As String = Session("ErrorMessage").ToString

            If msg.Contains("Cannot insert duplicate key") Then
                lblError.Text = "Διπλή εγγραφή. Η εισαγωγή δεν μπορεί να πραγματοποιηθεί."
            ElseIf msg.Contains("Cannot insert the value NULL into column") Then
                lblError.Text = "Δεν συμπληρώσατε όλα τα πεδία. Η εισαγωγή δεν μπορεί να πραγματοποιηθεί."
            ElseIf msg.Contains("Maximum request length exceeded") Then
                lblError.Text = "Η τελευταία ενέργεια απέτυχε γιατί ξεπέρασε τον μέγιστο επιτρεπόμενο χρόνο."
            ElseIf msg.Contains("The DELETE statement conflicted with the REFERENCE constraint") Then
                lblError.Text = "Δεν μπορείτε να διαγράψετε την συγκεκριμένη εγγραφή γιατί υπάρχουν συσχετισμένες εγγραφές σε άλλους πίνακες."
            ElseIf msg.Contains("permission was denied on the object") Then
                lblError.Text = "Δεν έχετε επαρκή δικαιώματα για να εκτελέσετε τη συγκεκριμένη ενέργεια."
            ElseIf msg.Contains("'ddlPrjCode' has a SelectedValue which is invalid because it does not exist") Then
                lblError.Text = "Δεν έχετε επαρκή δικαιώματα για να δείτε το συγκεκριμένο έργο."
            Else
                lblError.Text = msg
            End If
        End If
    End Sub
End Class
