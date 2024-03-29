﻿<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="ActionPlans.aspx.vb" Inherits="ActionPlans" Theme="MainSkin" %>

<%@ Register src="ctrlDateTime.ascx" tagname="ctrlDateTime" tagprefix="uc1" %>

<%@ Register src="DateBox.ascx" tagname="DateBox" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br />
    <table id="subPageMainTable">
        <tr>
            <td class="FormTitle">
                <table style="width:100%">
                    <tr>
                        <td><asp:ImageButton ID="btnRemovePaging" ImageUrl="~/Images/Paging3_32x32.png" runat="server" ToolTip="Ενεργοποίηση/Απενεργοποίηση σελιδοποίησης" /></td>
                        <td style="width:100%" align="center">Λίστα action plan</td>
                        <td><asp:ImageButton ID="btnPrint" runat="server" ToolTip="Εκτύπωση σελίδας" 
                                ImageUrl="~/Images/Icons/Print1_32x32.png" OnClientClick="return PrintWithoutPostback()" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="tdBelowTitle">
                <table>
                    <tr>
                        <td align="center">
                            <table id="tblStatus">
                                <tr>
                                    <td colspan="5" class="ShowStatus">Προβολή ενεργειών που βρίσκονται σε status:</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:CheckBoxList ID="cblStatus" runat="server" AutoPostBack="True"
                                            DataSourceID="objdsActionStatus" DataTextField="Description" 
                                            DataValueField="id" RepeatDirection="Horizontal" RepeatColumns="2">
                                        </asp:CheckBoxList>
                                    </td>
                                    <td align="right" style="padding-left:10px; text-align:right">Από:<br />Έως:</td>
                                    <td><uc2:DateBox ID="dbFrom" runat="server" ShowTime="False" /><uc2:DateBox ID="dbTo" runat="server" ShowTime="False" /></td>
                                    <td>Βασικός Υπεύθυνος:<br />
                                        <asp:DropDownList ID="ddlRespFilter" runat="server" 
                                            AppendDataBoundItems="True" DataSourceID="sqldsUsers" 
                                            DataTextField="FullName" DataValueField="id" AutoPostBack="True"></asp:DropDownList>
                                    </td>
                                    <td><asp:Button ID="btnFindPrj" runat="server" Text="Αναζήτηση" /><br /><asp:Button ID="btnClearFilter" runat="server" Text="Remove filtering" /></td>
                                </tr>
                            </table>
                        </td> 
                        <td id="tdInfo"><img alt="info" src="Images/Icons/Logs_24x24.png" />: Πιέστε το <img alt="Green check" src="Images/Icons/Approve_16x16.png" /> προκειμένου να επιλέξετε μία ενέργεια και να δείτε αναλυτικά τα στοιχεία της.<br />
                            <asp:TextBox ID="txtPrjId" runat="server" SkinID="txtTextCenter" Visible="false"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td id="tdAP">
                <asp:GridView ID="gvAP" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id,ProjectId" 
                    DataSourceID="sqldsAP" SkinID="gridviewSkinList" ShowFooter="true">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False" 
                                    CommandName="Select" ImageUrl="~/Images/Icons/Approve_16x16.png" ToolTip="Επιλογή εγγραφής" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="A/A" HeaderText="A/A" ReadOnly="True" SortExpression="A/A" />
                        <asp:TemplateField>
                            <HeaderStyle HorizontalAlign="Center" />
                            <HeaderTemplate>
                                <table>
                                    <tr>
                                        <td colspan="2" align="center">SubProject</td>
                                    </tr>
                                    <tr>
                                        <td><asp:TextBox ID="txtHeadAPFilter" SkinID="txtFilterSmall" runat="server"></asp:TextBox></td>
                                        <td><asp:ImageButton ID="btnFilter" runat="server" CausesValidation="False" 
                                                CommandName="Filter" ImageUrl="~/Images/Icons/Filter1_24x24.png" ToolTip="Φιλτράρισμα δεδομένων" /></td>                                        
                                    </tr>
                                </table>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="btnSubProject" runat="server" CausesValidation="True" CommandArgument='<%# Bind("ProjectId") %>'
                                                CommandName="SelSubProject" Text='<%# Bind("SubProject") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Πελάτης" SortExpression="Customer">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnCust" runat="server" CommandArgument='<%# Bind("Customer") %>'
                                                CommandName="SelCompany" Text='<%# Bind("Customer") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Description" HeaderText="Περιγραφή" 
                            SortExpression="Description" />
                        <asp:BoundField DataField="Responsible1" HeaderText="Υπεύθυνος1" 
                            SortExpression="Responsible1" ReadOnly="True" />
                        <asp:BoundField DataField="Responsible2" HeaderText="Υπεύθυνος2" 
                            ReadOnly="True" SortExpression="Responsible2" />
                        <asp:TemplateField HeaderText="Αρχείο" SortExpression="AttachmentName">
                            <ItemTemplate>
                                <asp:ImageButton ID="btnDown" runat="server" OnClientClick="this.form.onsubmit=''" CommandArgument='<%# Bind("id") %>'
                                                CommandName="Download" ImageUrl="~/Images/Icons/Download_16x16.png" ToolTip='<%# Bind("AttachmentName") %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Deadline *" HeaderStyle-Wrap="false" SortExpression="Deadline">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Deadline", "{0:dd/MM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status" SortExpression="Status">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlActionStatusOne" Font-Size="8pt" runat="server" DataSourceID="objdsActionStatus" 
                                    selectedvalue='<%# Bind("StatusNo") %>' AutoPostBack="true" DataTextField="Description" 
                                    OnSelectedIndexChanged="ddlActionStatusOne_IndexChanged" ToolTip='<%# Bind("id") %>' DataValueField="id">
                                </asp:DropDownList>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="ddlActionStatus" Font-Size="8pt" runat="server" DataSourceID="objdsActionStatus" 
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
                                <asp:CheckBox id="chkSelected" runat="server" printed="no"></asp:CheckBox>
                                <asp:Label ID="lblId" runat="server" Text='<%# Bind("id") %>' Visible="false"></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:Button ID="Button1" CommandName="UpdStatus" runat="server" CssClass="btnUpdStatus" ToolTip="Αλλαγή του status όλων των επιλεγμένων εγγραφών" />
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
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="FormTitle">Λεπτομέρειες επιλεγμένης ενέργειας</td>
        </tr>
        <tr>
            <td class="tdBelowTitle2">
                <asp:FormView ID="fvAction" runat="server" DataKeyNames="id"
                    DataSourceID="sqldsAPdet" DefaultMode="Edit" Width="100%">
                    <EditRowStyle CssClass="centered" />
                    <EditItemTemplate>
                        <table id="tblDetails">
                            <tr>
                                <td class="tblDetailsHeader">Deadline</td>
                                <td class="tblDetailsItem"><uc2:DateBox ID="DateBox1" runat="server" Value='<%# Bind("Deadline") %>' /></td>
                                <td class="tblDetailsHeader">Meeting</td>
                                <td class="tblDetailsItem"><uc2:DateBox ID="dbMeeting" runat="server" Value='<%# Bind("MeetingDate") %>' /></td>
                                <td class="tblDetailsHeader">Υπεύθυνος1</td>
                                <td class="tblDetailsItem"><asp:DropDownList ID="ddlResp1" runat="server" DataSourceID="sqldsResponsibles" 
                                                selectedvalue=<%# Bind("Responsible1") %> DataTextField="FullName" DataValueField="id">
                                            </asp:DropDownList></td>
                                <td class="tblDetailsHeader">Υπεύθυνος2</td>
                                <td class="tblDetailsItem"><asp:DropDownList ID="ddlResp2" runat="server" DataSourceID="sqldsResponsibles" 
                                                selectedvalue=<%# Bind("Responsible2") %> DataTextField="FullName" DataValueField="id">
                                            </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td class="tblDetailsHeader">Περιγραφή<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox6" ValidationGroup="UpdAP" ErrorMessage="*"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox6" ValidationExpression="^[\s\S]{0,500}$" ValidationGroup="UpdAP" ErrorMessage="*"></asp:RegularExpressionValidator></td>
                                <td class="tblDetailsItem" colspan="7"><asp:TextBox ID="TextBox6" TextMode="MultiLine" SkinID="txtTextLong" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="tblDetailsHeader">Όνομα αρχείου</td>
                                <td class="tblDetailsItem" colspan="3"><asp:label ID="AttachmentNameTextBox" runat="server" Text='<%# Bind("AttachmentName") %>' /></td>
                                <td class="tblDetailsHeader">Αρχείο</td>
                                <td class="tblDetailsItem">
                                    <table>
                                        <tr>
                                            <td><asp:ImageButton ID="ImageButton5" runat="server" CausesValidation="True" CommandArgument='<%# Bind("Id") %>' 
                                                CommandName="FileDel" OnClientClick="return ConfirmDelete()" ImageUrl="~/Images/Icons/Remove22_22.png" ToolTip="Διαγραφή αρχείου" /></td>
                                            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="fuAPupd" ValidationGroup="UpdFile" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                            <td><asp:FileUpload ID="fuAPupd" runat="server" /></td>
                                            <td><asp:ImageButton ID="ImageButton6" runat="server" CausesValidation="True" ValidationGroup="UpdFile" CommandArgument='<%# Bind("Id") %>' 
                                                CommandName="FileUpd" ImageUrl="~/Images/Icons/Update1_24x24.png" ToolTip="Αποθήκευση αρχείου" /></td>
                                        </tr>
                                    </table>
                                </td>
                                <td class="tblDetailsHeader">Status</td>
                                <td class="tblDetailsItem"><asp:DropDownList ID="ddlActionStatus" runat="server" DataSourceID="objdsActionStatus" 
                                                selectedvalue=<%# Bind("Status") %> DataTextField="Description" DataValueField="id">
                                            </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td class="tblDetailsHeader">Σχόλια<asp:RegularExpressionValidator ID="RegExpVal1" runat="server" ControlToValidate="TextBox1" ValidationExpression="^[\s\S]{0,500}$" ValidationGroup="UpdAP" ErrorMessage="*"></asp:RegularExpressionValidator></td>
                                <td class="tblDetailsItem" colspan="7"><asp:TextBox ID="TextBox1" TextMode="MultiLine" SkinID="txtTextLong" runat="server" Text='<%# Bind("Comments") %>'></asp:TextBox></td>
                            </tr>
                        </table>
                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" 
                            CommandName="Update" ImageUrl="~/Images/Icons/Save24_24.png" ToolTip="Ενημέρωση εγγραφής" ValidationGroup="UpdAP" />
                        &nbsp;<asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" 
                            CommandName="New" ImageUrl="~/Images/Icons/add_24x24.png" ToolTip="Νέα εγγραφή" />
                        <!--&nbsp;<asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False" 
                            CommandName="Delete" ImageUrl="~/Images/Icons/Remove22_22.png" ToolTip="Διαγραφή" />-->
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <table id="tblDetails">
                            <tr>
                                <td class="tblDetailsHeader">Deadline</td>
                                <td class="tblDetailsItem"><uc2:DateBox ID="dbDeadline" runat="server" Value='<%# Bind("Deadline") %>' Text='<%# Today.ToString("dd/MM/yyyy") %>' /></td>
                                <td class="tblDetailsHeader">Meeting</td>
                                <td class="tblDetailsItem"><uc2:DateBox ID="dbMeeting" runat="server" Value='<%# Bind("MeetingDate") %>' Text='<%# Today.ToString("dd/MM/yyyy") %>' /></td>
                                <td class="tblDetailsHeader">Υπεύθυνος1</td>
                                <td class="tblDetailsItem"><asp:DropDownList ID="ddlResp1" runat="server" DataSourceID="sqldsResponsibles" 
                                                selectedvalue=<%# Bind("Responsible1") %> DataTextField="FullName" DataValueField="id">
                                            </asp:DropDownList></td>
                                <td class="tblDetailsHeader">Υπεύθυνος2</td>
                                <td class="tblDetailsItem"><asp:DropDownList ID="ddlResp2" runat="server" DataSourceID="sqldsResponsibles" 
                                                selectedvalue=<%# Bind("Responsible2") %> DataTextField="FullName" DataValueField="id">
                                            </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td class="tblDetailsHeader">Περιγραφή<asp:RegularExpressionValidator ID="RegExpVal3" runat="server" ControlToValidate="TextBox6" ValidationExpression="^[\s\S]{0,500}$" ValidationGroup="InsAP" ErrorMessage="*"></asp:RegularExpressionValidator><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox6" ValidationGroup="InsAP" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                <td class="tblDetailsItem" colspan="7"><asp:TextBox ID="TextBox6" TextMode="MultiLine" SkinID="txtTextLong" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="tblDetailsHeader">Όνομα αρχείου</td>
                                <td class="tblDetailsItem" colspan="3"></td>
                                <td class="tblDetailsHeader">Αρχείο</td>
                                <td class="tblDetailsItem"><asp:FileUpload ID="fuAP" runat="server" /></td>
                                <td class="tblDetailsHeader">Status</td>
                                <td class="tblDetailsItem"><asp:DropDownList ID="ddlActionStatus" runat="server" DataSourceID="objdsActionStatus" 
                                                selectedvalue=<%# Bind("Status") %> DataTextField="Description" DataValueField="id">
                                            </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td class="tblDetailsHeader">Σχόλια<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" ValidationExpression="^[\s\S]{0,500}$" ValidationGroup="InsAP" ErrorMessage="*"></asp:RegularExpressionValidator></td>
                                <td class="tblDetailsItem" colspan="7"><asp:TextBox ID="TextBox2" TextMode="MultiLine" SkinID="txtTextLong" runat="server" Text='<%# Bind("Comments") %>'></asp:TextBox></td>
                            </tr>
                        </table>
                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" 
                            CommandName="Insert" ImageUrl="~/Images/Icons/add_24x24.png" ToolTip="Εισαγωγή εγγραφής" ValidationGroup="InsAP" />
                        &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                            CommandName="Cancel" ImageUrl="~/Images/Icons/Cancel32_32.png" ToolTip="Ακύρωση" />
                    </InsertItemTemplate>
                </asp:FormView>
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
                        <asp:Parameter Name="Status" Type="String" />
                        <asp:ControlParameter ControlID="dbFrom" Name="dtFrom" PropertyName="Value" Type="DateTime" />
                        <asp:ControlParameter ControlID="dbTo" Name="dtTo" PropertyName="Value" Type="DateTime" />
                        <asp:ControlParameter ControlID="ddlRespFilter" Name="UserIdFilter" PropertyName="Text" Type="Int16" />                        
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsAPdet" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    DeleteCommand="DELETE FROM [ActionPlans] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [ActionPlans] ([ProjectId], [ActionId], [Responsible1], [Responsible2], [Description], [Comments], [AttachmentName], [Attachment], [Deadline], [Status], [MeetingDate]) VALUES (@ProjectId, @ActionId, @Responsible1, @Responsible2, @Description, @Comments, @AttachmentName, @Attachment, @Deadline, @Status, @MeetingDate)" 
                    SelectCommand="SELECT [id], [ProjectId], [ActionId],  ISNULL([Responsible1], 0) AS Responsible1,  ISNULL([Responsible2], 0) AS Responsible2, [Description], [Comments], [AttachmentName], [Deadline], [Status], [MeetingDate] FROM [ActionPlans] WHERE ([id] = @id)" 
                    UpdateCommand="UPDATE [ActionPlans] SET [ActionId] = @ActionId, [Responsible1] = @Responsible1, [Responsible2] = @Responsible2, [Description] = @Description, [Comments] = @Comments, [AttachmentName] = @AttachmentName, [Deadline] = @Deadline, [Status] = @Status, [MeetingDate] = @MeetingDate WHERE [id] = @id">
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
                        <asp:Parameter Name="Comments" Type="String" DefaultValue=" " />
                        <asp:Parameter Name="AttachmentName" Type="String" />
                        <asp:Parameter Name="Deadline" Type="DateTime" />
                        <asp:Parameter Name="Status" Type="Byte" />
                        <asp:Parameter Name="id" Type="Int32" />
                        <asp:Parameter Name="Meetingdate" Type="DateTime" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ProjectId" Type="Int32" />
                        <asp:Parameter Name="ActionId" Type="Byte" />
                        <asp:Parameter Name="Responsible1" Type="Int32" />
                        <asp:Parameter Name="Responsible2" Type="Int32" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Comments" Type="String" DefaultValue=" " />
                        <asp:Parameter Name="AttachmentName" Type="String" />
                        <asp:Parameter Name="Attachment"  />
                        <asp:Parameter Name="Deadline" Type="DateTime" />
                        <asp:Parameter Name="Status" Type="Byte" />
                        <asp:Parameter Name="Meetingdate" Type="DateTime" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:ObjectDataSource ID="objdsActionStatus" runat="server" 
                    SelectMethod="VariousTypes" TypeName="Database">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Category = 'ActionStatus'" Name="Category" Type="String" />
                        <asp:Parameter DefaultValue="Description" Name="OrderBy" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
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
                    SelectCommand="SELECT [id], [Description] FROM [VariousTypes] WHERE ([Category] = @Category) ORDER BY [Description]"
                    UpdateCommand="UPDATE [ActionPlans] SET [Status] = @Status WHERE id = @id">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="ActionStatus" Name="Category" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Status" Type="Int16" />
                        <asp:Parameter Name="id" Type="Int16" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td></td>
            <td>
                <asp:SqlDataSource ID="sqldsUsers" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" SelectCommand="UsersByType" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="exclude" Name="Function" Type="String" />
                        <asp:Parameter DefaultValue="Admin" 
                            Name="UserType" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsFile" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="SELECT [id], [AttachmentName] FROM [ActionPlans]" 
                    UpdateCommand="UPDATE [ActionPlans] SET [Attachment] = @Attachment, [AttachmentName] = @AttachmentName WHERE [id] = @id"
                    DeleteCommand="UPDATE [ActionPlans] SET [Attachment] = null, [AttachmentName] = '' WHERE [id] = @id">
                    <UpdateParameters>
                        <asp:Parameter Name="Attachment" />
                        <asp:Parameter Name="AttachmentName" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

