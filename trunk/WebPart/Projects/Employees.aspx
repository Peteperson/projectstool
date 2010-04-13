<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="Employees.aspx.vb" Inherits="Employees" Theme="MainSkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br />
    <br />
    <table id="subPageMainTable">
        <tr>
            <td class="title">Manage user rights</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gvEmployees" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" 
                    DataSourceID="sqldsEmployees" SkinID="gridviewSkin" ShowFooter="true">
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
                            <FooterTemplate>
                                <asp:ImageButton ID="btnInsert" CausesValidation="true" runat="server" CommandName="Insert"
                                    ImageUrl="~/images/icons/add16_16.png" ToolTip="Insert" />
                            </FooterTemplate>
                        </asp:TemplateField> 
                        <asp:TemplateField HeaderText="id" InsertVisible="False" SortExpression="id">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Employee Type" SortExpression="EmployeeType">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlEmpType" runat="server" 
                                    Enabled="false" selectedvalue=<%# Bind("EmployeeType") %> DataSourceID="sqldsUserTypes" DataTextField="Description" DataValueField="id">
                                </asp:DropDownList>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlEmpType" runat="server" 
                                    selectedvalue=<%# Bind("EmployeeType") %> DataSourceID="sqldsUserTypes" DataTextField="Description" DataValueField="id">
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="ddlInsEmpType" runat="server" 
                                    DataSourceID="sqldsUserTypes" DataTextField="Description" DataValueField="id">
                                </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="First Name" SortExpression="FirstName">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("FirstName") %>' SkinID="txtDef"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtInsFirstName" runat="server"  SkinID="txtDef"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Name" SortExpression="LastName">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("LastName") %>' SkinID="txtDef"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtInsLastName" runat="server"  SkinID="txtDef"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Hired" SortExpression="Hired">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Hired") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Hired") %>' SkinID="txtDef"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtInsHired" runat="server" SkinID="txtDef"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Active" SortExpression="Active">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Active") %>' 
                                    Enabled="false" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Active") %>' />
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:CheckBox ID="cbInsActive" runat="server"/>
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
                <asp:SqlDataSource ID="sqldsEmployees" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    DeleteCommand="DELETE FROM [Employees] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [Employees] ([EmployeeType], [FirstName], [LastName], [Hired], [Active]) VALUES (@EmployeeType, @FirstName, @LastName, @Hired, @Active)" 
                    SelectCommand="SELECT * FROM [Employees]" 
                    
                    
                    UpdateCommand="UPDATE [Employees] SET [EmployeeType] = @EmployeeType, [FirstName] = @FirstName, [LastName] = @LastName, [Hired] = @Hired, [Active] = @Active WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="EmployeeType" Type="Byte" />
                        <asp:Parameter Name="FirstName" Type="String" />
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="Hired" DbType="Date" />
                        <asp:Parameter Name="Active" Type="Boolean" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="EmployeeType" Type="Byte" />
                        <asp:Parameter Name="FirstName" Type="String" />
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="Hired" DbType="Date" />
                        <asp:Parameter Name="Active" Type="Boolean" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsUserTypes" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="SELECT [id], [Description] FROM [VariousTypes] WHERE ([Category] = @Category)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="EmployeeType" Name="Category" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
            </td>
            <td></td>
        </tr>
    </table>
</asp:Content>

