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
    <form id="form1" runat="server">
      <table>
        <tr>
            <td style="background-color:white">
                <asp:Image ID="Image1" ImageUrl="~/Images/AdvLogoWhiteBack.png" runat="server" Height="71px" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <br />
                <br />
                <br />
                <asp:Login ID="ctrlLogin" runat="server" DisplayRememberMe="False" 
        BorderPadding="4" BorderStyle="None"
        BorderWidth="0px" Font-Names="Tahoma, Calibri, Verdana" ForeColor="#333333" Width="0%"
        TextLayout="TextOnTop">
        <LoginButtonStyle BackColor="White" BorderColor="#CC9966" BorderStyle="Solid" 
            BorderWidth="1px" Font-Names="Tahoma, Calibri, Verdana" ForeColor="#990000" />
        <LayoutTemplate>
            <table>
                <tr>
                    <td align="center">
                        <table class="LoginFirstTable">
                            <tr>
                                <td align="center" style="padding-top: 30px; padding-bottom: 20px;">
                                    <table class="LoginSecondTable" cellspacing="0">
                                        <tr>
                                            <td align="center" colspan="2" style="color:black; padding-top:10px; padding-bottom: 10px; font-weight:bold; border-bottom: solid 1px black">Παρακαλώ εισάγετε username και password:</td>
                                        </tr>                                
                                        <tr>
                                            <td align="right" style="vertical-align:top; padding-top:15px; padding-bottom:5px; border-top: solid 1px white">Username:<br /></td>
                                            <td align="center" style="vertical-align:top; padding-top:15px; padding-bottom:5px; border-top: solid 1px white">
                                                <asp:TextBox ID="UserName" runat="server" Width="130px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                                    ControlToValidate="UserName" ErrorMessage="Το πεδίο Username είναι υποχρεωτικό." 
                                                    ToolTip="Το πεδίο Username είναι υποχρεωτικό." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" style="vertical-align:top; padding-bottom:5px">Password:</td>
                                            <td align="center" style="vertical-align:top; padding-bottom:5px">
                                                <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="130px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                                    ControlToValidate="Password" ErrorMessage="Το πεδίο Password είναι υποχρεωτικό." 
                                                    ToolTip="Το πεδίο Password είναι υποχρεωτικό." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2" style="padding-top:12px; padding-bottom:2px">
                                                <asp:Button ID="LoginButton" runat="server" CommandName="Login" 
                                                    Font-Names="Tahoma, Calibri, Verdana" Text="Είσοδος" style="text-align:center" ValidationGroup="Login1" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="center" style="color:Red; border-bottom: solid 1px black" colspan="2">&nbsp;
                                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2" style="padding: 5px 0px 5px 0px; border-top: solid 1px white">Συμπληρώστε το email σας και πατήστε 'Αποστολή' προκειμένου να κάνετε αίτηση έκδοσης νέου password:</td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2" style="padding-bottom: 5px;" >e-mail: <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="txtemail" ValidationGroup="email"
                                                    ErrorMessage="Το πεδίο e-mail δεν μπορεί να είναι κενό" ToolTip="Το πεδίο e-mail δεν μπορεί να είναι κενό">*</asp:RequiredFieldValidator>
                                                <asp:Button ID="btnResetMail" runat="server" Text="Αποστολή" ValidationGroup="email" 
                                                    onclick="btnResetMail_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
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
            <td align="center">
                <asp:Label ID="lblMessage" Visible="false" runat="server" CssClass="ErrorMessage" Text="Label"></asp:Label>
                <br />
                <br />
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td style="border-top: solid 3px white">Legal Notice. <br />
                Application can be used only by an authorized person with preservation of 
                binding procedures ... Obtaining or attempt of obtaining an unauthorized access to the application can cause bearing criminal responsibility or civil liability.</td>
        </tr>
        <tr>
            <td style="background: url(Images/Blue.png) repeat-x; text-align:right; vertical-align:top"><div id="advlink"><a href="http://advent.com.gr">AG ADVENT <%=DateTime.Today.Year%></a></div></td>
        </tr>
      </table>
    </form>    
</body>
</html>
