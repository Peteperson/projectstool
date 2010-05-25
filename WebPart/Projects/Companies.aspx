<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="Companies.aspx.vb" Inherits="Companies" Theme="MainSkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
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
                    <tr class="centered">
                        <td>Companies list (select one - <asp:Image ID="Image1" runat="server" ImageUrl="Images/Icons/Approve_16x16.png" /> - to view details).<br />
                            Fill in company's name or part of it and press button to filter data: <asp:TextBox ID="txtFilterComp" runat="server" SkinID="txtTextCenter"></asp:TextBox>
                            &nbsp;<asp:Button ID="btnFilterComp" runat="server" Text="Filter data" />
                        </td>
                    </tr>
                    <tr>                       
                        <td align="center" style="vertical-align:top">
                            <asp:GridView ID="gvCompanies" runat="server" AllowPaging="True" EmptyDataText="Currently there are no registered companies"
                                AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id,Name" 
                                DataSourceID="sqldsCompanies" SkinID="gridviewSkinMainTbl" 
                                ShowFooter="True">
                                <Columns>
                                    <asp:TemplateField ShowHeader="True" HeaderText="Action">
                                        <ItemStyle Wrap="False" Width="60px" />
                                        <ItemTemplate>                
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                                CommandName="Edit" ImageUrl="~/Images/Icons/Edit16_16.png" ToolTip="Edit" />
                                            &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" Visible="false" 
                                                CommandName="Delete" ImageUrl="~/Images/Icons/Remove16_16.png" ToolTip="Delete" />
                                            &nbsp;<asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False" 
                                                CommandName="Select" ImageUrl="~/Images/Icons/Approve_16x16.png" ToolTip="Select" />
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
                                                ImageUrl="~/images/icons/add16_16.png" ValidationGroup="InsGroup" ToolTip="Insert" />
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Datestamp" SortExpression="Datestamp">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Datestamp", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Name" SortExpression="Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtCompanyName" MaxLength="50" SkinID="txtText" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" SkinID="rfvDef" runat="server" ControlToValidate="txtCompName" ValidationGroup="InsGroup" ErrorMessage="*"></asp:RequiredFieldValidator>
                                            <asp:TextBox ID="txtCompName" MaxLength="50" SkinID="txtText93" runat="server"></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Description" SortExpression="Description">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" MaxLength="150" runat="server" SkinID="txtText" Text='<%# Bind("Description") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtCompDesc" MaxLength="150" SkinID="txtText" runat="server"></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
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
        <tr class="title">
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
                            <table>
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
                                    <td><asp:ImageButton ID="btnInsEmpl" CausesValidation="true" ValidationGroup="InsEmp1st" runat="server" CommandName="Insert"
                                            ImageUrl="~/images/icons/add16_16.png" ToolTip="Insert employee" />
                                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" SkinID="rfvDef" runat="server" ControlToValidate="txt1LastName" ValidationGroup="InsEmp1st" ErrorMessage="*"></asp:RequiredFieldValidator><asp:TextBox ID="txt1LastName" MaxLength="50" SkinID="txtReqFld" runat="server"></asp:TextBox></td>
                                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" SkinID="rfvDef" runat="server" ControlToValidate="txt1FirstName" ValidationGroup="InsEmp1st" ErrorMessage="*"></asp:RequiredFieldValidator><asp:TextBox ID="txt1FirstName" MaxLength="50" SkinID="txtReqFld" runat="server"></asp:TextBox></td>
                                    <td><asp:DropDownList SkinId="ddlDef" ID="ddl1Position" runat="server" DataSourceID="sqldsEmplType" 
                                            DataTextField="Description" DataValueField="id">
                                        </asp:DropDownList></td>
                                    <td><asp:TextBox ID="txt1Tel" MaxLength="12" runat="server"></asp:TextBox></td>
                                    <td><asp:TextBox ID="txt1MobTel" MaxLength="12" runat="server"></asp:TextBox></td>
                                    <td><asp:TextBox ID="txt1email" MaxLength="50" runat="server"></asp:TextBox></td>
                                </tr>
                            </table>
                        </div>
                    </EmptyDataTemplate>
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemStyle Wrap="false" />
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
                                    ImageUrl="~/images/icons/add16_16.png" ToolTip="Insert" ValidationGroup="InsEmp" />
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Datestamp" SortExpression="Datestamp">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Datestamp", "{0:dd/MM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="LastName" SortExpression="LastName">
                            <EditItemTemplate>
                                <asp:TextBox SkinID="txtDef" MaxLength="50" ID="TextBox3" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" SkinID="rfvDef" runat="server" ControlToValidate="txt2LastName" ValidationGroup="InsEmp" ErrorMessage="*"></asp:RequiredFieldValidator><asp:TextBox SkinID="txtDef" ID="txt2LastName" MaxLength="50" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="FirstName" SortExpression="FirstName">
                            <EditItemTemplate>
                                <asp:TextBox SkinID="txtDef" MaxLength="50" ID="TextBox4" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" SkinID="rfvDef" runat="server" ControlToValidate="txt2FirstName" ValidationGroup="InsEmp" ErrorMessage="*"></asp:RequiredFieldValidator><asp:TextBox SkinID="txtDef" MaxLength="50" ID="txt2FirstName" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Position" SortExpression="Position">
                            <EditItemTemplate>
                                <asp:DropDownList SkinId="ddlDef" ID="ddl2Position" runat="server" DataSourceID="sqldsEmplType" 
                                    selectedvalue=<%# Bind("Position") %> DataTextField="Description" DataValueField="id">
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList SkinId="ddlDef" ID="ddl2Position" runat="server" DataSourceID="sqldsEmplType" 
                                    Enabled="false" selectedvalue=<%# Bind("Position") %> DataTextField="Description" DataValueField="id">
                                </asp:DropDownList>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList SkinId="ddlDef" ID="ddl2Position" runat="server" DataSourceID="sqldsEmplType" 
                                    DataTextField="Description" DataValueField="id">
                                </asp:DropDownList>
                            </FooterTemplate>                            
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Telephone" SortExpression="Telephone">
                            <EditItemTemplate>
                                <asp:TextBox SkinID="txtDef" MaxLength="12" ID="TextBox6" runat="server" Text='<%# Bind("Telephone") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Telephone") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox SkinID="txtDef" MaxLength="12" ID="txt2Tel" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Mobile" SortExpression="Mobile">
                            <EditItemTemplate>
                                <asp:TextBox SkinID="txtDef" ID="TextBox7" MaxLength="12" runat="server" Text='<%# Bind("Mobile") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("Mobile") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox SkinID="txtDef" MaxLength="12" ID="txt2MobTel" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email" SortExpression="Email">
                            <EditItemTemplate>
                                <asp:TextBox SkinID="txtDef" MaxLength="50" ID="TextBox8" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox SkinID="txtDef" MaxLength="50" ID="txt2Email" runat="server"></asp:TextBox>
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
                    SelectCommand="SELECT [Id], [Datestamp], [Name], [Description] FROM [Companies] WHERE [Name] LIKE ('%' + IsNull(@CompName, '') + '%')" 
                    UpdateCommand="UPDATE [Companies] SET [Name] = @Name, [Description] = @Description WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtFilterComp" Name="CompName" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsCompEmployees" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    
                    SelectCommand="SELECT * FROM [Users] WHERE ([Company] = @CompanyId AND [IsUser] = 0) ORDER BY [LastName], [FirstName]" 
                    DeleteCommand="DELETE FROM [Users] WHERE [Id] = @Id" 
                    InsertCommand="INSERT INTO [Users] ([UserName], [UserType], [Company], [Position], [LastName], [FirstName], [Telephone], [Mobile], [Email], [DefaultPage], [IsUser]) VALUES (@UserName, 41, @CompanyId, @Position, @LastName, @FirstName, @Telephone, @Mobile, @Email, 18, 0)" 
                    UpdateCommand="UPDATE [Users] SET [UserName] = @UserName, [LastName] = @LastName, [FirstName] = @FirstName, [Position] = @Position, [Telephone] = @Telephone, [Mobile] = @Mobile, [Email] = @Email WHERE [Id] = @Id">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="gvCompanies" Name="CompanyId" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="UserName" Type="String" />
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="FirstName" Type="String" />
                        <asp:Parameter Name="Position" Type="Byte" />
                        <asp:Parameter Name="Telephone" Type="String" DefaultValue=" " />
                        <asp:Parameter Name="Mobile" Type="String" DefaultValue=" " />
                        <asp:Parameter Name="Email" Type="String" DefaultValue=" " />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="UserName" Type="String" />
                        <asp:Parameter Name="UserType" Type="Int32" />
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

