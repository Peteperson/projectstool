<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="SystemDesign.aspx.vb" Inherits="SystemDesign" Theme="MainSkin" %>
<%@ Register src="DateBox.ascx" tagname="DateBox" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br />
    <table id="subPageMainTable">
        <tr>
            <td class="FormTitle">
                <table style="width:100%">
                    <tr>
                        <td><asp:ImageButton ID="btnRemovePaging" ImageUrl="~/Images/Paging3_32x32.png" 
                                runat="server" ToolTip="Ενεργοποίηση/Απενεργοποίηση σελιδοποίησης" /></td>
                        <td style="width:100%" align="center">Σχεδιασμός Συστήματος</td>
                        <td><asp:ImageButton ID="btnPrint" runat="server" ToolTip="Εκτύπωση σελίδας" 
                                ImageUrl="~/Images/Icons/Print1_32x32.png" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="tdBelowTitle"> <asp:Panel ID="pnl1" runat="server" DefaultButton="btnFindPrj">
                <img alt="info" src="Images/Icons/Logs_24x24.png" />: Επιλέξτε subproject από τη 
                λίστα:
                <asp:DropDownList ID="ddlPrjCode" runat="server" DataSourceID="sqldsPrjCodes" 
                    DataTextField="SubProject" DataValueField="id" AutoPostBack="True">
                </asp:DropDownList>&nbsp;ή συμπληρώστε το στο ακόλουθο πεδίο και πατήστε &quot;Αναζήτηση&quot;
                <asp:TextBox ID="txtPrjId" runat="server" SkinID="txtTextCenter"></asp:TextBox>
                &nbsp;<asp:Button ID="btnFindPrj" runat="server" Text="Αναζήτηση" /></asp:Panel> 
                Διαθέσιμες εκδόσεις:&nbsp;
                <asp:DropDownList ID="ddlSysVersions" runat="server" 
                    DataSourceID="sqldsSysVersions" DataTextField="VersionNo" 
                    DataValueField="id" AutoPostBack="True">
                </asp:DropDownList>
                 - Ενέργειες έκδοσης:&nbsp;
                <asp:ImageButton ID="btnAddVersion" runat="server" ImageUrl="~/Images/Icons/add_24x24.png" ToolTip="Προσθήκη νέας έκδοσης" />
                <asp:ImageButton ID="btnDelVersion" runat="server" ImageUrl="~/Images/Icons/Delete_24x24.png" ToolTip="Διαγραφή τρέχουσας έκδοσης" />
            </td>
        </tr>
        <tr>
            <td class="FormTitle">Processes - <asp:Label ID="lblCompany" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td class="tdBelowTitle">
                <asp:GridView ID="gvProcesses" runat="server" AllowPaging="True" ShowFooter="true"
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" 
                    DataSourceID="sqldsProcesses" SkinID="gridviewSkin">
                    <EmptyDataTemplate>
                        <br />
                        There are no processes. Insert one using the controls below.<br />
                        <br />
                        <table border="1" class="TblEmptyData">
                            <tr class="InsertTabHeader">
                                <td></td>
                                <td>Κωδικός</td>
                                <td class="CommentsCol">Περιγραφή <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="InsProc" ControlToValidate="txtDescr" ErrorMessage="*"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegExpVal1" runat="server" ControlToValidate="txtDescr" ValidationExpression="^[\s\S]{0,500}$" ValidationGroup="InsProc" ErrorMessage="*"></asp:RegularExpressionValidator></td>
                                <td>Status</td>
                                <td>StatusDate</td>
                                <td>Υπεύθυνος</td>
                                <td>Σχόλια</td>
                            </tr>
                            <tr class="InsertRow">
                                <td class="centered"><asp:ImageButton ID="btnInsert" CausesValidation="true" runat="server" CommandName="Insert"
                                    ImageUrl="~/images/icons/add16_16.png" ToolTip="Εισαγωγή εγγραφής" ValidationGroup="InsProc" /></td>
                                <td><asp:TextBox ID="txtCode" SkinID="txtTime" runat="server" Text='<%# Bind("Code") %>' ></asp:TextBox></td>
                                <td><asp:TextBox ID="txtDescr" TextMode="MultiLine" SkinID="txtTextLong" runat="server" Text='<%# Bind("Description") %>' ></asp:TextBox></td>
                                <td><asp:DropDownList ID="ddlProcStat" runat="server" DataSourceID="objdsProcStat" 
                                        selectedvalue=<%# Bind("Status") %> DataTextField="Description" DataValueField="id">
                                    </asp:DropDownList></td>
                                <td><uc1:DateBox ID="dbStatDate" runat="server" Value='<%# Bind("StatusDate") %>' Text='<%# Today.ToString("dd/MM/yyyy") %>' /></td>
                                <td><asp:DropDownList ID="ddlResp" runat="server" DataSourceID="sqldsResponsibles" 
                                        DataTextField="FullName" DataValueField="id">
                                    </asp:DropDownList></td>
                                <td><asp:TextBox ID="txtComm" runat="server" Text='<%# Bind("Comments") %>' ></asp:TextBox></td>
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
                        <asp:TemplateField HeaderText="Κωδικός" SortExpression="Code">
                            <ItemStyle Width="50px" Wrap="false" />
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" SkinID="txtText93" runat="server" Text='<%# Bind("Code") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Code") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtCode" SkinID="txtTime" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Περιγραφή" SortExpression="Description">
                            <ItemStyle HorizontalAlign="Center" />
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" SkinID="txtDef" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:RequiredFieldValidator SkinID="rfvDef" ID="RequiredFieldValidator2" runat="server" ValidationGroup="InsProc" ControlToValidate="txtDescr" ErrorMessage="*"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtDescr" SkinID="txtDef" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Υπεύθυνος" SortExpression="Responsible">
                            <ItemStyle Width="120px" Wrap="false" />
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlResp" runat="server" DataSourceID="sqldsResponsibles" 
                                    selectedvalue=<%# Bind("Responsible") %> DataTextField="FullName" DataValueField="id">
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlResp" runat="server" DataSourceID="sqldsResponsibles" AutoPostBack="true" 
                                    selectedvalue=<%# Bind("Responsible") %> DataTextField="FullName" DataValueField="id"
                                    OnSelectedIndexChanged="ddlResp_IndexChanged" ToolTip='<%# Bind("id") %>'>
                                </asp:DropDownList>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="ddlResp" runat="server" DataSourceID="sqldsResponsibles" 
                                    DataTextField="FullName" DataValueField="id">
                                </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Σχόλια" SortExpression="Comments">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" SkinID="txtText" runat="server" Text='<%# Bind("Comments") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Comments") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtComm" SkinID="txtText" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status" SortExpression="Status">
                            <ItemStyle Width="120px" Wrap="false" />
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlProcStat" runat="server" DataSourceID="objdsProcStat" 
                                    selectedvalue=<%# Bind("Status") %> DataTextField="Description" DataValueField="id">
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label16" runat="server" Text='<%# Bind("StatusText") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="ddlProcStat" runat="server" DataSourceID="objdsProcStat" 
                                    DataTextField="Description" DataValueField="id">
                                </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:Button ID="btnCheckAll" CommandName="CheckAll" runat="server" CssClass="btnCheckAll" ToolTip="Επιλογή όλων" />
                            </HeaderTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:CheckBox id="chkSelected" runat="server"></asp:CheckBox>
                                <asp:Label ID="lblId" runat="server" Text='<%# Bind("id") %>' Visible="false"></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Center" />
                            <FooterTemplate>
                                <asp:Button ID="Button1" CommandName="UpdStatus" runat="server" CssClass="btnUpdStatus" ToolTip="Αλλαγή του status όλων των επιλεγμένων εγγραφών" />
                            </FooterTemplate>
                        </asp:TemplateField>                        
                        <asp:TemplateField HeaderText="StatusDate" SortExpression="StatusDate">
                            <ItemStyle Width="100px" />
                            <EditItemTemplate>
                                <!--<uc1:DateBox ID="dbStatDate" runat="server" Value='<%# Bind("StatusDate") %>' />-->
                                <asp:Label ID="Label11" runat="server" 
                                    Text='<%# Bind("StatusDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" 
                                    Text='<%# Bind("StatusDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <uc1:DateBox ID="dbStatDate" runat="server" Text='<%# Today.ToString("dd/MM/yyyy") %>' />
                            </FooterTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView><br />
                <asp:Button ID="btnInsert" runat="server" Text="Enable/Disable insertion" />
&nbsp;</td>
        </tr>
        </table>
        <table style="width:95%">
        <tr>
            <td id="tdPrint">
                <table style="width:100%">
                    <tr>
                        <td align="center"><img alt="info" src="Images/Icons/Logs_24x24.png" />: Μπορείτε να αντιγράψετε τις παραπάνω διαδικασίες επιλέγοντας το έργο στο οποίο θέλετε να αντιγραφούν από την παρακάτω λίστα και πατώντας &quot;Αντιγραφή&quot;</td>
                    </tr>
                    <tr>
                        <td align="center"><asp:DropDownList ID="ddlCopyProjects" runat="server" 
                                DataSourceID="sqldsPrjCodes" DataTextField="SubProject" DataValueField="id">
                            </asp:DropDownList>&nbsp;<asp:Button ID="Button1" runat="server" Text="Αντιγραφή" /></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:SqlDataSource ID="sqldsPrjCodes" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="ProjectList" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserId" SessionField="UserId" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsSysVersions" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="SELECT [id], [VersionNo] FROM [SystemVersion] WHERE ([ProjectId] = @ProjectId) ORDER BY [VersionNo] DESC" 
                    InsertCommand="InsertVersion" InsertCommandType="StoredProcedure"
                    UpdateCommand="InsertVersion" UpdateCommandType="StoredProcedure"
                    DeleteCommand="DeleteVersion" DeleteCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlPrjCode" Name="ProjectId" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="ddlSysVersions" Name="VersionId" PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="ddlPrjCode" Name="ToProjectId" PropertyName="SelectedValue" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="ddlSysVersions" Name="VersionId" PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="ddlCopyProjects" Name="ToProjectId" PropertyName="SelectedValue" Type="Int32" />
                    </UpdateParameters>
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="ddlSysVersions" Name="VersionId" PropertyName="SelectedValue" Type="Int32" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsProcesses" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    DeleteCommand="DELETE FROM [Processes] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [Processes] ([SystemVersionId], [Code], [Description], [Status], [StatusDate], [Responsible], [Comments]) VALUES (@SystemVersionId, @Code, @Description, @Status, @StatusDate, @Responsible, @Comments)" 
                    SelectCommand="ProcessesList" SelectCommandType="StoredProcedure"
                    UpdateCommand="UPDATE [Processes] SET [SystemVersionId] = @SystemVersionId, [Code] = @Code, [Description] = @Description, [Status] = @Status, [StatusDate] = @StatusDate, [Responsible] = @Responsible, [Comments] = @Comments WHERE [id] = @id">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlSysVersions" Name="SystemVersionId" 
                            PropertyName="SelectedValue" Type="Int16" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="SystemVersionId" Type="Int16" />
                        <asp:Parameter Name="Code" Type="String" DefaultValue=" " />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Status" Type="Int32" />
                        <asp:Parameter Name="StatusDate" DbType="DateTime" />
                        <asp:Parameter Name="Responsible" Type="Int32" />
                        <asp:Parameter Name="Comments" Type="String" DefaultValue=" " />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="SystemVersionId" Type="Int16" />
                        <asp:Parameter Name="Code" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Status" Type="Int32" />
                        <asp:Parameter Name="StatusDate" DbType="DateTime" />
                        <asp:Parameter Name="Responsible" Type="Int32" />
                        <asp:Parameter Name="Comments" Type="String" DefaultValue=" " />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="sqldsProcStat" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="TypesByCategory" SelectCommandType="StoredProcedure"
                    UpdateCommand="UPDATE [Processes] SET [Status] = @Status, StatusDate=GetDate() WHERE id = @id">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="ProcessStatus" Name="Category" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Status" Type="Int16" />
                        <asp:Parameter Name="id" Type="Int16" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td><asp:SqlDataSource ID="sqldsResponsibles" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="GetResponsible" SelectCommandType="StoredProcedure"
                    UpdateCommand="UPDATE Processes SET [Responsible] = @Responsible WHERE id = @id">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlPrjCode" Name="ProjectId" 
                            PropertyName="SelectedValue" Type="Int16" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Responsible" Type="Int16" />
                        <asp:Parameter Name="id" Type="Int16" />
                    </UpdateParameters>
                </asp:SqlDataSource></td>
            <td>
                <asp:ObjectDataSource ID="objdsProcStat" runat="server" 
                    SelectMethod="VariousTypes" TypeName="Database">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Category = 'ProcessStatus'" Name="Category" Type="String" />
                        <asp:Parameter DefaultValue="Description" Name="OrderBy" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
            <td></td>
        </tr>
    </table>
</asp:Content>

