<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="ChangePass.aspx.vb" Inherits="ChangePass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br />
    <br />
    <asp:Panel runat="server" ID="pnl1" DefaultButton="btnChangePass" >
        <table id="subPageMainTable">
            <tr>
                <td class="title">Change password</td>
            </tr>
            <tr>
                <td align="center">
                    <br />
                    <br />
                    <table id="tblCngPass" cellpadding="5">
                        <tr>
                            <td colspan="2" style="font-weight:bold; color:White; text-align:center">Please give your new credentials</td>
                        </tr>
                        <tr style="background-color:#dddddd">
                            <td align="right">Old password:</td>
                            <td>
                                <asp:TextBox ID="txtOldPass" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="txtOldPass" ErrorMessage="*" ValidationGroup="CngPass"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr style="background-color:#dddddd">
                            <td align="right">New password:</td>
                            <td>
                                <asp:TextBox ID="txtNewPass" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="txtNewPass" ErrorMessage="*" ValidationGroup="CngPass"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr style="background-color:#dddddd">
                            <td align="right">Repeat new password:</td>
                            <td>
                                <asp:TextBox ID="txtReNewPass" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="txtReNewPass" ErrorMessage="*" ValidationGroup="CngPass"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align:center">
                                <asp:Button ID="btnChangePass" runat="server" Text="Change password" 
                                    ValidationGroup="CngPass" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>


