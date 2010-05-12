Imports Microsoft.VisualBasic
Imports System.Globalization

Public Enum LoginResultStatus
    Success
    InvalidCredentials
    LockedUser
    PasswordExpired
    ChangePassword
    AlreadyLoggedIn
    ExpiredUser
End Enum

Public Enum Gender
    Male
    Female
End Enum

Public Enum LogStatus
    Normal = 1
    DenyAccess = 2
    PassReset = 3
End Enum

Public Module Support
    Private provider As CultureInfo = CultureInfo.InvariantCulture
    'Public Function ReadDate(ByVal input As String) As DateTime
    '    Dim tail As String = " 00:00:00"
    '    input = input & tail.Substring(input.Length - 10)
    '    Return DateTime.ParseExact(input, "dd/MM/yyyy HH:mm:ss", provider)
    'End Function

    Public Sub FormatDateCell(ByVal FieldName As String, ByVal idx As Byte, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            If e.Row.RowState = DataControlRowState.Normal Or e.Row.RowState = DataControlRowState.Alternate Then
                Dim drv As System.Data.DataRowView = e.Row.DataItem
                Dim dt As DateTime = drv.Item(FieldName)
                If dt <= Today Then e.Row.Cells(idx).CssClass = "RedDate"
            End If
        End If
    End Sub
End Module

Public Enum CngPassResult
    Success
    WrongOldPass
    OtherError
End Enum