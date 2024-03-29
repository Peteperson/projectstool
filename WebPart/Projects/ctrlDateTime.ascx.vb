﻿
Partial Class ctrlDateTime
    Inherits System.Web.UI.UserControl
    Private _DateFrom As Date
    Private _DateTo As Date
    Private _ShowTime As Boolean

    Public Property DateFrom() As DateTime
        Get
            Return _DateFrom
        End Get
        Set(ByVal value As DateTime)
            _DateFrom = value
        End Set
    End Property

    Public Property DateTo() As DateTime
        Get
            Return _DateTo
        End Get
        Set(ByVal value As DateTime)
            _DateTo = value
        End Set
    End Property

    Public Property ShowTime() As Boolean
        Get
            Return _ShowTime
        End Get
        Set(ByVal value As Boolean)
            _ShowTime = value
        End Set
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not _ShowTime Then
            ddlFrom.Visible = False
            ddlTo.Visible = False
        Else
            ddlFrom.Visible = True
            ddlTo.Visible = True
        End If
    End Sub
End Class
