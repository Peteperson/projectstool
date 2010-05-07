<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="ActionPlans.aspx.vb" Inherits="ActionPlans" Theme="MainSkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script language="javascript" type="text/javascript">
    function setCaretPosition(elemId, caretPos) {
        var elem = document.getElementById(elemId);

        if (elem != null) {
            if (elem.createTextRange) {
                var range = elem.createTextRange();
                range.move('character', caretPos);
                range.select();
            }
            else {
                if (elem.selectionStart) {
                    elem.focus();
                    elem.setSelectionRange(caretPos, caretPos);
                }
                else
                    elem.focus();
            }
        }
    }

    function TestFunc(obj) {
        var mask = "__/__/____";
        var str
        if (obj.value.length > 10) {
            obj.value = obj.value.substring(0, 10);
            return
        }
        myRegExp = /[^0-9]+/g;
        str = obj.value.replace(myRegExp, "");
        var sc
        debugger        
        if (str.length < 3) {
            sc = str.length;
            str = str + mask.substring(str.length);
        } else if (str.length < 5) {
            sc = str.length + 1;
            str = str.substring(0, 2) + "/" + str.substring(2) + mask.substring(str.length + 1);
        } else {
            sc = str.length + 2;
            str = str.substring(0, 2) + "/" + str.substring(2, 4) + "/" + str.substring(4) + mask.substring(str.length + 2);
        }
        document.getElementById("inpMT").value = str;
        //obj.value = str;
        //setCaretPosition(obj.id, sc)
        setCaretPosition("inpMT", sc)
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br />
    <br />
    <table id="subPageMainTable">
        <tr>
            <td class="title">List of Actions</td>
        </tr>
        <tr>
            <td>Write a subproject id or part of it and press &quot;Find&quot; in order to 
                filter data
                <asp:TextBox ID="txtPrjId" runat="server" SkinID="txtTextCenter"></asp:TextBox>
                &nbsp;<asp:Button ID="btnFindPrj" runat="server" Text="Find" /><br />
                Click <img alt="Green check" src="Images/Icons/Approve_16x16.png" /> in order to select an action and view its details.
            </td>
        </tr>
        <tr>
            <td id="tdAP">
                <asp:GridView ID="gvAP" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id,ProjectId" 
                    DataSourceID="sqldsAP" SkinID="gridviewSkin">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False" 
                                    CommandName="Select" ImageUrl="~/Images/Icons/Approve_16x16.png" ToolTip="Select" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="A/A" HeaderText="A/A" ReadOnly="True" 
                            SortExpression="A/A" />
                        <asp:TemplateField HeaderText="SubProject" SortExpression="SubProject">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnSubProject" runat="server" CausesValidation="True" CommandArgument='<%# Bind("ProjectId") %>'
                                                CommandName="SelSubProject" Text='<%# Bind("SubProject") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Customer" HeaderText="Customer" 
                            SortExpression="Customer" />
                        <asp:BoundField DataField="ActionType" HeaderText="ActionType" 
                            SortExpression="ActionType" />
                        <asp:BoundField DataField="Description" HeaderText="Description" 
                            SortExpression="Description" />
                        <asp:BoundField DataField="Responsible1" HeaderText="Responsible1" 
                            SortExpression="Responsible1" ReadOnly="True" />
                        <asp:BoundField DataField="Responsible2" HeaderText="Responsible2" 
                            ReadOnly="True" SortExpression="Responsible2" />
                        <asp:TemplateField HeaderText="File" SortExpression="AttachmentName">
                            <ItemTemplate>
                                <asp:ImageButton ID="btnDown" runat="server" CommandArgument='<%# Bind("id") %>'
                                                CommandName="Download" ImageUrl="~/Images/Icons/Files2_24x24.png" ToolTip='<%# Bind("AttachmentName") %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Deadline *" HeaderStyle-Wrap="false" SortExpression="Deadline">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Deadline", "{0:dd/MM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>

                        <HeaderStyle Wrap="False"></HeaderStyle>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Status" HeaderText="Status" 
                            SortExpression="Status" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td align="right">(*): Default ordering</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="title">Action's details</td>
        </tr>
        <tr>
            <td>
                <asp:FormView ID="fvAction" runat="server" DataKeyNames="id" 
                    DataSourceID="sqldsAPdet" DefaultMode="Edit">
                    <EditItemTemplate>
                        <table id="tblDetails">
                            <tr>
                                <td class="tblDetailsHeader">Responsible1</td>
                                <td class="tblDetailsItem"><asp:DropDownList ID="ddlResp1" runat="server" DataSourceID="sqldsResponsibles" 
                                                selectedvalue=<%# Bind("Responsible1") %> DataTextField="FullName" DataValueField="id">
                                            </asp:DropDownList></td>
                                <td class="tblDetailsHeader">Responsible2</td>
                                <td class="tblDetailsItem"><asp:DropDownList ID="ddlResp2" runat="server" DataSourceID="sqldsResponsibles" 
                                                selectedvalue=<%# Bind("Responsible2") %> DataTextField="FullName" DataValueField="id">
                                            </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td class="tblDetailsHeader">Description<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox6" ValidationGroup="UpdAP" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                <td class="tblDetailsItem" colspan="3"><asp:TextBox ID="TextBox6" TextMode="MultiLine" SkinID="txtTextLong" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="tblDetailsHeader">ActionId</td>
                                <td class="tblDetailsItem"><asp:DropDownList ID="ddlActionType" runat="server" 
                                       selectedvalue=<%# Bind("ActionId") %> DataSourceID="sqldsActionType" DataTextField="Description" DataValueField="id">
                                    </asp:DropDownList></td>
                                <td class="tblDetailsHeader">AttachmentName</td>
                                <td class="tblDetailsItem"><asp:label ID="AttachmentNameTextBox" runat="server" Text='<%# Bind("AttachmentName") %>' /></td>
                            </tr>
                            <tr>
                                <td class="tblDetailsHeader">Deadline<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAPdead" ValidationGroup="UpdAP" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                <td class="tblDetailsItem"><asp:TextBox ID="txtAPdead" SkinID="txtDate" runat="server" Text='<%# Bind("Deadline", "{0:dd/MM/yyyy}") %>'></asp:TextBox></td>
                                <td class="tblDetailsHeader">Status</td>
                                <td class="tblDetailsItem"><asp:DropDownList ID="ddlActionStatus" runat="server" DataSourceID="sqldsActionStatus" 
                                                selectedvalue=<%# Bind("Status") %> DataTextField="Description" DataValueField="id">
                                            </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td class="tblDetailsHeader">Comments</td>
                                <td class="tblDetailsItem" colspan="3"><asp:TextBox ID="TextBox1" TextMode="MultiLine" SkinID="txtTextLong" runat="server" Text='<%# Bind("Comments") %>'></asp:TextBox></td>
                            </tr>
                        </table>
                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" 
                            CommandName="Update" ImageUrl="~/Images/Icons/Save24_24.png" ToolTip="Update" ValidationGroup="UpdAP" />
                        &nbsp;<asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" 
                            CommandName="New" ImageUrl="~/Images/Icons/add24_24.png" Tooltip="New" />
                        <!--&nbsp;<asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False" 
                            CommandName="Delete" ImageUrl="~/Images/Icons/Remove22_22.png" ToolTip="Delete" />-->
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <table id="tblDetails">
                            <tr>
                                <td class="tblDetailsHeader">Responsible1</td>
                                <td class="tblDetailsItem"><asp:DropDownList ID="ddlResp1" runat="server" DataSourceID="sqldsResponsibles" 
                                                selectedvalue=<%# Bind("Responsible1") %> DataTextField="FullName" DataValueField="id">
                                            </asp:DropDownList></td>
                                <td class="tblDetailsHeader">Responsible2</td>
                                <td class="tblDetailsItem"><asp:DropDownList ID="ddlResp2" runat="server" DataSourceID="sqldsResponsibles" 
                                                selectedvalue=<%# Bind("Responsible2") %> DataTextField="FullName" DataValueField="id">
                                            </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td class="tblDetailsHeader">Description<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox6" ValidationGroup="InsAP" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                <td class="tblDetailsItem" colspan="3"><asp:TextBox ID="TextBox6" TextMode="MultiLine" SkinID="txtTextLong" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="tblDetailsHeader">ActionId</td>
                                <td class="tblDetailsItem"><asp:DropDownList ID="ddlActionType" runat="server" 
                                       selectedvalue=<%# Bind("ActionId") %> DataSourceID="sqldsActionType" DataTextField="Description" DataValueField="id">
                                    </asp:DropDownList></td>
                                <td class="tblDetailsHeader">AttachmentName</td>
                                <td class="tblDetailsItem"><asp:FileUpload ID="fuAP" runat="server" /></td>
                            </tr>
                            <tr>
                                <td class="tblDetailsHeader">Deadline<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAPdead" ValidationGroup="InsAP" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                <td class="tblDetailsItem"><asp:TextBox ID="txtAPdead" SkinID="txtDate" runat="server" Text='<%# Bind("Deadline", "{0:dd/MM/yyyy}") %>'></asp:TextBox></td>
                                <td class="tblDetailsHeader">Status</td>
                                <td class="tblDetailsItem"><asp:DropDownList ID="ddlActionStatus" runat="server" DataSourceID="sqldsActionStatus" 
                                                selectedvalue=<%# Bind("Status") %> DataTextField="Description" DataValueField="id">
                                            </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td class="tblDetailsHeader">Comments<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox6" ValidationGroup="InsAP" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                <td class="tblDetailsItem" colspan="3"><asp:TextBox ID="TextBox2" TextMode="MultiLine" SkinID="txtTextLong" runat="server" Text='<%# Bind("Comments") %>'></asp:TextBox></td>
                            </tr>
                        </table>
                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" 
                            CommandName="Insert" ImageUrl="~/Images/Icons/add24_24.png" ToolTip="Insert" ValidationGroup="InsAP" />
                        &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                            CommandName="Cancel" ImageUrl="~/Images/Icons/Cancel32_32.png" ToolTip="Cancel" />
                    </InsertItemTemplate>
                </asp:FormView>
            </td>
        </tr>
        <tr>
            <td>
                <!--
                <asp:TextBox ID="txtMaskedText" onkeyup="TestFunc(this)" runat="server"></asp:TextBox>
                <input id="inpMT" type="text" /> 
                -->
                <asp:Button ID="btnReset" runat="server" Text="Remove filtering" />
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:SqlDataSource ID="sqldsAP" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="ActionPlanList" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserId" SessionField="UserId" Type="Int16" />
                        <asp:ControlParameter ControlID="txtPrjId" Name="SubProject" PropertyName="Text" Type="String" />
                        <asp:Parameter Name="APId" Type="Int16" DefaultValue="0" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsAPdet" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    DeleteCommand="DELETE FROM [ActionPlans] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [ActionPlans] ([ProjectId], [ActionId], [Responsible1], [Responsible2], [Description], [Comments], [AttachmentName], [Attachment], [Deadline], [Status]) VALUES (@ProjectId, @ActionId, @Responsible1, @Responsible2, @Description, @Comments, @AttachmentName, @Attachment, @Deadline, @Status)" 
                    SelectCommand="SELECT [id], [ProjectId], [ActionId], [Responsible1], [Responsible2], [Description], [Comments], [AttachmentName], [Deadline], [Status] FROM [ActionPlans] WHERE ([id] = @id)" 
                    UpdateCommand="UPDATE [ActionPlans] SET [ActionId] = @ActionId, [Responsible1] = @Responsible1, [Responsible2] = @Responsible2, [Description] = @Description, [Comments] = @Comments, [AttachmentName] = @AttachmentName, [Deadline] = @Deadline, [Status] = @Status WHERE [id] = @id">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="gvAP" Name="id" PropertyName="SelectedValue" 
                            Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ActionId" Type="Byte" />
                        <asp:Parameter Name="Responsible1" Type="Int32" />
                        <asp:Parameter Name="Responsible2" Type="Int32" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Comments" Type="String" />
                        <asp:Parameter Name="AttachmentName" Type="String" />
                        <asp:Parameter Name="Deadline" Type="DateTime" />
                        <asp:Parameter Name="Status" Type="Byte" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ProjectId" Type="Int32" />
                        <asp:Parameter Name="ActionId" Type="Byte" />
                        <asp:Parameter Name="Responsible1" Type="Int32" />
                        <asp:Parameter Name="Responsible2" Type="Int32" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Comments" Type="String" />
                        <asp:Parameter Name="AttachmentName" Type="String" />
                        <asp:Parameter Name="Attachment"  />
                        <asp:Parameter Name="Deadline" Type="DateTime" />
                        <asp:Parameter Name="Status" Type="Byte" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsActionType" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="SELECT [id], [Description] FROM [VariousTypes] WHERE ([Category] = @Category) ORDER BY [Description]">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="ActionType" Name="Category" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsResponsibles" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="GetResponsible" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="gvAP" Name="ProjectId" 
                            PropertyName='SelectedDataKey.Values("ProjectId")' Type="Int16" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="sqldsActionStatus" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="SELECT [id], [Description] FROM [VariousTypes] WHERE ([Category] = @Category) ORDER BY [Description]">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="ActionStatus" Name="Category" Type="String" />
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

