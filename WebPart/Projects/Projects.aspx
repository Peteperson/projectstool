<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="Projects.aspx.vb" Inherits="Projects" Theme="MainSkin" %>
<%@ Register src="DateBox.ascx" tagname="DateBox" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br />
    <table id="subPageMainTable" cellpadding="0" cellspacing="0">
        <tr>
            <td class="title">Manage projects</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="centered" style="padding-bottom:5px"><asp:Panel runat="server" ID="pnl1" DefaultButton="btnFindPrj">Select a subproject from the list:
                <asp:DropDownList ID="ddlPrjCode" runat="server" DataSourceID="sqldsPrjCodes" 
                    DataTextField="SubProject" DataValueField="id" AutoPostBack="True">
                </asp:DropDownList>&nbsp;or write its subproject id and press &quot;Find&quot;
                <asp:TextBox ID="txtPrjId" runat="server" SkinID="txtTextCenter"></asp:TextBox>
                &nbsp;<asp:Button ID="btnFindPrj" runat="server" Text="Find" /></asp:Panel> 
            </td>
        </tr>
        <tr>
            <td>
                <table style="width:100%">
                    <tr>
                        <td style="border: inset 5px white;"> <!--  style="width:70%; background-color: #788CA5; padding: 6px;"-->
                            <asp:DetailsView ID="dvProject" runat="server" AutoGenerateRows="False"
                                DataKeyNames="id" DataSourceID="sqldsProjects" Width="100%" BorderStyle="None">
                                <Fields>
                                    <asp:TemplateField ShowHeader="false">
                                        <ItemTemplate>
                                            <table id="tblDetails">
                                                <tr>
                                                    <td class="tblDetailsHeader">Title</td>
                                                    <td class="tblDetailsItem" colspan="5"><asp:Label ID="Label10" runat="server" Text='<%# Bind("Title") %>'></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Project</td>
                                                    <td class="tblDetailsItem"><asp:Label ID="Label2" runat="server" Text='<%# Bind("Code") %>'></asp:Label></td>
                                                    <td class="tblDetailsHeader">SubProject</td>
                                                    <td class="tblDetailsItem"><asp:Label ID="Label3" runat="server" Text='<%# Bind("SubProject") %>'></asp:Label></td>
                                                    <td class="tblDetailsHeader">Datestamp</td>
                                                    <td class="tblDetailsItem"><asp:Label ID="Label4" runat="server" Text='<%# Bind("DateStamp", "{0:dd/MM/yyyy}") %>'></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Creator</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlCreators" runat="server" DataSourceID="sqldsCreators" 
                                                           Enabled="false" selectedvalue=<%# Bind("Creator") %>  DataTextField="FullName" DataValueField="id">
                                                        </asp:DropDownList></td>
                                                    <td class="tblDetailsHeader">Customer</td>
                                                    <td class="tblDetailsItem">
                                                        <table>
                                                            <tr>
                                                                <td><asp:DropDownList ID="ddlCompanies" runat="server" 
                                                                    Enabled="false" selectedvalue=<%# Bind("CustomerId") %>  DataSourceID="sqldsCompanies" DataTextField="Name" DataValueField="Id"></asp:DropDownList></td>
                                                                <td><asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False" CommandArgument='<%# Bind("CustomerId") %>'
                                                                            CommandName="SelCompany" ImageUrl="~/Images/Icons/Preview2_24x24.png" ToolTip="View details" /></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td class="tblDetailsHeader">Supervisor</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlSupervisors" runat="server" DataSourceID="sqldsCreators" 
                                                           Enabled="false" selectedvalue=<%# Bind("Supervisor") %>  DataTextField="FullName" DataValueField="id">
                                                        </asp:DropDownList></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Consultant1</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlConsultant1" runat="server" DataSourceID="sqldsConsultants" 
                                                           Enabled="false" selectedvalue=<%# Bind("Consultant1") %>  DataTextField="FullName" DataValueField="id">
                                                        </asp:DropDownList></td>
                                                    <td class="tblDetailsHeader">Consultant2</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlConsultant2" runat="server" DataSourceID="sqldsConsultantsNN" 
                                                           Enabled="false" selectedvalue=<%# Bind("Consultant2") %>  DataTextField="FullName" DataValueField="id">
                                                        </asp:DropDownList></td>
                                                    <td class="tblDetailsHeader">Certification Fields</td>
                                                    <td class="tblDetailsItem"><asp:Label ID="Label16" runat="server" Text='<%# Bind("CertificationField") %>'></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Description</td>
                                                    <td colspan="5" class="tblDetailsItem"><asp:Label ID="Label11" runat="server" Text='<%# Bind("Description") %>'></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Start date</td>
                                                    <td class="tblDetailsItem"><asp:Label ID="Label8" runat="server" Text='<%# Bind("StartDate", "{0:dd/MM/yyyy}") %>'></asp:Label></td>
                                                    <td class="tblDetailsHeader">Initial end date</td>
                                                    <td class="tblDetailsItem"><asp:Label ID="Label9" runat="server" Text='<%# Bind("InitialEndDate", "{0:dd/MM/yyyy}") %>'></asp:Label></td>
                                                    <td class="tblDetailsHeader">Initial meetings no</td>
                                                    <td class="tblDetailsItem"><asp:Label ID="Label13" runat="server" Text='<%# Bind("InitialMeetingsNo") %>'></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Critical issues</td>
                                                    <td colspan="3" class="tblDetailsItem"><asp:Label ID="Label14" runat="server" Text='<%# Bind("CriticalIssues") %>'></asp:Label></td>
                                                    <td class="tblDetailsHeader">Desired Organization</td>
                                                    <td class="tblDetailsItem"><asp:Label ID="Label15" runat="server" Text='<%# Bind("DesiredOrganization") %>'></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Status</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlProjectStatus" runat="server" DataSourceID="sqldsProjectStatus" 
                                                            Enabled="false" selectedvalue=<%# Bind("Status") %>  DataTextField="Description" DataValueField="id">                                                
                                                        </asp:DropDownList></td>
                                                    <td class="tblDetailsHeader">Completion (%)</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlPercent" runat="server" Enabled="false" selectedvalue=<%# Bind("CompletionPercentage") %>  >
                                                            <asp:ListItem>0</asp:ListItem>
                                                            <asp:ListItem>10</asp:ListItem>
                                                            <asp:ListItem>20</asp:ListItem>
                                                            <asp:ListItem>30</asp:ListItem>
                                                            <asp:ListItem>40</asp:ListItem>
                                                            <asp:ListItem>50</asp:ListItem>
                                                            <asp:ListItem>60</asp:ListItem>
                                                            <asp:ListItem>70</asp:ListItem>
                                                            <asp:ListItem>80</asp:ListItem>
                                                            <asp:ListItem>90</asp:ListItem>
                                                            <asp:ListItem>100</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td class="tblDetailsHeader">Modification Date</td>
                                                    <td class="tblDetailsItem"><asp:Label ID="Label6" runat="server" Text='<%# Bind("ModificationDate", "{0:dd/MM/yyyy HH:mm}") %>'></asp:Label></td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <EditItemTemplate>
						                    <table id="tblDetails">
                                                <tr>
                                                    <td class="tblDetailsHeader">Title <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox9" ValidationGroup="UpdPrj" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                                    <td class="tblDetailsItem" colspan="5"><asp:TextBox ID="TextBox9" MaxLength="50" SkinID="txtText" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Project <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox1" ValidationGroup="UpdPrj" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                                    <td class="tblDetailsItem"><asp:TextBox ID="TextBox1" MaxLength="10" runat="server" Text='<%# Bind("Code") %>'></asp:TextBox></td>
                                                    <td class="tblDetailsHeader">SubProject <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox2" ValidationGroup="UpdPrj" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                                    <td class="tblDetailsItem"><asp:TextBox ID="TextBox2" MaxLength="10" runat="server" Text='<%# Bind("SubProject") %>'></asp:TextBox></td>
                                                    <td class="tblDetailsHeader">Datestamp</td>
                                                    <td class="tblDetailsItem"><asp:Label ID="Label4" runat="server" Text='<%# Bind("DateStamp", "{0:dd/MM/yyyy}") %>'></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Creator</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlCreators" runat="server" DataSourceID="sqldsCreators" 
                                                           selectedvalue=<%# Bind("Creator") %>  DataTextField="FullName" DataValueField="id">
                                                        </asp:DropDownList></td>
                                                    <td class="tblDetailsHeader">Customer</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlCompanies" runat="server" 
                                                           selectedvalue=<%# Bind("CustomerId") %>  DataSourceID="sqldsCompanies" DataTextField="Name" DataValueField="Id">
                                                        </asp:DropDownList></td>
                                                    <td class="tblDetailsHeader">Supervisor</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlSupervisors" runat="server" DataSourceID="sqldsCreators" 
                                                           selectedvalue=<%# Bind("Supervisor") %>  DataTextField="FullName" DataValueField="id">
                                                        </asp:DropDownList></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Consultant1</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlConsultant1" runat="server" DataSourceID="sqldsConsultants" 
                                                           selectedvalue=<%# Bind("Consultant1") %>  DataTextField="FullName" DataValueField="id">
                                                        </asp:DropDownList></td>
                                                    <td class="tblDetailsHeader">Consultant2</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlConsultant2" runat="server" DataSourceID="sqldsConsultantsNN" 
                                                           selectedvalue=<%# Bind("Consultant2") %>  DataTextField="FullName" DataValueField="id">
                                                        </asp:DropDownList></td>
                                                    <td class="tblDetailsHeader">Certification Fields</td>
                                                    <td class="tblDetailsItem"><asp:TextBox ID="TextBox15" MaxLength="500" runat="server" SkinID="txtText" Text='<%# Bind("CertificationField") %>'></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Description <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox10" ValidationGroup="UpdPrj" ErrorMessage="*"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegExpVal1" runat="server" ControlToValidate="TextBox10" ValidationExpression="^[\s\S]{0,500}$" ValidationGroup="UpdPrj" ErrorMessage="*"></asp:RegularExpressionValidator></td>
                                                    <td colspan="5" class="tblDetailsItem"><asp:TextBox ID="TextBox10" TextMode="MultiLine" SkinID="txtTextLong" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Start date</td>
                                                    <td class="tblDetailsItem"><uc1:DateBox ID="dbStartDate" runat="server" Value='<%# Bind("StartDate") %>' /></td>
                                                    <td class="tblDetailsHeader">Initial end date</td>
                                                    <td class="tblDetailsItem"><uc1:DateBox ID="dbEndDate" runat="server" Value='<%# Bind("InitialEndDate") %>' /></td>
                                                    <td class="tblDetailsHeader">Initial meetings no</td>
                                                    <td class="tblDetailsItem"><asp:TextBox ID="TextBox12" MaxLength="3" runat="server" Text='<%# Bind("InitialMeetingsNo") %>'></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Critical issues</td>
                                                    <td colspan="3" class="tblDetailsItem"><asp:TextBox ID="TextBox13" SkinID="txtText" MaxLength="500" runat="server" Text='<%# Bind("CriticalIssues") %>'></asp:TextBox></td>
                                                    <td class="tblDetailsHeader">Desired Organization</td>
                                                    <td class="tblDetailsItem"><asp:TextBox ID="TextBox14" MaxLength="50" runat="server" SkinID="txtText" Text='<%# Bind("DesiredOrganization") %>'></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Status</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlProjectStatus" runat="server" DataSourceID="sqldsProjectStatus" 
                                                            selectedvalue=<%# Bind("Status") %>  DataTextField="Description" DataValueField="id">                                                
                                                        </asp:DropDownList></td>
                                                    <td class="tblDetailsHeader">Completion (%)</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlPercent" runat="server" selectedvalue=<%# Bind("CompletionPercentage") %>  >
                                                            <asp:ListItem>0</asp:ListItem>
                                                            <asp:ListItem>10</asp:ListItem>
                                                            <asp:ListItem>20</asp:ListItem>
                                                            <asp:ListItem>30</asp:ListItem>
                                                            <asp:ListItem>40</asp:ListItem>
                                                            <asp:ListItem>50</asp:ListItem>
                                                            <asp:ListItem>60</asp:ListItem>
                                                            <asp:ListItem>70</asp:ListItem>
                                                            <asp:ListItem>80</asp:ListItem>
                                                            <asp:ListItem>90</asp:ListItem>
                                                            <asp:ListItem>100</asp:ListItem>
                                                        </asp:DropDownList></td>
                                                    <td class="tblDetailsHeader">Modification Date</td>
                                                    <td class="tblDetailsItem"></td>
                                                </tr>
                                            </table>                                        
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
						                    <table id="tblDetails">
                                                <tr>
                                                    <td class="tblDetailsHeader">Title <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox9" ValidationGroup="InsGroup" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                                    <td class="tblDetailsItem" colspan="5"><asp:TextBox ID="TextBox9" MaxLength="50" SkinID="txtText" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Project <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ValidationGroup="InsGroup" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                                    <td class="tblDetailsItem"><asp:TextBox ID="TextBox1" MaxLength="10" runat="server" Text='<%# Bind("Code") %>'></asp:TextBox></td>
                                                    <td class="tblDetailsHeader">SubProject <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox2" ValidationGroup="InsGroup" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                                    <td class="tblDetailsItem"><asp:TextBox ID="TextBox2" MaxLength="10" runat="server" Text='<%# Bind("SubProject") %>'></asp:TextBox></td>
                                                    <td class="tblDetailsHeader">Datestamp</td>
                                                    <td class="tblDetailsItem"></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Creator</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlCreators" runat="server" DataSourceID="sqldsCreators" 
                                                           DataTextField="FullName" DataValueField="id">
                                                        </asp:DropDownList></td>
                                                    <td class="tblDetailsHeader">Customer</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlCompanies" runat="server" 
                                                           DataSourceID="sqldsCompanies" DataTextField="Name" DataValueField="Id">
                                                        </asp:DropDownList></td>
                                                    <td class="tblDetailsHeader">Supervisor</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlSupervisors" runat="server" DataSourceID="sqldsCreators" 
                                                           DataTextField="FullName" DataValueField="id">
                                                        </asp:DropDownList></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Consultant1</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlInsConsultant1" runat="server" DataSourceID="sqldsConsultants" 
                                                           DataTextField="FullName" DataValueField="id">
                                                        </asp:DropDownList></td>
                                                    <td class="tblDetailsHeader">Consultant2</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlInsConsultant2" runat="server" DataSourceID="sqldsConsultantsNN" 
                                                           DataTextField="FullName" DataValueField="id">
                                                        </asp:DropDownList></td>
                                                    <td class="tblDetailsHeader">Certification Fields</td>
                                                    <td class="tblDetailsItem"><asp:TextBox ID="TextBox15" MaxLength="500" runat="server" SkinID="txtText" Text='<%# Bind("CertificationField") %>'></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Description <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox10" ValidationGroup="InsGroup" ErrorMessage="*"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegExpVal1" runat="server" ControlToValidate="TextBox10" ValidationExpression="^[\s\S]{0,500}$" ValidationGroup="InsGroup" ErrorMessage="*"></asp:RegularExpressionValidator></td>
                                                    <td colspan="5" class="tblDetailsItem"><asp:TextBox ID="TextBox10" TextMode="MultiLine" SkinID="txtTextLong" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Start date</td>
                                                    <td class="tblDetailsItem"><uc1:DateBox ID="dbStartDate" runat="server" Text='<%# Today.ToString("dd/MM/yyyy") %>' /></td>
                                                    <td class="tblDetailsHeader">Initial end date</td>
                                                    <td class="tblDetailsItem"><uc1:DateBox ID="dbEndDate" runat="server" Text='<%# Today.AddMonths(6).ToString("dd/MM/yyyy") %>' /></td>
                                                    <td class="tblDetailsHeader">Initial meetings no</td>
                                                    <td class="tblDetailsItem"><asp:TextBox ID="TextBox12" MaxLength="3" runat="server" Text='<%# Bind("InitialMeetingsNo") %>'></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Critical issues</td>
                                                    <td colspan="3" class="tblDetailsItem"><asp:TextBox ID="TextBox13" MaxLength="500" SkinID="txtText" runat="server" Text='<%# Bind("CriticalIssues") %>'></asp:TextBox></td>
                                                    <td class="tblDetailsHeader">Desired Organization</td>
                                                    <td class="tblDetailsItem"><asp:TextBox ID="TextBox14" MaxLength="50" runat="server" SkinID="txtText" Text='<%# Bind("DesiredOrganization") %>'></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Status</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlProjectStatus" runat="server" DataSourceID="sqldsProjectStatus" 
                                                            DataTextField="Description" DataValueField="id">                                                
                                                        </asp:DropDownList></td>
                                                    <td class="tblDetailsHeader">Completion (%)</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlPercent" runat="server" selectedvalue=<%# Bind("CompletionPercentage") %>  >
                                                            <asp:ListItem>0</asp:ListItem>
                                                            <asp:ListItem>10</asp:ListItem>
                                                            <asp:ListItem>20</asp:ListItem>
                                                            <asp:ListItem>30</asp:ListItem>
                                                            <asp:ListItem>40</asp:ListItem>
                                                            <asp:ListItem>50</asp:ListItem>
                                                            <asp:ListItem>60</asp:ListItem>
                                                            <asp:ListItem>70</asp:ListItem>
                                                            <asp:ListItem>80</asp:ListItem>
                                                            <asp:ListItem>90</asp:ListItem>
                                                            <asp:ListItem>100</asp:ListItem>
                                                        </asp:DropDownList></td>
                                                    <td class="tblDetailsHeader">Modification Date</td>
                                                    <td class="tblDetailsItem"></td>
                                                </tr>
                                            </table>                                        
                                        </InsertItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" ValidationGroup="UpdPrj"
                                                CommandName="Update" ImageUrl="~/Images/Icons/Save24_24.png" ToolTip="Update" />
                                            &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                                CommandName="Cancel" ImageUrl="~/Images/Icons/Cancel32_32.png" ToolTip="Cancel" />
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" 
                                                CommandName="Insert" ImageUrl="~/Images/Icons/add_24x24.png" ToolTip="Insert" ValidationGroup="InsGroup" />
                                            &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                                CommandName="Cancel" ImageUrl="~/Images/Icons/Cancel32_32.png" ToolTip="Cancel" />
                                        </InsertItemTemplate>
                                        <ItemStyle CssClass="centered"/>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="false" 
                                                CommandName="Edit" ImageUrl="~/Images/Icons/Edit22_22.png" ToolTip="Edit" />
                                            &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                                CommandName="New" ImageUrl="~/Images/Icons/add_24x24.png" Tooltip="New" />
                                            &nbsp;<asp:ImageButton ID="btnDeletePrj" runat="server" CausesValidation="False" 
                                                CommandName="Delete" ImageUrl="~/Images/Icons/Delete_24x24.png" ToolTip="Delete" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;<asp:ImageButton ID="btnSysDesign" runat="server" CausesValidation="False" 
                                                CommandName="SysDesign" ImageUrl="~/Images/LeftMenu/System_24x24.png" ToolTip="Go to system design page" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Fields>
                            </asp:DetailsView>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td id="tdSubMenu">
                <asp:Menu ID="mnuProjects" runat="server" Orientation="Horizontal" ForeColor="Black" 
                    StaticEnableDefaultPopOutImage="False" OnMenuItemClick="mnuProjects_MenuItemClick" 
                    StaticMenuItemStyle-CssClass="TabMenuItem">
                    <Items>
                        <asp:MenuItem ImageUrl="~/Images/ActionPlanSelected5.png" Text="" Value="0"></asp:MenuItem>
                        <asp:MenuItem ImageUrl="~/Images/MeetingsUnselected5.png" Text="" Value="1"></asp:MenuItem>
                        <asp:MenuItem ImageUrl="~/Images/AttachmentsUnselected5.png" Text="" Value="2"></asp:MenuItem>
                        <asp:MenuItem ImageUrl="~/Images/ProgressUnselected.png" Text="" Value="3"></asp:MenuItem>
                    </Items>
                </asp:Menu>
            </td>
        </tr>
        <tr>
            <td align="left" style="padding: 6px 6px 6px 6px; background-color:#842829">
                <table cellpadding="0" cellspacing="0" style="width:100%">
                    <tr>
                        <td id="tdAP" align="center">
                            <asp:GridView ID="gvAP" runat="server" AutoGenerateColumns="False" 
                                AllowPaging="True" AllowSorting="True" DataKeyNames="id" 
                                DataSourceID="sqldsAP" ShowFooter="false" SkinID="gridviewSkinSmall">
                            <EmptyDataTemplate>
                                <br />
                                There are no actions. Insert one using the controls below.<br />
                                <br />
                                <table border="1" class="TblEmptyData">
                                    <tr class="InsertTabHeader">
                                        <td>Action</td>
                                        <td class="CommentsCol">Description <asp:RegularExpressionValidator ID="RegExpVal1" runat="server" ControlToValidate="txtAPdesc" ValidationExpression="^[\s\S]{0,500}$" ValidationGroup="InsAP" ErrorMessage="*"></asp:RegularExpressionValidator></td>
                                        <!--<td>Type</td>-->
                                        <td>Responsible1<!--<br />Responsible2--></td>
                                        <td>Deadline</td>
                                        <td>Status</td>
                                        <td>Attachment</td>
                                    </tr>
                                    <tr class="InsertRow">
                                        <td class="centered"><asp:ImageButton ID="btnInsert" CausesValidation="true" runat="server" CommandName="Insert"
                                            ImageUrl="~/images/icons/add16_16.png" ToolTip="Insert" ValidationGroup="InsAP" /></td>
                                        <td><asp:TextBox ID="txtAPdesc" TextMode="MultiLine" SkinID="txtTextLong" runat="server" Text='<%# Bind("Description") %>' ></asp:TextBox></td>
                                        <!--<td><asp:DropDownList SkinId="ddlDef" ID="ddlActionType" runat="server" 
                                               DataSourceID="sqldsActionType" DataTextField="Description" DataValueField="id">
                                            </asp:DropDownList></td>-->
                                        <td><asp:DropDownList ID="ddlResp1" runat="server" DataSourceID="sqldsResponsibles" 
                                                DataTextField="FullName" DataValueField="id">
                                            </asp:DropDownList><!--<br /><asp:DropDownList SkinId="ddlDef" ID="ddlResp2" runat="server" DataSourceID="sqldsResponsibles" 
                                                DataTextField="FullName" DataValueField="id">
                                            </asp:DropDownList>--></td>
                                        <td><uc1:DateBox ID="dbDeadline" runat="server" Value='<%# Bind("Deadline") %>' Text='<%# Today.ToString("dd/MM/yyyy") %>' /></td>
                                        <td><asp:DropDownList SkinId="ddlDef" ID="ddlActionStatus" runat="server" DataSourceID="sqldsActionStatus" 
                                                DataTextField="Description" DataValueField="id">
                                            </asp:DropDownList></td>
                                        <td><asp:FileUpload ID="fuAP" Font-Size="8pt" runat="server" /></td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemStyle Wrap="false" />
                                    <ItemTemplate>                
                                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                            CommandName="Edit" ImageUrl="~/Images/Icons/Edit16_16.png" ToolTip="Edit" />&nbsp;
                                        <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                            CommandName="Delete" ImageUrl="~/Images/Icons/Remove16_16.png" ToolTip="Delete" />&nbsp;
                                        <asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False" CommandArgument='<%# Bind("id") %>'
                                            CommandName="Details" ImageUrl="~/Images/Icons/Preview1_16x16.png" ToolTip="View details" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" ValidationGroup="UpdAP" 
                                            CommandName="Update" ImageUrl="~/Images/Icons/Save16_16.png" ToolTip="Update" />
                                        &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                            CommandName="Cancel" ImageUrl="~/Images/Icons/Cancel16_16.png" ToolTip="Cancel" />
                                    </EditItemTemplate>
                                    <FooterStyle HorizontalAlign="Center" />
                                    <FooterTemplate>
                                        <asp:ImageButton ID="btnInsert" CausesValidation="true" runat="server" CommandName="Insert"
                                            ImageUrl="~/images/icons/add16_16.png" ToolTip="Insert" ValidationGroup="InsAP" />
                                    </FooterTemplate>
                                </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="Description" SortExpression="Description">
                                        <ItemStyle CssClass="CommentsCol" />
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox6" TextMode="MultiLine" SkinID="txtTextLong" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox><asp:RegularExpressionValidator ID="RegExpVal1" runat="server" ControlToValidate="TextBox6" ValidationExpression="^[\s\S]{0,500}$" ValidationGroup="UpdAP" ErrorMessage="*"></asp:RegularExpressionValidator>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtAPdesc" TextMode="MultiLine" SkinID="txtTextLong" runat="server" Text='<%# Bind("Description") %>' ></asp:TextBox><asp:RegularExpressionValidator ID="RegExpVal1" runat="server" ControlToValidate="txtAPdesc" ValidationExpression="^[\s\S]{0,500}$" ValidationGroup="InsAP" ErrorMessage="*"></asp:RegularExpressionValidator>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Type" Visible="false" SortExpression="ActionId">
                                        <EditItemTemplate>
                                            <asp:DropDownList SkinId="ddlDef" ID="ddlActionType" runat="server" 
                                               selectedvalue=<%# Bind("ActionId") %> DataSourceID="sqldsActionType" DataTextField="Description" DataValueField="id">
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:DropDownList SkinId="ddlDef" ID="ddlActionType" runat="server" 
                                               Enabled="false" selectedvalue=<%# Bind("ActionId") %> DataSourceID="sqldsActionType" DataTextField="Description" DataValueField="id">
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:DropDownList SkinId="ddlDef" ID="ddlActionType" runat="server" 
                                               DataSourceID="sqldsActionType" DataTextField="Description" DataValueField="id">
                                            </asp:DropDownList>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Responsible1" SortExpression="Responsible1">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlResp1" runat="server" DataSourceID="sqldsResponsibles" 
                                                selectedvalue=<%# Bind("Responsible1") %> DataTextField="FullName" DataValueField="id">
                                            </asp:DropDownList>
                                            <!--<br />
                                            <asp:DropDownList SkinId="ddlDef" ID="ddlResp2" runat="server" DataSourceID="sqldsResponsibles" 
                                                selectedvalue=<%# Bind("Responsible2") %> DataTextField="FullName" DataValueField="id">
                                            </asp:DropDownList>-->
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:DropDownList ID="ddlResp1" runat="server" DataSourceID="sqldsResponsibles" 
                                                Enabled="false" selectedvalue=<%# Bind("Responsible1") %> DataTextField="FullName" DataValueField="id">
                                            </asp:DropDownList><!--<br />
                                            <asp:DropDownList SkinId="ddlDef" ID="ddlResp2" runat="server" DataSourceID="sqldsResponsibles" 
                                                Enabled="false" selectedvalue=<%# Bind("Responsible2") %> DataTextField="FullName" DataValueField="id">
                                            </asp:DropDownList>-->
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:DropDownList ID="ddlResp1" runat="server" DataSourceID="sqldsResponsibles" 
                                                DataTextField="FullName" DataValueField="id">
                                            </asp:DropDownList><!--<br />
                                            <asp:DropDownList SkinId="ddlDef" ID="ddlResp2" runat="server" DataSourceID="sqldsResponsibles" 
                                                DataTextField="FullName" DataValueField="id">
                                            </asp:DropDownList>-->
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Deadline" SortExpression="Deadline">
                                        <EditItemTemplate>
                                            <uc1:DateBox ID="dbDeadline" runat="server" Value='<%# Bind("Deadline") %>' />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("Deadline", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <uc1:DateBox ID="dbDeadline" runat="server" Value='<%# Bind("Deadline") %>' Text='<%# Today.ToString("dd/MM/yyyy") %>' />
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status" SortExpression="Status">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlActionStatus" runat="server" DataSourceID="sqldsActionStatus" 
                                                selectedvalue=<%# Bind("Status") %> DataTextField="Description" DataValueField="id">
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:DropDownList ID="ddlActionStatus" runat="server" DataSourceID="sqldsActionStatus" 
                                                Enabled="false" selectedvalue=<%# Bind("Status") %> DataTextField="Description" DataValueField="id">
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:DropDownList ID="ddlActionStatus" runat="server" DataSourceID="sqldsActionStatus" 
                                                DataTextField="Description" DataValueField="id">
                                            </asp:DropDownList>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="AttachmentName" SortExpression="AttachmentName">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnDown" runat="server" CausesValidation="True" CommandArgument='<%# Bind("id") %>'
                                                CommandName="Download" Text='<%# Bind("AttachmentName") %>'></asp:LinkButton>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:FileUpload Font-Size="8pt" ID="fuAP" runat="server" />                                            
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:Button ID="btnAPins" runat="server" Text="Enable/Disable insertion" />
                        </td>
                    </tr>
                    <tr>
                        <td id="tdMeetings" align="center">
                            <asp:GridView ID="gvMeetings" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" 
                                DataSourceID="sqldsMeetings"  SkinID="gridviewSkinSmall" ShowFooter="false">
                                <EmptyDataTemplate>
                                <br />
                                There are no scheduled meetings for this project. Insert one using the controls below.<br />
                                <br />
                                <table border="1" class="TblEmptyData">
                                    <tr class="InsertTabHeader">
                                        <td></td>
                                        <td align="center">From</td>
                                        <td align="center">To</td>
                                        <td class="CommentsCol"><!--Kind<br />-->Subject</td>
                                        <td align="center">Consultant</td>
                                        <td align="center">Status</td>
                                        <!--<td>NewBusiness</td>
                                        <td>Comments</td>-->
                                        <td align="center">Attachment</td>
                                    </tr>
                                    <tr class="InsertRow">
                                        <td class="centered"><asp:ImageButton ID="btnInsert" CausesValidation="true" runat="server" CommandName="Insert"
                                                ImageUrl="~/Images/Icons/add16_16.png" ToolTip="Insert" ValidationGroup="InsMeet" /></td>
                                        <td><uc1:DateBox ID="dbTimeFrom" runat="server" ShowTime="true" Text='<%# Now.ToString("dd/MM/yyyy") %>' /></td>
                                        <td><uc1:DateBox ID="dbTimeTo" runat="server" ShowTime="true" ShowDate="false" Text='<%# Now.ToString("dd/MM/yyyy") %>' /></td>
                                        <td><!--<asp:DropDownList SkinId="ddlDef" ID="ddlMeetKind" runat="server" DataSourceID="sqldsMeetKind" 
                                                DataTextField="Description" DataValueField="id">
                                            </asp:DropDownList><br />--><asp:TextBox ID="txtMeetSubject" MaxLength="50" SkinID="txtText" runat="server" ></asp:TextBox></td>
                                        <td><asp:DropDownList SkinId="ddlDef" ID="ddlMeetCons" runat="server" DataSourceID="sqldsConsultants" 
                                                DataTextField="Fullname" DataValueField="id">
                                            </asp:DropDownList></td>
                                        <td><asp:DropDownList SkinId="ddlDef" ID="ddlMeetStat" runat="server" DataSourceID="sqldsMeetStat" 
				                                DataTextField="Description" DataValueField="id">
				                            </asp:DropDownList></td>
                                        <!--<td><asp:TextBox ID="txtMeetNewBus" SkinID="txtTextLong" TextMode="MultiLine" runat="server" ></asp:TextBox></td>
                                        <td><asp:TextBox ID="txtMeetComments" SkinID="txtTextLong" TextMode="MultiLine" runat="server" ></asp:TextBox></td>-->
                                        <td><asp:FileUpload Font-Size="8pt" ID="fuAttachment" runat="server" /></td>
                                    </tr>
                                </table>
                                </EmptyDataTemplate>
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemStyle Wrap="false" />
                                        <ItemTemplate>                
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                                CommandName="Edit" ImageUrl="~/Images/Icons/Edit16_16.png" ToolTip="Edit" /> &nbsp;
                                            <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False"
                                                CommandName="Delete" ImageUrl="~/Images/Icons/Remove16_16.png" ToolTip="Delete" /> &nbsp;
                                            <asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False" CommandArgument='<%# Bind("id") %>'
                                                CommandName="Details" ImageUrl="~/Images/Icons/Preview1_16x16.png" ToolTip="View details" />
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
                                                ImageUrl="~/images/icons/add16_16.png" ToolTip="Insert" ValidationGroup="InsMeet" />
                                        </FooterTemplate>
                                    </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="From" SortExpression="TimeFrom" ItemStyle-Wrap="false">
                                        <EditItemTemplate>
                                            <uc1:DateBox ID="dbTimeFrom" runat="server" Value='<%# Bind("TimeFrom") %>' ShowTime="true" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("TimeFrom", "{0:dd/MM/yyyy HH:mm}") %>'></asp:Label><br />
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <uc1:DateBox ID="dbTimeFrom" runat="server" Value='<%# Bind("TimeFrom") %>' ShowTime="true" Text='<%# Now.ToString("dd/MM/yyyy") %>' />
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="To" SortExpression="TimeTo" ItemStyle-Wrap="false">
                                        <EditItemTemplate>
                                            <uc1:DateBox ID="dbTimeTo" runat="server" Value='<%# Bind("TimeTo") %>' ShowTime="true" ShowDate="false" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("TimeTo", "{0:HH:mm}") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <uc1:DateBox ID="dbTimeTo" runat="server" Value='<%# Bind("TimeTo") %>' Text='<%# Now.ToString("HH:mm") %>' ShowTime="true" ShowDate="false" />                                            
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Kind" SortExpression="Kind" Visible="false">
                                        <EditItemTemplate>
                                            <asp:DropDownList SkinId="ddlDef" ID="ddlMeetKind" runat="server" DataSourceID="sqldsMeetKind" 
                                                selectedvalue=<%# Bind("Kind") %> DataTextField="Description" DataValueField="id">
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:DropDownList SkinId="ddlDef" ID="ddlMeetKind" runat="server" DataSourceID="sqldsMeetKind" 
                                                Enabled="false" selectedvalue=<%# Bind("Kind") %> DataTextField="Description" DataValueField="id">
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:DropDownList ID="ddlMeetKind" SkinID="ddlDef" runat="server" DataSourceID="sqldsMeetKind" 
                                                DataTextField="Description" DataValueField="id">
                                            </asp:DropDownList>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Subject" SortExpression="Subject">
                                        <ItemStyle CssClass="CommentsCol" />
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox7" SkinID="txtText" MaxLength="50" runat="server" Text='<%# Bind("Subject") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("Subject") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtMeetSubject" MaxLength="50" SkinID="txtText" runat="server" ></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Consultant" SortExpression="Consultant">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlMeetCons" runat="server" DataSourceID="sqldsConsultants" 
                                                selectedvalue=<%# Bind("Consultant") %> DataTextField="Fullname" DataValueField="id">
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:DropDownList ID="ddlMeetCons" runat="server" DataSourceID="sqldsConsultants" 
                                                Enabled="false" selectedvalue=<%# Bind("Consultant") %> DataTextField="Fullname" DataValueField="id">
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:DropDownList ID="ddlMeetCons" runat="server" DataSourceID="sqldsConsultants" 
                                                DataTextField="Fullname" DataValueField="id">
                                            </asp:DropDownList>
                                        </FooterTemplate>
                                    </asp:TemplateField>
				                    <asp:TemplateField HeaderText="NewBusiness" Visible="false" SortExpression="NewBusiness">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox10" TextMode="MultiLine" SkinID="txtTextLong" runat="server" Text='<%# Bind("NewBusiness") %>'></asp:TextBox><asp:RegularExpressionValidator ID="RegExpVal1" runat="server" ControlToValidate="TextBox10" ValidationExpression="^[\s\S]{0,500}$" ValidationGroup="UpdMeet" ErrorMessage="*"></asp:RegularExpressionValidator>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label11" runat="server" Text='<%# Bind("NewBusiness") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtMeetNewBus" SkinID="txtTextLong" TextMode="MultiLine" runat="server" ></asp:TextBox><asp:RegularExpressionValidator ID="RegExpVal1" runat="server" ControlToValidate="txtMeetNewBus" ValidationExpression="^[\s\S]{0,500}$" ValidationGroup="InsMeet" ErrorMessage="*"></asp:RegularExpressionValidator>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Comments" Visible="false" SortExpression="Comments">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox9" TextMode="MultiLine" SkinID="txtTextLong" runat="server" Text='<%# Bind("Comments") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label10" runat="server" Text='<%# Bind("Comments") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtMeetComments" SkinID="txtTextLong" TextMode="MultiLine" runat="server" ></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status" SortExpression="status">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlMeetStat" runat="server" DataSourceID="sqldsMeetStat" 
                                                selectedvalue=<%# Bind("Status") %> DataTextField="Description" DataValueField="id">
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:DropDownList ID="ddlMeetStat" runat="server" DataSourceID="sqldsMeetStat" 
                                                Enabled="false" selectedvalue=<%# Bind("Status") %> DataTextField="Description" DataValueField="id">
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:DropDownList ID="ddlMeetStat" runat="server" DataSourceID="sqldsMeetStat" 
                                                DataTextField="Description" DataValueField="id">
                                            </asp:DropDownList>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Attachment" SortExpression="AttachmentName">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label12" runat="server" Text='<%# Bind("AttachmentName") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnMeetDown" runat="server" CausesValidation="True" CommandArgument='<%# Bind("id") %>'
                                                CommandName="Download" Text='<%# Bind("AttachmentName") %>'></asp:LinkButton>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:FileUpload Font-Size="8pt" ID="fuAttachment" runat="server" />                                            
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:Button ID="btnMTins" runat="server" Text="Enable/Disable insertion" />
                        </td>
                    </tr>
                    <tr>
                        <td id="tdAttachments" align="center">
                            <asp:GridView ID="gvFiles" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" 
                                DataSourceID="sqldsAttachments" SkinID="gridviewSkinSmall" 
                                ShowFooter="false">
                                <EmptyDataTemplate>
                                    <br />
                                    There are no files uploaded. Insert one using the controls below.<br />
                                    <br />
                                    <table border="1" class="TblEmptyData">
                                        <tr class="InsertTabHeader">
                                            <td>Action</td>
                                            <td>File</td>
                                            <td>Comments</td>
                                        </tr>
                                        <tr class="InsertRow">
                                            <td class="centered"><asp:ImageButton ID="btnInsert" CausesValidation="true" runat="server" CommandName="Insert"
                                                ImageUrl="~/images/icons/add16_16.png" ToolTip="Insert" />
                                            </td>
                                            <td><asp:FileUpload ID="fuCtrl" runat="server" /></td>
                                            <td><asp:TextBox ID="txtAttachComment" MaxLength="250" SkinID="txtText" runat="server"></asp:TextBox></td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemStyle Wrap="false" />
                                        <ItemTemplate>                
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                                CommandName="Edit" ImageUrl="~/Images/Icons/Edit16_16.png" ToolTip="Edit" />
                                            &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                                CommandName="Delete" ImageUrl="~/Images/Icons/Remove16_16.png" ToolTip="Delete" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" 
                                                CommandName="Update" ImageUrl="~/Images/Icons/Save16_16.png" ToolTip="Update" />
                                            &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                                CommandName="Cancel" ImageUrl="~/Images/Icons/Cancel16_16.png" ToolTip="Cancel" />
                                        </EditItemTemplate>
                                        <FooterStyle HorizontalAlign="Center" />
                                        <FooterTemplate>
                                            <asp:ImageButton ID="btnInsert" CausesValidation="true" runat="server" CommandName="Insert"
                                                ImageUrl="~/images/icons/add16_16.png" ToolTip="Insert" />
                                        </FooterTemplate>
                                    </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="Datestamp" SortExpression="Datestamp">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Datestamp", "{0:dd/MM/yyyy HH:mm:ss}") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Datestamp", "{0:dd/MM/yyyy HH:mm:ss}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Attachment" SortExpression="AttachmentName">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnDown" runat="server" CausesValidation="True" CommandArgument='<%# Bind("id") %>'
                                                CommandName="Download" Text='<%# Bind("AttachmentName") %>'></asp:LinkButton>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:FileUpload ID="fuCtrl" runat="server" />                                            
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Comments" SortExpression="Comments">
                                        <ItemTemplate>
                                            <asp:Label  ID="lblComments" runat="server" Text='<%# Bind("Comments") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtAttachComment" MaxLength="250" SkinID="txtText" runat="server" Text='<%# Bind("Comments") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtAttachComment" MaxLength="250" SkinID="txtText" runat="server" Text='<%# Bind("Comments") %>'></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:Button ID="btnFlsIns" runat="server" Text="Enable/Disable insertion" />
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
                    SelectCommand="ProjectList" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserId" SessionField="UserId" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsProjects" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    DeleteCommand="DELETE FROM [Projects] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [Projects] ([Code], [SubProject], [Creator], [CustomerId], [StartDate], [InitialEndDate], [Title], [Description], [Supervisor], [Consultant1], [Consultant2], [InitialMeetingsNo], [CriticalIssues], [DesiredOrganization], [CertificationField], [CompletionPercentage], [Status]) VALUES (@Code, @SubProject, @Creator, @CustomerId, @StartDate, @InitialEndDate, @Title, @Description, @Supervisor, @Consultant1, @Consultant2, @InitialMeetingsNo, @CriticalIssues, @DesiredOrganization, @CertificationField, @CompletionPercentage, @Status)" 
                    SelectCommand="SELECT [id], [Code], [SubProject], [DateStamp], [Creator], [ModificationDate], [CustomerId], [StartDate], [InitialEndDate], [Title], [Description], [Supervisor], [Consultant1], ISNULL([Consultant2], 0) AS Consultant2, [InitialMeetingsNo], [CriticalIssues], [DesiredOrganization], [CertificationField], [CompletionPercentage], [Status]  FROM [Projects] WHERE ([id] = @id)" 
                    UpdateCommand="UPDATE [Projects] SET [Code] = @Code, [SubProject] = @SubProject, [Creator] = @Creator, [ModificationDate] = @ModificationDate, [CustomerId] = @CustomerId, [StartDate] = @StartDate, [InitialEndDate] = @InitialEndDate, [Title] = @Title, [Description] = @Description, [Supervisor] = @Supervisor, [Consultant1] = @Consultant1, [Consultant2] = @Consultant2, [InitialMeetingsNo] = @InitialMeetingsNo, [CriticalIssues] = @CriticalIssues, [DesiredOrganization] = @DesiredOrganization, [CertificationField] = @CertificationField, [CompletionPercentage] = @CompletionPercentage, [Status] = @Status WHERE [id] = @id">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlPrjCode" Name="id" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Code" Type="String" />
                        <asp:Parameter Name="SubProject" Type="String" />
                        <asp:Parameter Name="Creator" Type="Int32" />
                        <asp:Parameter Name="ModificationDate" Type="DateTime" />
                        <asp:Parameter Name="CustomerId" Type="Int32" />
                        <asp:Parameter Name="StartDate" Type="DateTime" />
                        <asp:Parameter Name="InitialEndDate" Type="DateTime" />
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Supervisor" Type="Int32" />
                        <asp:Parameter Name="Consultant1" Type="Int32" />
                        <asp:Parameter Name="Consultant2" Type="Int32" />
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
                        <asp:Parameter Name="Creator" Type="Int32" />
                        <asp:Parameter Name="CustomerId" Type="Int32" />
                        <asp:Parameter Name="StartDate" Type="DateTime" />
                        <asp:Parameter Name="InitialEndDate" Type="DateTime" />
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="Description" Type="String" DefaultValue=" " />
                        <asp:Parameter Name="Supervisor" Type="Int32" />
                        <asp:Parameter Name="Consultant1" Type="Int32" />
                        <asp:Parameter Name="Consultant2" Type="Int32" />
                        <asp:Parameter Name="InitialMeetingsNo" Type="Byte" DefaultValue="10" />
                        <asp:Parameter Name="CriticalIssues" Type="String" DefaultValue=" " />
                        <asp:Parameter Name="DesiredOrganization" Type="String" DefaultValue=" " />
                        <asp:Parameter Name="CertificationField" Type="String" DefaultValue=" " />
                        <asp:Parameter Name="CompletionPercentage" Type="Byte" DefaultValue="0" />
                        <asp:Parameter Name="Status" Type="Byte" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsAP" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    
                    SelectCommand="SELECT [id], [ProjectId], [DateStamp], [ActionId], [Responsible1], [Responsible2], [Description], [Comments], [AttachmentName], [Deadline], [Status] FROM [ActionPlans] WHERE ([ProjectId] = @ProjectId)" 
                    DeleteCommand="DELETE FROM [ActionPlans] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [ActionPlans] ([ProjectId], [ActionId], [Responsible1], [Responsible2], [Description], [AttachmentName], [Attachment], [Deadline], [Status]) VALUES (@ProjectId, @ActionId, @Responsible1, @Responsible2, @Description, @AttachmentName, @Attachment, @Deadline, @Status)" 
                    UpdateCommand="UPDATE [ActionPlans] SET [Responsible1] = @Responsible1, [Description] = @Description, [Deadline] = @Deadline, [Status] = @Status WHERE [id] = @id">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlPrjCode" Name="ProjectId" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ProjectId" Type="Int32" />
                        <asp:Parameter Name="Responsible1" Type="Int32" />
                        <asp:Parameter Name="Description" Type="String" />
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
                        <asp:Parameter Name="AttachmentName" Type="String" />
                        <asp:Parameter Name="Attachment" />
                        <asp:Parameter Name="Deadline" Type="DateTime" />
                        <asp:Parameter Name="Status" Type="Byte" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsMeetings" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="SELECT [id], [Datestamp], [ProjectId], [TimeFrom], [TimeTo], [Kind], [Subject], [Consultant], [Comments], [NewBusiness], [AttachmentName], [Status] FROM [Meetings] WHERE ([ProjectId] = @ProjectId)" 
                    DeleteCommand="DELETE FROM [Meetings] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [Meetings] ([ProjectId], [TimeFrom], [TimeTo], [Kind], [Subject], [Consultant], [Comments], [NewBusiness], [AttachmentName], [Attachment], [Status]) VALUES (@ProjectId, @TimeFrom, @TimeTo, @Kind, @Subject, @Consultant, @Comments, @NewBusiness, @AttachmentName, @Attachment, @Status)" 
                    UpdateCommand="UPDATE [Meetings] SET [TimeFrom] = @TimeFrom, [TimeTo] = @TimeTo, [Subject] = @Subject, [Consultant] = @Consultant, [Status] = @Status WHERE [id] = @id">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlPrjCode" Name="ProjectId" 
                            PropertyName="SelectedValue" Type="Int32" />
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
                        <asp:Parameter Name="Comments" Type="String" />
                        <asp:Parameter Name="NewBusiness" Type="String" />
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
                        <asp:Parameter Name="Comments" Type="String" />
                        <asp:Parameter Name="NewBusiness" Type="String" />
                        <asp:Parameter Name="AttachmentName" Type="String" />
                        <asp:Parameter Name="Attachment" />
                        <asp:Parameter Name="Status" Type="Byte" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="sqldsAttachments" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="SELECT [id], [Datestamp], [ProjectId], [AttachmentName], [Comments] FROM [ProjectFiles] WHERE ([ProjectId] = @ProjectId)" 
                    DeleteCommand="DELETE FROM [ProjectFiles] WHERE [id] = @id" 
                    UpdateCommand="UPDATE [ProjectFiles] SET [Comments] = @Comments WHERE [id] = @id"
                    InsertCommand="INSERT INTO [ProjectFiles] ([ProjectId], [AttachmentName], [Attachment], [Comments]) VALUES (@ProjectId, @AttachmentName, @Attachment, @Comments)" >
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlPrjCode" Name="ProjectId" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                        <asp:Parameter Name="Comments" Type="String" />
                    </UpdateParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ProjectId" Type="Int32" />
                        <asp:Parameter Name="AttachmentName" Type="String" />
                        <asp:Parameter Name="Attachment" />
                        <asp:Parameter Name="Comments" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsSysVer" runat="server" ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    InsertCommand="INSERT INTO [SystemVersion] ([ProjectId], [VersionNo], [Comments]) VALUES (@ProjectId, 1, '')" 
                    SelectCommand="SELECT [id], [ProjectId], [VersionNo], [Comments] FROM [SystemVersion]" >
                    <InsertParameters>
                        <asp:Parameter Name="ProjectId" Type="Int32" />
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
                        <asp:ControlParameter ControlID="ddlPrjCode" Name="ProjectId" 
                            PropertyName="SelectedValue" Type="Int16" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="sqldsCreators" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="UsersByType" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="*" Name="UserType" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsCompanies" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="SELECT DISTINCT [Name], [Id] FROM [Companies] ORDER BY [Name]"></asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsProjectStatus" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="SELECT [id], [Description] FROM [VariousTypes] WHERE ([Category] = @Category) ORDER BY [Description]">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="ProjectStatus" Name="Category" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsActionStatus" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="SELECT [id], [Description] FROM [VariousTypes] WHERE ([Category] = @Category) ORDER BY [Description]">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="ActionStatus" Name="Category" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="sqldsMeetKind" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="SELECT [id], [Description] FROM [VariousTypes] WHERE ([Category] = @Category) ORDER BY [Description]">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="MeetingKind" Name="Category" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
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
                <asp:SqlDataSource ID="sqldsConsultants" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" SelectCommand="SELECT Users.id, LastName + ' ' + FirstName AS Fullname FROM Users
                    INNER JOIN VariousTypes ON Users.UserType = VariousTypes.id
                    WHERE VariousTypes.[Description] IN ('Consultant', 'Supervisor') AND users.IsActive = 1">
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsConsultantsNN" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="UsersByTypeNoone" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Consultant" Name="UserType" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
    </table>
</asp:Content>

