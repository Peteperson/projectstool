<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="Meetings.aspx.vb" Inherits="Meetings" Theme="MainSkin" %>

<%@ Register src="DateBox.ascx" tagname="DateBox" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br />
    <table id="subPageMainTable">
        <tr>
            <td class="title">Λίστα Συναντήσεων</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="centered">Πιέστε το <img alt="Green check" src="Images/Icons/Approve_16x16.png" /> προκειμένου να επιλέξετε μία συνάντηση και να δείτε αναλυτικά τα στοιχεία της.<br />
                <asp:TextBox ID="txtPrjId" runat="server" SkinID="txtTextCenter" Visible="false"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center">
                <table style="border: solid 1px white">
                    <tr>
                        <td colspan="2" class="ShowStatus">Προβολή συναντήσεων που βρίσκονται σε status:</td>
                    </tr>
                    <tr>
                        <td><asp:RadioButtonList ID="rblStatus" runat="server" RepeatDirection="Horizontal" 
                                DataSourceID="sqldsMeetStat" DataTextField="Description" 
                                DataValueField="id" AutoPostBack="True">
                            </asp:RadioButtonList>
                        </td>
                        <td><asp:Button ID="btnClearFilter" runat="server" Text="Remove filtering" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td id="tdMeetings">
                <asp:GridView ID="gvMeetings" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id,ProjectId" 
                    DataSourceID="sqldsMeetings" SkinID="gridviewSkinList">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False" 
                                    CommandName="Select" ImageUrl="~/Images/Icons/Approve_16x16.png" ToolTip="Select" />
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
                                                CommandName="Filter" ImageUrl="~/Images/Icons/Filter1_24x24.png" ToolTip="Filter data" /></td>                                        
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
                        <asp:TemplateField HeaderText="From *" HeaderStyle-Wrap="false" SortExpression="From">
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
                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
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
            <td class="title">Λεπτομέρειες</td>
        </tr>
        <tr>
            <td class="DetFormView">
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
                                        selectedvalue=<%# Bind("Consultant") %> DataTextField="Fullname" DataValueField="id">
                                    </asp:DropDownList></td>
                                <td class="tblDetailsHeader">Kind</td>
                                <td class="tblDetailsItem"><asp:DropDownList ID="ddlMeetKind" runat="server" DataSourceID="sqldsMeetKind" 
                                        selectedvalue=<%# Bind("Kind") %> DataTextField="Description" DataValueField="id">
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
                                            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="fuMtupd" ValidationGroup="UpdFile" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                            <td><asp:FileUpload ID="fuMtupd" runat="server" /></td>
                                            <td><asp:ImageButton ID="ImageButton6" runat="server" CausesValidation="True" ValidationGroup="UpdFile" CommandArgument='<%# Bind("Id") %>' 
                                                CommandName="FileUpd" ImageUrl="~/Images/Icons/Update1_24x24.png" ToolTip="Update file" /></td>
                                        </tr>
                                    </table>
                                </td>
                                <td class="tblDetailsHeader">Status</td>
                                <td class="tblDetailsItem"><asp:DropDownList ID="ddlMeetStat" runat="server" DataSourceID="sqldsMeetStat" 
                                        selectedvalue=<%# Bind("Status") %> DataTextField="Description" DataValueField="id">
                                    </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td class="tblDetailsHeader">Comments<asp:RegularExpressionValidator ID="RegExpVal2" runat="server" ControlToValidate="CommentsTextBox" ValidationExpression="^[\s\S]{0,500}$" ValidationGroup="UpdMeet" ErrorMessage="*"></asp:RegularExpressionValidator></td>
                                <td class="tblDetailsItem" colspan="7"><asp:TextBox ID="CommentsTextBox" TextMode="MultiLine" SkinID="txtTextLong" runat="server" MaxLength="500" Text='<%# Bind("Comments") %>' /></td>
                            </tr>
                        </table>
                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" ValidationGroup="UpdMeet"
                            CommandName="Update" ImageUrl="~/Images/Icons/Save24_24.png" ToolTip="Update" />
                        &nbsp;<asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" 
                            CommandName="New" ImageUrl="~/Images/Icons/add_24x24.png" Tooltip="New" />
                        <!--&nbsp;<asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False" 
                            CommandName="Delete" ImageUrl="~/Images/Icons/Remove22_22.png" ToolTip="Delete" />-->
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
                                        selectedvalue=<%# Bind("Consultant") %> DataTextField="Fullname" DataValueField="id">
                                    </asp:DropDownList></td>
                                <td class="tblDetailsHeader">Kind</td>
                                <td class="tblDetailsItem"><asp:DropDownList ID="ddlMeetKind" runat="server" DataSourceID="sqldsMeetKind" 
                                        selectedvalue=<%# Bind("Kind") %> DataTextField="Description" DataValueField="id">
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
                                <td class="tblDetailsItem"><asp:DropDownList ID="ddlMeetStat" runat="server" DataSourceID="sqldsMeetStat" 
                                         selectedvalue=<%# Bind("Status") %> DataTextField="Description" DataValueField="id">
                                    </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td class="tblDetailsHeader">Comments<asp:RegularExpressionValidator ID="RegExpVal2" runat="server" ControlToValidate="CommentsTextBox" ValidationExpression="^[\s\S]{0,500}$" ValidationGroup="InsMeet" ErrorMessage="*"></asp:RegularExpressionValidator></td>
                                <td class="tblDetailsItem" colspan="7"><asp:TextBox ID="CommentsTextBox" TextMode="MultiLine" SkinID="txtTextLong" runat="server" Text='<%# Bind("Comments") %>' /></td>
                            </tr>
                        </table>
                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" 
                            CommandName="Insert" ImageUrl="~/Images/Icons/add_24x24.png" ToolTip="Insert" ValidationGroup="InsMeet" />
                        &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                            CommandName="Cancel" ImageUrl="~/Images/Icons/Cancel32_32.png" ToolTip="Cancel" />
                    </InsertItemTemplate>
                </asp:FormView>
            </td>
        </tr>
        <tr>
            <td align="center"><asp:Button ID="btnReset" runat="server" Text="Remove filtering" /></td>
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
                        <asp:ControlParameter ControlID="rblStatus" DefaultValue="0" Name="Status" 
                            PropertyName="SelectedValue" Type="Int32" />
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
                <asp:SqlDataSource ID="sqldsMeetKind" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="SELECT [id], [Description] FROM [VariousTypes] WHERE ([Category] = @Category) ORDER BY [Description]">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="MeetingKind" Name="Category" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td style="margin-left: 40px">
                <asp:SqlDataSource ID="sqldsConsultants" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" SelectCommand="SELECT Users.id, LastName + ' ' + FirstName AS Fullname FROM Users
                    INNER JOIN VariousTypes ON Users.UserType = VariousTypes.id
                    WHERE VariousTypes.[Description] IN ('Consultant', 'Supervisor') AND users.IsActive = 1">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="sqldsMeetStat" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="TypesByCategory" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="MeetingStatus" Name="Category" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsFiles" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="SELECT [id], [AttachmentName] FROM [Meetings]" 
                    UpdateCommand="UPDATE [Meetings] SET [AttachmentName] = @AttachmentName, [Attachment] = @Attachment WHERE [id] = @id">
                    <UpdateParameters>
                        <asp:Parameter Name="AttachmentName" Type="String" />
                        <asp:Parameter Name="Attachment" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td></td>
            <td></td>
        </tr>
    </table>
</asp:Content>

