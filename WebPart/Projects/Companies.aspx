<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="Companies.aspx.vb" Inherits="Companies" Theme="MainSkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br />
    <asp:Panel runat="server" ID="pnl1" DefaultButton="btnFilterQ" >
    <table id="subPageMainTable">
        <tr>
            <td class="FormTitle">
                <table style="width:100%">
                    <tr>
                        <td><asp:ImageButton ID="btnRemovePaging" ImageUrl="~/Images/Paging3_32x32.png" runat="server" ToolTip="Ενεργοποίηση/Απενεργοποίηση σελιδοποίησης" /></td>
                        <td style="width:100%" align="center">Διαχείριση πελατών</td>
                        <td><asp:ImageButton ID="btnPrint" runat="server" ToolTip="Εκτύπωση σελίδας" 
                                ImageUrl="~/Images/Icons/Print1_32x32.png" OnClientClick="return PrintWithoutPostback()" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td></td>
        </tr>
        <tr>
            <td style="width:100%">
                <table style="width:100%">
                    <tr>                       
                        <td align="center" style="vertical-align:top">
                            <table style="width:100%">
                                <tr class="centered">
                                    <td>Λίστα εταιρειών (επιλέξτε μία - <asp:Image ID="Image1" runat="server" ImageUrl="Images/Icons/Approve_16x16.png" /> - για να δείτε λεπτομέρειες):<br />
                                        <asp:TextBox ID="txtNameFilter" runat="server" SkinID="txtTextCenter" Visible="False"></asp:TextBox>
                                        </td>
                                    <td>Συσχετιζόμενα έργα:</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:GridView ID="gvCompanies" runat="server" AllowPaging="True" EmptyDataText="Δεν υπάρχουν καταγεγραμμένοι πελάτες"
                                            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id,Name" 
                                            DataSourceID="sqldsCompanies" SkinID="gridviewSkinMainTbl" 
                                            ShowFooter="True">
                                            <Columns>
                                                <asp:TemplateField ShowHeader="True" HeaderText="Ενέργεια">
                                                    <ItemStyle Wrap="False" Width="60px" />
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
                                                            ImageUrl="~/images/icons/add16_16.png" ValidationGroup="InsGroup" ToolTip="Εισαγωγή εγγραφής" />
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Ημ/νία" SortExpression="Datestamp">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Datestamp", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <HeaderTemplate>
                                                        <table>
                                                            <tr>
                                                                <td style="padding-right:10px">Όνομα</td>
                                                                <td><asp:TextBox ID="txtHeadNameFilter" SkinID="txtFilter" runat="server"></asp:TextBox></td>
                                                                <td><asp:ImageButton ID="btnFilter" runat="server" CausesValidation="False" 
                                                                        CommandName="Filter" ImageUrl="~/Images/Icons/Filter1_24x24.png" ToolTip="Φιλτράρισμα δεδομένων" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </HeaderTemplate>
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
                                                <asp:TemplateField HeaderText="Περιγραφή" SortExpression="Description">
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
                                    <td style="vertical-align:top">
                                        <asp:GridView ID="gvProjects" runat="server" AllowPaging="True" 
                                            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" 
                                            DataSourceID="sqldsProjects" SkinID="gridviewSkin" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="SubProject" SortExpression="SubProject">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="btnSubProject" ForeColor="Black" runat="server" CommandArgument='<%# Bind("Id") %>'
                                                                        CommandName="SelSubProject" Text='<%# Bind("SubProject") %>'></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Τίτλος" SortExpression="Title">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="imgTitle" runat="server" ImageUrl="~/Images/Icons/Logs_24x24.png" ToolTip='<%# Bind("Title") %>'/>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="btnClearFilter" runat="server" Text="Clear filtering" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnFilterQ" runat="server" Text="Button" 
                    style="visibility:hidden" Height="16px" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="FormTitle">
                <table style="width:100%">
                    <tr>
                        <td style="width:40px; text-align:left"><asp:ImageButton ID="btnRemovePaging2" ImageUrl="~/Images/Paging3_32x32.png" runat="server" ToolTip="Ενεργοποίηση/Απενεργοποίηση σελιδοποίησης" /></td>
                        <td align="center">Υπάλληλοι της εταιρείας: <asp:Label ID="lblCompName2" runat="server" Text="..."></asp:Label></td>
                        <td style="width:40px"></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="tdBelowTitle2">
                <asp:GridView ID="gvCompEmpl" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="Id" DataSourceID="sqldsCompEmployees" AllowPaging="True" 
                    AllowSorting="True" SkinID="gridviewSkin" Visible="False" ShowFooter="true">
                    <EmptyDataTemplate>
                        Δεν υπάρχουν καταγεγραμμένοι υπάλληλοι.<br />
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
                                            ImageUrl="~/images/icons/add16_16.png" ToolTip="Εισαγωγή υπαλλήλου" />
                                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" SkinID="rfvDef" runat="server" ControlToValidate="txt1LastName" ValidationGroup="InsEmp1st" ErrorMessage="*"></asp:RequiredFieldValidator><asp:TextBox ID="txt1LastName" MaxLength="50" SkinID="txtReqFld" runat="server"></asp:TextBox></td>
                                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" SkinID="rfvDef" runat="server" ControlToValidate="txt1FirstName" ValidationGroup="InsEmp1st" ErrorMessage="*"></asp:RequiredFieldValidator><asp:TextBox ID="txt1FirstName" MaxLength="50" SkinID="txtReqFld" runat="server"></asp:TextBox></td>
                                    <td><asp:DropDownList SkinId="ddlDef" ID="ddl1Position" runat="server" DataSourceID="objdsEmplType" 
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
                            <FooterStyle HorizontalAlign="Center" />
                            <FooterTemplate>
                                <asp:ImageButton ID="btnInsert" runat="server" CommandName="Insert" CausesValidation="true" ValidationGroup="InsEmp"
                                    ImageUrl="~/images/icons/add16_16.png" ToolTip="Εισαγωγή υπαλλήλου" />
                            </FooterTemplate>
                        </asp:TemplateField>                        
                        <asp:TemplateField HeaderText="Ημ/νία" SortExpression="Datestamp">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Datestamp", "{0:dd/MM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Επίθετο" SortExpression="LastName">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" SkinID="rfvDef" runat="server" ControlToValidate="txt2LastName" ValidationGroup="InsEmp" ErrorMessage="*"></asp:RequiredFieldValidator><asp:TextBox SkinID="txtDef" CssClass="MaxWidth120px" ID="txt2LastName" MaxLength="50" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Όνομα" SortExpression="FirstName">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" SkinID="rfvDef" runat="server" ControlToValidate="txt2FirstName" ValidationGroup="InsEmp" ErrorMessage="*"></asp:RequiredFieldValidator><asp:TextBox SkinID="txtDef" MaxLength="50" ID="txt2FirstName" CssClass="MaxWidth120px" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Θέση" SortExpression="Position">
                            <ItemTemplate>
                                <asp:Label ID="Label15" runat="server" Text='<%# Bind("PositionText") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList SkinId="ddlDef" ID="ddl2Position" runat="server" DataSourceID="objdsEmplType" 
                                    DataTextField="Description" DataValueField="id">
                                </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Τηλέφωνο" SortExpression="Telephone">
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Telephone") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox SkinID="txtDef" CssClass="MaxWidth80px" MaxLength="12" ID="txt2Tel" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Κινητό" SortExpression="Mobile">
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("Mobile") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox SkinID="txtDef" MaxLength="12" CssClass="MaxWidth80px" ID="txt2MobTel" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email" SortExpression="Email">
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox SkinID="txtDef" MaxLength="50" ID="txt2Email" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Είναι<br/>χρήστης" SortExpression="IsUser">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("IsUser") %>' 
                                    Enabled="false" />
                            </ItemTemplate>
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
                    SelectCommand="SELECT [Id], [Datestamp], [Name], [Description] FROM [Companies] WHERE [Name] LIKE ('%' + IsNull(@CompName, '') + '%') ORDER BY Name  " 
                    UpdateCommand="UPDATE [Companies] SET [Name] = @Name, [Description] = @Description WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Description" Type="String" DefaultValue=" " />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtNameFilter" Name="CompName" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsCompEmployees" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="CmpEmplList" SelectCommandType="StoredProcedure"
                    InsertCommand="CmpInsEmployee" InsertCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="gvCompanies" Name="CompanyId" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="UserName" Type="String" />
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
                <asp:ObjectDataSource ID="objdsEmplType" runat="server" 
                    SelectMethod="VariousTypes" TypeName="Database">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Category ='EmployeeType'" Name="Category" Type="String" />
                        <asp:Parameter DefaultValue="Description" Name="OrderBy" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsProjects" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="SELECT [id], [SubProject], [Title] FROM [Projects] WHERE ([CustomerId] = @CustomerId) ORDER BY [id]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="gvCompanies" Name="CustomerId" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td></td>
            <td></td>
        </tr>
    </table>
    </asp:Panel>
</asp:Content>

