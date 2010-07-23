<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="Pages.aspx.vb" Inherits="Pages" Theme="MainSkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br />
    <table id="subPageMainTable">
        <tr>
            <td class="title">
                <table style="width:100%">
                    <tr>
                        <td><asp:ImageButton ID="btnRemovePaging1" ImageUrl="~/Images/Paging3_32x32.png" runat="server" ToolTip="Ενεργοποίηση/Απενεργοποίηση σελιδοποίησης" /></td>
                        <td style="width:100%" align="center">Διαχείριση σελίδων</td>
                        <td><asp:ImageButton ID="btnPrint" runat="server" ToolTip="Εκτύπωση σελίδας" 
                                ImageUrl="~/Images/Icons/Print1_32x32.png" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td></td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gvPages" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" 
                    DataSourceID="sqldsPages" SkinID="gridviewSkin" ShowFooter="true">
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
                        <asp:TemplateField HeaderText="Path" SortExpression="Path">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Path") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Path") %>' SkinID="txtDef"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:RequiredFieldValidator SkinID="rfvDef" ID="RequiredFieldValidator1" runat="server" ValidationGroup="InsGroup" ControlToValidate="txtInsPath" ErrorMessage="*"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtInsPath" runat="server" SkinID="txtDef"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Image" SortExpression="Image">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Image") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Image") %>' SkinID="txtDef"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:RequiredFieldValidator SkinID="rfvDef" ID="RequiredFieldValidator2" ControlToValidate="txtInsImage" runat="server" ValidationGroup="InsGroup" ErrorMessage="*"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtInsImage" runat="server" SkinID="txtDef"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>                        
                        <asp:TemplateField HeaderText="Description" SortExpression="Description">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Description") %>' SkinID="txtDef"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:RequiredFieldValidator SkinID="rfvDef" ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtInsDesc" ValidationGroup="InsGroup" ErrorMessage="*"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtInsDesc" runat="server" SkinID="txtDef"></asp:TextBox>
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
                <asp:SqlDataSource ID="sqldsPages" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    DeleteCommand="DELETE FROM [Pages] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [Pages] ([Path], [Image], [Description]) VALUES (@Path, @Image, @Description)" 
                    SelectCommand="SELECT * FROM [Pages]" 
                    UpdateCommand="UPDATE [Pages] SET [Path] = @Path, [Description] = @Description, [Image] = @Image WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Path" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Image" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Path" Type="String" />
                        <asp:Parameter Name="Image" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
    </table>
</asp:Content>

