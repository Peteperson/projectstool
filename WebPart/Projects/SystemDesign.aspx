<%@ Page Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="SystemDesign.aspx.vb" Inherits="SystemDesign" title="Untitled Page" Theme="MainSkin" %>
<%@ Register src="DateBox.ascx" tagname="DateBox" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br />
    <table id="subPageMainTable">
        <tr>
            <td class="title">System design</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="centered" style="padding-bottom:5px">Select a subproject from the list:
                <asp:DropDownList ID="ddlPrjCode" runat="server" DataSourceID="sqldsPrjCodes" 
                    DataTextField="SubProject" DataValueField="id" AutoPostBack="True">
                </asp:DropDownList>&nbsp;or write its subproject id and press &quot;Find&quot;
                <asp:TextBox ID="txtPrjId" runat="server" SkinID="txtTextCenter"></asp:TextBox>
                &nbsp;<asp:Button ID="btnFindPrj" runat="server" Text="Find" />
            </td>
        </tr>
        <tr>
            <td>
                <table style="width:100%">
                    <tr class="centered">
                        <td>Available versions:
                            <asp:DropDownList ID="ddlSysVersions" runat="server" 
                                DataSourceID="sqldsSysVersions" DataTextField="VersionNo" DataValueField="id">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>                       
                        <td align="center" style="vertical-align:top">
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr class="title">
            <td>Processes:</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" ShowFooter="true"
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" 
                    DataSourceID="sqldsProcesses" SkinID="gridviewSkin">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemStyle Wrap="false" />
                            <ItemTemplate>                
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                    CommandName="Edit" ImageUrl="~/Images/Icons/Edit16_16.png" ToolTip="Edit" /> &nbsp;
                                <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False"
                                    CommandName="Delete" ImageUrl="~/Images/Icons/Remove16_16.png" ToolTip="Delete" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" ValidationGroup="UpdMeet" 
                                    CommandName="Update" ImageUrl="~/Images/Icons/Save16_16.png" ToolTip="Update" />
                                &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                    CommandName="Cancel" ImageUrl="~/Images/Icons/Cancel16_16.png" ToolTip="Cancel" />
                            </EditItemTemplate>
                            <FooterStyle HorizontalAlign="Center" />
                            <FooterTemplate>
                                <asp:ImageButton ID="btnInsert" CausesValidation="true" runat="server" CommandName="Insert"
                                    ImageUrl="~/images/icons/add16_16.png" ToolTip="Insert" ValidationGroup="InsProc" />
                            </FooterTemplate>
                        </asp:TemplateField> 
                        <asp:TemplateField HeaderText="Code" SortExpression="Code">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" SkinID="txtText" runat="server" Text='<%# Bind("Code") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Code") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtCode" SkinID="txtText" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Description" SortExpression="Description">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" SkinID="txtText" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtDescr" SkinID="txtText" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status" SortExpression="Status">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlMeetStat" runat="server" DataSourceID="sqldsProcStat" 
                                    selectedvalue=<%# Bind("Status") %> DataTextField="Description" DataValueField="id">
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlMeetStat" runat="server" DataSourceID="sqldsProcStat" 
                                    Enabled="false" selectedvalue=<%# Bind("Status") %> DataTextField="Description" DataValueField="id">
                                </asp:DropDownList>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="ddlMeetStat" runat="server" DataSourceID="sqldsProcStat" 
                                    DataTextField="Description" DataValueField="id">
                                </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="StatusDate" SortExpression="StatusDate">
                            <EditItemTemplate>
                                <uc1:DateBox ID="dbDeadline" runat="server" Value='<%# Bind("StatusDate") %>' Text='<%# Today.ToString("dd/MM/yyyy") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" 
                                    Text='<%# Bind("StatusDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <uc1:DateBox ID="dbDeadline" runat="server" Text='<%# Today.ToString("dd/MM/yyyy") %>' />
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Responsible" SortExpression="Responsible">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Responsible") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Responsible") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Comments" SortExpression="Comments">
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
                    </Columns>
                </asp:GridView>
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
                    SelectCommand="SELECT [id], [VersionNo] FROM [SystemVersion] WHERE ([ProjectId] = @ProjectId) ORDER BY [VersionNo]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlPrjCode" Name="ProjectId" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsProcesses" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    DeleteCommand="DELETE FROM [Processes] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [Processes] ([Datestamp], [SystemVersionId], [Code], [Description], [Status], [StatusDate], [Responsible], [Comments]) VALUES (@Datestamp, @SystemVersionId, @Code, @Description, @Status, @StatusDate, @Responsible, @Comments)" 
                    SelectCommand="SELECT [id], [Datestamp], [SystemVersionId], [Code], [Description], [Status], [StatusDate], [Responsible], [Comments] FROM [Processes] WHERE ([SystemVersionId] = @SystemVersionId) ORDER BY [Code]" 
                    
                    UpdateCommand="UPDATE [Processes] SET [Datestamp] = @Datestamp, [SystemVersionId] = @SystemVersionId, [Code] = @Code, [Description] = @Description, [Status] = @Status, [StatusDate] = @StatusDate, [Responsible] = @Responsible, [Comments] = @Comments WHERE [id] = @id">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlSysVersions" Name="SystemVersionId" 
                            PropertyName="SelectedValue" Type="Int16" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter DbType="Date" Name="Datestamp" />
                        <asp:Parameter Name="SystemVersionId" Type="Int16" />
                        <asp:Parameter Name="Code" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Status" Type="Int32" />
                        <asp:Parameter Name="StatusDate" DbType="Date" />
                        <asp:Parameter Name="Responsible" Type="Int32" />
                        <asp:Parameter Name="Comments" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter DbType="Date" Name="Datestamp" />
                        <asp:Parameter Name="SystemVersionId" Type="Int16" />
                        <asp:Parameter Name="Code" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Status" Type="Int32" />
                        <asp:Parameter Name="StatusDate" DbType="Date" />
                        <asp:Parameter Name="Responsible" Type="Int32" />
                        <asp:Parameter Name="Comments" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="sqldsProcStat" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="TypesByCategory" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="ProcessStatus" Name="Category" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
    </table>
</asp:Content>

