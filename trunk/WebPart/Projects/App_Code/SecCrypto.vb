Imports Microsoft.VisualBasic
Imports System.Security.Cryptography

Public Module SecCrypto
    Public Function Hash(ByVal thePassword As String) As Byte()
        Dim md5Hasher As New MD5CryptoServiceProvider
        Dim encoder As New UTF8Encoding
        Return md5Hasher.ComputeHash(encoder.GetBytes("FCKU::" & thePassword))
    End Function
End Module
