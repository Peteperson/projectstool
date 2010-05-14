<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="Users.aspx.vb" Inherits="Users" Theme="MainSkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br />
    <br />
    <table id="subPageMainTable">
        <tr>
            <td class="title">Manage Users</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gvUsers" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id"
                    DataSourceID="sqldsUsers" SkinID="gridviewSkin" ShowFooter="true">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemStyle Wrap="false" />
                            <ItemTemplate>                
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                    CommandName="Edit" ImageUrl="~/Images/Icons/Edit16_16.png" ToolTip="Edit" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" 
                                    CommandName="Update" ImageUrl="~/Images/Icons/Save16_16.png" ToolTip="Update" />
                                &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                    CommandName="Cancel" ImageUrl="~/Images/Icons/Cancel16_16.png" ToolTip="Cancel" />
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:ImageButton ID="btnInsert" CausesValidation="true" runat="server" CommandName="Insert"
                                    ImageUrl="~/images/icons/add16_16.png" ToolTip="Insert" ValidationGroup="InsGroup" />
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User Name" SortExpression="UserName">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" SkinID="txtDef" runat="server" Text='<%# Bind("UserName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:RequiredFieldValidator SkinID="rfvDef" ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtInsUserName" ValidationGroup="InsGroup" ErrorMessage="*"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtInsUserName" SkinID="txtReqFld" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User Type" SortExpression="UserType">
                            <ItemTemplate>
                                    <asp:DropDownList SkinId="ddlDef" ID="ddlUserType" runat="server" DataSourceID="sqldsUserTypes" 
                                        Enabled="false" selectedvalue=<%# Bind("UserType") %> DataTextField="Description" DataValueField="id">
                                    </asp:DropDownList>
                            </ItemTemplate>
                            <EditItemTemplate>
                                    <asp:DropDownList SkinId="ddlDef" ID="ddlUserType" runat="server" DataSourceID="sqldsUserTypes" 
                                        selectedvalue=<%# Bind("UserType") %> DataTextField="Description" DataValueField="id">
                                    </asp:DropDownList>
                            </EditItemTemplate>
                            <FooterTemplate>
                                    <asp:DropDownList SkinId="ddlDef" ID="ddlInsUserType" runat="server" DataSourceID="sqldsUserTypes" 
                                        DataTextField="Description" DataValueField="id">
                                    </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Company" SortExpression="Company">
                            <ItemTemplate>
                                <asp:DropDownList SkinId="ddlDef" ID="ddlCompanies" runat="server" 
                                    Enabled="false" selectedvalue=<%# Bind("Company") %> DataSourceID="sqldsCompanies" DataTextField="Name" DataValueField="Id">
                                </asp:DropDownList>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList SkinId="ddlDef" ID="ddlCompanies" runat="server" 
                                    selectedvalue=<%# Bind("Company") %> DataSourceID="sqldsCompanies" DataTextField="Name" DataValueField="Id">
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList SkinId="ddlDef" ID="ddlCompanies" runat="server" 
                                    DataSourceID="sqldsCompanies" DataTextField="Name" DataValueField="Id">
                                </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Name<br>First Name" SortExpression="LastName">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("LastName") %>'></asp:Label><br />
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" SkinID="txtDef" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox><br />
                                <asp:TextBox ID="TextBox3" SkinID="txtDef" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:RequiredFieldValidator SkinID="rfvDef" ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtInsLastName" ValidationGroup="InsGroup" ErrorMessage="*"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtInsLastName" SkinID="txtReqFld" runat="server"></asp:TextBox><br />
                                <asp:RequiredFieldValidator SkinID="rfvDef" ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtInsFirstName" ValidationGroup="InsGroup" ErrorMessage="*"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtInsFirstName" SkinID="txtReqFld" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Mobile<br>Telephone" SortExpression="Mobile">
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Mobile") %>'></asp:Label><br />
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Telephone") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" SkinID="txtDef" runat="server" Text='<%# Bind("Mobile") %>'></asp:TextBox><br />
                                <asp:TextBox ID="TextBox5" SkinID="txtDef" runat="server" Text='<%# Bind("Telephone") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtInsMobile" SkinID="txtDef" runat="server"></asp:TextBox><br />
                                <asp:TextBox ID="txtInsTelephone" SkinID="txtDef" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email" SortExpression="Email">
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox7" SkinID="txtDef" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtInsEmail" SkinID="txtDef" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Default Page" SortExpression="DefaultPage">
                            <ItemTemplate>
                                    <asp:DropDownList SkinId="ddlDef" ID="DropDownList2" runat="server" DataSourceID="sqldsPages" 
                                        Enabled="false" selectedvalue=<%# Bind("DefaultPage") %> DataTextField="Description" DataValueField="id">
                                    </asp:DropDownList>
                            </ItemTemplate>
                            <EditItemTemplate>
                                    <asp:DropDownList SkinId="ddlDef" ID="DropDownList2" runat="server" DataSourceID="sqldsPages" 
                                        selectedvalue=<%# Bind("DefaultPage") %> DataTextField="Description" DataValueField="id">
                                    </asp:DropDownList>
                            </EditItemTemplate>
                            <FooterTemplate>
                                    <asp:DropDownList SkinId="ddlDef" ID="ddlInsDefPage" runat="server" DataSourceID="sqldsPages" 
                                        DataTextField="Description" DataValueField="id">
                                    </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Enabled" SortExpression="IsActive">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("IsActive") %>' 
                                    Enabled="false" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("IsActive") %>' />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Login" SortExpression="LastLogin">
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("LastLogin", "{0:dd/MM/yyyy HH:mm:ss}") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("LastLogin", "{0:dd/MM/yyyy HH:mm:ss}") %>'></asp:Label>
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
        <table>
            <tr>
                <td>
    <asp:SqlDataSource ID="sqldsUsers" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cnMain %>" 
        DeleteCommand="DELETE FROM [Users] WHERE [id] = @id" 
        InsertCommand="INSERT INTO [Users] ([UserName], [Password], [UserType], [Company], [FirstName], [LastName], [Telephone], [Mobile], [Email], [DefaultPage]) VALUES (@UserName, @Password, @UserType, @Company, @FirstName, @LastName, @Telephone, @Mobile, @Email, @DefaultPage)" 
        SelectCommand="SELECT [id], [UserName], [UserType], [Company], [FirstName], [LastName], [Telephone], [Mobile], [Email], [DefaultPage], [IsActive], [LastLogin] FROM [Users]" 
        UpdateCommand="UPDATE [Users] SET [UserName] = @UserName, [UserType] = @UserType, [Company] = @Company, [FirstName] = @FirstName, [LastName] = @LastName, [Telephone] = @Telephone, [Mobile] = @Mobile, [Email] = @Email, [DefaultPage] = @DefaultPage, [IsActive] = @IsActive WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="UserType" Type="Byte" />
            <asp:Parameter Name="Company" Type="Int32" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Telephone" Type="String" />
            <asp:Parameter Name="Mobile" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="DefaultPage" Type="String" />
            <asp:Parameter Name="IsActive" Type="Boolean" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="Password" />
            <asp:Parameter Name="UserType" Type="Byte" />
            <asp:Parameter Name="Company" Type="Int32" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Telephone" Type="String" />
            <asp:Parameter Name="Mobile" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="DefaultPage" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
                </td>
                <td>
    <asp:SqlDataSource ID="sqldsUserTypes" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cnMain %>" 
        SelectCommand="SELECT [id], [Description] FROM [VariousTypes] WHERE ([Category] = @Category)">
        <SelectParameters>
            <asp:Parameter DefaultValue="UserType" Name="Category" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
                </td>
                <td>
    <asp:SqlDataSource ID="sqldsPages" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cnMain %>" 
        SelectCommand="SELECT [id], [Description] FROM [Pages]"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:SqlDataSource ID="sqldsCompanies" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                        SelectCommand="SELECT [Id], [Name] FROM [Companies] ORDER BY [Name]">
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </asp:Content>