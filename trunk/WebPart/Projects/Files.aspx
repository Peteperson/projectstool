<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="Files.aspx.vb" Inherits="Files" Theme="MainSkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br />
    <br />
    <table id="subPageMainTable">
        <tr>
            <td class="title">File list</td>
        </tr>
        <tr>
            <td id="tdAttachments">
                <asp:GridView ID="gvFiles" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" 
                    DataSourceID="sqldsFiles" SkinID="gridviewSkinSmall">
                    <Columns>
                        <asp:TemplateField HeaderText="A/A" SortExpression="A/A">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("[A/A]") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Datestamp *" HeaderStyle-Wrap="false" SortExpression="Datestamp">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Datestamp", "{0:dd/MM/yyyy HH:mm:ss}") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SubProject" SortExpression="SubProject">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnSubProject" runat="server" CausesValidation="True" CommandArgument='<%# Bind("ProjectId") %>'
                                                CommandName="SelSubProject" Text='<%# Bind("SubProject") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="File" SortExpression="File">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnDown" runat="server" CausesValidation="True" CommandArgument='<%# Bind("id") %>'
                                                CommandName="Download" Text='<%# Bind("File") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Comments" HeaderText="Comments" 
                            SortExpression="Comments" />
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
                <asp:SqlDataSource ID="sqldsFiles" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="FileList" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserId" SessionField="UserId" Type="Int16" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
    </table>
</asp:Content>

