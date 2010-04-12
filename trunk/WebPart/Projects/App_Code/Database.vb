Imports Microsoft.VisualBasic

Imports System.Data
Public Module Database
    Function DoLogin(ByVal username As String, ByVal password As Byte(), ByVal ip As String) As LgnResult
        Dim cmdDoLogin As SqlClient.SqlCommand
        Dim result As New LgnResult

        cmdDoLogin = New SqlClient.SqlCommand("DoLogin")
        cmdDoLogin.CommandType = CommandType.StoredProcedure

        cmdDoLogin.Parameters.Add("@username", SqlDbType.VarChar, 32).Value = username
        cmdDoLogin.Parameters.Add("@password", SqlDbType.VarBinary, 16).Value = password
        cmdDoLogin.Parameters.Add("@userIP", SqlDbType.VarChar, 40).Value = ip

        Dim cn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("cnMain").ConnectionString)
        cmdDoLogin.Connection = cn
        cn.Open()
        Dim dr As SqlClient.SqlDataReader = cmdDoLogin.ExecuteReader
        If dr.Read Then
            Dim r As Integer = dr("Status")
            Select Case r
                Case 1 : result.Status = LoginResultStatus.Success
                Case 2 : result.Status = LoginResultStatus.InvalidCredentials
                Case 3 : result.Status = LoginResultStatus.InvalidCredentials
                Case 4 : result.Status = LoginResultStatus.LockedUser
                Case 5 : result.Status = LoginResultStatus.PasswordExpired
                Case 6 : result.Status = LoginResultStatus.AlreadyLoggedIn
                Case 7 : result.Status = LoginResultStatus.ChangePassword
                Case 8 : result.Status = LoginResultStatus.ExpiredUser
                Case Else : result.Status = LoginResultStatus.InvalidCredentials
            End Select
            result.Id = dr("UserId")
            result.LastLogin = IIf(dr("LastLogin") Is DBNull.Value, Nothing, dr("LastLogin"))
            result.UserName = username
            result.UserFullName = dr("Name")
            result.UserType = dr("UserType")
            result.DefPage = dr("DefPage")
        Else
            result.Status = LoginResultStatus.InvalidCredentials
            result.Id = 0
            result.LastLogin = Date.MinValue
            result.UserName = ""
            result.UserFullName = ""
            result.UserType = ""
            result.DefPage = ""
        End If

        dr.Close()
        cn.Close()
        Return result
    End Function
End Module
