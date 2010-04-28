<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="Meetings.aspx.vb" Inherits="Meetings" Theme="MainSkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br />
    <br />
    <table id="subPageMainTable">
        <tr>
            <td class="title">Meetings</td>
        </tr>
        <tr>
            <td id="tdMeetings">
                <asp:GridView ID="gvMeetings" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" 
                    DataSourceID="sqldsMeetings" SkinID="gridviewSkinSmall">
                    <Columns>
                        <asp:BoundField DataField="A/A" HeaderText="A/A" ReadOnly="True" 
                            SortExpression="A/A" />
                        <asp:BoundField DataField="SubProject" HeaderText="SubProject" 
                            SortExpression="SubProject" />
                        <asp:BoundField DataField="Customer" HeaderText="Customer" 
                            SortExpression="Customer" />
                        <asp:TemplateField HeaderText="Date *" HeaderStyle-Wrap="false" SortExpression="Date">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Date", "{0:dd/MM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="From *" HeaderStyle-Wrap="false" SortExpression="From">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("From", "{0:HH:mm}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="To" SortExpression="To">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("To", "{0:HH:mm}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Kind" HeaderText="Kind" SortExpression="Kind" />
                        <asp:BoundField DataField="Subject" HeaderText="Subject" 
                            SortExpression="Subject" />
                        <asp:BoundField DataField="Consultant" HeaderText="Consultant" ReadOnly="True" 
                            SortExpression="Consultant" />
                        <asp:BoundField DataField="Comments" HeaderText="Comments" 
                            SortExpression="Comments" />
                        <asp:BoundField DataField="NewBusiness" HeaderText="NewBusiness" 
                            SortExpression="NewBusiness" />
                        <asp:TemplateField HeaderText="File" SortExpression="File">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnDown" runat="server" CausesValidation="True" CommandArgument='<%# Bind("id") %>'
                                                CommandName="Download" Text='<%# Bind("File") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Status" HeaderText="Status" 
                            SortExpression="Status" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td align="right">(*): Default ordering</td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:SqlDataSource ID="sqldsMeetings" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="MeetingsList" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="UserId" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
    </table>
</asp:Content>

