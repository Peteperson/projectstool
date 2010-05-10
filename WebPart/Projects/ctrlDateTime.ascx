<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ctrlDateTime.ascx.vb" Inherits="ctrlDateTime" %>
<table width="200px">
    <tr>
        <td rowspan="5">
            <asp:Calendar ID="Calendar1" runat="server" BackColor="#7593B9" DayNameFormat="Shortest" ForeColor="Black" Width="150px" Font-Size="8pt" >
                <SelectedDayStyle BackColor="#7593B9" Font-Bold="True" ForeColor="White" />
                <DayHeaderStyle BackColor="Tan" ForeColor="Black" />
                <TitleStyle BackColor="#2C486E" Font-Bold="True" Font-Size="10pt" ForeColor="White" />
                <WeekendDayStyle BackColor="LightGray" ForeColor="Black" />
            </asp:Calendar></td>
        <td>From:</td>
    </tr>
    <tr>
        <td>
            <asp:DropDownList ID="ddlFrom" runat="server">
                <asp:ListItem Value="1">08:00</asp:ListItem>
                <asp:ListItem Value="2">08:30</asp:ListItem>
                <asp:ListItem Value="3">09:00</asp:ListItem>
                <asp:ListItem Value="4">09:30</asp:ListItem>
                <asp:ListItem Value="5">10:00</asp:ListItem>
                <asp:ListItem Value="6">10:30</asp:ListItem>
                <asp:ListItem Value="7">11:00</asp:ListItem>
                <asp:ListItem Value="8">11:30</asp:ListItem>
                <asp:ListItem Value="9">12:00</asp:ListItem>
                <asp:ListItem Value="10">12:30</asp:ListItem>
                <asp:ListItem Value="11">13:00</asp:ListItem>
                <asp:ListItem Value="12">13:30</asp:ListItem>
                <asp:ListItem Value="13">14:00</asp:ListItem>
                <asp:ListItem Value="14">14:30</asp:ListItem>
                <asp:ListItem Value="15">15:00</asp:ListItem>
                <asp:ListItem Value="16">15:30</asp:ListItem>
                <asp:ListItem Value="17">16:00</asp:ListItem>
                <asp:ListItem Value="18">16:30</asp:ListItem>
                <asp:ListItem Value="19">17:00</asp:ListItem>
                <asp:ListItem Value="20">17:30</asp:ListItem>
                <asp:ListItem Value="21">18:00</asp:ListItem>
                <asp:ListItem Value="22">18:30</asp:ListItem>
                <asp:ListItem Value="23">19:00</asp:ListItem>
                <asp:ListItem Value="24">19:30</asp:ListItem>
                <asp:ListItem Value="25">20:00</asp:ListItem>
                <asp:ListItem Value="26">20:30</asp:ListItem>
                <asp:ListItem Value="27">21:00</asp:ListItem>
                <asp:ListItem Value="28">21:30</asp:ListItem>
                <asp:ListItem Value="29">22:00</asp:ListItem>
                <asp:ListItem Value="30">22:30</asp:ListItem>
                <asp:ListItem Value="29">23:00</asp:ListItem>
                <asp:ListItem Value="30">23:30</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>To:</td>
    </tr>
    <tr>
        <td>
            <asp:DropDownList ID="ddlTo" runat="server">
                <asp:ListItem Value="1">08:00</asp:ListItem>
                <asp:ListItem Value="2">08:30</asp:ListItem>
                <asp:ListItem Value="3">09:00</asp:ListItem>
                <asp:ListItem Value="4">09:30</asp:ListItem>
                <asp:ListItem Value="5">10:00</asp:ListItem>
                <asp:ListItem Value="6">10:30</asp:ListItem>
                <asp:ListItem Value="7">11:00</asp:ListItem>
                <asp:ListItem Value="8">11:30</asp:ListItem>
                <asp:ListItem Value="9">12:00</asp:ListItem>
                <asp:ListItem Value="10">12:30</asp:ListItem>
                <asp:ListItem Value="11">13:00</asp:ListItem>
                <asp:ListItem Value="12">13:30</asp:ListItem>
                <asp:ListItem Value="13">14:00</asp:ListItem>
                <asp:ListItem Value="14">14:30</asp:ListItem>
                <asp:ListItem Value="15">15:00</asp:ListItem>
                <asp:ListItem Value="16">15:30</asp:ListItem>
                <asp:ListItem Value="17">16:00</asp:ListItem>
                <asp:ListItem Value="18">16:30</asp:ListItem>
                <asp:ListItem Value="19">17:00</asp:ListItem>
                <asp:ListItem Value="20">17:30</asp:ListItem>
                <asp:ListItem Value="21">18:00</asp:ListItem>
                <asp:ListItem Value="22">18:30</asp:ListItem>
                <asp:ListItem Value="23">19:00</asp:ListItem>
                <asp:ListItem Value="24">19:30</asp:ListItem>
                <asp:ListItem Value="25">20:00</asp:ListItem>
                <asp:ListItem Value="26">20:30</asp:ListItem>
                <asp:ListItem Value="27">21:00</asp:ListItem>
                <asp:ListItem Value="28">21:30</asp:ListItem>
                <asp:ListItem Value="29">22:00</asp:ListItem>
                <asp:ListItem Value="30">22:30</asp:ListItem>
                <asp:ListItem Value="29">23:00</asp:ListItem>
                <asp:ListItem Value="30">23:30</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td align="center">
            <asp:Button ID="btnDone" runat="server" Text="Done" />
        </td>
    </tr>
</table>