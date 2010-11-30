<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="Users.aspx.vb" Inherits="Users" Theme="MainSkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script language="javascript" type="text/javascript">
    function CheckUserName(source, clientside_arguments) {
        //GetClientId("txtInsUserName");
        var ddl = document.getElementById(GetClientId("ddlInsUserType"));
        var idx = ddl.selectedIndex;
        if (ddl.options[idx].text.toLowerCase() == "client") {
            clientside_arguments.IsValid = true;
        } else {
            clientside_arguments.IsValid = false;
        }
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br />
    <table id="subPageMainTable">
        <tr>
            <td class="FormTitle">
                <table style="width:100%">
                    <tr>
                        <td><asp:ImageButton ID="btnRemovePaging" ImageUrl="~/Images/Paging3_32x32.png" runat="server" ToolTip="Ενεργοποίηση/Απενεργοποίηση σελιδοποίησης" /></td>
                        <td style="width:100%" align="center">Διαχείριση Χρηστών</td>
                        <td><asp:ImageButton ID="btnPrint" runat="server" ToolTip="Εκτύπωση σελίδας" 
                                ImageUrl="~/Images/Icons/Print1_32x32.png" OnClientClick="return PrintWithoutPostback()"/></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="tdBelowTitle">
                Προβολή των χρηστών τής εταιρείας: <asp:DropDownList ID="ddlCompanies" runat="server" 
                                    DataSourceID="objdsCompanies" DataTextField="Name" DataValueField="Id">
                                </asp:DropDownList>
                <asp:TextBox ID="txtUNameFilter" runat="server" Visible="False"></asp:TextBox>
                <asp:TextBox ID="txtLastNameFilter" runat="server" Visible="False"></asp:TextBox>
                <asp:TextBox ID="txtCompNameFilter" runat="server" Visible="False"></asp:TextBox>
                <asp:Button ID="btnSetCmp" runat="server" Text="Επιλογή" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gvUsers" runat="server" AllowPaging="True" ShowFooter="True"
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id"
                    DataSourceID="sqldsUsers" SkinID="gridviewSkinMainTbl">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemStyle Wrap="false" />
                            <ItemTemplate>                
                                <asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False" 
                                    CommandName="Select" ImageUrl="~/Images/Icons/Approve_16x16.png" ToolTip="Επιλογή εγγραφής" />
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                    CommandName="Edit" ImageUrl="~/Images/Icons/Edit16_16.png" ToolTip="Διόρθωση" />
                                <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False"
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
                        <asp:TemplateField HeaderText="User Type" SortExpression="UserType">
                            <ItemTemplate>
                                <asp:Label ID="Label12" runat="server" Text='<%# Bind("UserTypeText") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                    <asp:DropDownList ID="ddlUserType" runat="server" DataSourceID="objdsUserType" 
                                        selectedvalue=<%# Bind("UserType") %> DataTextField="Description" DataValueField="id">
                                    </asp:DropDownList>
                            </EditItemTemplate>
                            <FooterTemplate>
                                    <asp:DropDownList ID="ddlInsUserType" runat="server" DataSourceID="objdsUserType" 
                                        DataTextField="Description" DataValueField="id">
                                    </asp:DropDownList>
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
                                <asp:CustomValidator ID="CustomValidator4" runat="server" ClientValidationFunction="CheckUserName" ValidateEmptyText = "true"
                                    ControlToValidate="txtInsUserName" ErrorMessage="*" ValidationGroup="InsGroup" SkinID="csvDef"></asp:CustomValidator>
                                <asp:TextBox ID="txtInsUserName" SkinID="txtReqFld" runat="server"></asp:TextBox>
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
                <asp:Button ID="btnclearFilters" runat="server" Text="Clear filtering" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="FormTitle">Στοιχεία εταιρείας</td>
        </tr>
        <tr>
            <td class="tdBelowTitle2">
                <asp:GridView ID="gvCompanies" runat="server" AutoGenerateColumns="False" ShowFooter="True" 
                    DataKeyNames="UserId,CompanyId" DataSourceID="sqldsCompanies" 
                    SkinID="gridviewSkin">
                    <EmptyDataTemplate>
                        <br />
                        Δεν υπάρχουν καταχωρημένες εταιρείες.<br />
                        <br />
                        <table border="1" class="TblEmptyData">
                            <tr class="InsertTabHeader">
                                <td></td>
                                <td>Όνομα εταιρείας</td>
                                <td>Θέση</td>
                                <td>Τηλέφωνο</td>
                                <td>Κινητό</td>
                                <td>Email</td>
                            </tr>
                            <tr class="InsertRow">
                                <td class="centered"><asp:ImageButton ID="btnInsert" CausesValidation="true" runat="server" CommandName="Insert"
                                    ImageUrl="~/images/icons/add16_16.png" ToolTip="Εισαγωγή εγγραφής" ValidationGroup="InsAP" /></td>
                                <td><asp:DropDownList ID="ddlUsrCompany" runat="server" 
                                    DataSourceID="objdsCompanies" DataTextField="Name" DataValueField="Id">
                                </asp:DropDownList></td>
                                <td><asp:DropDownList ID="ddlUsrPosition" runat="server" DataSourceID="objdsEmplType" 
                                        DataTextField="Description" DataValueField="id">
                                    </asp:DropDownList></td>
                                <td><asp:TextBox ID="txtCmpTel" runat="server" Text='<%# Bind("Telephone") %>'></asp:TextBox></td>
                                <td><asp:TextBox ID="txtCmpMob" runat="server" Text='<%# Bind("Mobile") %>'></asp:TextBox></td>
                                <td><asp:TextBox ID="txtCmpMail" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox></td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemStyle Wrap="false" />
                            <ItemTemplate>                
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                    CommandName="Edit" ImageUrl="~/Images/Icons/Edit16_16.png" ToolTip="Διόρθωση" />
                                <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False"
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
                                    ImageUrl="~/images/icons/add16_16.png" ToolTip="Εισαγωγή εγγραφής" />
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Όνομα εταιρείας" SortExpression="CompanyText">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlUsrCompany" runat="server" 
                                    selectedvalue=<%# Bind("CompanyId") %> DataSourceID="objdsCompanies" DataTextField="Name" DataValueField="Id">
                                </asp:DropDownList><br />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("CompanyText") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="ddlUsrCompany" runat="server" 
                                    DataSourceID="objdsCompanies" DataTextField="Name" DataValueField="Id">
                                </asp:DropDownList><br />
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Θέση" SortExpression="PositionText">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlUsrPosition" runat="server" DataSourceID="objdsEmplType" 
                                    selectedvalue=<%# Bind("Position") %> DataTextField="Description" DataValueField="id">
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("PositionText") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="ddlUsrPosition" runat="server" DataSourceID="objdsEmplType" 
                                    DataTextField="Description" DataValueField="id">
                                </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Τηλέφωνο" SortExpression="Telephone">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Telephone") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Telephone") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtCmpTel" runat="server" Text='<%# Bind("Telephone") %>'></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Κινητό" SortExpression="Mobile">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Mobile") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Mobile") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtCmpMob" runat="server" Text='<%# Bind("Mobile") %>'></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email" SortExpression="Email">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtCmpMail" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
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
    <asp:SqlDataSource ID="sqldsUsers" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cnMain %>" 
        DeleteCommand="DELETE FROM [Users] WHERE [id] = @id" 
        InsertCommand="INSERT INTO [Users] ([UserName], [Password], [UserType], [FirstName], [LastName], [Telephone], [Mobile], [Email], [DefaultPage], [IsUser]) VALUES (@UserName, @Password, @UserType, @FirstName, @LastName, @Telephone, @Mobile, @Email, @DefaultPage, @IsUser)" 
        SelectCommand="UsersList" 
        UpdateCommand="UPDATE [Users] SET [UserName] = @UserName, [UserType] = @UserType, [FirstName] = @FirstName, [LastName] = @LastName, [Telephone] = @Telephone, [Mobile] = @Mobile, [Email] = @Email, [DefaultPage] = @DefaultPage, [IsActive] = @IsActive, [IsUser] = @IsUser WHERE [id] = @id" 
        SelectCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="UserType" Type="Byte" />
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
            <asp:ControlParameter ControlID="txtCompNameFilter" Name="CompName" PropertyName="Text" Type="String" />
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
                    <asp:ObjectDataSource ID="objdsCompanies" runat="server" 
                        SelectMethod="Companies" TypeName="Database">
                        <SelectParameters>
                            <asp:Parameter Name="WhereText" Type="String" />
                            <asp:Parameter DefaultValue="Name" Name="OrderBy" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:ObjectDataSource ID="objdsEmplType" runat="server" 
                        SelectMethod="VariousTypes" TypeName="Database">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="Category ='EmployeeType'" Name="Category" Type="String" />
                            <asp:Parameter DefaultValue="Description" Name="OrderBy" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
                <td>
                <asp:ObjectDataSource ID="objdsUserType" runat="server" 
                    SelectMethod="VariousTypes" TypeName="Database">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Category = 'UserType' AND Description <> 'Admin'" Name="Category" Type="String" />
                        <asp:Parameter DefaultValue="Description" Name="OrderBy" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                </td>
                <td>
                    <asp:SqlDataSource ID="sqldsCompanies" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                        SelectCommand="UserCompanies" SelectCommandType="StoredProcedure"
                        DeleteCommand="DELETE FROM [UsersCompanies] WHERE [UserId] = @UserId AND [CompanyId] = @CompanyId" 
                        InsertCommand="INSERT INTO [UsersCompanies] ([UserId], [CompanyId], [Position], [Telephone], [Mobile], [Email]) VALUES (@UserId, @CompanyId, @Position, @Telephone, @Mobile, @Email)" 
                        UpdateCommand="UPDATE [UsersCompanies] SET [CompanyId]=@CompanyNewId, [Position] = @Position, [Telephone] = @Telephone, [Mobile] = @Mobile, [Email] = @Email WHERE [UserId] = @UserId AND [CompanyId] = @CompanyId">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="gvUsers" Name="UserId" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                        <DeleteParameters>
                            <asp:Parameter Name="UserId" Type="Int32" />
                            <asp:Parameter Name="CompanyId" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Position" Type="Int32" />
                            <asp:Parameter Name="Telephone" Type="String" DefaultValue=" " />
                            <asp:Parameter Name="Mobile" Type="String" DefaultValue=" " />
                            <asp:Parameter Name="Email" Type="String" DefaultValue=" " />
                            <asp:Parameter Name="UserId" Type="Int32" />
                            <asp:Parameter Name="CompanyId" Type="Int32" />
                            <asp:Parameter Name="CompanyNewId" Type="Int32" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="UserId" Type="Int32" />
                            <asp:Parameter Name="CompanyId" Type="Int32" />
                            <asp:Parameter Name="Position" Type="Int32" />
                            <asp:Parameter Name="Telephone" Type="String" />
                            <asp:Parameter Name="Mobile" Type="String" />
                            <asp:Parameter Name="Email" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                </td>
                <td></td>
            </tr>
        </table>
    </asp:Content>