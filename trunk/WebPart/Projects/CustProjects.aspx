<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="CustProjects.aspx.vb" Inherits="CustProjects" Theme="MainSkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br />
    <table id="subPageMainTable" cellpadding="0" cellspacing="0">
        <tr>
            <td class="title">Project list</td>
        </tr>
        <tr>
            <td class="centered"><br />Click <img alt="Green check" src="Images/Icons/Approve_16x16.png" /> in order to select a project and view its details.</td>
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
                                    CommandName="Select" ImageUrl="~/Images/Icons/Approve_16x16.png" ToolTip="Select" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Code" HeaderText="Code" SortExpression="Code" />
                        <asp:BoundField DataField="SubProject" HeaderText="SubProject" 
                            SortExpression="SubProject" />
                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                        <asp:BoundField DataField="Supervisor" HeaderText="Supervisor" ReadOnly="True" 
                            SortExpression="Supervisor" />
                        <asp:BoundField DataField="Consultant" HeaderText="Consultant" ReadOnly="True" 
                            SortExpression="Consultant" />
                        <asp:BoundField DataField="InitialEndDate" DataFormatString="{0:dd/MM/yyyy}" 
                            HeaderText="InitialEndDate" SortExpression="InitialEndDate" />
                        <asp:BoundField DataField="CompletionPercentage" HeaderText="%" 
                            SortExpression="CompletionPercentage" />
                        <asp:BoundField DataField="Status" HeaderText="Status" 
                            SortExpression="Status" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
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
            <td align="left" style="padding: 6px 6px 6px 6px; background-color:#7A2021">
                <table cellpadding="0" cellspacing="0" style="width:100%">
                    <tr>
                        <td id="tdAP">
                            <asp:GridView ID="gvAP" runat="server" AllowPaging="True" SkinID="gridviewSkinSmall"
                                AllowSorting="True" AutoGenerateColumns="False" DataSourceID="sqldsAP">
                                <Columns>
                                    <asp:BoundField DataField="A/A" HeaderText="A/A" ReadOnly="True" 
                                        SortExpression="A/A" />
                                    <asp:BoundField DataField="Responsible1" HeaderText="Responsible1" 
                                        ReadOnly="True" SortExpression="Responsible1" />
                                    <asp:BoundField DataField="Responsible2" HeaderText="Responsible2" 
                                        ReadOnly="True" SortExpression="Responsible2" />
                                    <asp:BoundField DataField="Description" HeaderText="Description" 
                                        SortExpression="Description" />
                                    <asp:TemplateField HeaderText="File" SortExpression="AttachmentName">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnDown" runat="server" CommandArgument='<%# Bind("id") %>'
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
                                        HeaderText="Date" SortExpression="Date" />
                                    <asp:BoundField DataField="From" DataFormatString="{0:HH:mm}" HeaderText="From" 
                                        SortExpression="From" />
                                    <asp:BoundField DataField="To" DataFormatString="{0:HH:mm}" HeaderText="To" 
                                        SortExpression="To" />
                                    <asp:BoundField DataField="Kind" HeaderText="Kind" SortExpression="Kind" />
                                    <asp:BoundField DataField="Subject" HeaderText="Subject" 
                                        SortExpression="Subject" />
                                    <asp:BoundField DataField="Consultant" HeaderText="Consultant" ReadOnly="True" 
                                        SortExpression="Consultant" />
                                    <asp:BoundField DataField="Comments" HeaderText="Comments" 
                                        SortExpression="Comments" />
                                    <asp:TemplateField HeaderText="File" SortExpression="File">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnDown" runat="server" CommandArgument='<%# Bind("id") %>'
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
                                    <asp:BoundField DataField="Datestamp" HeaderText="Datestamp" 
                                        SortExpression="Datestamp" />
                                    <asp:TemplateField HeaderText="File" SortExpression="File">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnDown" runat="server" CausesValidation="True" CommandArgument='<%# Bind("id") %>'
                                                CommandName="Download" Text='<%# Bind("File") %>'></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Comments" HeaderText="Comments" 
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

