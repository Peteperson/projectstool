<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

<%@ Register src="ctrlDateTime.ascx" tagname="ctrlDateTime" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project management tool - Login page</title>
    <link rel="shortcut icon" href="Images/Icons/favicon.ico" />
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" style="height:100%" runat="server">
      <table style="height:99%">
        <tr>
            <td style="background-color:white" colspan="2">
                <asp:Image ID="Image1" ImageUrl="~/Images/AdvLogoWhiteBack.png" runat="server" Height="71px" />
            </td>
        </tr>
        <tr style="height:100%">
            <td align="center" colspan="2">
                <asp:Login ID="ctrlLogin" runat="server" DisplayRememberMe="False" 
                    BorderPadding="4" BorderStyle="None"
                    BorderWidth="0px" Font-Names="Tahoma, Calibri, Verdana" ForeColor="#333333" Width="0%"
                    TextLayout="TextOnTop">
                <LoginButtonStyle BackColor="White" BorderColor="#CC9966" BorderStyle="Solid" 
                            BorderWidth="1px" Font-Names="Tahoma, Calibri, Verdana" ForeColor="#990000" />
                <LayoutTemplate>
                    <table id="LoginFrame">
                        <tr>
                            <td align="center">
                                <table id="LoginFirstTable">
                                    <tr>
                                        <td rowspan="3">
                                            <img alt="lockimage" src="Images/LoginLock.png" 
                                                style="width: 112px; height: 112px" /></td>
                                        <td>
                                            <table id="tblUsrPass">
                                                <tr>
                                                    <td style="padding-bottom:9px;">Username:&nbsp;</td>
                                                    <td style="padding-bottom:3px;"><asp:TextBox ID="UserName" runat="server" Width="130px"></asp:TextBox></td>
                                                    <td><asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                                            ControlToValidate="UserName" 
                                                            ErrorMessage="Το πεδίο Username είναι υποχρεωτικό." 
                                                            ToolTip="Το πεδίο Username είναι υποχρεωτικό." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding-bottom:9px;">Password:&nbsp;</td>
                                                    <td style="padding-bottom:3px;"><asp:TextBox ID="Password" runat="server" TextMode="Password" Width="130px"></asp:TextBox></td>
                                                    <td><asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                                            ControlToValidate="Password" 
                                                            ErrorMessage="Το πεδίο Password είναι υποχρεωτικό." 
                                                            ToolTip="Το πεδίο Password είναι υποχρεωτικό." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td align="left" valign="bottom" style="width:100%">
                                            <asp:ImageButton ID="btnLoginButton" runat="server" CommandName="Login" 
                                                Font-Names="Tahoma, Calibri, Verdana" ToolTip="Είσοδος" 
                                                ValidationGroup="Login1" ImageUrl="~/Images/ArrowNext.png" />    
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="color: Yellow; font-weight: bold;"><br />
                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>
                                </table>
                                <br /><br /><br /><br />
                            </td>
                        </tr>            
                    </table>
                </LayoutTemplate>
                <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                <TitleTextStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                </asp:Login>
            </td>
        </tr>
        <tr>
            <td>
                <table id="LoginSecondTable">                            
                    <tr>
                        <td rowspan="2" valign="bottom"><img alt="MailImage" src="Images/OrangeMail.png" /></td>
                        <td colspan="4" style="font-size:8pt; height: 40px" valign="bottom">Συμπληρώστε το email σας και πατήστε &#39;Αποστολή&#39; προκειμένου να κάνετε αίτηση 
                            έκδοσης νέου password:</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="width:100%; padding-bottom: 6px">
                            <asp:TextBox ID="txtemail" runat="server" Width="100%"></asp:TextBox>
                        </td>
                        <td style="width: 0%">
                            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                                ControlToValidate="txtemail" 
                                ErrorMessage="Το πεδίο e-mail δεν μπορεί να είναι κενό" 
                                ToolTip="Το πεδίο e-mail δεν μπορεί να είναι κενό" ValidationGroup="email">&nbsp;&nbsp;*</asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:ImageButton ID="btnResetMail" runat="server" onclick="btnResetMail_Click" 
                                ToolTip="Αποστολή" ValidationGroup="email" ImageUrl="~/Images/ArrowNext.png" />
                        </td>
                    </tr>
                </table>
            </td>
            <td align="right" valign="bottom">
                <table id="tblBrowsers">
                    <tr>
                        <td>Best viewed in:&nbsp;</td>
                        <td><asp:HyperLink ID="HyperLink1" ImageUrl="~/Images/chrome.png" Target="_blank" ToolTip="Chrome" NavigateUrl="http://www.google.com/chrome" runat="server"></asp:HyperLink></td>
                        <td><asp:HyperLink ID="HyperLink2" ImageUrl="~/Images/safari.png" Target="_blank" ToolTip="Safari" NavigateUrl="http://www.apple.com/safari/" runat="server"/></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Label ID="lblMessage" Visible="false" runat="server" CssClass="ErrorMessage" Text="Label"></asp:Label>
                <br />
            </td>
        </tr>
        <tr>
            <td style="border-top: solid 3px white" colspan="2">Legal Notice. <br />
                Application can be used only by an authorized person with preservation of 
                binding procedures ... Obtaining or attempt of obtaining an unauthorized access to the application can cause bearing criminal responsibility or civil liability.</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td id="tdBottomLogo" colspan="2"><div><a id="AdventLink" href="http://advent.com.gr">&copy; AG ADVENT <%=DateTime.Today.Year%></a></div></td>
        </tr>
      </table>
    </form>    
</body>
</html>
