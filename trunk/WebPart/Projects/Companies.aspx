<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="Companies.aspx.vb" Inherits="Companies" Theme="MainSkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br />
    <br />
    <table id="subPageMainTable">
        <tr>
            <td class="title">Manage companies</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gvCompanies" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" 
                    DataSourceID="sqldsCompanies" SkinID="gridviewSkin" ShowFooter="true">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemStyle Width="40px" />
                            <ItemTemplate>                
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                    CommandName="Edit" ImageUrl="~/Images/Icons/Edit16_16.png" Text="Edit" />
                                &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                    CommandName="Delete" ImageUrl="~/Images/Icons/Remove16_16.png" Text="Delete" />
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
                        <asp:TemplateField HeaderText="Name" SortExpression="Name">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>' SkinID="txtDef"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtInsName" runat="server" SkinID="txtDef"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ContactPerson" SortExpression="ContactPerson">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("ContactPerson") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ContactPerson") %>' SkinID="txtDef"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtInsContactPerson" runat="server" SkinID="txtDef"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="TelephoneNo" SortExpression="TelephoneNo">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("TelephoneNo") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("TelephoneNo") %>' SkinID="txtDef"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtInsTelNo" runat="server" SkinID="txtDef"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Mobile" SortExpression="Mobile">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Mobile") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Mobile") %>' SkinID="txtDef"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtInsMobile" runat="server" SkinID="txtDef"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Mail" SortExpression="Mail">
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Mail") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Mail") %>' SkinID="txtDef"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtInsMail" runat="server" SkinID="txtDef"></asp:TextBox>
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
                    DeleteCommand="DELETE FROM [Companies] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [Companies] ([Name], [ContactPerson], [TelephoneNo], [Mobile], [Mail]) VALUES (@Name, @ContactPerson, @TelephoneNo, @Mobile, @Mail)" 
                    SelectCommand="SELECT * FROM [Companies]" 
                    UpdateCommand="UPDATE [Companies] SET [Name] = @Name, [ContactPerson] = @ContactPerson, [TelephoneNo] = @TelephoneNo, [Mobile] = @Mobile, [Mail] = @Mail WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="ContactPerson" Type="String" />
                        <asp:Parameter Name="TelephoneNo" Type="String" />
                        <asp:Parameter Name="Mobile" Type="String" />
                        <asp:Parameter Name="Mail" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="ContactPerson" Type="String" />
                        <asp:Parameter Name="TelephoneNo" Type="String" />
                        <asp:Parameter Name="Mobile" Type="String" />
                        <asp:Parameter Name="Mail" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
    </table>
</asp:Content>

