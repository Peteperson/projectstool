<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="CustProjects.aspx.vb" Inherits="CustProjects" Theme="MainSkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br />
    <table id="subPageMainTable" cellpadding="0" cellspacing="0">
        <tr>
            <td class="FormTitle">
                <table style="width:100%">
                    <tr>
                        <td><asp:ImageButton ID="btnRemovePaging" ImageUrl="~/Images/Paging3_32x32.png" runat="server" ToolTip="Ενεργοποίηση/Απενεργοποίηση σελιδοποίησης" /></td>
                        <td style="width:100%" align="center">Λίστα έργων</td>
                        <td><asp:ImageButton ID="btnPrint" runat="server" ToolTip="Εκτύπωση σελίδας" 
                                ImageUrl="~/Images/Icons/Print1_32x32.png" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="tdBelowTitle"><br />Πιέστε το <img alt="Green check" src="Images/Icons/Approve_16x16.png" /> προκειμένου να επιλέξετε ένα έργο και να δείτε αναλυτικά τα στοιχεία του.</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gvProjects" runat="server" AllowPaging="True" SkinID="gridviewSkinList" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ProjectId,SubProject" 
                    DataSourceID="sqldsProjects">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                    CommandName="Select" ImageUrl="~/Images/Icons/Approve_16x16.png" ToolTip="Επιλογή εγγραφής" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="SubProject" HeaderText="SubProject" 
                            SortExpression="SubProject" />
                        <asp:BoundField DataField="Title" HeaderText="Τίτλος" SortExpression="Title" />
                        <asp:BoundField DataField="ProjectManager" HeaderText="Project manager" ReadOnly="True" 
                            SortExpression="ProjectManager" />
                        <asp:BoundField DataField="Consultant" HeaderText="Σύμβουλος" ReadOnly="True" 
                            SortExpression="Consultant" />
                        <asp:BoundField DataField="InitialEndDate" DataFormatString="{0:dd/MM/yyyy}" 
                            HeaderText="Λήξη" SortExpression="InitialEndDate" />
                        <asp:BoundField DataField="CompletionPercentage" HeaderText="%" 
                            SortExpression="CompletionPercentage" />
                        <asp:BoundField DataField="Status" HeaderText="Status" 
                            SortExpression="Status" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td><br /><br /><br /><br /><br /></td>
        </tr>
        <tr>
            <td id="tdSubMenu">
                <asp:Menu ID="mnuProjects" runat="server" Orientation="Horizontal" ForeColor="Black" 
                    StaticEnableDefaultPopOutImage="False" OnMenuItemClick="mnuProjects_MenuItemClick" 
                    StaticMenuItemStyle-CssClass="TabMenuItem" Visible="False">
                    <StaticMenuItemStyle CssClass="TabMenuItem"></StaticMenuItemStyle>
                    <Items>
                        <asp:MenuItem ImageUrl="~/Images/ActionPlanSelected5.png" Text="" Value="0"></asp:MenuItem>
                        <asp:MenuItem ImageUrl="~/Images/MeetingsUnselected5.png" Text="" Value="1"></asp:MenuItem>
                        <asp:MenuItem ImageUrl="~/Images/AttachmentsUnselected5.png" Text="" Value="2"></asp:MenuItem>
                    </Items>
                </asp:Menu>
            </td>
        </tr>
        <tr>
            <td align="left" style="padding: 6px 6px 6px 6px; background-color:#842829">
                <table cellpadding="0" cellspacing="0" style="width:100%">
                    <tr>
                        <td id="tdAP">
                            <asp:GridView ID="gvAP" runat="server" AllowPaging="True" SkinID="gridviewSkinSmall"
                                AllowSorting="True" AutoGenerateColumns="False" DataSourceID="sqldsAP">
                                <Columns>
                                    <asp:BoundField DataField="A/A" HeaderText="A/A" ReadOnly="True" 
                                        SortExpression="A/A" />
                                    <asp:BoundField DataField="Responsible1" HeaderText="Υπεύθυνος1" 
                                        ReadOnly="True" SortExpression="Responsible1" />
                                    <asp:BoundField DataField="Responsible2" HeaderText="Υπεύθυνος2" 
                                        ReadOnly="True" SortExpression="Responsible2" />
                                    <asp:BoundField DataField="Description" HeaderText="Περιγραφή" 
                                        SortExpression="Description" />
                                    <asp:TemplateField HeaderText="Αρχείο" SortExpression="AttachmentName">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnDown" runat="server" OnClientClick="this.form.onsubmit=''" CommandArgument='<%# Bind("id") %>'
                                                CommandName="Download" ImageUrl="~/Images/Icons/Download_16x16.png" ToolTip='<%# Bind("AttachmentName") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Deadline" DataFormatString="{0:dd/MM/yyyy}" 
                                        HeaderText="Deadline" SortExpression="Deadline" />
                                    <asp:BoundField DataField="Status" HeaderText="Status" 
                                        SortExpression="Status" />
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td id="tdMeetings">
                            <asp:GridView ID="gvMeetings" runat="server" AllowPaging="True" SkinID="gridviewSkinList" 
                                AllowSorting="True" AutoGenerateColumns="False" DataSourceID="sqldsMeetings">
                                <Columns>
                                    <asp:BoundField DataField="A/A" HeaderText="A/A" ReadOnly="True" 
                                        SortExpression="A/A" />
                                    <asp:BoundField DataField="Date" DataFormatString="{0:dd/MM/yyyy}" 
                                        HeaderText="Ημ/νία" SortExpression="Date" />
                                    <asp:BoundField DataField="From" DataFormatString="{0:HH:mm}" HeaderText="Έναρξη" 
                                        SortExpression="From" />
                                    <asp:BoundField DataField="To" DataFormatString="{0:HH:mm}" HeaderText="Λήξη" 
                                        SortExpression="To" />
                                    <asp:BoundField DataField="Kind" HeaderText="Τύπος" SortExpression="Kind" />
                                    <asp:BoundField DataField="Subject" HeaderText="Θέμα" 
                                        SortExpression="Subject" />
                                    <asp:BoundField DataField="Consultant" HeaderText="Σύμβουλος" ReadOnly="True" 
                                        SortExpression="Consultant" />
                                    <asp:BoundField DataField="Comments" HeaderText="Σχόλια" 
                                        SortExpression="Comments" />
                                    <asp:TemplateField HeaderText="Αρχείο" SortExpression="File">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnDown" runat="server" OnClientClick="this.form.onsubmit=''" CommandArgument='<%# Bind("id") %>'
                                                CommandName="Download" ImageUrl="~/Images/Icons/Download_16x16.png" ToolTip='<%# Bind("File") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Status" HeaderText="Status" 
                                        SortExpression="Status" />
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td id="tdAttachments">
                            <asp:GridView ID="gvAttachments" runat="server" AllowPaging="True" SkinID="gridviewSkinList"  
                                AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id,ProjectId" 
                                DataSourceID="sqldsAttachments">
                                <Columns>
                                    <asp:BoundField DataField="A/A" HeaderText="A/A" ReadOnly="True" 
                                        SortExpression="A/A" />
                                    <asp:BoundField DataField="Datestamp" HeaderText="Ημ/νία" 
                                        SortExpression="Datestamp" />
                                    <asp:TemplateField HeaderText="Αρχείο" SortExpression="File">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDown" runat="server" Text='<%# Bind("File") %>'></asp:Label>
                                            <asp:ImageButton ID="btnDown" OnClientClick="this.form.onsubmit=''" runat="server" CommandArgument='<%# Bind("id") %>'
                                                    CommandName="Download" ImageUrl="~/Images/Icons/Download_16x16.png" ToolTip="Πιέστε εδώ για να κατεβάσετε το αρχείο"/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Comments" HeaderText="Σχόλια" 
                                        SortExpression="Comments" />
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
                
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:SqlDataSource ID="sqldsProjects" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="ProjectsList" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserId" SessionField="UserId" Type="Int16" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsAP" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="ActionPlanList" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserId" SessionField="UserId" Type="Int32" />
                        <asp:ControlParameter ControlID="gvProjects" Name="SubProject" 
                            PropertyName='SelectedDataKey.Values("SubProject")' Type="String" />
                        <asp:Parameter Name="APId" Type="Int32" DefaultValue="0" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsMeetings" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" SelectCommand="MeetingsList" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserId" SessionField="UserId" Type="Int32" />
                        <asp:ControlParameter ControlID="gvProjects" Name="SubProject" 
                            PropertyName='SelectedDataKey.Values("SubProject")' Type="String" />
                        <asp:Parameter DefaultValue="0" Name="MtngsId" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsAttachments" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" SelectCommand="FileList" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserId" SessionField="UserId" Type="Int32" />
                        <asp:ControlParameter ControlID="gvProjects" Name="SubProject" 
                            PropertyName='SelectedDataKey.Values("SubProject")' Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

