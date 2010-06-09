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

    Private AcceptableStrings As ArrayList = GetAcceptableValues()
    Private Function GetAcceptableValues() As ArrayList
        Dim al As New ArrayList
        al.Add("")
        al.Add("Ολοκληρωμένο")
        Return al
    End Function
    Public Sub FormatDateCell(ByVal FieldName As String, ByVal PrmIdx As Byte, ByVal CompareFieldName As String, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        Dim drv As System.Data.DataRowView = e.Row.DataItem
        Dim dt As DateTime = drv.Item(FieldName)
        Dim stat As String = ""
        If CompareFieldName <> "" Then stat = drv.Item(CompareFieldName).ToString.Trim()
        If dt <= Today And Not AcceptableStrings.Contains(stat) Then e.Row.Cells(PrmIdx).CssClass = "RedDate"
        If dt.Date = Today And Not AcceptableStrings.Contains(stat) Then e.Row.Cells(PrmIdx).CssClass = "BoldDate"
    End Sub
End Module

Public Enum CngPassResult
    Success
    WrongOldPass
    OtherError
End Enum