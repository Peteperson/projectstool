<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="Pages.aspx.vb" Inherits="Pages" Theme="MainSkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br />
    <br />
    <table id="subPageMainTable">
        <tr>
            <td class="title">Manage pages</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gvPages" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" 
                    DataSourceID="sqldsPages" SkinID="gridviewSkin" ShowFooter="true">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemStyle Width="40px" />
                            <ItemTemplate>                
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                    CommandName="Edit" ImageUrl="~/Images/Icons/Edit16_16.png" Text="Edit" />
                                &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                    CommandName="Delete" ImageUrl="~/Images/Icons/Remove16_16.png" Text="Delete" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" 
                                    CommandName="Update" ImageUrl="~/Images/Icons/Save16_16.png" Text="Update" />
                                &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                    CommandName="Cancel" ImageUrl="~/Images/Icons/Cancel16_16.png" Text="Cancel" />
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:ImageButton ID="btnInsert" CausesValidation="true" runat="server" CommandName="Insert"
                                    ImageUrl="~/images/icons/add16_16.png" ToolTip="Insert" />
                            </FooterTemplate>
                        </asp:TemplateField> 
                        <asp:TemplateField HeaderText="&nbsp;id&nbsp;" SortExpression="id">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                            </EditItemTemplate>
                            <FooterTemplate>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Path" SortExpression="Path">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Path") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Path") %>' SkinID="txtDef"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtInsPath" runat="server" SkinID="txtDef"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Image" SortExpression="Image">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Image") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Image") %>' SkinID="txtDef"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtInsImage" runat="server" SkinID="txtDef"></asp:TextBox>
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
                <asp:SqlDataSource ID="sqldsPages" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    DeleteCommand="DELETE FROM [Pages] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [Pages] ([id], [Path], [Image], [Description]) VALUES (@id, @Path, @Image, @Description)" 
                    SelectCommand="SELECT * FROM [Pages]" 
                    UpdateCommand="UPDATE [Pages] SET [Path] = @Path, [Description] = @Description, [Image] = @Image WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Path" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Image" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                        <asp:Parameter Name="Path" Type="String" />
                        <asp:Parameter Name="Image" Type="String" />
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

