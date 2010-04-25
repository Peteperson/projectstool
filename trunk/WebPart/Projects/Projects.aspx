<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="Projects.aspx.vb" Inherits="Projects" Theme="MainSkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br />
    <br />
    <table id="subPageMainTable" cellpadding="0" cellspacing="0">
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
                <table>
                    <tr>
                        <td style="width:70%" rowspan="2">
                            <asp:DetailsView ID="dvProject" runat="server" AutoGenerateRows="False" 
                                DataKeyNames="id" DataSourceID="sqldsProjects" Width="100%">
                                <Fields>
                                    <asp:TemplateField>
                                        <EditItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <table>
                                                <tr>
                                                    <td>Project Id</td>
                                                    <td><asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label></td>
                                                    <td>Title</td>
                                                    <td><asp:Label ID="Label10" runat="server" Text='<%# Bind("Title") %>'></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>Code</td>
                                                    <td><asp:Label ID="Label2" runat="server" Text='<%# Bind("Code") %>'></asp:Label></td>
                                                    <td>SubProject</td>
                                                    <td><asp:Label ID="Label3" runat="server" Text='<%# Bind("SubProject") %>'></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>Datestamp</td>
                                                    <td><asp:Label ID="Label4" runat="server" Text='<%# Bind("DateStamp", "{0:dd/MM/yyyy}") %>'></asp:Label></td>
                                                    <td>Creator</td>
                                                    <td><asp:DropDownList ID="ddlCreators" runat="server" DataSourceID="sqldsCreators" 
                                                           Enabled="false" selectedvalue=<%# Bind("Creator") %>  DataTextField="FullName" DataValueField="id">
                                                        </asp:DropDownList></td>
                                                </tr>
                                                <tr>
                                                    <td>Customer</td>
                                                    <td><asp:DropDownList ID="ddlCompanies" runat="server" 
                                                           Enabled="false" selectedvalue=<%# Bind("CustomerId") %>  DataSourceID="sqldsCompanies" DataTextField="Name" DataValueField="Id">
                                                        </asp:DropDownList></td>
                                                    <td>Supervisor</td>
                                                    <td><asp:DropDownList ID="ddlSupervisors" runat="server" DataSourceID="sqldsCreators" 
                                                           Enabled="false" selectedvalue=<%# Bind("Supervisor") %>  DataTextField="FullName" DataValueField="id">
                                                        </asp:DropDownList></td>
                                                </tr>
                                                <tr>
                                                    <td>Description</td>
                                                    <td colspan="3"><asp:Label ID="Label11" runat="server" Text='<%# Bind("Description") %>'></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>Start date</td>
                                                    <td><asp:Label ID="Label8" runat="server" Text='<%# Bind("StartDate", "{0:dd/MM/yyyy}") %>'></asp:Label></td>
                                                    <td>Initial end date</td>
                                                    <td><asp:Label ID="Label9" runat="server" Text='<%# Bind("InitialEndDate", "{0:dd/MM/yyyy}") %>'></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>Critical issues</td>
                                                    <td colspan="3"><asp:Label ID="Label14" runat="server" Text='<%# Bind("CriticalIssues") %>'></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>Desired Organization</td>
                                                    <td><asp:Label ID="Label15" runat="server" Text='<%# Bind("DesiredOrganization") %>'></asp:Label></td>
                                                    <td>Certification Fields</td>
                                                    <td><asp:Label ID="Label16" runat="server" Text='<%# Bind("CertificationField") %>'></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>Initial meetings no</td>
                                                    <td><asp:Label ID="Label13" runat="server" Text='<%# Bind("InitialMeetingsNo") %>'></asp:Label></td>
                                                    <td>Completion (%)</td>
                                                    <td><asp:Label ID="Label17" runat="server" Text='<%# Bind("CompletionPercentage") %>'></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>Status</td>
                                                    <td><asp:DropDownList ID="ddlProjectStatus" runat="server" DataSourceID="sqldsProjectStatus" 
                                                            Enabled="false" selectedvalue=<%# Bind("Status") %>  DataTextField="Description" DataValueField="id">                                                
                                                        </asp:DropDownList></td>
                                                    <td>Modification Date</td>
                                                    <td><asp:Label ID="Label6" runat="server" Text='<%# Bind("ModificationDate", "{0:dd/MM/yyyy HH:mm}") %>'></asp:Label></td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Code" SortExpression="Code">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Code") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Code") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="SubProject" SortExpression="SubProject">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("SubProject") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("SubProject") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="DateStamp" SortExpression="DateStamp">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("DateStamp", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Creator" SortExpression="Creator">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlCreators" runat="server" DataSourceID="sqldsCreators" 
                                               selectedvalue=<%# Bind("Creator") %>  DataTextField="FullName" DataValueField="id">
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:DropDownList ID="ddlCreators" runat="server" DataSourceID="sqldsCreators" 
                                               DataTextField="FullName" DataValueField="id">
                                            </asp:DropDownList>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField >
                                        <ItemTemplate>
                                            
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField >
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlCompanies" runat="server" 
                                               selectedvalue=<%# Bind("CustomerId") %>  DataSourceID="sqldsCompanies" DataTextField="Name" DataValueField="Id">
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:DropDownList ID="ddlCompanies" runat="server" 
                                               DataSourceID="sqldsCompanies" DataTextField="Name" DataValueField="Id">
                                            </asp:DropDownList>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="StartDate" SortExpression="StartDate">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("StartDate", "{0:dd/MM/yyyy}") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("StartDate", "{0:dd/MM/yyyy}") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="InitialEndDate" SortExpression="InitialEndDate">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("InitialEndDate", "{0:dd/MM/yyyy}") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("InitialEndDate", "{0:dd/MM/yyyy}") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Title" SortExpression="Title">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlSupervisors" runat="server" DataSourceID="sqldsCreators" 
                                               selectedvalue=<%# Bind("Supervisor") %>  DataTextField="FullName" DataValueField="id">
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:DropDownList ID="ddlSupervisors" runat="server" DataSourceID="sqldsCreators" 
                                               DataTextField="FullName" DataValueField="id">
                                            </asp:DropDownList>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField >
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox12" runat="server" 
                                                Text='<%# Bind("InitialMeetingsNo") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox12" runat="server" 
                                                Text='<%# Bind("InitialMeetingsNo") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="CriticalIssues" SortExpression="CriticalIssues">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("CriticalIssues") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("CriticalIssues") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField >
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox14" runat="server" 
                                                Text='<%# Bind("DesiredOrganization") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox14" runat="server" 
                                                Text='<%# Bind("DesiredOrganization") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("CertificationField") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("CertificationField") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField >
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox16" runat="server" 
                                                Text='<%# Bind("CompletionPercentage") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox16" runat="server" 
                                                Text='<%# Bind("CompletionPercentage") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status" 
                                        SortExpression="Status">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlProjectStatus" runat="server" DataSourceID="sqldsProjectStatus" 
                                                selectedvalue=<%# Bind("Status") %>  DataTextField="Description" DataValueField="id">                                                
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:DropDownList ID="ddlProjectStatus" runat="server" DataSourceID="sqldsProjectStatus" 
                                                DataTextField="Description" DataValueField="id">                                                
                                            </asp:DropDownList>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            
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
                    </Items>
                </asp:Menu>
            </td>
        </tr>
        <tr>
            <td align="left" style="padding: 6px 6px 6px 6px; background-color:#7A2021">
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <asp:GridView ID="gvAP" runat="server" AutoGenerateColumns="False" 
                                AllowPaging="True" AllowSorting="True" DataKeyNames="id" 
                                DataSourceID="sqldsAP" ShowFooter="True" SkinID="gridviewSkinSmall">
                            <EmptyDataTemplate>
                                <br />
                                There are no actions. Insert one using the controls below.<br />
                                <br />
                                <table style="border-top: solid 1px white">
                                    <tr class="InsertTabHeader">
                                        <td>Action</td>
                                        <td>ActionId</td>
                                        <td>Responsible1</td>
                                        <td>Responsible2</td>
                                        <td>Comments</td>
                                        <td>Attachment</td>
                                        <td>Deadline</td>
                                        <td>Status</td>
                                    </tr>
                                    <tr class="InsertRow">
                                        <td><asp:ImageButton ID="btnInsert" CausesValidation="true" runat="server" CommandName="Insert"
                                            ImageUrl="~/images/icons/add16_16.png" ToolTip="Insert" /></td>
                                        <td><asp:DropDownList ID="ddlActionType" runat="server" 
                                               DataSourceID="sqldsActionType" DataTextField="Description" DataValueField="id">
                                            </asp:DropDownList></td>
                                        <td><asp:DropDownList ID="ddlResp1" runat="server" DataSourceID="sqldsResponsibles" 
                                                DataTextField="FullName" DataValueField="id">
                                            </asp:DropDownList></td>
                                        <td><asp:DropDownList ID="ddlResp2" runat="server" DataSourceID="sqldsResponsibles" 
                                                DataTextField="FullName" DataValueField="id">
                                            </asp:DropDownList></td>
                                        <td><asp:TextBox ID="txtAPcomments" TextMode="MultiLine" SkinID="txtTextLong" runat="server" Text='<%# Bind("Comments") %>' ></asp:TextBox></td>
                                        <td><asp:FileUpload ID="fuAP" Width="100px" Font-Size="8pt" runat="server" /></td>
                                        <td><asp:TextBox SkinID="txtDef" ID="txtAPdead" runat="server" Text='<%# Today.ToString("dd/MM/yyyy") %>'></asp:TextBox></td>
                                        <td><asp:DropDownList ID="ddlActionStatus" runat="server" DataSourceID="sqldsActionStatus" 
                                                DataTextField="Description" DataValueField="id">
                                            </asp:DropDownList></td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemStyle Wrap="false" />
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
                                    <asp:TemplateField HeaderText="Description" SortExpression="Comments">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox6" TextMode="MultiLine" SkinID="txtTextLong" runat="server" Text='<%# Bind("Comments") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Comments") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtAPcomments" TextMode="MultiLine" SkinID="txtTextLong" runat="server" Text='<%# Bind("Comments") %>' ></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ActionId" SortExpression="ActionId">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlActionType" runat="server" 
                                               selectedvalue=<%# Bind("ActionId") %> DataSourceID="sqldsActionType" DataTextField="Description" DataValueField="id">
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:DropDownList ID="ddlActionType" runat="server" 
                                               Enabled="false" selectedvalue=<%# Bind("ActionId") %> DataSourceID="sqldsActionType" DataTextField="Description" DataValueField="id">
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:DropDownList ID="ddlActionType" runat="server" 
                                               DataSourceID="sqldsActionType" DataTextField="Description" DataValueField="id">
                                            </asp:DropDownList>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Responsible1" SortExpression="Responsible1">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlResp1" runat="server" DataSourceID="sqldsResponsibles" 
                                                selectedvalue=<%# Bind("Responsible1") %> DataTextField="FullName" DataValueField="id">
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:DropDownList ID="ddlResp1" runat="server" DataSourceID="sqldsResponsibles" 
                                                Enabled="false" selectedvalue=<%# Bind("Responsible1") %> DataTextField="FullName" DataValueField="id">
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:DropDownList ID="ddlResp1" runat="server" DataSourceID="sqldsResponsibles" 
                                                DataTextField="FullName" DataValueField="id">
                                            </asp:DropDownList>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Responsible2" SortExpression="Responsible2">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlResp2" runat="server" DataSourceID="sqldsResponsibles" 
                                                selectedvalue=<%# Bind("Responsible2") %> DataTextField="FullName" DataValueField="id">
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:DropDownList ID="ddlResp2" runat="server" DataSourceID="sqldsResponsibles" 
                                                Enabled="false" selectedvalue=<%# Bind("Responsible2") %> DataTextField="FullName" DataValueField="id">
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:DropDownList ID="ddlResp2" runat="server" DataSourceID="sqldsResponsibles" 
                                                DataTextField="FullName" DataValueField="id">
                                            </asp:DropDownList>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Deadline" SortExpression="Deadline">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox7" SkinID="txtDate" runat="server" Text='<%# Bind("Deadline", "{0:dd/MM/yyyy}") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("Deadline", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox SkinID="txtDate" ID="txtAPdead" runat="server" Text='<%# Today.ToString("dd/MM/yyyy") %>'></asp:TextBox>
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
                                            <asp:Label ID="Label18" runat="server" Text='<%# Bind("AttachmentName") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:FileUpload Width="150px" ID="fuAP" runat="server" />                                            
                                        </FooterTemplate>
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
                                        <ItemStyle Wrap="false" />
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
                                    <asp:TemplateField HeaderText="TimeFrom" SortExpression="TimeFrom">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" SkinID="txtDateTime" Text='<%# Bind("TimeFrom", "{0:dd/MM/yyyy HH:mm}") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("TimeFrom", "{0:dd/MM/yyyy HH:mm}") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtMeetTimeFrom" SkinID="txtDateTime" runat="server" Text='<%# Now.ToString("dd/MM/yyyy HH:mm") %>'></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TimeTo" SortExpression="TimeTo">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" SkinID="txtDateTime" Text='<%# Bind("TimeTo", "{0:dd/MM/yyyy HH:mm}") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("TimeTo", "{0:dd/MM/yyyy HH:mm}") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtMeetTimeTo" SkinID="txtDateTime" runat="server" Text='<%# Now.ToString("dd/MM/yyyy HH:mm") %>'></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Kind" SortExpression="Kind">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlMeetKind" runat="server" DataSourceID="sqldsMeetKind" 
                                                selectedvalue=<%# Bind("Kind") %> DataTextField="Description" DataValueField="id">
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:DropDownList ID="ddlMeetKind" runat="server" DataSourceID="sqldsMeetKind" 
                                                Enabled="false" selectedvalue=<%# Bind("Kind") %> DataTextField="Description" DataValueField="id">
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:DropDownList ID="ddlMeetKind" runat="server" DataSourceID="sqldsMeetKind" 
                                                DataTextField="Description" DataValueField="id">
                                            </asp:DropDownList>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Subject" SortExpression="Subject">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Subject") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("Subject") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtMeetSubject" runat="server" ></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Consultant" SortExpression="Consultant">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlMeetCons" runat="server" DataSourceID="sqldsMeetCons" 
                                                selectedvalue=<%# Bind("Consultant") %> DataTextField="Fullname" DataValueField="id">
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:DropDownList ID="ddlMeetCons" runat="server" DataSourceID="sqldsMeetCons" 
                                                Enabled="false" selectedvalue=<%# Bind("Consultant") %> DataTextField="Fullname" DataValueField="id">
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:DropDownList ID="ddlMeetCons" runat="server" DataSourceID="sqldsMeetCons" 
                                                DataTextField="Fullname" DataValueField="id">
                                            </asp:DropDownList>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Comments" SortExpression="Comments">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Comments") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label10" runat="server" Text='<%# Bind("Comments") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtMeetComments" SkinID="txtTextLong" TextMode="MultiLine" runat="server" ></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="NewBusiness" SortExpression="NewBusiness">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("NewBusiness") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label11" runat="server" Text='<%# Bind("NewBusiness") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtMeetNewBus" SkinID="txtTextLong" TextMode="MultiLine" runat="server" ></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status" SortExpression="Status">
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
                                    <br />There are no files uploaded.<br /><br />
                                    <table>
                                        <tr class="InsertHeader">
                                            <td colspan="2">File</td>
                                        </tr>
                                        <tr class="InsertRow">
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
                                        <ItemStyle Wrap="false" />
                                        <ItemTemplate>                
                                            <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
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
                                            <asp:Label  ID="lblfn" runat="server" Text='<%# Bind("FileName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Button ID="btnDown" runat="server" CausesValidation="True" CommandArgument='<%# Bind("id") %>'
                                                CommandName="Download" Text="Download file"/>
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
                    InsertCommand="INSERT INTO [Projects] ([Code], [SubProject], [Creator], [CustomerId], [StartDate], [InitialEndDate], [Title], [Description], [Supervisor], [InitialMeetingsNo], [CriticalIssues], [DesiredOrganization], [CertificationField], [CompletionPercentage], [Status]) VALUES (@Code, @SubProject, @Creator, @CustomerId, @StartDate, @InitialEndDate, @Title, @Description, @Supervisor, @InitialMeetingsNo, @CriticalIssues, @DesiredOrganization, @CertificationField, @CompletionPercentage, @Status)" 
                    SelectCommand="SELECT * FROM [Projects] WHERE ([id] = @id)" 
                    UpdateCommand="UPDATE [Projects] SET [Code] = @Code, [SubProject] = @SubProject, [Creator] = @Creator, [ModificationDate] = @ModificationDate, [CustomerId] = @CustomerId, [StartDate] = @StartDate, [InitialEndDate] = @InitialEndDate, [Title] = @Title, [Description] = @Description, [Supervisor] = @Supervisor, [InitialMeetingsNo] = @InitialMeetingsNo, [CriticalIssues] = @CriticalIssues, [DesiredOrganization] = @DesiredOrganization, [CertificationField] = @CertificationField, [CompletionPercentage] = @CompletionPercentage, [Status] = @Status WHERE [id] = @id">
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
                        <asp:Parameter Name="Creator" Type="Int32" />
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
                    
                    SelectCommand="SELECT [id], [ProjectId], [DateStamp], [ActionId], [Responsible1], [Responsible2], [Comments], [AttachmentName], [Deadline], [Status] FROM [ActionPlans] WHERE ([ProjectId] = @ProjectId)" 
                    DeleteCommand="DELETE FROM [ActionPlans] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [ActionPlans] ([ProjectId], [ActionId], [Responsible1], [Responsible2], [Comments], [AttachmentName], [Attachment], [Deadline], [Status]) VALUES (@ProjectId, @ActionId, @Responsible1, @Responsible2, @Comments, @AttachmentName, @Attachment, @Deadline, @Status)" 
                    UpdateCommand="UPDATE [ActionPlans] SET [ActionId] = @ActionId, [Responsible1] = @Responsible1, [Responsible2] = @Responsible2, [Comments] = @Comments, [Deadline] = @Deadline, [Status] = @Status WHERE [id] = @id">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlPrjCode" Name="ProjectId" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ProjectId" Type="Int32" />
                        <asp:Parameter Name="ActionId" Type="Byte" />
                        <asp:Parameter Name="Responsible1" Type="Int32" />
                        <asp:Parameter Name="Responsible2" Type="Int32" />
                        <asp:Parameter Name="Comments" Type="String" />
                        <asp:Parameter Name="Deadline" Type="DateTime" />
                        <asp:Parameter Name="Status" Type="Byte" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ProjectId" Type="Int32" />
                        <asp:Parameter Name="ActionId" Type="Byte" />
                        <asp:Parameter Name="Responsible1" Type="Int32" />
                        <asp:Parameter Name="Responsible2" Type="Int32" />
                        <asp:Parameter Name="Comments" Type="String" />
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
                    UpdateCommand="UPDATE [Meetings] SET [TimeFrom] = @TimeFrom, [TimeTo] = @TimeTo, [Kind] = @Kind, [Subject] = @Subject, [Consultant] = @Consultant, [Comments] = @Comments, [NewBusiness] = @NewBusiness, [Status] = @Status WHERE [id] = @id">
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
                    SelectCommand="SELECT [id], [Datestamp], [ProjectId], [FileName] FROM [ProjectFiles] WHERE ([ProjectId] = @ProjectId)" 
                    DeleteCommand="DELETE FROM [ProjectFiles] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [ProjectFiles] ([ProjectId], [FileName], [FileData]) VALUES (@ProjectId, @FileName, @FileData)" >
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlPrjCode" Name="ProjectId" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
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
                    SelectCommand="SELECT [id], [LastName] + ' ' + [FirstName] as FullName FROM [Users] WHERE [IsActive] = 1">
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
                <asp:SqlDataSource ID="sqldsMeetCons" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" SelectCommand="UsersByType" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Consultant" Name="UserType" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

