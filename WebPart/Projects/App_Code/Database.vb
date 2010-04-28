﻿Imports Microsoft.VisualBasic
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
End Module
