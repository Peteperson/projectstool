<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="Messages.aspx.vb" Inherits="Messages" Theme="MainSkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br />
    <table id="subPageMainTable">
        <tr>
            <td class="title">Διαχείριση μηνυμάτων</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gvMessages" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" 
                    DataSourceID="sqldsMessages" SkinID="gridviewSkin" ShowFooter="true">
                    <EmptyDataTemplate>
                        <br />
                        Δεν υπάρχουν καταχωρημένα μηνύματα που να αφορούν εσάς.<br />
                        <br />
                        <table border="1" class="TblEmptyData">
                            <tr class="InsertTabHeader">
                                <td></td>
                                <td>Ημ/νία</td>
                                <td>Δημιουργός</td>
                                <td class="CommentsCol">Μήνυμα <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="InsMsg" ControlToValidate="txtMessage" ErrorMessage="*"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegExpVal1" runat="server" ControlToValidate="txtMessage" ValidationExpression="^[\s\S]{0,500}$" ValidationGroup="InsMsg" ErrorMessage="*"></asp:RegularExpressionValidator></td>
                                <td>Παραλήπτης</td>
                                <td>Εταιρεία</td>
                                <td>Όλοι;</td>
                            </tr>
                            <tr class="InsertRow">
                                <td class="centered"><asp:ImageButton ID="btnInsert" CausesValidation="true" runat="server" CommandName="Insert"
                                    ImageUrl="~/images/icons/add16_16.png" ToolTip="Εισαγωγή εγγραφής" ValidationGroup="InsMsg" /></td>
                                <td></td>
                                <td></td>
                                <td><asp:TextBox ID="txtMessage" TextMode="MultiLine" SkinID="txtTextLong" runat="server" Text='' ></asp:TextBox></td>
                                <td><asp:DropDownList ID="ddlUsers" runat="server" DataSourceID="sqldsUsers" 
                                       DataTextField="Fullname" DataValueField="id">
                                    </asp:DropDownList></td>
                                <td><asp:DropDownList ID="ddlCompanies" runat="server" 
                                       DataSourceID="sqldsCompanies" DataTextField="Name" DataValueField="id">
                                    </asp:DropDownList></td>
                                <td><asp:CheckBox ID="cbAll" runat="server" Checked="false" /></td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemStyle Wrap="false" />
                            <ItemTemplate>                
                                <asp:ImageButton ID="ImageButton1" runat="server" 
                                    CommandName="Edit" ImageUrl="~/Images/Icons/Edit16_16.png" ToolTip="Διόρθωση" /> &nbsp;
                                <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False"
                                    CommandName="Delete" ImageUrl="~/Images/Icons/Remove16_16.png" ToolTip="Διαγραφή" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" ValidationGroup="UpdMeet" 
                                    CommandName="Update" ImageUrl="~/Images/Icons/Save16_16.png" ToolTip="Ενημέρωση εγγραφής" />
                                &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                    CommandName="Cancel" ImageUrl="~/Images/Icons/Cancel16_16.png" ToolTip="Ακύρωση" />
                            </EditItemTemplate>
                            <FooterStyle HorizontalAlign="Center" />
                            <FooterTemplate>
                                <asp:ImageButton ID="btnInsert" CausesValidation="true" runat="server" CommandName="Insert"
                                    ImageUrl="~/images/icons/add16_16.png" ToolTip="Εισαγωγή εγγραφής" ValidationGroup="InsProc" />
                            </FooterTemplate>
                        </asp:TemplateField> 
                        <asp:TemplateField HeaderText="Ημ/νία" SortExpression="datestamp">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("datestamp", "{0:dd/MM/yyyy HH:mm}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Δημιουργός" SortExpression="Writer">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlWriter" runat="server" DataSourceID="sqldsUsers" 
                                    Enabled="false" selectedValue='<%# Bind("Writer") %>' DataTextField="Fullname" DataValueField="id">
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Μήνυμα" SortExpression="Message">
                            <ItemStyle CssClass="CommentsCol" />
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Message") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" SkinID="txtText" runat="server" Text='<%# Bind("Message") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtMessage" TextMode="MultiLine" SkinID="txtTextLong" runat="server" Text=''></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Παραλήπτης" SortExpression="ToUserId">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlUsers" runat="server" DataSourceID="sqldsUsers" 
                                    Enabled="false" selectedValue='<%# Bind("ToUserId") %>' DataTextField="Fullname" DataValueField="id">
                                </asp:DropDownList>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlUsers" runat="server" DataSourceID="sqldsUsers" 
                                    selectedValue='<%# Bind("ToUserId") %>' DataTextField="Fullname" DataValueField="id">
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="ddlUsers" runat="server" DataSourceID="sqldsUsers" 
                                    DataTextField="Fullname" DataValueField="id">
                                </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Εταιρεία" SortExpression="ToCompanyId">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlCompanies" runat="server" 
                                    Enabled="false" selectedValue='<%# Bind("ToCompanyId") %>' DataSourceID="sqldsCompanies" DataTextField="Name" DataValueField="Id">
                                </asp:DropDownList>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlCompanies" runat="server" 
                                    selectedValue='<%# Bind("ToCompanyId") %>' DataSourceID="sqldsCompanies" DataTextField="Name" DataValueField="Id">
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="ddlCompanies" runat="server" 
                                    DataSourceID="sqldsCompanies" DataTextField="Name" DataValueField="Id">
                                </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Όλοι;" SortExpression="ToEveryone">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("ToEveryone") %>' 
                                    Enabled="false" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("ToEveryone") %>' />
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:CheckBox ID="cbAll" runat="server" Checked="false" />
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
                <asp:SqlDataSource ID="sqldsMessages" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    DeleteCommand="DELETE FROM [Messages] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [Messages] ([Message], [Writer], [ToUserId], [ToCompanyId], [ToEveryone]) VALUES (@Message, @Writer, @ToUserId, @ToCompanyId, @ToEveryone)" 
                    SelectCommand="SELECT [id], [datestamp], [Message], [Writer], [ToUserId], [ToCompanyId], [ToEveryone] FROM [Messages] ORDER BY [id] DESC" 
                    
                    UpdateCommand="UPDATE [Messages] SET [datestamp] = @datestamp, [Message] = @Message, [Writer] = @Writer, [ToUserId] = @ToUserId, [ToCompanyId] = @ToCompanyId, [ToEveryone] = @ToEveryone WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Message" Type="String" />
                        <asp:Parameter Name="Writer" Type="Int32" />
                        <asp:Parameter Name="ToUserId" Type="Int32" />
                        <asp:Parameter Name="ToCompanyId" Type="Int32" />
                        <asp:Parameter Name="ToEveryone" Type="Boolean" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="datestamp" Type="DateTime" />
                        <asp:Parameter Name="Message" Type="String" />
                        <asp:Parameter Name="Writer" Type="Int32" />
                        <asp:Parameter Name="ToUserId" Type="Int32" />
                        <asp:Parameter Name="ToCompanyId" Type="Int32" />
                        <asp:Parameter Name="ToEveryone" Type="Boolean" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsUsers" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="UsersByTypeNoone" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="*" Name="UserType" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsCompanies" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="CompaniesPlusNone" SelectCommandType="StoredProcedure">
                </asp:SqlDataSource>
            </td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
    </table>
</asp:Content>