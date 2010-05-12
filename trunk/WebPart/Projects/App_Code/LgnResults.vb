Imports Microsoft.VisualBasic

Public Class LgnResult
    Public Status As LoginResultStatus
    Public Id As Integer
    Public LastLogin As Date
    Public UserFullName As String
    Public UserName As String
    Public UserType As String
    Public DefPage As String
End Class

Public Class ChkEmailResult
    Public UserId As Int16
    Public Username As String
End Class