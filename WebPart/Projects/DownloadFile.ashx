<%@ WebHandler Language="VB" Class="DownloadFile" %>

Imports System
Imports System.Web
Imports System.Web.SessionState
Imports System.Data

Public Class DownloadFile : Implements IHttpHandler, IReadOnlySessionState
    
    Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
        Dim FileBytes() As Byte
        Dim FileName As String
        Dim dt As DataTable
        Dim FileId As String = context.Session("DownloadFileId")
        Dim tbl As String = context.Session("TableName")
        If FileId Is Nothing Then context.Response.Redirect("~/")

        dt = Database.DownloadFile(FileId, tbl)
        
        If dt.Rows.Count < 1 Then context.Response.Redirect("~/")
        
        FileBytes = dt.Rows(0).Item("Attachment")
        FileName = dt.Rows(0).Item("AttachmentName")

        With context.Response
            .Clear()
            .ContentType = "application"
            .CacheControl = "private"
            .ExpiresAbsolute = Now().AddMinutes(-10)
            .AddHeader("content-disposition", String.Format("attachment; filename={0}", FileName))
            .OutputStream.Write(FileBytes, 0, FileBytes.Length)
        End With
    End Sub
 
    Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property

End Class