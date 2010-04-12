<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="Users.aspx.vb" Inherits="Users" Theme="MainSkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" 
        DataSourceID="sqldsUsers" SkinID="gridviewSkin">
        <Columns>
            <asp:CommandField ButtonType="Image" 
                EditImageUrl="~/Images/Icons/Edit16_16.png" 
                InsertImageUrl="~/Images/Icons/add16_16.png" ShowEditButton="True" 
                UpdateImageUrl="~/Images/Icons/Save16_16.png" />
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" 
                SortExpression="UserName" />
            <asp:BoundField DataField="UserType" HeaderText="UserType" 
                SortExpression="UserType" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" 
                SortExpression="LastName" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="DefaultPage" HeaderText="DefaultPage" 
                SortExpression="DefaultPage" />
            <asp:CheckBoxField DataField="IsActive" HeaderText="IsActive" 
                SortExpression="IsActive" />
            <asp:BoundField DataField="LastLogin" HeaderText="LastLogin" 
                SortExpression="LastLogin" />
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