<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

<%@ Register src="ctrlDateTime.ascx" tagname="ctrlDateTime" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project management tool - Login page</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
      <table>
        <tr>
            <td style="background-color:white; border-bottom: solid 3px white">
                <asp:Image ID="Image1" ImageUrl="~/Images/eurobank.png" runat="server" Height="71px" />
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
            <table id="tblLogin">
                <tr>
                    <td align="center" style="vertical-align:top; padding-top:90px">
                        <table border="0" cellpadding="0" style="width:400px;">
                            <tr>
                                <td align="center" colspan="2" style="color:black; padding-bottom: 30px;font-weight:bold">Please insert your username and password:</td>
                            </tr>
                            <tr>
                                <td align="right" style="vertical-align:top; padding-bottom:5px">User Name:<br /></td>
                                <td align="center" style="vertical-align:top; padding-bottom:5px">
                                    <asp:TextBox ID="UserName" runat="server" Width="130px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                        ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                        ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="vertical-align:top; padding-bottom:5px">Password:</td>
                                <td align="center" style="vertical-align:top; padding-bottom:5px">
                                    <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="130px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                        ControlToValidate="Password" ErrorMessage="Password is required." 
                                        ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="padding-top:12px; padding-bottom:2px">
                                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" 
                                        Font-Names="Tahoma, Calibri, Verdana" Text="Enter site" style="text-align:center" ValidationGroup="Login1" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="color:Red; height:45px" colspan="2">&nbsp;
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="padding-bottom:5px; padding-top:8px;">Forgot your password? Fill in the field below and press 'Reset'.</td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">e-mail: <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                                    <asp:Button ID="btnResetMail" runat="server" Text="Reset" 
                                        onclick="btnResetMail_Click" />
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
            <td style="background: url(Images/Blue.png) repeat-x; text-align:right; height: 27px; vertical-align:top"><a href="http://advent.com.gr">AG ADVENT 2010</a></td>
        </tr>
      </table>
    </form>
</body>
</html>
