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

Public Module Support
    Private provider As CultureInfo = CultureInfo.InvariantCulture
    Public Function ReadDate(ByVal input As String) As DateTime
        Dim tail As String = " 00:00:00"
        input = input & tail.Substring(input.Length - 10)
        Return DateTime.ParseExact(input, "dd/MM/yyyy HH:mm:ss", provider)
    End Function
End Module

Public Enum CngPassResult
    Success
    WrongOldPass
    OtherError
End Enum