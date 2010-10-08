<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="ViewErrors.aspx.vb" Inherits="ViewErrors" Theme="MainSkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br />
    <br />
    <table id="subPageMainTable">
        <tr>
            <td class="FormTitle">Λίστα Προβλημάτων</td>
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
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataSourceID="sqldsErrors" 
                    SkinID="gridviewSkinSmall">
                    <Columns>
                        <asp:TemplateField HeaderText="Datestamp" SortExpression="Datestamp">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" 
                                    Text='<%# Bind("Datestamp", "{0:dd/MM/yyyy HH:mm:ss}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="URL" HeaderText="URL" SortExpression="URL" />
                        <asp:BoundField DataField="IP" HeaderText="IP" SortExpression="IP" />
                        <asp:BoundField DataField="UserFullName" HeaderText="UserFullName" 
                            ReadOnly="True" SortExpression="UserFullName" />
                        <asp:BoundField DataField="ServerName" HeaderText="ServerName" 
                            SortExpression="ServerName" />
                        <asp:BoundField DataField="Error" HeaderText="Error" SortExpression="Error" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:SqlDataSource ID="sqldsErrors" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="ErrorList" SelectCommandType="StoredProcedure">
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

