<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="Projects.aspx.vb" Inherits="Projects" Theme="MainSkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br />
    <br />
    <table id="subPageMainTable">
        <tr>
            <td class="title">Manage projects</td>
        </tr>
        <tr>
            <td>Select a subproject from the list:
                <asp:DropDownList ID="ddlPrjCode" runat="server" DataSourceID="sqldsPrjCodes" 
                    DataTextField="SubProject" DataValueField="id" AutoPostBack="True">
                </asp:DropDownList>&nbsp;or write its [id] and press &quot;Find&quot;
                <asp:TextBox ID="txtPrjId" runat="server" SkinID="txtTextCenter"></asp:TextBox>
                &nbsp;<asp:Button ID="btnFindPrj" runat="server" Text="Find" />
            </td>
        </tr>
        <tr>
            <td>
                <table style="width:100%">
                    <tr>
                        <td style="width:70%" rowspan="2">
                            <asp:DetailsView ID="dvProject" runat="server" AutoGenerateRows="False" 
                                DataKeyNames="id" DataSourceID="sqldsProjects" Width="100%">
                                <Fields>
                                    <asp:TemplateField HeaderStyle-CssClass="DetViewHeader" HeaderText="&nbsp;id&nbsp;" InsertVisible="False" SortExpression="id">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-CssClass="DetViewHeader" HeaderText="Code" SortExpression="Code">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Code") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Code") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Code") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-CssClass="DetViewHeader" HeaderText="SubProject" SortExpression="SubProject">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("SubProject") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("SubProject") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("SubProject") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-CssClass="DetViewHeader" HeaderText="DateStamp" SortExpression="DateStamp">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("DateStamp") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("DateStamp") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("DateStamp") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-CssClass="DetViewHeader" HeaderText="Creator" SortExpression="Creator">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Creator") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Creator") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Creator") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-CssClass="DetViewHeader" HeaderText="ModificationDate" 
                                        SortExpression="ModificationDate">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" 
                                                Text='<%# Bind("ModificationDate") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" 
                                                Text='<%# Bind("ModificationDate") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("ModificationDate") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-CssClass="DetViewHeader" HeaderText="CustomerId" SortExpression="CustomerId">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("CustomerId") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("CustomerId") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("CustomerId") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-CssClass="DetViewHeader" HeaderText="StartDate" SortExpression="StartDate">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("StartDate") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("StartDate") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("StartDate") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-CssClass="DetViewHeader" HeaderText="InitialEndDate" SortExpression="InitialEndDate">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("InitialEndDate") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("InitialEndDate") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("InitialEndDate") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-CssClass="DetViewHeader" HeaderText="Title" SortExpression="Title">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label10" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-CssClass="DetViewHeader" HeaderText="Description" SortExpression="Description">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label11" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-CssClass="DetViewHeader" HeaderText="Supervisor" SortExpression="Supervisor">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("Supervisor") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("Supervisor") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label12" runat="server" Text='<%# Bind("Supervisor") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-CssClass="DetViewHeader" HeaderText="InitialMeetingsNo" 
                                        SortExpression="InitialMeetingsNo">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox12" runat="server" 
                                                Text='<%# Bind("InitialMeetingsNo") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox12" runat="server" 
                                                Text='<%# Bind("InitialMeetingsNo") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label13" runat="server" Text='<%# Bind("InitialMeetingsNo") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-CssClass="DetViewHeader" HeaderText="CriticalIssues" SortExpression="CriticalIssues">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("CriticalIssues") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("CriticalIssues") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label14" runat="server" Text='<%# Bind("CriticalIssues") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-CssClass="DetViewHeader" HeaderText="DesiredOrganization" 
                                        SortExpression="DesiredOrganization">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox14" runat="server" 
                                                Text='<%# Bind("DesiredOrganization") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox14" runat="server" 
                                                Text='<%# Bind("DesiredOrganization") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label15" runat="server" 
                                                Text='<%# Bind("DesiredOrganization") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-CssClass="DetViewHeader" HeaderText="CertificationField" 
                                        SortExpression="CertificationField">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox15" runat="server" 
                                                Text='<%# Bind("CertificationField") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox15" runat="server" 
                                                Text='<%# Bind("CertificationField") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label16" runat="server" Text='<%# Bind("CertificationField") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-CssClass="DetViewHeader" HeaderText="CompletionPercentage" 
                                        SortExpression="CompletionPercentage">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox16" runat="server" 
                                                Text='<%# Bind("CompletionPercentage") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox16" runat="server" 
                                                Text='<%# Bind("CompletionPercentage") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label17" runat="server" 
                                                Text='<%# Bind("CompletionPercentage") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-CssClass="DetViewHeader" HeaderText="Status" 
                                        SortExpression="Status">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox17" runat="server" 
                                                Text='<%# Bind("Status") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox17" runat="server" 
                                                Text='<%# Bind("Status") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label18" runat="server" 
                                                Text='<%# Bind("Status") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" 
                                                CommandName="Update" ImageUrl="~/Images/Icons/Save24_24.png" Text="Update" />
                                            &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                                CommandName="Cancel" ImageUrl="~/Images/Icons/Cancel32_32.png" Text="Cancel" />
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" 
                                                CommandName="Insert" ImageUrl="~/Images/Icons/add24_24.png" Text="Insert" />
                                            &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                                CommandName="Cancel" ImageUrl="~/Images/Icons/Cancel32_32.png" Text="Cancel" />
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                                CommandName="Edit" ImageUrl="~/Images/Icons/Edit22_22.png" Text="Edit" />
                                            &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                                CommandName="New" ImageUrl="~/Images/Icons/add24_24.png" Text="New" />
                                            <!--&nbsp;<asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False" 
                                                CommandName="Delete" ImageUrl="~/Images/Icons/Remove22_22.png" Text="Delete" />-->
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Fields>
                                <HeaderStyle HorizontalAlign="Left" Width="100px" Wrap="False" />
                            </asp:DetailsView>
                        </td>
                        <td>qwe</td>
                    </tr>
                    <tr>
                        <td>qwe</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="left" style="border: inset 3px white; padding: 8px 8px 8px 8px">
                <table width="95%" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <asp:Menu ID="mnuProjects" runat="server" Orientation="Horizontal" ForeColor="Black" 
                                StaticEnableDefaultPopOutImage="False" BackColor="#2C486E" OnMenuItemClick="mnuProjects_MenuItemClick" 
                                StaticMenuItemStyle-CssClass="TabMenuItem">
                                <Items>
                                    <asp:MenuItem ImageUrl="~/Images/Icons/Action_32x32.png" Text="Action Plan" Value="0"></asp:MenuItem>
                                    <asp:MenuItem ImageUrl="~/Images/Icons/Meetings3_32x32.png" Text="Meetings" Value="1"></asp:MenuItem>
                                    <asp:MenuItem ImageUrl="~/Images/Icons/Files232x32.png" Text="Attachments" Value="2"></asp:MenuItem>
                                </Items>
                            </asp:Menu>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="gvAP" runat="server" AutoGenerateColumns="False" 
                                AllowPaging="True" AllowSorting="True" DataKeyNames="id" 
                                DataSourceID="sqldsAP" ShowFooter="True" SkinID="gridviewSkinSmall">
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemStyle Width="40px" />
                                    <ItemTemplate>                
                                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                            CommandName="Edit" ImageUrl="~/Images/Icons/Edit16_16.png" Text="Edit" />
                                        &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                            CommandName="Delete" ImageUrl="~/Images/Icons/Remove16_16.png" Text="Delete" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" 
                                            CommandName="Update" ImageUrl="~/Images/Icons/Save16_16.png" Text="Update" />
                                        &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                            CommandName="Cancel" ImageUrl="~/Images/Icons/Cancel16_16.png" Text="Cancel" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:ImageButton ID="btnInsert" CausesValidation="true" runat="server" CommandName="Insert"
                                            ImageUrl="~/images/icons/add16_16.png" ToolTip="Insert" />
                                    </FooterTemplate>
                                </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="&nbsp;id&nbsp;" InsertVisible="False" SortExpression="id">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ActionId" SortExpression="ActionId">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ActionId") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("ActionId") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Responsible" SortExpression="Responsible">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Responsible") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Responsible") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Comments" SortExpression="Comments">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Comments") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Comments") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Deadline" SortExpression="Deadline">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Deadline") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("Deadline") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status" SortExpression="Status">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="gvMeetings" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" 
                                DataSourceID="sqldsMeetings"  SkinID="gridviewSkinSmall" ShowFooter="True">
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemStyle Width="40px" />
                                        <ItemTemplate>                
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                                CommandName="Edit" ImageUrl="~/Images/Icons/Edit16_16.png" Text="Edit" />
                                            &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                                CommandName="Delete" ImageUrl="~/Images/Icons/Remove16_16.png" Text="Delete" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" 
                                                CommandName="Update" ImageUrl="~/Images/Icons/Save16_16.png" Text="Update" />
                                            &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                                CommandName="Cancel" ImageUrl="~/Images/Icons/Cancel16_16.png" Text="Cancel" />
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:ImageButton ID="btnInsert" CausesValidation="true" runat="server" CommandName="Insert"
                                                ImageUrl="~/images/icons/add16_16.png" ToolTip="Insert" />
                                        </FooterTemplate>
                                    </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="&nbsp;id&nbsp;" InsertVisible="False" SortExpression="id">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="SubProjectId" SortExpression="SubProjectId">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("SubProjectId") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("SubProjectId") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TimeFrom" SortExpression="TimeFrom">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("TimeFrom") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("TimeFrom") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TimeTo" SortExpression="TimeTo">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("TimeTo") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("TimeTo") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Kind" SortExpression="Kind">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Kind") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Kind") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Subject" SortExpression="Subject">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Subject") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("Subject") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Consultant" SortExpression="Consultant">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Consultant") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("Consultant") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Comments" SortExpression="Comments">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Comments") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label10" runat="server" Text='<%# Bind("Comments") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="NewBusiness" SortExpression="NewBusiness">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("NewBusiness") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label11" runat="server" Text='<%# Bind("NewBusiness") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status" SortExpression="Status">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label12" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="gvFiles" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" 
                                DataSourceID="sqldsAttachments" SkinID="gridviewSkinSmall" 
                                ShowFooter="True">
                                <EmptyDataTemplate>
                                    Currently there are no files uploaded.<br /><br />
                                    <table>
                                        <tr class="InsertHeader">
                                            <td colspan="2">File</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:ImageButton ID="btnInsert" CausesValidation="true" runat="server" CommandName="Insert"
                                                ImageUrl="~/images/icons/add16_16.png" ToolTip="Insert" />
                                            </td>
                                            <td><asp:FileUpload ID="fuCtrl" runat="server" /></td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemStyle Width="40px" />
                                        <ItemTemplate>                
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                                CommandName="Edit" ImageUrl="~/Images/Icons/Edit16_16.png" Text="Edit" />
                                            &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                                CommandName="Delete" ImageUrl="~/Images/Icons/Remove16_16.png" Text="Delete" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" 
                                                CommandName="Update" ImageUrl="~/Images/Icons/Save16_16.png" Text="Update" />
                                            &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                                CommandName="Cancel" ImageUrl="~/Images/Icons/Cancel16_16.png" Text="Cancel" />
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:ImageButton ID="btnInsert" CausesValidation="true" runat="server" CommandName="Insert"
                                                ImageUrl="~/images/icons/add16_16.png" ToolTip="Insert" />
                                        </FooterTemplate>
                                    </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="&nbsp;id&nbsp;" InsertVisible="False" SortExpression="id">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Datestamp" SortExpression="Datestamp">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Datestamp") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Datestamp") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="FileName" SortExpression="FileName">
                                        <ItemTemplate>
                                            <asp:Button ID="btnDown" runat="server" CausesValidation="True" CommandArgument='<%# Bind("id") %>'
                                                CommandName="Download" Text='<%# Bind("FileName") %>'/>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:FileUpload ID="fuCtrl" runat="server" />                                            
                                        </FooterTemplate>
                                    </asp:TemplateField>
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
                <asp:SqlDataSource ID="sqldsPrjCodes" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="SELECT id, SubProject FROM Projects ORDER BY SubProject">
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsProjects" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    DeleteCommand="DELETE FROM [Projects] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [Projects] ([Code], [SubProject], [DateStamp], [Creator], [ModificationDate], [CustomerId], [StartDate], [InitialEndDate], [Title], [Description], [Supervisor], [InitialMeetingsNo], [CriticalIssues], [DesiredOrganization], [CertificationField], [CompletionPercentage], [Status]) VALUES (@Code, @SubProject, @DateStamp, @Creator, @ModificationDate, @CustomerId, @StartDate, @InitialEndDate, @Title, @Description, @Supervisor, @InitialMeetingsNo, @CriticalIssues, @DesiredOrganization, @CertificationField, @CompletionPercentage, @Status)" 
                    SelectCommand="SELECT * FROM [Projects] WHERE ([id] = @id)" 
                    
                    UpdateCommand="UPDATE [Projects] SET [Code] = @Code, [SubProject] = @SubProject, [DateStamp] = @DateStamp, [Creator] = @Creator, [ModificationDate] = @ModificationDate, [CustomerId] = @CustomerId, [StartDate] = @StartDate, [InitialEndDate] = @InitialEndDate, [Title] = @Title, [Description] = @Description, [Supervisor] = @Supervisor, [InitialMeetingsNo] = @InitialMeetingsNo, [CriticalIssues] = @CriticalIssues, [DesiredOrganization] = @DesiredOrganization, [CertificationField] = @CertificationField, [CompletionPercentage] = @CompletionPercentage, [Status] = @Status WHERE [id] = @id">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlPrjCode" Name="id" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Code" Type="String" />
                        <asp:Parameter Name="SubProject" Type="String" />
                        <asp:Parameter Name="DateStamp" Type="DateTime" />
                        <asp:Parameter Name="Creator" Type="Int32" />
                        <asp:Parameter Name="ModificationDate" Type="DateTime" />
                        <asp:Parameter Name="CustomerId" Type="Int32" />
                        <asp:Parameter Name="StartDate" Type="DateTime" />
                        <asp:Parameter Name="InitialEndDate" Type="DateTime" />
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Supervisor" Type="Int32" />
                        <asp:Parameter Name="InitialMeetingsNo" Type="Byte" />
                        <asp:Parameter Name="CriticalIssues" Type="String" />
                        <asp:Parameter Name="DesiredOrganization" Type="String" />
                        <asp:Parameter Name="CertificationField" Type="String" />
                        <asp:Parameter Name="CompletionPercentage" Type="Byte" />
                        <asp:Parameter Name="Status" Type="Byte" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Code" Type="String" />
                        <asp:Parameter Name="SubProject" Type="String" />
                        <asp:Parameter Name="DateStamp" Type="DateTime" />
                        <asp:Parameter Name="Creator" Type="Int32" />
                        <asp:Parameter Name="ModificationDate" Type="DateTime" />
                        <asp:Parameter Name="CustomerId" Type="Int32" />
                        <asp:Parameter Name="StartDate" Type="DateTime" />
                        <asp:Parameter Name="InitialEndDate" Type="DateTime" />
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Supervisor" Type="Int32" />
                        <asp:Parameter Name="InitialMeetingsNo" Type="Byte" />
                        <asp:Parameter Name="CriticalIssues" Type="String" />
                        <asp:Parameter Name="DesiredOrganization" Type="String" />
                        <asp:Parameter Name="CertificationField" Type="String" />
                        <asp:Parameter Name="CompletionPercentage" Type="Byte" />
                        <asp:Parameter Name="Status" Type="Byte" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsAP" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    
                    SelectCommand="SELECT * FROM [ActionPlans] WHERE ([ProjectId] = @ProjectId)" 
                    DeleteCommand="DELETE FROM [ActionPlans] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [ActionPlans] ([ProjectId], [SubProjectId], [ActionId], [Responsible], [Comments], [Attachment], [Deadline], [Status]) VALUES (@ProjectId, @SubProjectId, @ActionId, @Responsible, @Comments, @Attachment, @Deadline, @Status)" 
                    UpdateCommand="UPDATE [ActionPlans] SET [SubProjectId] = @SubProjectId, [ActionId] = @ActionId, [Responsible] = @Responsible, [Comments] = @Comments, [Attachment] = @Attachment, [Deadline] = @Deadline, [Status] = @Status WHERE [id] = @id">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlPrjCode" Name="ProjectId" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ProjectId" Type="Int32" />
                        <asp:Parameter Name="SubProjectId" Type="String" />
                        <asp:Parameter Name="ActionId" Type="Byte" />
                        <asp:Parameter Name="Responsible" Type="Int32" />
                        <asp:Parameter Name="Comments" Type="String" />
                        <asp:Parameter Name="Attachment" Type="Object" />
                        <asp:Parameter Name="Deadline" Type="DateTime" />
                        <asp:Parameter Name="Status" Type="Byte" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ProjectId" Type="Int32" />
                        <asp:Parameter Name="SubProjectId" Type="String" />
                        <asp:Parameter Name="ActionId" Type="Byte" />
                        <asp:Parameter Name="Responsible" Type="Int32" />
                        <asp:Parameter Name="Comments" Type="String" />
                        <asp:Parameter Name="Attachment" Type="Object" />
                        <asp:Parameter Name="Deadline" Type="DateTime" />
                        <asp:Parameter Name="Status" Type="Byte" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsMeetings" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="SELECT * FROM [Meetings] WHERE ([ProjectId] = @ProjectId)" 
                    DeleteCommand="DELETE FROM [Meetings] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [Meetings] ([ProjectId], [SubProjectId], [TimeFrom], [TimeTo], [Kind], [Subject], [Consultant], [Comments], [NewBusiness], [Attachment], [Status]) VALUES (@ProjectId, @SubProjectId, @TimeFrom, @TimeTo, @Kind, @Subject, @Consultant, @Comments, @NewBusiness, @Attachment, @Status)" 
                    UpdateCommand="UPDATE [Meetings] SET [SubProjectId] = @SubProjectId, [TimeFrom] = @TimeFrom, [TimeTo] = @TimeTo, [Kind] = @Kind, [Subject] = @Subject, [Consultant] = @Consultant, [Comments] = @Comments, [NewBusiness] = @NewBusiness, [Attachment] = @Attachment, [Status] = @Status WHERE [id] = @id">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlPrjCode" Name="ProjectId" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="SubProjectId" Type="String" />
                        <asp:Parameter Name="TimeFrom" Type="DateTime" />
                        <asp:Parameter Name="TimeTo" Type="DateTime" />
                        <asp:Parameter Name="Kind" Type="Byte" />
                        <asp:Parameter Name="Subject" Type="String" />
                        <asp:Parameter Name="Consultant" Type="Int32" />
                        <asp:Parameter Name="Comments" Type="String" />
                        <asp:Parameter Name="NewBusiness" Type="String" />
                        <asp:Parameter Name="Attachment" Type="Object" />
                        <asp:Parameter Name="Status" Type="Byte" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ProjectId" Type="Int32" />
                        <asp:Parameter Name="SubProjectId" Type="String" />
                        <asp:Parameter Name="TimeFrom" Type="DateTime" />
                        <asp:Parameter Name="TimeTo" Type="DateTime" />
                        <asp:Parameter Name="Kind" Type="Byte" />
                        <asp:Parameter Name="Subject" Type="String" />
                        <asp:Parameter Name="Consultant" Type="Int32" />
                        <asp:Parameter Name="Comments" Type="String" />
                        <asp:Parameter Name="NewBusiness" Type="String" />
                        <asp:Parameter Name="Attachment" Type="Object" />
                        <asp:Parameter Name="Status" Type="Byte" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="sqldsAttachments" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    
                    SelectCommand="SELECT * FROM [ProjectFiles] WHERE ([ProjectId] = @ProjectId)" 
                    DeleteCommand="DELETE FROM [ProjectFiles] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [ProjectFiles] ([ProjectId], [FileName], [FileData]) VALUES (@ProjectId, @FileName, @FileData)" 
                    UpdateCommand="UPDATE [ProjectFiles] SET [FileName] = @FileName, [FileData] = @FileData WHERE [id] = @id">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlPrjCode" Name="ProjectId" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="FileName" Type="String" />
                        <asp:Parameter Name="FileData" Type="Object" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ProjectId" Type="Int32" />
                        <asp:Parameter Name="FileName" Type="String" />
                        <asp:Parameter Name="FileData" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsConsultants" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    DeleteCommand="DELETE FROM [ProjectConsultants] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [ProjectConsultants] ([ConsultantId], [Comments]) VALUES (@ConsultantId, @Comments)" 
                    SelectCommand="SELECT [id], [ConsultantId], [Comments] FROM [ProjectConsultants] WHERE ([ProjectId] = @ProjectId)" 
                    UpdateCommand="UPDATE [ProjectConsultants] SET [ConsultantId] = @ConsultantId, [Comments] = @Comments WHERE [id] = @id">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlPrjCode" Name="ProjectId" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ConsultantId" Type="Int32" />
                        <asp:Parameter Name="Comments" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ConsultantId" Type="Int32" />
                        <asp:Parameter Name="Comments" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsStatuses" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    DeleteCommand="DELETE FROM [ProjectStatuses] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [ProjectStatuses] ([Status], [Comments]) VALUES (@Status, @Comments)" 
                    SelectCommand="SELECT [id], [Status], [Comments] FROM [ProjectStatuses] WHERE ([ProjectId] = @ProjectId)" 
                    UpdateCommand="UPDATE [ProjectStatuses] SET [Status] = @Status, [Comments] = @Comments WHERE [id] = @id">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlPrjCode" Name="ProjectId" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Status" Type="Int32" />
                        <asp:Parameter Name="Comments" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Status" Type="Int32" />
                        <asp:Parameter Name="Comments" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
            <td></td>
        </tr>
    </table>
</asp:Content>

