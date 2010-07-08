Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient

Public Module Database
    Function CheckEmail(ByVal email As String) As ChkEmailResult
        Dim res As New ChkEmailResult
        Dim cmdChkeml As SqlClient.SqlCommand
        cmdChkeml = New SqlClient.SqlCommand("CheckEmail")
        cmdChkeml.CommandType = CommandType.StoredProcedure
        cmdChkeml.Parameters.Add("@email", SqlDbType.NVarChar, 50).Value = email
        Dim cn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("cnMain").ConnectionString)
        cmdChkeml.Connection = cn
        cn.Open()
        Dim dr As SqlClient.SqlDataReader = cmdChkeml.ExecuteReader
        If dr.Read Then
            res.UserId = dr("id")
            res.Username = dr("username")
        Else
            res.UserId = 0
            res.Username = ""
        End If

        dr.Close()
        cn.Close()
        Return res
    End Function

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

    Public Function ChangePassword(ByVal UserId As Integer, ByVal OldPass As Byte(), ByVal NewPass As Byte()) As CngPassResult
        Dim cmdCngPass As SqlClient.SqlCommand
        Dim Result As CngPassResult

        cmdCngPass = New SqlClient.SqlCommand("ChangePassword")
        cmdCngPass.CommandType = CommandType.StoredProcedure
        cmdCngPass.Parameters.Add("@UserId", SqlDbType.Int).Value = UserId
        cmdCngPass.Parameters.Add("@OldPass", SqlDbType.VarBinary, 16).Value = OldPass
        cmdCngPass.Parameters.Add("@NewPass", SqlDbType.VarBinary, 16).Value = NewPass

        Dim cn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("cnMain").ConnectionString)
        cmdCngPass.Connection = cn
        cn.Open()
        Dim res As Byte = cmdCngPass.ExecuteScalar
        Select Case res
            Case 1 : Result = CngPassResult.Success
            Case 2 : Result = CngPassResult.WrongOldPass
            Case Else : Result = CngPassResult.OtherError
        End Select

        cn.Close()
        Return Result
    End Function

    Public Function DownloadFile(ByVal id As Integer, ByVal TableName As String) As DataTable
        Dim SP As String = ""
        Select Case TableName
            Case "Attachments"
                SP = "DownloadFile"
            Case "Meetings"
                SP = "DownloadMeetingFile"
            Case "ActionPlan"
                SP = "DownloadAPFile"
        End Select
        Dim cmdCurrentStatementData As New SqlClient.SqlCommand(SP)
        cmdCurrentStatementData.CommandType = CommandType.StoredProcedure
        cmdCurrentStatementData.Parameters.Add("@FileId", SqlDbType.Int).Value = id
        Dim cn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("cnMain").ConnectionString)
        Dim dt As New DataTable
        Dim da As New SqlClient.SqlDataAdapter(cmdCurrentStatementData)
        cmdCurrentStatementData.Connection = cn
        da.Fill(dt)
        Return dt
    End Function

    Public Sub InsertAspxError(ByVal URL As String, ByVal Exception As String, _
                               ByVal UserIp As String, ByVal UserId As Integer)

        Dim cn As New System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("cnMain").ConnectionString)
        Dim cmd As New System.Data.SqlClient.SqlCommand("InsertAspxError", cn) With {.CommandType = Data.CommandType.StoredProcedure}
        cmd.Parameters.Add("@URL", Data.SqlDbType.NVarChar, 250).Value = URL
        cmd.Parameters.Add("@Exception", Data.SqlDbType.NVarChar, 500).Value = Exception
        cmd.Parameters.Add("@UserIp", Data.SqlDbType.NVarChar, 15).Value = UserIp
        cmd.Parameters.Add("@UserId", Data.SqlDbType.Int).Value = UserId
        cmd.Parameters.Add("@ServerName", Data.SqlDbType.NVarChar, 64).Value = My.Computer.Name
        cn.Open()
        cmd.ExecuteNonQuery()
        cn.Close()
    End Sub

    Public Sub InsertActivity(ByVal UserIP As String, ByVal UserId As Integer, ByVal URL As String, ByVal Status As LogStatus, Optional ByVal ExtraInfo As String = "")
        Dim cmd As New SqlClient.SqlCommand("InsertActivity")
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.Add("@UserId", SqlDbType.Int).Value = UserId
        cmd.Parameters.Add("@Status", SqlDbType.Int).Value = Status
        cmd.Parameters.Add("@UserIP", SqlDbType.NVarChar).Value = UserIP
        cmd.Parameters.Add("@URL", SqlDbType.NVarChar).Value = URL
        cmd.Parameters.Add("@ServerName", Data.SqlDbType.NVarChar, 64).Value = My.Computer.Name
        cmd.Parameters.Add("@ExtraInfo", Data.SqlDbType.NVarChar, 100).Value = ExtraInfo

        Dim cn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("cnMain").ConnectionString)
        cmd.Connection = cn
        cn.Open()
        Dim result As Integer = cmd.ExecuteScalar()
        cn.Close()
    End Sub

    Public Function LatestMessage(ByVal UserId As Integer) As String
        Dim cmd As New SqlClient.SqlCommand("LatestMessage")
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.Add("@UserId", SqlDbType.Int).Value = UserId

        Dim cn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("cnMain").ConnectionString)
        cmd.Connection = cn
        cn.Open()
        Dim ret As String = ""
        Dim dr As SqlDataReader = cmd.ExecuteReader
        While dr.Read
            ret &= "|" & dr("Message") & "|"
        End While
        ret = ret.Replace("||", "|").Replace("|", "   ===   ")
        dr.Close()
        cn.Close()
        Return ret
    End Function

    Public Function CompanyName(ByVal ProjectId As Integer) As String
        Dim cmd As New SqlClient.SqlCommand("CompNameFromPrj")
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.Add("@ProjectId", SqlDbType.Int).Value = ProjectId

        Dim cn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("cnMain").ConnectionString)
        cmd.Connection = cn
        cn.Open()
        Dim result As String = cmd.ExecuteScalar()
        cn.Close()
        Return result
    End Function
End Module
