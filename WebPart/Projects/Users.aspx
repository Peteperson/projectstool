<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="Users.aspx.vb" Inherits="Users" Theme="MainSkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" 
        DataSourceID="sqldsUsers" SkinID="gridviewSkin">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemStyle Width="40px" />
                <ItemTemplate>                
                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                        CommandName="Edit" ImageUrl="~/Images/Icons/Edit16_16.png" Text="Edit" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" 
                        CommandName="Update" ImageUrl="~/Images/Icons/Save16_16.png" Text="Update" />
                    &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                        CommandName="Cancel" ImageUrl="~/Images/Icons/Cancel16_16.png" Text="Cancel" />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="id" InsertVisible="False" SortExpression="id">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="UserName" SortExpression="UserName">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("UserName") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="UserType" SortExpression="UserType">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("UserType") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("UserType") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="FirstName" SortExpression="FirstName">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="LastName" SortExpression="LastName">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email" SortExpression="Email">
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DefaultPage" SortExpression="DefaultPage">
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("DefaultPage") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("DefaultPage") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="IsActive" SortExpression="IsActive">
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("IsActive") %>' 
                        Enabled="false" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("IsActive") %>' />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="LastLogin" SortExpression="LastLogin">
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("LastLogin") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("LastLogin") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:DropDownList ID="DropDownList1" runat="server" 
        DataSourceID="sqldsUserTypes" DataTextField="Description" DataValueField="id">
    </asp:DropDownList>
    <asp:SqlDataSource ID="sqldsUsers" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cnMain %>" 
        DeleteCommand="DELETE FROM [Users] WHERE [id] = @id" 
        InsertCommand="INSERT INTO [Users] ([UserName], [UserType], [FirstName], [LastName], [Email], [DefaultPage], [IsActive], [LastLogin]) VALUES (@UserName, @UserType, @FirstName, @LastName, @Email, @DefaultPage, @IsActive, @LastLogin)" 
        SelectCommand="SELECT [id], [UserName], [UserType], [FirstName], [LastName], [Email], [DefaultPage], [IsActive], [LastLogin] FROM [Users]" 
        UpdateCommand="UPDATE [Users] SET [UserName] = @UserName, [UserType] = @UserType, [FirstName] = @FirstName, [LastName] = @LastName, [Email] = @Email, [DefaultPage] = @DefaultPage, [IsActive] = @IsActive, [LastLogin] = @LastLogin WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="UserType" Type="Byte" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="DefaultPage" Type="String" />
            <asp:Parameter Name="IsActive" Type="Boolean" />
            <asp:Parameter Name="LastLogin" Type="DateTime" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="UserType" Type="Byte" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="DefaultPage" Type="String" />
            <asp:Parameter Name="IsActive" Type="Boolean" />
            <asp:Parameter Name="LastLogin" Type="DateTime" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="sqldsPages" 
        DataTextField="Description" DataValueField="id">
    </asp:DropDownList>
    <asp:SqlDataSource ID="sqldsUserTypes" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cnMain %>" 
        SelectCommand="SELECT [id], [Description] FROM [VariousTypes] WHERE ([Category] = @Category)">
        <SelectParameters>
            <asp:Parameter DefaultValue="UserType" Name="Category" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqldsPages" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cnMain %>" 
        SelectCommand="SELECT [id], [Description] FROM [Pages]"></asp:SqlDataSource>
    </asp:Content>