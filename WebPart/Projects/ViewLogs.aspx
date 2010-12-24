<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="ViewLogs.aspx.vb" Inherits="ViewLogs" Theme="MainSkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br />
    <br />
    <table id="subPageMainTable">
        <tr>
            <td class="FormTitle">Παρακολούθηση Δραστηριότητας</td>
        </tr>
        <tr>
            <td class="tdBelowTitle">
                <table style="width:0%">
                    <tr>
                        <td>From</td>
                        <td>To</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Calendar ID="clndFrom" runat="server" SkinID="clndMain">
                            </asp:Calendar>
                        </td>
                        <td>
                            <asp:Calendar ID="clndTo" runat="server" SkinID="clndMain"></asp:Calendar>
                        </td>
                        <td>
                            From: <asp:TextBox ID="txtEmailFrom" runat="server"></asp:TextBox><br />
                            To: <asp:TextBox ID="txtEmailTo" runat="server"></asp:TextBox><br />
                            Subject: <asp:TextBox ID="txtEmailSbj" runat="server"></asp:TextBox><br />
                            Body: <asp:TextBox ID="txtEmailBody" runat="server"></asp:TextBox><br />
                            <asp:Button ID="btnEmail" runat="server" Text="Send" />
                        </td>
                    </tr>
                    
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataSourceID="sqldsLogs" 
                    SkinID="gridviewSkinShort">
                    <Columns>
                        <asp:BoundField DataField="Datestamp" 
                            DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" HeaderText="Datestamp" 
                            SortExpression="Datestamp" />
                        <asp:BoundField DataField="URL" HeaderText="URL" SortExpression="URL" />
                        <asp:BoundField DataField="ip" HeaderText="ip" SortExpression="ip" />
                        <asp:BoundField DataField="UserFullName" HeaderText="UserFullName" 
                            ReadOnly="True" SortExpression="UserFullName" />
                        <asp:BoundField DataField="Status" HeaderText="Status" 
                            SortExpression="Status" />
                        <asp:BoundField DataField="BrowserName" HeaderText="Browser" 
                            SortExpression="BrowserName" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:SqlDataSource ID="sqldsLogs" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="LogList" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="clndFrom" Name="DateFrom" 
                            PropertyName="SelectedDate" Type="DateTime" />
                        <asp:ControlParameter ControlID="clndTo" Name="DateTo" 
                            PropertyName="SelectedDate" Type="DateTime" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
    </table>
</asp:Content>

