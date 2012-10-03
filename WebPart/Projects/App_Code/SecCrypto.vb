Imports Microsoft.VisualBasic
Imports System.Security.Cryptography
Imports System
Imports System.Text.RegularExpressions
Imports System.Text

Public Module SecCrypto
	' Define default min and max password lengths.
	Private Const DEFAULT_MIN_PASSWORD_LENGTH As Integer = 8
	Private Const DEFAULT_MAX_PASSWORD_LENGTH As Integer = 12

	' Define supported password characters divided into groups.
	' You can add (or remove) characters to (from) these groups.
	Private Const PASSWORD_CHARS_LCASE As String = "abcdefgijkmnopqrstwxyz"
	Private Const PASSWORD_CHARS_UCASE As String = "ABCDEFGHJKLMNPQRSTWXYZ"
	Private Const PASSWORD_CHARS_NUMERIC As String = "23456789"
	Private Const PASSWORD_CHARS_SPECIAL As String = "*$-+?&=!%{}/"
	Private passwordChars As Char() = PASSWORD_CHARS_LCASE & PASSWORD_CHARS_UCASE & PASSWORD_CHARS_NUMERIC & PASSWORD_CHARS_SPECIAL

	Public Function Hash(ByVal thePassword As String) As Byte()
		Dim md5Hasher As New MD5CryptoServiceProvider
		Dim encoder As New UTF8Encoding
		Return md5Hasher.ComputeHash(encoder.GetBytes("FCKU::" & thePassword))
	End Function

	Public Function GeneratePassword(ByVal minLength As Integer, ByVal maxLength As Integer) As String
		If minLength <= 0 Then Throw New ArgumentOutOfRangeException("minLength", minLength, "Minimum length must be positive")
		If maxLength <= 0 Then Throw New ArgumentOutOfRangeException("maxLength", maxLength, "Maximum length must be positive")
		If minLength > maxLength Then Throw New ArgumentOutOfRangeException("minLength", minLength, "Minimum length must be less than maximum length")

		Dim buff1(0) As Byte
		Dim length As Byte = 0

		Dim rng As New System.Security.Cryptography.RNGCryptoServiceProvider

		Do
			rng.GetBytes(buff1)
			length = buff1(0)
		Loop Until length >= minLength And length <= maxLength

		Dim password(length - 1) As Char
		Dim passbuff(length - 1) As Byte

		Dim usedUppercase As Boolean = False
		Dim usedLowercase As Boolean = False
		Dim usedNumeric As Boolean = False
		Dim usedSpecial As Boolean = False
		Dim complexity As Byte

		Do
			rng.GetBytes(passbuff)
			complexity = 0
			Array.Clear(password, 0, length)
			For i As Integer = 0 To length - 1
				Dim passChar As Byte = passbuff(i) And 63 ' cut off the top 2 bits
				password(i) = passwordChars(passChar)
				If PASSWORD_CHARS_LCASE.IndexOf(password(i)) >= 0 And Not usedLowercase Then
					usedLowercase = True
					complexity += 1
				End If
				If PASSWORD_CHARS_UCASE.IndexOf(password(i)) >= 0 And Not usedUppercase Then
					usedUppercase = True
					complexity += 1
				End If
				If PASSWORD_CHARS_NUMERIC.IndexOf(password(i)) >= 0 And Not usedNumeric Then
					usedNumeric = True
					complexity += 1
				End If
				If PASSWORD_CHARS_SPECIAL.IndexOf(password(i)) >= 0 And Not usedSpecial Then
					usedSpecial = True
					complexity += 1
				End If
			Next
		Loop Until complexity >= 0

		Return New String(password)
	End Function

	Public Function GeneratePasswordNoSpecialChrs(ByVal minLgth As Integer, ByVal maxLgth As Integer) As String
		Dim rnd As New Random
		Return Regex.Replace(GeneratePassword(minLgth, maxLgth), "[^a-zA-Z0-9]", rnd.Next(0, 10).ToString)
	End Function

	Public Function GeneratePasswordNoSpecialChrs(ByVal Length As Integer) As String
		Dim rnd As New Random
		Return Regex.Replace(GeneratePassword(Length), "[^a-zA-Z0-9]", rnd.Next(0, 10).ToString)
	End Function

	Public Function GeneratePasswordNoSpecialChrs() As String
		Dim rnd As New Random
		Return Regex.Replace(GeneratePassword(), "[^a-zA-Z0-9]", rnd.Next(0, 10).ToString)
	End Function

	Public Function GeneratePassword() As String
		Return GeneratePassword(DEFAULT_MIN_PASSWORD_LENGTH, DEFAULT_MAX_PASSWORD_LENGTH)
	End Function

	Public Function GeneratePassword(ByVal length As Integer) As String
		Return GeneratePassword(length, length)
	End Function
End Module
