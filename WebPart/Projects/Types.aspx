﻿<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="Types.aspx.vb" Inherits="Types" Theme="MainSkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br />
    <br />
    <table id="subPageMainTable">
        <tr>
            <td class="title">Manage all types</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gvTypes" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" 
                    DataSourceID="sqldsTypes" SkinID="gridviewSkin" ShowFooter="true">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemStyle Wrap="false" />
                            <ItemTemplate>                
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                    CommandName="Edit" ImageUrl="~/Images/Icons/Edit16_16.png" ToolTip="Edit" />
                                &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                    CommandName="Delete" ImageUrl="~/Images/Icons/Remove16_16.png" ToolTip="Delete" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" 
                                    CommandName="Update" ImageUrl="~/Images/Icons/Save16_16.png" ToolTip="Update" />
                                &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                    CommandName="Cancel" ImageUrl="~/Images/Icons/Cancel16_16.png" ToolTip="Cancel" />
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:ImageButton ID="btnInsert" CausesValidation="true" runat="server" CommandName="Insert"
                                    ImageUrl="~/images/icons/add16_16.png" ToolTip="Insert" />
                            </FooterTemplate>
                        </asp:TemplateField>                        
                        <asp:TemplateField HeaderText="Category" SortExpression="Category">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Category") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Category") %>' SkinID="txtDef"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtInsCategory" runat="server" SkinID="txtDef"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Description" SortExpression="Description">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Description") %>' SkinID="txtDef"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtInsDesc" runat="server" SkinID="txtDef"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:SqlDataSource ID="sqldsTypes" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    DeleteCommand="DELETE FROM [VariousTypes] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [VariousTypes] ([Category], [Description]) VALUES (@Category, @Description)" 
                    SelectCommand="SELECT * FROM [VariousTypes]" 
                    UpdateCommand="UPDATE [VariousTypes] SET [Category] = @Category, [Description] = @Description WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Category" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Category" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
    </table>
</asp:Content>

