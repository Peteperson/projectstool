<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="Users.aspx.vb" Inherits="Users" Theme="MainSkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br />
    <table id="subPageMainTable">
        <tr>
            <td class="FormTitle">
                <table style="width:100%">
                    <tr>
                        <td><asp:ImageButton ID="btnRemovePaging1" ImageUrl="~/Images/Paging3_32x32.png" runat="server" ToolTip="Ενεργοποίηση/Απενεργοποίηση σελιδοποίησης" /></td>
                        <td style="width:100%" align="center">Διαχείριση Χρηστών</td>
                        <td><asp:ImageButton ID="btnPrint" runat="server" ToolTip="Εκτύπωση σελίδας" 
                                ImageUrl="~/Images/Icons/Print1_32x32.png"/></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="tdBelowTitle">
                <asp:TextBox ID="txtUNameFilter" runat="server" Visible="False"></asp:TextBox>
                <asp:TextBox ID="txtLastNameFilter" runat="server" Visible="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gvUsers" runat="server" AllowPaging="True"
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id"
                    DataSourceID="sqldsUsers" SkinID="gridviewSkin">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemStyle Wrap="false" />
                            <ItemTemplate>                
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                    CommandName="Edit" ImageUrl="~/Images/Icons/Edit16_16.png" ToolTip="Διόρθωση" />
                                &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False"
                                    CommandName="Delete" ImageUrl="~/Images/Icons/Remove16_16.png" ToolTip="Διαγραφή" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" 
                                    CommandName="Update" ImageUrl="~/Images/Icons/Save16_16.png" ToolTip="Ενημέρωση εγγραφής" />
                                &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                    CommandName="Cancel" ImageUrl="~/Images/Icons/Cancel16_16.png" ToolTip="Ακύρωση" />
                            </EditItemTemplate>
                            <FooterStyle HorizontalAlign="Center" />
                            <FooterTemplate>
                                <asp:ImageButton ID="btnInsert" CausesValidation="true" runat="server" CommandName="Insert"
                                    ImageUrl="~/images/icons/add16_16.png" ToolTip="Εισαγωγή εγγραφής" ValidationGroup="InsGroup" />
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderStyle HorizontalAlign="Center" />
                            <HeaderTemplate>
                                <table>
                                    <tr>
                                        <td colspan="2" align="center"> <asp:LinkButton ID="lnkUsername" runat="server" CommandName="Sort" CommandArgument="UserName" >Username</asp:LinkButton></td>
                                    </tr>
                                    <tr>
                                        <td><asp:TextBox ID="txtHeadUsrFilter" SkinID="txtFilterSmall" runat="server"></asp:TextBox></td>
                                        <td><asp:ImageButton ID="btnFilter" runat="server" CausesValidation="False" 
                                                CommandName="Filter" ImageUrl="~/Images/Icons/Filter1_24x24.png" ToolTip="Φιλτράρισμα δεδομένων" /></td>                                        
                                    </tr>
                                </table>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" SkinID="txtDef" runat="server" Text='<%# Bind("UserName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:RequiredFieldValidator SkinID="rfvDef" ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtInsUserName" ValidationGroup="InsGroup" ErrorMessage="*"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtInsUserName" SkinID="txtReqFld" CssClass="MaxWidth80px" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User Type" SortExpression="UserType">
                            <ItemTemplate>
                                <asp:Label ID="Label12" runat="server" Text='<%# Bind("UserTypeText") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                    <asp:DropDownList ID="ddlUserType" runat="server" DataSourceID="sqldsUserTypes" 
                                        selectedvalue=<%# Bind("UserType") %> DataTextField="Description" DataValueField="id">
                                    </asp:DropDownList>
                            </EditItemTemplate>
                            <FooterTemplate>
                                    <asp:DropDownList ID="ddlInsUserType" runat="server" DataSourceID="sqldsUserTypes" 
                                        DataTextField="Description" DataValueField="id">
                                    </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Company<br>Position" SortExpression="Company">
                            <ItemTemplate>
                                <asp:Label ID="Label13" runat="server" Text='<%# Bind("CompanyText") %>'></asp:Label><br />
                                <asp:Label ID="Label14" runat="server" Text='<%# Bind("UserPositionText") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlCompanies" runat="server" 
                                    selectedvalue=<%# Bind("Company") %> DataSourceID="sqldsCompanies" DataTextField="Name" DataValueField="Id">
                                </asp:DropDownList><br />
                                <asp:DropDownList ID="ddlPosition" runat="server" DataSourceID="sqldsEmplType" 
                                    selectedvalue=<%# Bind("Position") %> DataTextField="Description" DataValueField="id">
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="ddlCompanies" runat="server" 
                                    DataSourceID="sqldsCompanies" DataTextField="Name" DataValueField="Id">
                                </asp:DropDownList><br />
                                <asp:DropDownList ID="ddlPosition" runat="server" DataSourceID="sqldsEmplType" 
                                    DataTextField="Description" DataValueField="id">
                                </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderStyle HorizontalAlign="Center" />
                            <HeaderTemplate>
                                <table>
                                    <tr>
                                        <td colspan="2" align="center"><asp:LinkButton ID="lnkLastname" runat="server" CommandName="Sort" CommandArgument="LastName" >Fullname</asp:LinkButton></td>
                                    </tr>
                                    <tr>
                                        <td><asp:TextBox ID="txtHeadLstFilter" SkinID="txtFilterSmall" runat="server"></asp:TextBox></td>
                                        <td><asp:ImageButton ID="btnFilterLstName" runat="server" CausesValidation="False" 
                                                CommandName="FilterLN" ImageUrl="~/Images/Icons/Filter1_24x24.png" ToolTip="Φιλτράρισμα δεδομένων" /></td>                                        
                                    </tr>
                                </table>
                            </HeaderTemplate>                        
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
                                <asp:TextBox ID="txtInsLastName" CssClass="MaxWidth80px" SkinID="txtReqFld" runat="server"></asp:TextBox><br />
                                <asp:RequiredFieldValidator SkinID="rfvDef" ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtInsFirstName" ValidationGroup="InsGroup" ErrorMessage="*"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtInsFirstName" CssClass="MaxWidth80px" SkinID="txtReqFld" runat="server"></asp:TextBox>
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
                                <asp:TextBox ID="txtInsMobile" CssClass="MaxWidth80px" SkinID="txtDef" runat="server"></asp:TextBox><br />
                                <asp:TextBox ID="txtInsTelephone" CssClass="MaxWidth80px" SkinID="txtDef" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email<br>Default Page" SortExpression="Email">
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("Email") %>'></asp:Label><br />
                                <asp:Label ID="Label15" runat="server" Text='<%# Bind("DefaultPageText") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox7" SkinID="txtDef" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox><br />
                                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="sqldsPages" 
                                    selectedvalue=<%# Bind("DefaultPage") %> DataTextField="Description" DataValueField="id">
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtInsEmail" SkinID="txtDef" runat="server"></asp:TextBox><br />
                                <asp:DropDownList ID="ddlInsDefPage" runat="server" DataSourceID="sqldsPages"
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
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("LastLogin", "{0:dd/MM/yyyy<br />HH:mm:ss}") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("LastLogin", "{0:dd/MM/yyyy HH:mm:ss}") %>'></asp:Label>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User" SortExpression="IsUser">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("IsUser") %>' 
                                    Enabled="false" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("IsUser") %>' />
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:CheckBox ID="chkIsUser" runat="server" />
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="btnResetPass" runat="server" CommandName="ResetPass" CausesValidation="False" 
                                    ImageUrl="~/Images/Icons/Update2_22x22.png" CommandArgument='<%# Bind("Id") %>' 
                                    ToolTip="Έκδοση νέου κωδικού" />
                            </ItemTemplate>
                            <EditItemTemplate>
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="btnInsertion" runat="server" Text="Enable/Disable insertion" />
                <asp:Button ID="btnclearFilters" runat="server" Text="Clear filtering" />
            </td>
        </tr>
    </table>
        <table>
            <tr>
                <td>
    <asp:SqlDataSource ID="sqldsUsers" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cnMain %>" 
        DeleteCommand="DELETE FROM [Users] WHERE [id] = @id" 
        InsertCommand="INSERT INTO [Users] ([UserName], [Password], [UserType], [Company], [Position], [FirstName], [LastName], [Telephone], [Mobile], [Email], [DefaultPage], [IsUser]) VALUES (@UserName, @Password, @UserType, @Company, @Position, @FirstName, @LastName, @Telephone, @Mobile, @Email, @DefaultPage, @IsUser)" 
        SelectCommand="UsersList" 
        UpdateCommand="UPDATE [Users] SET [UserName] = @UserName, [UserType] = @UserType, [Company] = @Company, [Position] = @Position, [FirstName] = @FirstName, [LastName] = @LastName, [Telephone] = @Telephone, [Mobile] = @Mobile, [Email] = @Email, [DefaultPage] = @DefaultPage, [IsActive] = @IsActive, [IsUser] = @IsUser WHERE [id] = @id" 
        SelectCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="UserType" Type="Byte" />
            <asp:Parameter Name="Company" Type="Int32" />
            <asp:Parameter Name="Position" Type="Int32" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Telephone" Type="String" DefaultValue=" " />
            <asp:Parameter Name="Mobile" Type="String" DefaultValue=" " />
            <asp:Parameter Name="Email" Type="String" DefaultValue=" " />
            <asp:Parameter Name="DefaultPage" Type="String" />
            <asp:Parameter Name="IsActive" Type="Boolean" />
            <asp:Parameter Name="IsUser" Type="Boolean" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="Password" />
            <asp:Parameter Name="UserType" Type="Byte" />
            <asp:Parameter Name="Company" Type="Int32" />
            <asp:Parameter Name="Position" Type="Int32" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Telephone" Type="String" DefaultValue=" " />
            <asp:Parameter Name="Mobile" Type="String" DefaultValue=" " />
            <asp:Parameter Name="Email" Type="String" DefaultValue=" " />
            <asp:Parameter Name="DefaultPage" Type="String" />
            <asp:Parameter Name="IsUser" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtLastNameFilter" Name="LastName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtUNameFilter" Name="UserName" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
                </td>
                <td>
    <asp:SqlDataSource ID="sqldsUserTypes" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cnMain %>" 
        SelectCommand="SELECT [id], [Description] FROM [VariousTypes] WHERE ([Category] = @Category) AND [Description] <> 'Admin'"
        UpdateCommand="UPDATE [Users] SET [Password] = @Password WHERE [id] = @id" >
        <SelectParameters>
            <asp:Parameter DefaultValue="UserType" Name="Category" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Password" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:SqlDataSource ID="sqldsPages" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                        SelectCommand="SELECT [id], [Description] FROM [Pages] ORDER BY [Description]"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:SqlDataSource ID="sqldsCompanies" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                        SelectCommand="SELECT [Id], [Name] FROM [Companies] ORDER BY [Name]">
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