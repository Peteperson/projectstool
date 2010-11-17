<%@ Application Language="VB" %>

<script runat="server">

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application startup
    End Sub
    
    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application shutdown
    End Sub
        
    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        'Dim errorCode As Guid
        Dim httpStatusCode As Integer = 500
        Dim httpErrorNumber As Integer = 0
        'Dim uid As String = "anon"
        Dim lastError = Server.GetLastError

        If TypeOf lastError Is HttpException Then
            With CType(lastError, HttpException)
                httpStatusCode = .GetHttpCode
                httpErrorNumber = .ErrorCode
            End With
        End If
      
        'If Me.Request.IsAuthenticated AndAlso Context.User IsNot Nothing AndAlso TypeOf Context.User Is UserState Then
        'uid = CType(Context.User, UserState).Id
        'End If
        
        Session("ErrorMessage") = Server.GetLastError.InnerException.ToString
        Try
            Database.InsertAspxError(Request.Url.ToString, Server.GetLastError.InnerException.ToString, _
                                     Request.UserHostAddress, Session("UserId"))
        Catch ex As Exception
            Session("ErrorMessage") = Server.GetLastError.InnerException.ToString
        End Try

        Server.ClearError()
        'Response.Redirect("~/Error.aspx")
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a new session is started
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a session ends. 
        ' Note: The Session_End event is raised only when the sessionstate mode
        ' is set to InProc in the Web.config file. If session mode is set to StateServer 
        ' or SQLServer, the event is not raised.
    End Sub
       
</script>