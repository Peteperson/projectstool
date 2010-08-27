Imports System
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Globalization

Partial Class DateBox
    Inherits System.Web.UI.UserControl
    Private _Value As DateTime
    Private script As String = "<script type=""text/javascript"">" + vbCrLf + "	Calendar.setup({" + vbCrLf + "		inputField     :    ""{0}"",		// id of the input field" + vbCrLf + "		ifFormat       :    ""%d/%m/%Y"",  // format of the input field" + vbCrLf + "		button         :    ""{1}"",		// trigger for the calendar (button ID)" + vbCrLf + "		inputhiddenField         :    ""{2}"",		// id of the input field" + vbCrLf + "		align          :    ""BR"",			// alignment (defaults to ""BR"")" + vbCrLf + "		singleClick    :    true" + vbCrLf + "	});" + vbCrLf + "</script>"

    Private _ShowTime As Boolean = False
    Private _ShowDate As Boolean = True

    Public Property Tooltip() As String
        Get
            Return txtDate.ToolTip
        End Get
        Set(ByVal value As String)
            txtDate.ToolTip = value
        End Set
    End Property

    Public Property ShowDate() As Boolean
        Get
            Return _ShowDate
        End Get
        Set(ByVal value As Boolean)
            _ShowDate = value
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

    Public Property Value() As DateTime
        Get
            If _ShowTime Then
                Return GreekStringToDate(Request.Form(txtDate.UniqueID), ddlHours.SelectedValue, ddlMinutes.SelectedValue)
            Else
                Return GreekStringToDate(Request.Form(txtDate.UniqueID), 0, 0)
            End If
        End Get
        Set(ByVal value As DateTime)
            If value <> DateTime.MinValue Then
                Me.txtDate.Text = value.ToString("dd/MM/yyyy")
                If _ShowTime Then
                    ddlHours.SelectedIndex = value.Hour - 8
                    ddlMinutes.SelectedIndex = (value.Minute / 60) * 4
                End If
            Else
                Me.txtDate.Text = Today.ToString("dd/MM/yyyy")
            End If
        End Set
    End Property

    Public Property Text() As String
        Get
            Return Request.Form(txtDate.UniqueID)
        End Get
        Set(ByVal value As String)
            Me.txtDate.Text = value
        End Set
    End Property

    Private _scriptFolder As String = "calendar"

    Public Property ScriptFolder() As String
        Get
            Return _scriptFolder
        End Get
        Set(ByVal value As String)
            _scriptFolder = value
        End Set
    End Property

    Private _imageFile As String = "Images/Icons/Calendar_16x16.png"

    Public Property ImageFile() As String
        Get
            Return _imageFile
        End Get
        Set(ByVal value As String)
            _imageFile = value
        End Set
    End Property

    Private _enabled As Boolean = True
    Public Property Enabled() As Boolean
        Get
            Return _enabled
        End Get
        Set(ByVal value As Boolean)
            _enabled = value
            Me.imgButton.Visible = value
        End Set
    End Property

    Public Property CssClass() As String
        Get
            Return Me.txtDate.CssClass
        End Get
        Set(ByVal value As String)
            Me.txtDate.CssClass = value
        End Set
    End Property

    Public Property Width() As Unit
        Get
            Return Me.txtDate.Width
        End Get
        Set(ByVal value As Unit)
            Me.txtDate.Width = value
        End Set
    End Property

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
        If Me._enabled Then
            imgButton.ImageUrl = _imageFile
            Page.RegisterClientScriptBlock("CalendarJS", "<script type=""text/javascript"" src=""" + _scriptFolder + "/calendar_stripped.js""></script>")
            Page.RegisterClientScriptBlock("CalendarSetup", "<script type=""text/javascript"" src=""" + _scriptFolder + "/calendar-setup_stripped.js""></script>")
            Page.RegisterClientScriptBlock("CalendarLang", "<script type=""text/javascript"" src=""" + _scriptFolder + "/lang/calendar-en.js""></script>")

            script = script.Replace("{0}", txtDate.ClientID)
            script = script.Replace("{1}", imgButton.ClientID)
            script = script.Replace("{2}", hdDate.ClientID)
            scrCalendar.Text = script
        End If
        If _ShowTime Then tblTime.Visible = True Else tblTime.Visible = False
        If _ShowDate Then tblDate.Visible = True Else tblDate.Visible = False
    End Sub

    Public Function ControlToValidate() As String
        Return txtDate.ClientID.ToString
    End Function

    Private Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        If Me._enabled Then
            If hdDate.Value <> String.Empty Then
                Text = hdDate.Value
            End If
        End If
    End Sub

    Protected Overrides Sub OnInit(ByVal e As System.EventArgs)
        InitializeComponent()
        MyBase.OnInit(e)
    End Sub

    Private Sub InitializeComponent()
        AddHandler Me.Load, AddressOf Me.Page_Load
    End Sub

    Public Shared Function StringToDate(ByVal input As String) As DateTime
        Dim ret As DateTime
        Try
            ret = DateTime.Parse(input, New System.Globalization.CultureInfo("el-GR"))
        Catch ex As Exception
            ret = DateTime.MinValue
        End Try
        Return ret
    End Function

    Public Shared Function GreekStringToDate(ByVal input As String, ByVal hrs As Byte, ByVal mins As Byte) As DateTime
        If input = "" Then
            Return Today.AddHours(hrs).AddMinutes(mins)
        Else
            'Dim greekDate() As String = input.Split("/")
            'Return New DateTime(greekDate(2), greekDate(1), greekDate(0))
            Dim provider As CultureInfo = CultureInfo.InvariantCulture
            Return DateTime.ParseExact(input, "dd/MM/yyyy", provider).AddHours(hrs).AddMinutes(mins)
        End If
    End Function
End Class

