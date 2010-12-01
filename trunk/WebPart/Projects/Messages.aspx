<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="Messages.aspx.vb" Inherits="Messages" Theme="MainSkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script language="javascript" type="text/javascript">
        function ddlUsersToValueChanged(obj) {
            Parts = obj.split("_");
            MainPart = obj.replace(Parts[Parts.length - 1], "");

            ddlcmp = document.getElementById(MainPart + "ddlCompanies");
            ForceNoneValue(ddlcmp);
            document.getElementById(MainPart + "cbAll").checked = false;
        }

        function ddlCompaniesValueChanged(obj) {
            Parts = obj.split("_");
            MainPart = obj.replace(Parts[Parts.length - 1], "");

            ddlcmp = document.getElementById(MainPart + "ddlUsers");
            ForceNoneValue(ddlcmp);
            document.getElementById(MainPart + "cbAll").checked = false;
        }

        function cbAllValueChanged(obj) {
            if (document.getElementById(obj).checked) {
                Parts = obj.split("_");
                MainPart = obj.replace(Parts[Parts.length - 1], "");

                ddlcmp = document.getElementById(MainPart + "ddlCompanies");
                ForceNoneValue(ddlcmp);
                ddlcmp = document.getElementById(MainPart + "ddlUsers");
                ForceNoneValue(ddlcmp);
            }
        }

        function ForceNoneValue(ddl) {
            i = 0;
            for (i = 0; i <= ddl.length - 1; i++) {
                if (ddl.options[i].value == 0) {
                    ddl.selectedIndex = i;
                    break;
                }
            }        
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br />
    <table id="subPageMainTable">
        <tr>
            <td class="FormTitle">Μηνύματα για εμένα</td>
        </tr>
        <tr>
            <td class="tdBelowTitle">
                <asp:GridView ID="gvToMeMsgs" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" 
                    DataSourceID="sqldsMsgForMe" SkinID="gridviewSkinSmall">
                    <Columns>
                        <asp:BoundField DataField="datestamp" HeaderText="datestamp" SortExpression="datestamp" />
                        <asp:BoundField DataField="Fullname" HeaderText="From" ReadOnly="True" SortExpression="Fullname" />
                        <asp:BoundField DataField="Message" HeaderText="Message" SortExpression="Message" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td><br /><br /></td>
        </tr>
        <tr>
            <td class="FormTitle">Μηνύματα από εμένα</td>
        </tr>
        <tr>
            <td class="tdBelowTitle">
                <asp:GridView ID="gvMessages" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" 
                    DataSourceID="sqldsMessages" SkinID="gridviewSkinSmall" ShowFooter="True">
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
                                <asp:Label ID="lblWriter" runat="server" Text='<%# Bind("Fullname") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Μήνυμα" SortExpression="Message">
                            <ItemStyle CssClass="MessageCol" />
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Message") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" TextMode="MultiLine" SkinID="txtTextLong" runat="server" Text='<%# Bind("Message") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtMessage" TextMode="MultiLine" SkinID="txtTextLong" runat="server" Text=''></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Παραλήπτης" SortExpression="ToUserId">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td>Άτομο: </td>
                                        <td><asp:Label ID="Label12" runat="server" Text='<%# Bind("ToUserText") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>Εταιρεία: </td>
                                        <td><asp:Label ID="Label13" runat="server" Text='<%# Bind("ToCompanyText") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>Όλοι: </td>
                                        <td><asp:CheckBox ID="cbAll" runat="server" Checked='<%# Bind("ToEveryone") %>' Enabled="false" /></td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <table>
                                    <tr>
                                        <td>Άτομο: </td>
                                        <td><asp:DropDownList ID="ddlUsers" runat="server" DataSourceID="sqldsUsers" 
                                                selectedValue='<%# Bind("ToUserId") %>' DataTextField="Fullname" DataValueField="id">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Εταιρεία: </td>
                                        <td><asp:DropDownList ID="ddlCompanies" runat="server" 
                                                selectedValue='<%# Bind("ToCompanyId") %>' DataSourceID="sqldsCompanies" DataTextField="Name" DataValueField="Id">
                                            </asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td>Όλοι: </td>
                                        <td><asp:CheckBox ID="cbAll" runat="server" Checked='<%# Bind("ToEveryone") %>' /></td>
                                    </tr>
                                </table>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <table>
                                    <tr>
                                        <td>Άτομο: </td>
                                        <td align="left"><asp:DropDownList ID="ddlUsers" runat="server" DataSourceID="sqldsUsers" 
                                                DataTextField="Fullname" onchange="ddlUsersToValueChanged(this.id)" DataValueField="id">
                                            </asp:DropDownList><br /></td>
                                    </tr>
                                    <tr>
                                        <td>Εταιρεία: </td>
                                        <td><asp:DropDownList ID="ddlCompanies" runat="server" onchange="ddlCompaniesValueChanged(this.id)" 
                                                DataSourceID="sqldsCompanies" DataTextField="Name" DataValueField="Id">
                                            </asp:DropDownList><br /></td>
                                    </tr>
                                    <tr>
                                        <td>Όλοι: </td>
                                        <td align="left"><asp:CheckBox ID="cbAll" runat="server" onclick="cbAllValueChanged(this.id)" Checked="false" /></td>
                                    </tr>
                                </table>
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
                    SelectCommand="MyMessages"
                    UpdateCommand="UPDATE [Messages] SET [datestamp] = GetDate(), [Message] = @Message, [ToUserId] = @ToUserId, [ToCompanyId] = @ToCompanyId, [ToEveryone] = @ToEveryone WHERE [id] = @id" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserId" SessionField="UserId" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Message" Type="String" />
                        <asp:Parameter Name="ToUserId" Type="Int32" />
                        <asp:Parameter Name="ToCompanyId" Type="Int32" />
                        <asp:Parameter Name="ToEveryone" Type="Boolean" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
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
                        <asp:Parameter DefaultValue="allusers" Name="Function" Type="String" />
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
            <td>
                <asp:SqlDataSource ID="sqldsMsgForMe" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" SelectCommand="ToMeMessages" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserId" SessionField="UserId" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
    </table>
</asp:Content>