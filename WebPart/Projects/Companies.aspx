<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="Companies.aspx.vb" Inherits="Companies" Theme="MainSkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br />
    <br />
    <table id="subPageMainTable">
        <tr>
            <td class="title">Manage companies</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <table style="width:100%">
                    <tr class="smalltitle">
                        <td>Companies list</td>
                        <td><asp:Label ID="lblCompName1" runat="server" Text="..."></asp:Label> users</td>
                    </tr>
                    <tr>                       
                        <td align="center" style="vertical-align:top">
                            <asp:GridView ID="gvCompanies" runat="server" AllowPaging="True"  EmptyDataText="Currently there are no registered companies"
                                AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id,Name" 
                                DataSourceID="sqldsCompanies" SkinID="gridviewSkinMainTbl" 
                                ShowFooter="true">
                                <Columns>
                                    <asp:TemplateField ShowHeader="True" HeaderText="Action">
                                        <ItemStyle Width="70px" />
                                        <ItemTemplate>                
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                                CommandName="Edit" ImageUrl="~/Images/Icons/Edit16_16.png" ToolTip="Edit" />
                                            &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                                CommandName="Delete" ImageUrl="~/Images/Icons/Remove16_16.png" ToolTip="Delete" />
                                            &nbsp;<asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False" 
                                                CommandName="Select" ImageUrl="~/Images/Icons/Approve_16x16.png" ToolTip="Select" />
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
                                    <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="Id">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Datestamp" SortExpression="Datestamp" >
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Datestamp", "{0:dd/MM/yyyy}") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>                                           
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Datestamp", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Name" SortExpression="Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtCompName" runat="server"></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Description" SortExpression="Description">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtCompDesc" runat="server"></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>                            
                        </td>
                        <td style="vertical-align:top" align="center">
                            <table>
                                <tr>
                                    <td>
                                        <asp:GridView ID="gvCmpUsr" runat="server" AllowPaging="True"  EmptyDataText="Currently there are no registered users"
                                            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" 
                                            DataSourceID="sqldsUsersComp" SkinID="gridviewSkin" Visible="False">
                                            <Columns>
                                                <asp:TemplateField ShowHeader="False">
                                                    <ItemStyle Width="40px" />
                                                    <ItemTemplate>                
                                                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                                            CommandName="Edit" ImageUrl="~/Images/Icons/Edit16_16.png" ToolTip="Edit" />
                                                        &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                                            CommandName="Delete" ImageUrl="~/Images/Icons/Remove16_16.png" ToolTip="Delete" />
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" 
                                                            CommandName="Update" ImageUrl="~/Images/Icons/Save16_16.png" Text="Update" />
                                                        &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                                            CommandName="Cancel" ImageUrl="~/Images/Icons/Cancel16_16.png" Text="Cancel" />
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="Id">
                                                    <EditItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="UserId" SortExpression="UserId">
                                                    <EditItemTemplate>
                                                        <asp:DropDownList ID="ddlUsers" runat="server" DataSourceID="sqldsUsers" 
                                                           selectedvalue=<%# Bind("UserId") %> DataTextField="UserName" DataValueField="id">
                                                        </asp:DropDownList>                                            
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:DropDownList ID="ddlUsers" runat="server" DataSourceID="sqldsUsers" 
                                                           Enabled="false" selectedvalue=<%# Bind("UserId") %> DataTextField="UserName" DataValueField="id">
                                                        </asp:DropDownList>                                            
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div id="dvInsUsrComp" runat="server" visible="false" class="InsertRow">Users: <asp:DropDownList ID="ddlInsUsers" runat="server" DataSourceID="sqldsUsers" 
                                               DataTextField="UserName" DataValueField="id">
                                             </asp:DropDownList>                                            
                                            <asp:ImageButton ID="btnInsUser" runat="server" 
                                                ImageUrl="~/Images/Icons/add16_16.png" ToolTip="Add the selected user" />
                                        </div>                            
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr class="smalltitle">
            <td><asp:Label ID="lblCompName2" runat="server" Text="..."></asp:Label> employees</td>
        </tr>
        <tr>
            <td align="center">
                <asp:GridView ID="gvCompEmpl" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="Id" DataSourceID="sqldsCompEmployees" AllowPaging="True" 
                    AllowSorting="True" SkinID="gridviewSkin" ShowFooter="True" 
                    Visible="False">
                    <EmptyDataTemplate>
                        Currently there are no registered employees<br />
                        <br />
                        <div class="InsertRow">
                            <table width="100%">
                                <tr class="InsertHeader">
                                    <td>Action</td>
                                    <td>LastName</td>
                                    <td>FirstName</td>
                                    <td>Position</td>
                                    <td>Telephone</td>
                                    <td>Mobile</td>
                                    <td>Email</td>
                                </tr>
                                <tr>
                                    <td><asp:ImageButton ID="btnInsEmpl" CausesValidation="true" runat="server" CommandName="Insert"
                                            ImageUrl="~/images/icons/add16_16.png" ToolTip="Insert employee" />
                                    <td><asp:TextBox ID="txt1LastName" runat="server"></asp:TextBox></td>
                                    <td><asp:TextBox ID="txt1FirstName" runat="server"></asp:TextBox></td>
                                    <td><asp:DropDownList ID="ddl1Position" runat="server" DataSourceID="sqldsEmplType" 
                                            DataTextField="Description" DataValueField="id">
                                        </asp:DropDownList></td>
                                    <td><asp:TextBox ID="txt1Tel" runat="server"></asp:TextBox></td>
                                    <td><asp:TextBox ID="txt1MobTel" runat="server"></asp:TextBox></td>
                                    <td><asp:TextBox ID="txt1email" runat="server"></asp:TextBox></td>
                                </tr>
                            </table>
                        </div>
                    </EmptyDataTemplate>
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemStyle Width="40px" />
                            <ItemTemplate>                
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                    CommandName="Edit" ImageUrl="~/Images/Icons/Edit16_16.png" ToolTip="Edit" />
                                &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                    CommandName="Delete" ImageUrl="~/Images/Icons/Remove16_16.png" ToolTip="Delete" />
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
                        <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="Id">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Datestamp" SortExpression="Datestamp">
                            <EditItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Datestamp", "{0:dd/MM/yyyy}") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Datestamp", "{0:dd/MM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="LastName" SortExpression="LastName">
                            <EditItemTemplate>
                                <asp:TextBox SkinID="txtDef" ID="TextBox3" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox SkinID="txtDef" ID="txt2LastName" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="FirstName" SortExpression="FirstName">
                            <EditItemTemplate>
                                <asp:TextBox SkinID="txtDef" ID="TextBox4" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox SkinID="txtDef" ID="txt2FirstName" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Position" SortExpression="Position">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddl2Position" runat="server" DataSourceID="sqldsEmplType" 
                                    selectedvalue=<%# Bind("Position") %> DataTextField="Description" DataValueField="id">
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="ddl2Position" runat="server" DataSourceID="sqldsEmplType" 
                                    Enabled="false" selectedvalue=<%# Bind("Position") %> DataTextField="Description" DataValueField="id">
                                </asp:DropDownList>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="ddl2Position" runat="server" DataSourceID="sqldsEmplType" 
                                    DataTextField="Description" DataValueField="id">
                                </asp:DropDownList>
                            </FooterTemplate>                            
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Telephone" SortExpression="Telephone">
                            <EditItemTemplate>
                                <asp:TextBox SkinID="txtDef" ID="TextBox6" runat="server" Text='<%# Bind("Telephone") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Telephone") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox SkinID="txtDef" ID="txt2Tel" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Mobile" SortExpression="Mobile">
                            <EditItemTemplate>
                                <asp:TextBox SkinID="txtDef" ID="TextBox7" runat="server" Text='<%# Bind("Mobile") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("Mobile") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox SkinID="txtDef" ID="txt2MobTel" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email" SortExpression="Email">
                            <EditItemTemplate>
                                <asp:TextBox SkinID="txtDef" ID="TextBox8" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox SkinID="txtDef" ID="txt2Email" runat="server"></asp:TextBox>
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
                <asp:SqlDataSource ID="sqldsCompanies" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    DeleteCommand="DELETE FROM [Companies] WHERE [Id] = @Id" 
                    InsertCommand="INSERT INTO [Companies] ([Name], [Description]) VALUES (@Name, @Description)" 
                    SelectCommand="SELECT [Id], [Datestamp], [Name], [Description] FROM [Companies] ORDER BY [Name]" 
                    
                    UpdateCommand="UPDATE [Companies] SET [Datestamp] = @Datestamp, [Name] = @Name, [Description] = @Description WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Datestamp" Type="DateTime" />
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsCompEmployees" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    
                    SelectCommand="SELECT * FROM [CompaniesEmployees] WHERE ([CompanyId] = @CompanyId) ORDER BY [LastName], [FirstName]" 
                    DeleteCommand="DELETE FROM [CompaniesEmployees] WHERE [Id] = @Id" 
                    InsertCommand="INSERT INTO [CompaniesEmployees] ([CompanyId], [LastName], [FirstName], [Position], [Telephone], [Mobile], [Email]) VALUES (@CompanyId, @LastName, @FirstName, @Position, @Telephone, @Mobile, @Email)" 
                    UpdateCommand="UPDATE [CompaniesEmployees] SET [LastName] = @LastName, [FirstName] = @FirstName, [Position] = @Position, [Telephone] = @Telephone, [Mobile] = @Mobile, [Email] = @Email WHERE [Id] = @Id">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="gvCompanies" Name="CompanyId" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="FirstName" Type="String" />
                        <asp:Parameter Name="Position" Type="Byte" />
                        <asp:Parameter Name="Telephone" Type="String" />
                        <asp:Parameter Name="Mobile" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="CompanyId" Type="Int32" />
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="FirstName" Type="String" />
                        <asp:Parameter Name="Position" Type="Byte" />
                        <asp:Parameter Name="Telephone" Type="String" />
                        <asp:Parameter Name="Mobile" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsUsersComp" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    DeleteCommand="DELETE FROM [UsersCompanies] WHERE [Id] = @Id" 
                    InsertCommand="INSERT INTO [UsersCompanies] ([UserId], [CompanyId]) VALUES (@UserId, @CompanyId)" 
                    SelectCommand="SELECT * FROM [UsersCompanies] WHERE ([CompanyId] = @CompanyId)" 
                    UpdateCommand="UPDATE [UsersCompanies] SET [UserId] = @UserId WHERE [Id] = @Id">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="gvCompanies" Name="CompanyId" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="UserId" Type="Int32" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="UserId" Type="Int32" />
                        <asp:Parameter Name="CompanyId" Type="Int32" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsUsers" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    
                    SelectCommand="SELECT [UserName], [id] FROM [Users] WHERE ([Company] = @Company) ORDER BY [UserName]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="gvCompanies" Name="Company" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="sqldsEmplType" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="SELECT [id], [Description] FROM [VariousTypes] WHERE ([Category] = @Category) ORDER BY [id]">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="EmployeeType" Name="Category" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
    </table>
</asp:Content>

