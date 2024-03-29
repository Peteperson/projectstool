﻿<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="Meetings.aspx.vb" Inherits="Meetings" Theme="MainSkin" %>

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
                        <td><asp:ImageButton ID="btnRemovePaging" ImageUrl="~/Images/Paging3_32x32.png" runat="server" ToolTip="Ενεργοποίηση/Απενεργοποίηση σελιδοποίησης" /></td>
                        <td style="width:100%" align="center">Λίστα Συναντήσεων</td>
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
                                    <td colspan="4" class="ShowStatus">Προβολή συναντήσεων που βρίσκονται σε status:</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:CheckBoxList ID="cblStatus" runat="server" DataSourceID="objdsMeetStatus" 
                                            DataTextField="Description" DataValueField="id" AutoPostBack="True"
                                            RepeatDirection="Horizontal" RepeatColumns="2">
                                        </asp:CheckBoxList>
                                    </td>
                                    <td align="right" style="padding-left:10px; text-align:right">Από:<br />Έως:</td>
                                    <td><uc1:DateBox ID="dbFrom" runat="server" ShowTime="False" /><uc1:DateBox ID="dbTo" runat="server" ShowTime="False" /></td>
                                    <td><asp:Button ID="btnFindPrj" runat="server" Text="Αναζήτηση" /><br /><asp:Button ID="btnClearFilter" runat="server" Text="Remove filtering" /></td>
                                </tr>
                            </table>
                        </td>
                        <td id="tdInfo"><img alt="info" src="Images/Icons/Logs_24x24.png" />: Πιέστε το <img alt="Green check" src="Images/Icons/Approve_16x16.png" /> προκειμένου να επιλέξετε μία συνάντηση και να δείτε αναλυτικά τα στοιχεία της.<br />
                            <asp:TextBox ID="txtPrjId" runat="server" SkinID="txtTextCenter" Visible="false"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td id="tdMeetings">
                <asp:GridView ID="gvMeetings" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id,ProjectId" 
                    DataSourceID="sqldsMeetings" SkinID="gridviewSkinList" ShowFooter="true">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False" 
                                    CommandName="Select" ImageUrl="~/Images/Icons/Approve_16x16.png" ToolTip="Επιλογή εγγραφής" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="A/A" HeaderText="A/A" ReadOnly="True" 
                            SortExpression="A/A" />
                        <asp:TemplateField>
                            <HeaderStyle HorizontalAlign="Center" />
                            <HeaderTemplate>
                                <table>
                                    <tr>
                                        <td colspan="2" align="center">SubProject</td>
                                    </tr>
                                    <tr>
                                        <td><asp:TextBox ID="txtHeadMtFilter" SkinID="txtFilterSmall" runat="server"></asp:TextBox></td>
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
                        <asp:TemplateField HeaderText="Customer" SortExpression="Customer">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnCust" runat="server" CommandArgument='<%# Bind("Customer") %>'
                                                CommandName="SelCompany" Text='<%# Bind("Customer") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date *" HeaderStyle-Wrap="false" SortExpression="Date">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Date", "{0:dd/MM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="From" HeaderStyle-Wrap="false" SortExpression="From">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("From", "{0:HH:mm}") %>'></asp:Label>
                            </ItemTemplate>
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="To" SortExpression="To">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("To", "{0:HH:mm}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Subject" ItemStyle-CssClass="CommentsCol" HeaderText="Subject" SortExpression="Subject" >
                        <ItemStyle CssClass="CommentsCol"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Consultant" HeaderText="Consultant" ReadOnly="True" SortExpression="Consultant" />
                        <asp:TemplateField HeaderText="File" SortExpression="File">
                            <ItemTemplate>
                                <asp:ImageButton ID="btnDown" OnClientClick="this.form.onsubmit=''" runat="server" CommandArgument='<%# Bind("id") %>'
                                    CommandName="Download" ImageUrl="~/Images/Icons/Download_16x16.png" ToolTip='<%# Bind("File") %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status" SortExpression="Status">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlMeetingStatusOne" Font-Size="8pt" runat="server" DataSourceID="objdsMeetStatus" 
                                    selectedvalue='<%# Bind("StatusNo") %>' DataTextField="Description" DataValueField="id" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlMeetingStatusOne_IndexChanged" ToolTip='<%# Bind("id") %>' >
                                </asp:DropDownList>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="ddlMeetingStatus" Font-Size="8pt" runat="server" DataSourceID="objdsMeetStatus" 
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
            <td class="FormTitle">Λεπτομέρειες</td>
        </tr>
        <tr>
            <td class="tdBelowTitle2">
                <asp:FormView ID="fvMeetings" runat="server" DataKeyNames="id" 
                    DataSourceID="sqldsMeetingsDet" DefaultMode="Edit" Width="100%">
                    <EditRowStyle CssClass="centered" />
                    <EditItemTemplate>
                        <table id="tblDetails">
                            <tr>
                                <td class="tblDetailsHeader">TimeFrom</td>
                                <td class="tblDetailsItem"><uc1:DateBox ID="dbTimeFrom" runat="server" Value='<%# Bind("TimeFrom") %>' ShowTime="true" /></td>
                                <td class="tblDetailsHeader">TimeTo</td>
                                <td class="tblDetailsItem"><uc1:DateBox ID="dbTimeTo" runat="server" Value='<%# Bind("TimeTo") %>' ShowTime="true" ShowDate="false" /></td>
                                <td class="tblDetailsHeader">Consultant</td>
                                <td class="tblDetailsItem"><asp:DropDownList ID="ddlMeetCons" runat="server" DataSourceID="sqldsConsultants" 
                                        selectedvalue='<%# Bind("Consultant") %>' DataTextField="Fullname" DataValueField="id">
                                    </asp:DropDownList></td>
                                <td class="tblDetailsHeader">Kind</td>
                                <td class="tblDetailsItem"><asp:DropDownList ID="ddlMeetKind" runat="server" DataSourceID="objdsMeetKind" 
                                        selectedvalue='<%# Bind("Kind") %>' DataTextField="Description" DataValueField="id">
                                    </asp:DropDownList>
                            </tr>
                            <tr>
                                <td class="tblDetailsHeader">Subject</td>
                                <td class="tblDetailsItem" colspan="7"><asp:TextBox ID="SubjectTextBox" SkinID="txtText" MaxLength="50" runat="server" Text='<%# Bind("Subject") %>' /></td>
                            </tr>
                            <tr>
                                <td class="tblDetailsHeader">NewBusiness<asp:RegularExpressionValidator ID="RegExpVal1" runat="server" ControlToValidate="NewBusinessTextBox" ValidationExpression="^[\s\S]{0,500}$" ValidationGroup="UpdMeet" ErrorMessage="*"></asp:RegularExpressionValidator></td>
                                <td class="tblDetailsItem" colspan="7"><asp:TextBox ID="NewBusinessTextBox" TextMode="MultiLine" SkinID="txtTextLong" runat="server" Text='<%# Bind("NewBusiness") %>' /></td>
                            </tr>
                            <tr>
                                <td class="tblDetailsHeader">File Name</td>
                                <td class="tblDetailsItem"><asp:label ID="lblAttachmentName" runat="server" Text='<%# Bind("AttachmentName") %>' /></td>
                                <td class="tblDetailsHeader">Attachment</td>
                                <td class="tblDetailsItem" colspan="3">
                                    <table>
                                        <tr>
                                            <td><asp:ImageButton ID="ImageButton5" runat="server" CausesValidation="True" CommandArgument='<%# Bind("Id") %>' 
                                                CommandName="FileDel" OnClientClick="return ConfirmDelete()" ImageUrl="~/Images/Icons/Remove22_22.png" ToolTip="Διαγραφή αρχείου" /></td>
                                            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="fuMtupd" ValidationGroup="UpdFile" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                            <td><asp:FileUpload ID="fuMtupd" runat="server" /></td>
                                            <td><asp:ImageButton ID="ImageButton6" runat="server" CausesValidation="True" ValidationGroup="UpdFile" CommandArgument='<%# Bind("Id") %>' 
                                                CommandName="FileUpd" ImageUrl="~/Images/Icons/Update1_24x24.png" ToolTip="Αποθήκευση αρχείου" /></td>
                                        </tr>
                                    </table>
                                </td>
                                <td class="tblDetailsHeader">Status</td>
                                <td class="tblDetailsItem"><asp:DropDownList ID="ddlMeetStat" runat="server" DataSourceID="objdsMeetStatus" 
                                        selectedvalue='<%# Bind("Status") %>' DataTextField="Description" DataValueField="id">
                                    </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td class="tblDetailsHeader">Comments<asp:RegularExpressionValidator ID="RegExpVal2" runat="server" ControlToValidate="CommentsTextBox" ValidationExpression="^[\s\S]{0,500}$" ValidationGroup="UpdMeet" ErrorMessage="*"></asp:RegularExpressionValidator></td>
                                <td class="tblDetailsItem" colspan="7"><asp:TextBox ID="CommentsTextBox" TextMode="MultiLine" SkinID="txtTextLong" runat="server" MaxLength="500" Text='<%# Bind("Comments") %>' /></td>
                            </tr>
                        </table>
                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" ValidationGroup="UpdMeet"
                            CommandName="Update" ImageUrl="~/Images/Icons/Save24_24.png" ToolTip="Ενημέρωση εγγραφής" />
                        &nbsp;<asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" 
                            CommandName="New" ImageUrl="~/Images/Icons/add_24x24.png" ToolTip="Νέα εγγραφή" />
                        <!--&nbsp;<asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False" 
                            CommandName="Delete" ImageUrl="~/Images/Icons/Remove22_22.png" ToolTip="Διαγραφή" />-->
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <table id="tblDetails">
                            <tr>
                                <td class="tblDetailsHeader">TimeFrom</td>
                                <td class="tblDetailsItem"><uc1:DateBox ID="dbTimeFrom" runat="server" Value='<%# Bind("TimeFrom") %>' ShowTime="true" Text='<%# Now.ToString("dd/MM/yyyy") %>' /></td>
                                <td class="tblDetailsHeader">TimeTo</td>
                                <td class="tblDetailsItem"><uc1:DateBox ID="DateBox1" runat="server" Value='<%# Bind("TimeTo") %>' ShowTime="true" ShowDate="false" Text='<%# Now.AddMinutes(90).ToString("dd/MM/yyyy") %>' /></td>
                                <td class="tblDetailsHeader">Consultant</td>
                                <td class="tblDetailsItem"><asp:DropDownList ID="ddlMeetCons" runat="server" DataSourceID="sqldsConsultants" 
                                        selectedvalue='<%# Bind("Consultant") %>' DataTextField="Fullname" DataValueField="id">
                                    </asp:DropDownList></td>
                                <td class="tblDetailsHeader">Kind</td>
                                <td class="tblDetailsItem"><asp:DropDownList ID="ddlMeetKind" runat="server" DataSourceID="objdsMeetKind" 
                                        selectedvalue='<%# Bind("Kind") %>' DataTextField="Description" DataValueField="id">
                                    </asp:DropDownList>
                            </tr>
                            <tr>
                                <td class="tblDetailsHeader">Subject<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="SubjectTextBox" ValidationGroup="InsMeet" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                <td class="tblDetailsItem" colspan="7"><asp:TextBox ID="SubjectTextBox" SkinID="txtText" runat="server" MaxLength="50" Text='<%# Bind("Subject") %>' /></td>
                            </tr>
                            <tr>
                                <td class="tblDetailsHeader">NewBusiness<asp:RegularExpressionValidator ID="RegExpVal1" runat="server" ControlToValidate="NewBusinessTextBox" ValidationExpression="^[\s\S]{0,500}$" ValidationGroup="InsMeet" ErrorMessage="*"></asp:RegularExpressionValidator></td>
                                <td class="tblDetailsItem" colspan="7"><asp:TextBox ID="NewBusinessTextBox" TextMode="MultiLine" SkinID="txtTextLong" runat="server" Text='<%# Bind("NewBusiness") %>' /></td>
                            </tr>
                            <tr>
                                <td class="tblDetailsHeader">File Name</td>
                                <td class="tblDetailsItem"></td>
                                <td class="tblDetailsHeader">Attachment</td>
                                <td class="tblDetailsItem" colspan="3"><asp:FileUpload ID="FileUpload1" runat="server" /></td>
                                <td class="tblDetailsHeader">Status</td>
                                <td class="tblDetailsItem"><asp:DropDownList ID="ddlMeetStat" runat="server" DataSourceID="objdsMeetStatus" 
                                         selectedvalue='<%# Bind("Status") %>' DataTextField="Description" DataValueField="id">
                                    </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td class="tblDetailsHeader">Comments<asp:RegularExpressionValidator ID="RegExpVal2" runat="server" ControlToValidate="CommentsTextBox" ValidationExpression="^[\s\S]{0,500}$" ValidationGroup="InsMeet" ErrorMessage="*"></asp:RegularExpressionValidator></td>
                                <td class="tblDetailsItem" colspan="7"><asp:TextBox ID="CommentsTextBox" TextMode="MultiLine" SkinID="txtTextLong" runat="server" Text='<%# Bind("Comments") %>' /></td>
                            </tr>
                        </table>
                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" 
                            CommandName="Insert" ImageUrl="~/Images/Icons/add_24x24.png" ToolTip="Εισαγωγή εγγραφής" ValidationGroup="InsMeet" />
                        &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                            CommandName="Cancel" ImageUrl="~/Images/Icons/Cancel32_32.png" ToolTip="Ακύρωση" />
                    </InsertItemTemplate>
                </asp:FormView>
            </td>
        </tr>
        <tr>
            <td align="center">&nbsp;</td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:SqlDataSource ID="sqldsMeetings" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="MeetingsList" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserId" SessionField="UserId" Type="Int16" />
                        <asp:ControlParameter ControlID="txtPrjId" Name="SubProject" PropertyName="Text" Type="String" />
                        <asp:Parameter Name="MtngsId" Type="Int16" DefaultValue="0" />
                        <asp:Parameter Name="Status" Type="String" />
                        <asp:ControlParameter ControlID="dbFrom" Name="dtFrom" PropertyName="Value" Type="DateTime" />
                        <asp:ControlParameter ControlID="dbTo" Name="dtTo" PropertyName="Value" Type="DateTime" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsMeetingsDet" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    DeleteCommand="DELETE FROM [Meetings] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [Meetings] ([ProjectId], [TimeFrom], [TimeTo], [Kind], [Subject], [Consultant], [Comments], [NewBusiness], [AttachmentName], [Status], [Attachment]) VALUES (@ProjectId, @TimeFrom, @TimeTo, @Kind, @Subject, @Consultant, @Comments, @NewBusiness, @AttachmentName, @Status, @Attachment)" 
                    SelectCommand="SELECT [id], [Datestamp], [ProjectId], [TimeFrom], [TimeTo], [Kind], [Subject], [Consultant], [Comments], [NewBusiness], [AttachmentName], [Status] FROM [Meetings] WHERE ([id] = @id)" 
                    UpdateCommand="UPDATE [Meetings] SET [TimeFrom] = @TimeFrom, [TimeTo] = @TimeTo, [Kind] = @Kind, [Subject] = @Subject, [Consultant] = @Consultant, [Comments] = @Comments, [NewBusiness] = @NewBusiness, [Status] = @Status WHERE [id] = @id">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="gvMeetings" Name="id" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="TimeFrom" Type="DateTime" />
                        <asp:Parameter Name="TimeTo" Type="DateTime" />
                        <asp:Parameter Name="Kind" Type="Byte" />
                        <asp:Parameter Name="Subject" Type="String" />
                        <asp:Parameter Name="Consultant" Type="Int32" />
                        <asp:Parameter Name="Comments" Type="String" DefaultValue=" " />
                        <asp:Parameter Name="NewBusiness" Type="String" DefaultValue=" " />
                        <asp:Parameter Name="Status" Type="Byte" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ProjectId" Type="Int32" />
                        <asp:Parameter Name="TimeFrom" Type="DateTime" />
                        <asp:Parameter Name="TimeTo" Type="DateTime" />
                        <asp:Parameter Name="Kind" Type="Byte" />
                        <asp:Parameter Name="Subject" Type="String" />
                        <asp:Parameter Name="Consultant" Type="Int32" />
                        <asp:Parameter Name="Comments" Type="String" DefaultValue=" " />
                        <asp:Parameter Name="NewBusiness" Type="String" DefaultValue=" " />
                        <asp:Parameter Name="AttachmentName" Type="String" />
                        <asp:Parameter Name="Status" Type="Byte" />
                        <asp:Parameter Name="Attachment" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:ObjectDataSource ID="objdsMeetKind" runat="server" 
                    SelectMethod="VariousTypes" TypeName="Database">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Category = 'MeetingKind'" Name="Category" Type="String" />
                        <asp:Parameter DefaultValue="Description" Name="OrderBy" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
            <td style="margin-left: 40px">
                <asp:SqlDataSource ID="sqldsConsultants" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" SelectCommand="UsersByType" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="include" Name="Function" Type="String" />
                        <asp:Parameter DefaultValue="Consultant,ProjectManager,FoodDirector,OrgDirector,ITDirector" 
                            Name="UserType" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="sqldsMeetStat" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="TypesByCategory" SelectCommandType="StoredProcedure"
                    UpdateCommand="UPDATE [Meetings] SET [Status] = @Status WHERE id = @id">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="MeetingStatus" Name="Category" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Status" Type="Int16" />
                        <asp:Parameter Name="id" Type="Int16" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsFiles" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="SELECT [id], [AttachmentName] FROM [Meetings]" 
                    UpdateCommand="UPDATE [Meetings] SET [AttachmentName] = @AttachmentName, [Attachment] = @Attachment WHERE [id] = @id"
                    DeleteCommand="UPDATE [Meetings] SET [AttachmentName] = '', [Attachment] = null WHERE [id] = @id">
                    <UpdateParameters>
                        <asp:Parameter Name="AttachmentName" Type="String" />
                        <asp:Parameter Name="Attachment" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:ObjectDataSource ID="objdsMeetStatus" runat="server" 
                    SelectMethod="VariousTypes" TypeName="Database">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Category = 'MeetingStatus'" Name="Category" Type="String" />
                        <asp:Parameter DefaultValue="Description" Name="OrderBy" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
            <td></td>
        </tr>
    </table>
</asp:Content>

