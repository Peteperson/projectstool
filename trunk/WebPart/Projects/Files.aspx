<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="Files.aspx.vb" Inherits="Files" Theme="MainSkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br />
    <table id="subPageMainTable">
        <tr>
            <td class="FormTitle">
                <table style="width:100%">
                    <tr>
                        <td><asp:ImageButton ID="btnRemovePaging" ImageUrl="~/Images/Paging3_32x32.png" runat="server" ToolTip="Ενεργοποίηση/Απενεργοποίηση σελιδοποίησης" /></td>
                        <td style="width:100%" align="center">Λίστα Αρχείων</td>
                        <td><asp:ImageButton ID="btnPrint" runat="server" ToolTip="Εκτύπωση σελίδας" 
                                ImageUrl="~/Images/Icons/Print1_32x32.png" OnClientClick="return PrintWithoutPostback()" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="tdBelowTitle"><asp:TextBox ID="txtPrjId" runat="server" SkinID="txtTextCenter" Visible="false"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td id="tdAttachments">
                <asp:GridView ID="gvFiles" runat="server" AllowPaging="True" ShowFooter="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id"
                    DataSourceID="sqldsFiles" SkinID="gridviewSkinList">
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
                                    ImageUrl="~/images/icons/add16_16.png" ToolTip="Εισαγωγή εγγραφής" ValidationGroup="InsFile" />
                            </FooterTemplate>
                        </asp:TemplateField> 
                        <asp:TemplateField HeaderText="A/A" SortExpression="A/A">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("[A/A]") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Datestamp *" HeaderStyle-Wrap="false" SortExpression="Datestamp">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Datestamp", "{0:dd/MM/yyyy HH:mm:ss}") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderStyle HorizontalAlign="Center" />
                            <HeaderTemplate>
                                <table>
                                    <tr>
                                        <td colspan="2" align="center">SubProject</td>
                                    </tr>
                                    <tr>
                                        <td><asp:TextBox ID="txtHeadFFilter" SkinID="txtFilterSmall" runat="server"></asp:TextBox></td>
                                        <td><asp:ImageButton ID="btnFilter" runat="server" CausesValidation="False" 
                                                CommandName="Filter" ImageUrl="~/Images/Icons/Filter1_24x24.png" ToolTip="Φιλτράρισμα δεδομένων" /></td>                                        
                                    </tr>
                                </table>
                            </HeaderTemplate>                            <ItemTemplate>
                                <asp:LinkButton ID="btnSubProject" runat="server" CausesValidation="True" CommandArgument='<%# Bind("ProjectId") %>'
                                                CommandName="SelSubProject" Text='<%# Bind("SubProject") %>'></asp:LinkButton>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="ddlPrjCode" runat="server" DataSourceID="sqldsPrjCodes" 
                                    DataTextField="SubProject" DataValueField="id" >
                                </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Attachment" SortExpression="File">
                            <ItemTemplate>
                                <asp:ImageButton ID="btnDown" OnClientClick="this.form.onsubmit=''" runat="server" CommandArgument='<%# Bind("id") %>'
                                                CommandName="Download" ImageUrl="~/Images/Icons/Download_16x16.png" ToolTip="Πιέστε εδώ για να κατεβάσετε το αρχείο"/>
                                <asp:Label ID="lblDown" runat="server" Text='<%# Bind("File") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="fuCtrl" SkinID="rfvDef" ValidationGroup="InsFile" ErrorMessage="*"></asp:RequiredFieldValidator> <asp:FileUpload ID="fuCtrl" runat="server" />                                            
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Comments" SortExpression="Comments">
                            <ItemStyle Width="40%" />
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" MaxLength="500" Text='<%# Bind("Comments") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Comments") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtAttachComment" SkinID="txtText" runat="server" MaxLength="500" Text='<%# Bind("Comments") %>'></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <!--
        <tr>
            <td align="right">(*): Default ordering</td>
        </tr>
        -->
    </table>
    <table>
        <tr>
            <td>
                <asp:SqlDataSource ID="sqldsFiles" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="FileList" SelectCommandType="StoredProcedure"
                    DeleteCommand="DELETE FROM [ProjectFiles] WHERE [id] = @id" 
                    UpdateCommand="UPDATE [ProjectFiles] SET [Comments] = @Comments WHERE [id] = @id"
                    InsertCommand="INSERT INTO [ProjectFiles] ([ProjectId], [AttachmentName], [Attachment], [Comments]) VALUES (@ProjectId, @AttachmentName, @Attachment, @Comments)" >
                    <UpdateParameters>
                        <asp:Parameter Name="Comments" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ProjectId" Type="Int32" />
                        <asp:Parameter Name="AttachmentName" Type="String" />
                        <asp:Parameter Name="Attachment" />
                        <asp:Parameter Name="Comments" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="UserId" SessionField="UserId" Type="Int16" />
                        <asp:ControlParameter ControlID="txtPrjId" Name="SubProject" 
                            PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsPrjCodes" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="ProjectList" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserId" SessionField="UserId" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td></td>
            <td></td>
        </tr>
    </table>
</asp:Content>

