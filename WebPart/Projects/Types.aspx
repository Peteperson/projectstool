<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="Types.aspx.vb" Inherits="Types" Theme="MainSkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br />
    <table id="subPageMainTable">
        <tr>
            <td class="title">Manage all types</td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtCatFilter" runat="server" Visible="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gvTypes" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" 
                    DataSourceID="sqldsTypes" SkinID="gridviewSkin" ShowFooter="true">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemStyle Wrap="false" Width="60px" />
                            <ItemTemplate>                
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                    CommandName="Edit" ImageUrl="~/Images/Icons/Edit16_16.png" ToolTip="Edit" />
                                &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" Visible="false"
                                    CommandName="Delete" ImageUrl="~/Images/Icons/Remove16_16.png" ToolTip="Delete" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" 
                                    CommandName="Update" ImageUrl="~/Images/Icons/Save16_16.png" ToolTip="Update" />
                                &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                    CommandName="Cancel" ImageUrl="~/Images/Icons/Cancel16_16.png" ToolTip="Cancel" />
                            </EditItemTemplate>
                            <FooterStyle HorizontalAlign="Center" />
                            <FooterTemplate>
                                <asp:ImageButton ID="btnInsert" CausesValidation="true" runat="server" CommandName="Insert"
                                    ImageUrl="~/images/icons/add16_16.png" ToolTip="Insert" ValidationGroup="InsGroup" />
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Category" SortExpression="Category">
                            <HeaderStyle HorizontalAlign="Center" />
                            <HeaderTemplate>
                                <table>
                                    <tr>
                                        <td style="padding-right:10px">Category</td>
                                        <td><asp:TextBox ID="txtHeadCatFilter" SkinID="txtFilter" runat="server"></asp:TextBox></td>
                                        <td><asp:ImageButton ID="btnFilterCat" runat="server" CausesValidation="False" 
                                                CommandName="Filter" ImageUrl="~/Images/Icons/Filter1_24x24.png" ToolTip="Filter data" />
                                        </td>
                                    </tr>
                                </table>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Category") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Category") %>' SkinID="txtDef"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:RequiredFieldValidator SkinID="rfvDef" ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtInsCategory" ValidationGroup="InsGroup" ErrorMessage="*"></asp:RequiredFieldValidator>
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
                                <asp:RequiredFieldValidator SkinID="rfvDef" ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtInsDesc" ValidationGroup="InsGroup" ErrorMessage="*"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtInsDesc" runat="server" SkinID="txtDef"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnClear" runat="server" Text="Remove filtering" 
                    Visible="False" />
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:SqlDataSource ID="sqldsTypes" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    DeleteCommand="DELETE FROM [VariousTypes] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [VariousTypes] ([id], [Category], [Description]) VALUES (@Id, @Category, @Description)" 
                    SelectCommand="SELECT * FROM [VariousTypes] WHERE Category LIKE ('%' + IsNull(@CatName, '') + '%')" 
                    UpdateCommand="UPDATE [VariousTypes] SET [id] = @id, [Category] = @Category, [Description] = @Description WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Category" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                        <asp:Parameter Name="Category" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtCatFilter" Name="CatName" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
    </table>
</asp:Content>

