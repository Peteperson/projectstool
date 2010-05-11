<%@ Control Language="VB" AutoEventWireup="false" CodeFile="DateBox.ascx.vb" Inherits="DateBox" %>
<link rel="stylesheet" type="text/css" href="calendar.css"/>
<table id="tblCalendar">
    <tr>
        <td>
            <table id="tblDate" runat="server">
                <tr>
                    <td><asp:TextBox id="txtDate" Runat="server" MaxLength='10' ReadOnly="True" style="text-align:center" SkinID="txtDate"></asp:TextBox></td>
                    <td>&nbsp;</td>
                    <td><asp:Image Runat="server" Enabled="True" ID="imgButton" onmouseover="this.style.cursor='hand'" ToolTip="Click to display calendar" EnableViewState="False" BorderWidth="0px" ImageAlign="AbsMiddle"></asp:Image></td>
                </tr>
            </table>
        </td>
        <td>&nbsp;</td>
        <td>
            <table id="tblTime" runat="server">
                <tr>
                    <td><asp:DropDownList ID="ddlHours" runat="server">
                            <asp:ListItem Value="8">08</asp:ListItem>
                            <asp:ListItem Value="9">09</asp:ListItem>
                            <asp:ListItem Value="10">10</asp:ListItem>
                            <asp:ListItem Value="11">11</asp:ListItem>
                            <asp:ListItem Value="12">12</asp:ListItem>
                            <asp:ListItem Value="13">13</asp:ListItem>
                            <asp:ListItem Value="14">14</asp:ListItem>
                            <asp:ListItem Value="15">15</asp:ListItem>
                            <asp:ListItem Value="16">16</asp:ListItem>
                            <asp:ListItem Value="17">17</asp:ListItem>
                            <asp:ListItem Value="18">18</asp:ListItem>
                            <asp:ListItem Value="19">19</asp:ListItem>
                            <asp:ListItem Value="20">20</asp:ListItem>
                            <asp:ListItem Value="21">21</asp:ListItem>
                            <asp:ListItem Value="22">22</asp:ListItem>
                            <asp:ListItem Value="23">23</asp:ListItem>
                        </asp:DropDownList></td>
                    <td>:</td>
                    <td><asp:DropDownList ID="ddlMinutes" runat="server">
                            <asp:ListItem Value="0">00</asp:ListItem>
                            <asp:ListItem Value="15">15</asp:ListItem>
                            <asp:ListItem Value="30">30</asp:ListItem>
                            <asp:ListItem Value="45">45</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<asp:HiddenField runat="server" ID="hdDate" />
<asp:Literal ID="scrCalendar" Runat="server" EnableViewState="False"></asp:Literal>