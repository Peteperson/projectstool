﻿<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="Projects.aspx.vb" Inherits="Projects" Theme="MainSkin" %>
<%@ Register src="DateBox.ascx" tagname="DateBox" tagprefix="uc1" %>

<%@ Register assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" namespace="System.Web.UI.WebControls" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br />
    <table id="subPageMainTablePrj" cellpadding="0" cellspacing="0">
        <tr>
            <td class="FormTitle">
                <table style="width:100%">
                    <tr>
                        <td><asp:ImageButton ID="btnRemovePaging" ImageUrl="~/Images/Paging3_32x32.png" runat="server" ToolTip="Ενεργοποίηση/Απενεργοποίηση σελιδοποίησης" /></td>
                        <td style="width:100%" align="center">Διαχείριση έργων</td>
                        <td><asp:ImageButton ID="btnPrint" runat="server" ToolTip="Εκτύπωση σελίδας" 
                                ImageUrl="~/Images/Icons/Print1_32x32.png" OnClientClick="return PrintWithoutPostback()" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="tdBelowTitle"><asp:Panel runat="server" ID="pnl1" DefaultButton="btnFindPrj">Επιλέξτε subproject από τη λίστα:
                <asp:DropDownList ID="ddlPrjCode" runat="server" DataSourceID="sqldsPrjCodes" 
                    DataTextField="SubProject" DataValueField="id" AutoPostBack="True">
                </asp:DropDownList>&nbsp;ή συμπληρώστε το στο ακόλουθο πεδίο και πατήστε &quot;Αναζήτηση&quot;
                <asp:TextBox ID="txtPrjId" runat="server" SkinID="txtTextCenter"></asp:TextBox>
                &nbsp;<asp:Button ID="btnFindPrj" runat="server" Text="Αναζήτηση" /></asp:Panel> 
            </td>
        </tr>
        <tr>
            <td>
                <table style="width:100%">
                    <tr>
                        <td id="tdProject">
                            <asp:DetailsView ID="dvProject" runat="server" AutoGenerateRows="False"
                                DataKeyNames="id" DataSourceID="sqldsProjects" Width="100%" BorderStyle="None">
                                <Fields>
                                    <asp:TemplateField ShowHeader="false">
                                        <ItemTemplate>
                                            <table id="tblDetails">
                                                <tr>
                                                    <td class="tblDetailsHeader">Τίτλος έργου</td>
                                                    <td class="tblDetailsItem" colspan="3"><asp:Label ID="Label10" runat="server" Text='<%# Bind("Title") %>'></asp:Label></td>
                                                    <td class="tblDetailsHeader">Τύπος</td>
                                                    <td class="tblDetailsItem">
                                                        <asp:RadioButtonList ID="rbPrjType" runat="server" DataSourceID="objdsPrjType" 
                                                             Enabled="false" selectedvalue='<%# Bind("Type") %>' DataTextField="Description" DataValueField="id" RepeatDirection="Horizontal">
                                                        </asp:RadioButtonList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Κωδ. έργου</td>
                                                    <td class="tblDetailsItem"><asp:Label ID="Label2" runat="server" Text='<%# Bind("Code") %>'></asp:Label></td>
                                                    <td class="tblDetailsHeader">SubProject</td>
                                                    <td class="tblDetailsItem"><asp:Label ID="Label3" runat="server" Text='<%# Bind("SubProject") %>'></asp:Label></td>
                                                    <td class="tblDetailsHeader">Datestamp</td>
                                                    <td class="tblDetailsItem"><asp:Label ID="Label4" runat="server" Text='<%# Bind("DateStamp", "{0:dd/MM/yyyy}") %>'></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Δημιουργός</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlCreators" runat="server" DataSourceID="sqldsCreators" 
                                                           Enabled="false" selectedvalue='<%# Bind("Creator") %>'  DataTextField="FullName" DataValueField="id">
                                                        </asp:DropDownList></td>
                                                    <td class="tblDetailsHeader">Πελάτης</td>
                                                    <td class="tblDetailsItem">
                                                        <table>
                                                            <tr>
                                                                <td><asp:DropDownList ID="ddlCompanies" runat="server" 
                                                                    Enabled="false" selectedvalue='<%# Bind("CustomerId") %>' DataSourceID="sqldsCompanies" DataTextField="Name" DataValueField="Id"></asp:DropDownList></td>
                                                                <td><asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False" CommandArgument='<%# Bind("CustomerId") %>'
                                                                            CommandName="SelCompany" ImageUrl="~/Images/Icons/Preview2_24x24.png" ToolTip="Προβολή λεπτομερειών" /></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td class="tblDetailsHeader">Project manager</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlProjectManagers" runat="server" DataSourceID="sqldsPrjManagers" 
                                                           Enabled="false" selectedvalue='<%# Bind("ProjectManager") %>' DataTextField="FullName" DataValueField="id">
                                                        </asp:DropDownList></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Σύμβουλος1</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlConsultant1" runat="server" DataSourceID="sqldsPrjManagers" 
                                                           Enabled="false" selectedvalue='<%# Bind("Consultant1") %>'  DataTextField="FullName" DataValueField="id">
                                                        </asp:DropDownList></td>
                                                    <td class="tblDetailsHeader">Σύμβουλος2</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlConsultant2" runat="server" DataSourceID="sqldsConsultantsNN" 
                                                           Enabled="false" selectedvalue='<%# Bind("Consultant2") %>' DataTextField="FullName" DataValueField="id">
                                                        </asp:DropDownList></td>
                                                    <td class="tblDetailsHeader">Πεδίο πιστοποίησης</td>
                                                    <td class="tblDetailsItem"><asp:Label ID="Label16" runat="server" Text='<%# Bind("CertificationField") %>'></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Περιγραφή</td>
                                                    <td colspan="5" class="tblDetailsItem"><asp:Label ID="Label11" runat="server" Text='<%# Bind("Description") %>'></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Έναρξη</td>
                                                    <td class="tblDetailsItem"><asp:Label ID="Label8" runat="server" ToolTip="Συμβατική ημ/νία έναρξης" Text='<%# Bind("InitialStartDate", "{0:dd/MM/yyyy}") %>'></asp:Label>&nbsp;&nbsp;(<asp:Label ID="lblActualStartDate" runat="server" ToolTip="Πραγματική ημ/νία έναρξης" Text='<%# Bind("StartDate", "{0:dd/MM/yyyy}") %>'></asp:Label>)</td>
                                                    <td class="tblDetailsHeader">Λήξη</td>
                                                    <td class="tblDetailsItem"><asp:Label ID="Label9" runat="server" ToolTip="Συμβατική ημ/νία λήξης" Text='<%# Bind("InitialEndDate", "{0:dd/MM/yyyy}") %>'></asp:Label>&nbsp;&nbsp;(<asp:Label ID="lblActualEndDate" runat="server" ToolTip="Πραγματική ημ/νία λήξης" Text='<%# Bind("EndDate", "{0:dd/MM/yyyy}") %>'></asp:Label>)</td>
                                                    <td class="tblDetailsHeader">Αρ. συναντήσεων</td>
                                                    <td class="tblDetailsItem"><asp:Label ID="Label13" runat="server" Text='<%# Bind("InitialMeetingsNo") %>'></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Κρίσιμα σημεία</td>
                                                    <td colspan="3" class="tblDetailsItem"><asp:Label ID="Label14" runat="server" Text='<%# Bind("CriticalIssues") %>'></asp:Label></td>
                                                    <td class="tblDetailsHeader">Επιθυμητός φορέας</td>
                                                    <td class="tblDetailsItem"><asp:Label ID="Label15" runat="server" Text='<%# Bind("DesiredOrganization") %>'></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Status</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlProjectStatus" runat="server" DataSourceID="objdsPrjStatus" 
                                                            Enabled="false" selectedvalue='<%# Bind("Status") %>'  DataTextField="Description" DataValueField="id">                                                
                                                        </asp:DropDownList></td>
                                                    <td class="tblDetailsHeader">% Ολοκλήρωσης</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlPercent" runat="server" Enabled="false" selectedvalue='<%# Bind("CompletionPercentage") %>'  >
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
                                                    <td class="tblDetailsHeader">Ημ/νία τροποποίησης</td>
                                                    <td class="tblDetailsItem"><asp:Label ID="Label6" runat="server" Text='<%# Bind("ModificationDate", "{0:dd/MM/yyyy HH:mm}") %>'></asp:Label></td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <EditItemTemplate>
						                    <table id="tblDetails">
                                                <tr>
                                                    <td class="tblDetailsHeader">Τίτλος έργου <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox9" ValidationGroup="UpdPrj" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                                    <td class="tblDetailsItem" colspan="3"><asp:TextBox ID="TextBox9" MaxLength="50" SkinID="txtText" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox></td>
                                                    <td class="tblDetailsHeader">Τύπος</td>
                                                    <td class="tblDetailsItem">
                                                        <asp:RadioButtonList ID="rbPrjType" runat="server" DataSourceID="objdsPrjType" 
                                                             selectedvalue='<%# Bind("Type") %>' DataTextField="Description" DataValueField="id" RepeatDirection="Horizontal">
                                                        </asp:RadioButtonList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Κωδ. έργου <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox1" ValidationGroup="UpdPrj" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                                    <td class="tblDetailsItem"><asp:TextBox ID="TextBox1" MaxLength="10" runat="server" Text='<%# Bind("Code") %>'></asp:TextBox></td>
                                                    <td class="tblDetailsHeader">SubProject <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox2" ValidationGroup="UpdPrj" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                                    <td class="tblDetailsItem"><asp:TextBox ID="TextBox2" MaxLength="10" runat="server" Text='<%# Bind("SubProject") %>'></asp:TextBox></td>
                                                    <td class="tblDetailsHeader">Datestamp</td>
                                                    <td class="tblDetailsItem"><asp:Label ID="Label4" runat="server" Text='<%# Bind("DateStamp", "{0:dd/MM/yyyy}") %>'></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Δημιουργός</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlCreators" runat="server" DataSourceID="sqldsCreators" 
                                                           selectedvalue='<%# Bind("Creator") %>'  DataTextField="FullName" DataValueField="id">
                                                        </asp:DropDownList></td>
                                                    <td class="tblDetailsHeader">Πελάτης</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlCompanies" runat="server" 
                                                           selectedvalue='<%# Bind("CustomerId") %>'  DataSourceID="sqldsCompanies" DataTextField="Name" DataValueField="Id">
                                                        </asp:DropDownList></td>
                                                    <td class="tblDetailsHeader">Project manager</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlProjectManagers" runat="server" DataSourceID="sqldsPrjManagers" 
                                                           selectedvalue='<%# Bind("ProjectManager") %>' DataTextField="FullName" DataValueField="id">
                                                        </asp:DropDownList></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Σύμβουλος1</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlConsultant1" runat="server" DataSourceID="sqldsPrjManagers" 
                                                           selectedvalue='<%# Bind("Consultant1") %>'  DataTextField="FullName" DataValueField="id">
                                                        </asp:DropDownList></td>
                                                    <td class="tblDetailsHeader">Σύμβουλος2</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlConsultant2" runat="server" DataSourceID="sqldsConsultantsNN" 
                                                           selectedvalue='<%# Bind("Consultant2") %>'  DataTextField="FullName" DataValueField="id">
                                                        </asp:DropDownList></td>
                                                    <td class="tblDetailsHeader">Πεδίο πιστοποίησης</td>
                                                    <td class="tblDetailsItem"><asp:TextBox ID="TextBox15" MaxLength="500" runat="server" SkinID="txtText" Text='<%# Bind("CertificationField") %>'></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Περιγραφή <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox10" ValidationGroup="UpdPrj" ErrorMessage="*"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegExpVal1" runat="server" ControlToValidate="TextBox10" ValidationExpression="^[\s\S]{0,500}$" ValidationGroup="UpdPrj" ErrorMessage="*"></asp:RegularExpressionValidator></td>
                                                    <td colspan="5" class="tblDetailsItem"><asp:TextBox ID="TextBox10" TextMode="MultiLine" SkinID="txtTextLong" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Έναρξη</td>
                                                    <td class="tblDetailsItem"><table><tr><td><uc1:DateBox ID="dbInitialStartDate" runat="server" Tooltip="Συμβατική ημ/νία έναρξης" Value='<%# Bind("InitialStartDate") %>' /></td><td><uc1:DateBox ID="dbStartDate" runat="server" Tooltip="Πραγματική ημ/νία έναρξης" Value='<%# Bind("StartDate") %>' /></td></tr></table></td>
                                                    <td class="tblDetailsHeader">Λήξη</td>
                                                    <td class="tblDetailsItem"><table><tr><td><uc1:DateBox ID="dbInitialEndDate" runat="server" Tooltip="Συμβατική ημ/νία λήξης" Value='<%# Bind("InitialEndDate") %>' /></td><td><uc1:DateBox ID="dbEndDate" runat="server" Tooltip="Πραγματική ημ/νία λήξης" Value='<%# Bind("EndDate") %>' /></td></tr></table></td>
                                                    <td class="tblDetailsHeader">Αρ. συναντήσεων</td>
                                                    <td class="tblDetailsItem"><asp:TextBox ID="TextBox12" MaxLength="3" runat="server" Text='<%# Bind("InitialMeetingsNo") %>'></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Κρίσιμα σημεία</td>
                                                    <td colspan="3" class="tblDetailsItem"><asp:TextBox ID="TextBox13" SkinID="txtText" MaxLength="500" runat="server" Text='<%# Bind("CriticalIssues") %>'></asp:TextBox></td>
                                                    <td class="tblDetailsHeader">Επιθυμητός φορέας</td>
                                                    <td class="tblDetailsItem"><asp:TextBox ID="TextBox14" MaxLength="50" runat="server" SkinID="txtText" Text='<%# Bind("DesiredOrganization") %>'></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Status</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlProjectStatus" runat="server" DataSourceID="objdsPrjStatus" 
                                                            selectedvalue='<%# Bind("Status") %>'  DataTextField="Description" DataValueField="id">                                                
                                                        </asp:DropDownList></td>
                                                    <td class="tblDetailsHeader">% Ολοκλήρωσης</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlPercent" runat="server" selectedvalue='<%# Bind("CompletionPercentage") %>' >
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
                                                    <td class="tblDetailsHeader">Ημ/νία τροποποίησης</td>
                                                    <td class="tblDetailsItem"></td>
                                                </tr>
                                            </table>                                        
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
						                    <table id="tblDetails">
                                                <tr>
                                                    <td class="tblDetailsHeader">Τίτλος έργου <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox9" ValidationGroup="InsGroup" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                                    <td class="tblDetailsItem" colspan="3"><asp:TextBox ID="TextBox9" MaxLength="50" SkinID="txtText" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox></td>
                                                    <td class="tblDetailsHeader">Τύπος <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="rbPrjType" ValidationGroup="InsGroup" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                                    <td class="tblDetailsItem">
                                                        <asp:RadioButtonList ID="rbPrjType" runat="server" DataSourceID="objdsPrjType" 
                                                             DataTextField="Description" DataValueField="id" RepeatDirection="Horizontal">
                                                        </asp:RadioButtonList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Κωδ. έργου <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ValidationGroup="InsGroup" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                                    <td class="tblDetailsItem"><asp:TextBox ID="TextBox1" MaxLength="10" runat="server" Text='<%# Bind("Code") %>'></asp:TextBox></td>
                                                    <td class="tblDetailsHeader">SubProject <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox2" ValidationGroup="InsGroup" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                                    <td class="tblDetailsItem"><asp:TextBox ID="TextBox2" MaxLength="10" runat="server" Text='<%# Bind("SubProject") %>'></asp:TextBox></td>
                                                    <td class="tblDetailsHeader">Datestamp</td>
                                                    <td class="tblDetailsItem"></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Δημιουργός</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlCreators" runat="server" DataSourceID="sqldsCreators" 
                                                           DataTextField="FullName" DataValueField="id">
                                                        </asp:DropDownList></td>
                                                    <td class="tblDetailsHeader">Πελάτης</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlCompanies" runat="server" 
                                                           DataSourceID="sqldsCompanies" DataTextField="Name" DataValueField="Id">
                                                        </asp:DropDownList></td>
                                                    <td class="tblDetailsHeader">Project manager</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlProjectManagers" runat="server" DataSourceID="sqldsPrjManagers" 
                                                           DataTextField="FullName" DataValueField="id">
                                                        </asp:DropDownList></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Σύμβουλος1</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlInsConsultant1" runat="server" DataSourceID="sqldsPrjManagers" 
                                                           DataTextField="FullName" DataValueField="id">
                                                        </asp:DropDownList></td>
                                                    <td class="tblDetailsHeader">Σύμβουλος2</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlInsConsultant2" runat="server" DataSourceID="sqldsConsultantsNN" 
                                                           DataTextField="FullName" DataValueField="id">
                                                        </asp:DropDownList></td>
                                                    <td class="tblDetailsHeader">Πεδίο πιστοποίησης</td>
                                                    <td class="tblDetailsItem"><asp:TextBox ID="TextBox15" MaxLength="500" runat="server" SkinID="txtText" Text='<%# Bind("CertificationField") %>'></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Περιγραφή <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox10" ValidationGroup="InsGroup" ErrorMessage="*"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegExpVal1" runat="server" ControlToValidate="TextBox10" ValidationExpression="^[\s\S]{0,500}$" ValidationGroup="InsGroup" ErrorMessage="*"></asp:RegularExpressionValidator></td>
                                                    <td colspan="5" class="tblDetailsItem"><asp:TextBox ID="TextBox10" TextMode="MultiLine" SkinID="txtTextLong" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Έναρξη</td>
                                                    <td class="tblDetailsItem"><uc1:DateBox ID="dbStartDate" runat="server" Text='<%# Today.ToString("dd/MM/yyyy") %>' /></td>
                                                    <td class="tblDetailsHeader">Συμβατική λήξη</td>
                                                    <td class="tblDetailsItem"><uc1:DateBox ID="dbEndDate" runat="server" Text='<%# Today.AddMonths(6).ToString("dd/MM/yyyy") %>' /></td>
                                                    <td class="tblDetailsHeader">Αρ. συναντήσεων</td>
                                                    <td class="tblDetailsItem"><asp:TextBox ID="TextBox12" MaxLength="3" runat="server" Text='<%# Bind("InitialMeetingsNo") %>'></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Κρίσιμα σημεία</td>
                                                    <td colspan="3" class="tblDetailsItem"><asp:TextBox ID="TextBox13" MaxLength="500" SkinID="txtText" runat="server" Text='<%# Bind("CriticalIssues") %>'></asp:TextBox></td>
                                                    <td class="tblDetailsHeader">Επιθυμητός φορέας</td>
                                                    <td class="tblDetailsItem"><asp:TextBox ID="TextBox14" MaxLength="50" runat="server" SkinID="txtText" Text='<%# Bind("DesiredOrganization") %>'></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td class="tblDetailsHeader">Status</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlProjectStatus" runat="server" DataSourceID="objdsPrjStatus" 
                                                            DataTextField="Description" DataValueField="id">                                                
                                                        </asp:DropDownList></td>
                                                    <td class="tblDetailsHeader">% Ολοκλήρωσης</td>
                                                    <td class="tblDetailsItem"><asp:DropDownList ID="ddlPercent" runat="server" selectedvalue='<%# Bind("CompletionPercentage") %>'  >
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
                                                    <td class="tblDetailsHeader">Ημ/νία τροποποίησης</td>
                                                    <td class="tblDetailsItem"></td>
                                                </tr>
                                            </table>                                        
                                        </InsertItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" ValidationGroup="UpdPrj"
                                                CommandName="Update" ImageUrl="~/Images/Icons/Save24_24.png" ToolTip="Ενημέρωση εγγραφής" />
                                            &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                                CommandName="Cancel" ImageUrl="~/Images/Icons/Cancel32_32.png" ToolTip="Ακύρωση" />
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" 
                                                CommandName="Insert" ImageUrl="~/Images/Icons/Add3_24x24.png" ToolTip="Εισαγωγή εγγραφής" ValidationGroup="InsGroup" />
                                            &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                                CommandName="Cancel" ImageUrl="~/Images/Icons/Cancel32_32.png" ToolTip="Ακύρωση" />
                                        </InsertItemTemplate>
                                        <ItemStyle CssClass="centered"/>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="false" 
                                                CommandName="Edit" ImageUrl="~/Images/Icons/Edit22_22.png" ToolTip="Διόρθωση" />
                                            &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                                CommandName="New" ImageUrl="~/Images/Icons/Add3_24x24.png" Tooltip="Νέα εγγραφή" />
                                            &nbsp;<asp:ImageButton ID="btnDeletePrj" runat="server" CausesValidation="False" 
                                                CommandName="Delete" ImageUrl="~/Images/Icons/Delete_24x24.png" ToolTip="Διαγραφή" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;<asp:ImageButton ID="btnSysDesign" runat="server" CausesValidation="False" 
                                                CommandName="SysDesign" ImageUrl="~/Images/LeftMenu/System_24x24.png" ToolTip="Μετάβαση στη σελίδα 'Σχεδιασμού Συστήματος'" />
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
                        <asp:MenuItem ImageUrl="~/Images/ActionPlanSelected5.png" Selected="true" Text="" Value="0"></asp:MenuItem>
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
                                Δεν υπάρχουν καταχωρημένες ενέργειες.<br />
                                <br />
                                <table border="1" class="TblEmptyData">
                                    <tr class="InsertTabHeader">
                                        <td></td>
                                        <td class="CommentsCol">Περιγραφή <asp:RegularExpressionValidator ID="RegExpVal1" runat="server" ControlToValidate="txtAPdesc" ValidationExpression="^[\s\S]{0,500}$" ValidationGroup="InsAP" ErrorMessage="*"></asp:RegularExpressionValidator></td>
                                        <!--<td>Type</td>-->
                                        <td>Υπεύθυνος1</td>
                                        <td>Υπεύθυνος2</td>
                                        <td>Deadline</td>
                                        <td>Status</td>
                                        <td>File</td>
                                    </tr>
                                    <tr class="InsertRow">
                                        <td class="centered"><asp:ImageButton ID="btnInsert" CausesValidation="true" runat="server" CommandName="Insert"
                                            ImageUrl="~/images/icons/add16_16.png" ToolTip="Εισαγωγή εγγραφής" ValidationGroup="InsAP" /></td>
                                        <td><asp:TextBox ID="txtAPdesc" TextMode="MultiLine" SkinID="txtTextLong" runat="server" Text='<%# Bind("Description") %>' ></asp:TextBox></td>
                                        <td><asp:DropDownList ID="ddlResp1" runat="server" DataSourceID="sqldsResponsibles" 
                                                DataTextField="FullName" DataValueField="id">
                                            </asp:DropDownList></td>
                                        <td><asp:DropDownList SkinId="ddlDef" ID="ddlResp2" runat="server" DataSourceID="sqldsResponsibles" 
                                                DataTextField="FullName" DataValueField="id">
                                            </asp:DropDownList></td>
                                        <td><uc1:DateBox ID="dbDeadline" runat="server" Value='<%# Bind("Deadline") %>' Text='<%# Today.ToString("dd/MM/yyyy") %>' /></td>
                                        <td><asp:DropDownList SkinId="ddlDef" ID="ddlActionStatus" runat="server" DataSourceID="objdsActionStatus" 
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
                                            CommandName="Edit" ImageUrl="~/Images/Icons/Edit16_16.png" ToolTip="Διόρθωση" />&nbsp;
                                        <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                            CommandName="Delete" ImageUrl="~/Images/Icons/Remove16_16.png" ToolTip="Διαγραφή" />&nbsp;
                                        <asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False" CommandArgument='<%# Bind("id") %>'
                                            CommandName="Details" ImageUrl="~/Images/Icons/Preview1_16x16.png" ToolTip="Προβολή λεπτομερειών" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" ValidationGroup="UpdAP" 
                                            CommandName="Update" ImageUrl="~/Images/Icons/Save16_16.png" ToolTip="Ενημέρωση εγγραφής" />
                                        &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                            CommandName="Cancel" ImageUrl="~/Images/Icons/Cancel16_16.png" ToolTip="Ακύρωση" />
                                    </EditItemTemplate>
                                    <FooterStyle HorizontalAlign="Center" />
                                    <FooterTemplate>
                                        <asp:ImageButton ID="btnInsert" CausesValidation="true" runat="server" CommandName="Insert"
                                            ImageUrl="~/images/icons/add16_16.png" ToolTip="Εισαγωγή εγγραφής" ValidationGroup="InsAP" />
                                    </FooterTemplate>
                                </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="Περιγραφή" SortExpression="Description">
                                        <ItemStyle CssClass="CommentsCol" />
                                        <EditItemTemplate>
                                            <asp:RegularExpressionValidator ID="RegExpVal1" runat="server" ControlToValidate="TextBox6" ValidationExpression="^[\s\S]{0,500}$" ValidationGroup="UpdAP" ErrorMessage="*"></asp:RegularExpressionValidator><asp:TextBox ID="TextBox6" TextMode="MultiLine" SkinID="txtTextLong" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:RegularExpressionValidator ID="RegExpVal1" runat="server" ControlToValidate="txtAPdesc" ValidationExpression="^[\s\S]{0,500}$" ValidationGroup="InsAP" ErrorMessage="*"></asp:RegularExpressionValidator><asp:TextBox ID="txtAPdesc" TextMode="MultiLine" SkinID="txtTextLong" runat="server" Text='<%# Bind("Description") %>' ></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Υπεύθυνος1" SortExpression="Responsible1">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlResp1" runat="server" DataSourceID="sqldsResponsibles" 
                                                selectedvalue='<%# Bind("Responsible1") %>' DataTextField="FullName" DataValueField="id">
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label18" runat="server" Text='<%# Bind("Responsible1Text") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:DropDownList ID="ddlResp1" runat="server" DataSourceID="sqldsResponsibles" 
                                                DataTextField="FullName" DataValueField="id">
                                            </asp:DropDownList>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Υπεύθυνος2" SortExpression="Responsible2">
                                        <EditItemTemplate>
                                            <asp:DropDownList SkinId="ddlDef" ID="ddlResp2" runat="server" DataSourceID="sqldsResponsibles" 
                                                selectedvalue='<%# Bind("Responsible2") %>' DataTextField="FullName" DataValueField="id">
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label19" runat="server" Text='<%# Bind("Responsible2Text") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:DropDownList SkinId="ddlDef" ID="ddlResp2" runat="server" DataSourceID="sqldsResponsibles" 
                                                DataTextField="FullName" DataValueField="id">
                                            </asp:DropDownList>
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
                                            <asp:DropDownList ID="ddlActionStatus" runat="server" DataSourceID="objdsActionStatus" 
                                                selectedvalue='<%# Bind("Status") %>' DataTextField="Description" DataValueField="id">
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label20" runat="server" Text='<%# Bind("StatusText") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:DropDownList ID="ddlActionStatus" runat="server" DataSourceID="objdsActionStatus" 
                                                DataTextField="Description" DataValueField="id">
                                            </asp:DropDownList>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="File" SortExpression="AttachmentName">
                                        <ItemTemplate> 
                                            <asp:ImageButton ID="btnDown" OnClientClick="this.form.onsubmit=''" runat="server" CommandArgument='<%# Bind("id") %>'
                                                CommandName="Download" ImageUrl="~/Images/Icons/Download_16x16.png" ToolTip='<%# Bind("AttachmentName") %>'/>
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
                                DataSourceID="sqldsMeetings" SkinID="gridviewSkinSmall" ShowFooter="false">
                                <EmptyDataTemplate>
                                <br />
                                Δεν υπάρχουν καταχωρημένες συναντήσεις για αυτό το έργο.<br />
                                <br />
                                <table border="1" class="TblEmptyData">
                                    <tr class="InsertTabHeader">
                                        <td></td>
                                        <td align="center">Έναρξη</td>
                                        <td align="center">Λήξη</td>
                                        <td class="CommentsCol">Θέμα</td>
                                        <td align="center">Σύμβουλος</td>
                                        <td align="center">Status</td>
                                        <td align="center">File</td>
                                    </tr>
                                    <tr class="InsertRow">
                                        <td class="centered"><asp:ImageButton ID="btnInsert" CausesValidation="true" runat="server" CommandName="Insert"
                                                ImageUrl="~/Images/Icons/add16_16.png" ToolTip="Εισαγωγή εγγραφής" ValidationGroup="InsMeet" /></td>
                                        <td><uc1:DateBox ID="dbTimeFrom" runat="server" ShowTime="true" Text='<%# Now.ToString("dd/MM/yyyy") %>' /></td>
                                        <td><uc1:DateBox ID="dbTimeTo" runat="server" ShowTime="true" ShowDate="false" Text='<%# Now.ToString("dd/MM/yyyy") %>' /></td>
                                        <td><asp:TextBox ID="txtMeetSubject" MaxLength="50" SkinID="txtText" runat="server" ></asp:TextBox></td>
                                        <td><asp:DropDownList SkinId="ddlDef" ID="ddlMeetCons" runat="server" DataSourceID="sqldsPrjManagers" 
                                                DataTextField="Fullname" DataValueField="id">
                                            </asp:DropDownList></td>
                                        <td><asp:DropDownList SkinId="ddlDef" ID="ddlMeetStat" runat="server" DataSourceID="objdsMeetStat" 
				                                DataTextField="Description" DataValueField="id">
				                            </asp:DropDownList></td>
                                        <td><asp:FileUpload Font-Size="8pt" ID="fuAttachment" runat="server" /></td>
                                    </tr>
                                </table>
                                </EmptyDataTemplate>
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemStyle Wrap="false" />
                                        <ItemTemplate>                
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                                CommandName="Edit" ImageUrl="~/Images/Icons/Edit16_16.png" ToolTip="Διόρθωση" /> &nbsp;
                                            <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False"
                                                CommandName="Delete" ImageUrl="~/Images/Icons/Remove16_16.png" ToolTip="Διαγραφή" /> &nbsp;
                                            <asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False" CommandArgument='<%# Bind("id") %>'
                                                CommandName="Details" ImageUrl="~/Images/Icons/Preview1_16x16.png" ToolTip="Προβολή λεπτομερειών" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" ValidationGroup="UpdMeet" 
                                                CommandName="Update" ImageUrl="~/Images/Icons/Save16_16.png" ToolTip="Ενημέρωση εγγραφής" />
                                            &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                                CommandName="Cancel" ImageUrl="~/Images/Icons/Cancel16_16.png" ToolTip="Ακύρωση" />
                                        </EditItemTemplate>
                                        <FooterStyle HorizontalAlign="Center" />
                                        <FooterTemplate>
                                            <asp:ImageButton ID="btnInsert" CausesValidation="true" runat="server" CommandName="Insert"
                                                ImageUrl="~/images/icons/add16_16.png" ToolTip="Εισαγωγή εγγραφής" ValidationGroup="InsMeet" />
                                        </FooterTemplate>
                                    </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="Έναρξη" SortExpression="TimeFrom" ItemStyle-Wrap="false">
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
                                    <asp:TemplateField HeaderText="Λήξη" SortExpression="TimeTo" ItemStyle-Wrap="false">
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
                                    <asp:TemplateField HeaderText="Θέμα" SortExpression="Subject">
                                        <ItemStyle />
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
                                    <asp:TemplateField HeaderText="Σύμβουλος" SortExpression="Consultant">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlMeetCons" runat="server" DataSourceID="sqldsPrjManagers" 
                                                selectedvalue='<%# Bind("Consultant") %>' DataTextField="Fullname" DataValueField="id">
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label21" runat="server" Text='<%# Bind("ConsultantText") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:DropDownList ID="ddlMeetCons" runat="server" DataSourceID="sqldsPrjManagers" 
                                                DataTextField="Fullname" DataValueField="id">
                                            </asp:DropDownList>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status" SortExpression="status">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlMeetStat" runat="server" DataSourceID="objdsMeetStat" 
                                                selectedvalue='<%# Bind("Status") %>' DataTextField="Description" DataValueField="id">
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label20" runat="server" Text='<%# Bind("StatusText") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:DropDownList ID="ddlMeetStat" runat="server" DataSourceID="objdsMeetStat" 
                                                DataTextField="Description" DataValueField="id">
                                            </asp:DropDownList>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="File" SortExpression="AttachmentName">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label12" runat="server" Text='<%# Bind("AttachmentName") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnMeetDown" OnClientClick="this.form.onsubmit=''" runat="server" CommandArgument='<%# Bind("id") %>'
                                                CommandName="Download" ImageUrl="~/Images/Icons/Download_16x16.png" ToolTip='<%# Bind("AttachmentName") %>'/>
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
                                DataSourceID="sqldsAttachments" SkinID="gridviewSkinSmall">
                                <EmptyDataTemplate>
                                    <br />
                                    Δεν υπάρχουν καταχωρημένα αρχεία στο συγκεκριμένο έργο.<br />
                                    <br />
                                    <table border="1" class="TblEmptyData">
                                        <tr class="InsertTabHeader">
                                            <td></td>
                                            <td>Αρχείο</td>
                                            <td>Σχόλια</td>
                                        </tr>
                                        <tr class="InsertRow">
                                            <td class="centered"><asp:ImageButton ID="btnInsert" CausesValidation="true" runat="server" CommandName="Insert"
                                                ImageUrl="~/images/icons/add16_16.png" ToolTip="Εισαγωγή εγγραφής" />
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
                                                CommandName="Edit" ImageUrl="~/Images/Icons/Edit16_16.png" ToolTip="Διόρθωση" />
                                            &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                                CommandName="Delete" ImageUrl="~/Images/Icons/Remove16_16.png" ToolTip="Διαγραφή" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" 
                                                CommandName="Update" ImageUrl="~/Images/Icons/Save16_16.png" ToolTip="Ενημέρωση εγγραφής" />
                                            &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                                CommandName="Cancel" ImageUrl="~/Images/Icons/Cancel16_16.png" ToolTip="Ακύρωση" />
                                        </EditItemTemplate>
                                        <FooterStyle HorizontalAlign="Center" />
                                        <FooterTemplate>
                                            <asp:ImageButton ID="btnInsert" CausesValidation="true" runat="server" CommandName="Insert"
                                                ImageUrl="~/images/icons/add16_16.png" ToolTip="Εισαγωγή εγγραφής" />
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
                                    <asp:TemplateField HeaderText="Αρχείο" SortExpression="AttachmentName">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDown" runat="server" Text='<%# Bind("AttachmentName") %>'></asp:Label>
                                            <asp:ImageButton ID="btnDown" OnClientClick="this.form.onsubmit=''" runat="server" CommandArgument='<%# Bind("id") %>'
                                                            CommandName="Download" ImageUrl="~/Images/Icons/Download_16x16.png" ToolTip="Πιέστε εδώ για να κατεβάσετε το αρχείο"/>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:FileUpload ID="fuCtrl" runat="server" />                                            
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Σχόλια" SortExpression="Comments">
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
                    <tr>
                        <td id="tdProgress" align="center">
                            <asp:GridView ID="gvProgress" runat="server" AllowPaging="True" ShowFooter="true" 
                                AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" 
                                DataSourceID="sqldsProgress" SkinID="gridviewSkinSmall" >
                                <EmptyDataTemplate>
                                    <br />
                                    Δεν υπάρχουν καταχωρημένες εγγραφές.<br />
                                    <br />
                                    <table border="1" class="TblEmptyData">
                                        <tr class="InsertTabHeader">
                                            <td></td>
                                            <td>Ημ/νία</td>
                                            <td>Σχολιαστής</td>
                                            <td>Σχόλιο <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtComments" ValidationGroup="InsProg" ErrorMessage="*"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegExpVal1" runat="server" ControlToValidate="txtComments" ValidationExpression="^[\s\S]{0,500}$" ValidationGroup="InsProg" ErrorMessage="*"></asp:RegularExpressionValidator></td>
                                        </tr>
                                        <tr class="InsertRow">
                                            <td class="centered"><asp:ImageButton ID="btnInsert" CausesValidation="true" runat="server" CommandName="Insert"
                                                ImageUrl="~/images/icons/add16_16.png" ToolTip="Εισαγωγή εγγραφής" ValidationGroup="InsProg" />
                                            </td>
                                            <td></td>
                                            <td><asp:DropDownList ID="ddlWriter" runat="server" DataSourceID="sqldsCreators" 
                                                    selectedvalue='<%# Session("UserId") %>'  DataTextField="FullName" DataValueField="id">
                                                </asp:DropDownList></td>
                                            <td><asp:TextBox ID="txtComments" TextMode="MultiLine" SkinID="txtTextLong" runat="server"></asp:TextBox></td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemStyle Wrap="false" />
                                        <ItemTemplate>                
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                                CommandName="Edit" ImageUrl="~/Images/Icons/Edit16_16.png" ToolTip="Διόρθωση" />
                                            &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                                CommandName="Delete" ImageUrl="~/Images/Icons/Remove16_16.png" ToolTip="Διαγραφή" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" ValidationGroup="UpdProg"
                                                CommandName="Update" ImageUrl="~/Images/Icons/Save16_16.png" ToolTip="Ενημέρωση εγγραφής" />
                                            &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                                CommandName="Cancel" ImageUrl="~/Images/Icons/Cancel16_16.png" ToolTip="Ακύρωση" />
                                        </EditItemTemplate>
                                        <FooterStyle HorizontalAlign="Center" />
                                        <FooterTemplate>
                                            <asp:ImageButton ID="btnInsert" CausesValidation="true" runat="server" CommandName="Insert"
                                                ImageUrl="~/images/icons/add16_16.png" ToolTip="Εισαγωγή εγγραφής" ValidationGroup="InsProg" />
                                        </FooterTemplate>
                                    </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="Ημ/νία" SortExpression="Datestamp">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("DateStamp", "{0:dd/MM/yyyy HH:mm}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Σχολιαστής" SortExpression="Writer">
                                        <ItemStyle CssClass="MinWidth" />
                                        <ItemTemplate>
                                            <asp:DropDownList ID="ddlWriter" runat="server" DataSourceID="sqldsCreators" 
                                                Enabled="false" selectedvalue='<%# Bind("Writer") %>' DataTextField="FullName" DataValueField="id">
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlWriter" runat="server" DataSourceID="sqldsCreators" 
                                                selectedvalue='<%# Bind("Writer") %>'  DataTextField="FullName" DataValueField="id">
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:DropDownList ID="ddlWriter" runat="server" DataSourceID="sqldsCreators" 
                                                selectedvalue='<%# Session("UserId") %>'  DataTextField="FullName" DataValueField="id">
                                            </asp:DropDownList>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Σχόλιο" SortExpression="Comments">
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Comments") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:RegularExpressionValidator ID="RegExpVal3" SkinID="revDef" runat="server" ControlToValidate="TextBox4" ValidationExpression="^[\s\S]{0,500}$" ValidationGroup="UpdProg" ErrorMessage="*"></asp:RegularExpressionValidator><asp:TextBox ID="TextBox4" TextMode="MultiLine" SkinID="txtTextLong" runat="server" Text='<%# Bind("Comments") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" SkinID="rfvDef" runat="server" ControlToValidate="txtComments" ValidationGroup="InsProg" ErrorMessage="*"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegExpVal2" SkinID="revDef" runat="server" ControlToValidate="txtComments" ValidationExpression="^[\s\S]{0,500}$" ValidationGroup="InsProg" ErrorMessage="*"></asp:RegularExpressionValidator><asp:TextBox ID="txtComments" TextMode="MultiLine" SkinID="txtTextLong" runat="server" Text='<%# Bind("Comments") %>' ></asp:TextBox>
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
    <table id="subPageDetTablePrj">
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
                    InsertCommand="INSERT INTO [Projects] ([Code], [SubProject], [Creator], [Type], [CustomerId], [InitialStartDate], [StartDate], [InitialEndDate], [EndDate], [Title], [Description], [ProjectManager], [Consultant1], [Consultant2], [InitialMeetingsNo], [CriticalIssues], [DesiredOrganization], [CertificationField], [CompletionPercentage], [Status]) VALUES (@Code, @SubProject, @Creator, @Type, @CustomerId, @InitialStartDate, @InitialStartDate, @InitialEndDate, @InitialEndDate, @Title, @Description, @ProjectManager, @Consultant1, @Consultant2, @InitialMeetingsNo, @CriticalIssues, @DesiredOrganization, @CertificationField, @CompletionPercentage, @Status)" 
                    SelectCommand="SELECT [id], [Code], [Type], [SubProject], [DateStamp], [Creator], [ModificationDate], [CustomerId], [InitialStartDate], [StartDate], [InitialEndDate], [EndDate], [Title], [Description], [ProjectManager], [Consultant1], ISNULL([Consultant2], 0) AS Consultant2, [InitialMeetingsNo], [CriticalIssues], [DesiredOrganization], [CertificationField], [CompletionPercentage], [Status]  FROM [Projects] WHERE ([id] = @id)" 
                    UpdateCommand="UPDATE [Projects] SET [Code] = @Code, [Type] = @Type, [SubProject] = @SubProject, [Creator] = @Creator, [ModificationDate] = @ModificationDate, [CustomerId] = @CustomerId, [InitialStartDate] = @InitialStartDate, [StartDate] = @StartDate, [InitialEndDate] = @InitialEndDate, [EndDate] = @EndDate, [Title] = @Title, [Description] = @Description, [ProjectManager] = @ProjectManager, [Consultant1] = @Consultant1, [Consultant2] = @Consultant2, [InitialMeetingsNo] = @InitialMeetingsNo, [CriticalIssues] = @CriticalIssues, [DesiredOrganization] = @DesiredOrganization, [CertificationField] = @CertificationField, [CompletionPercentage] = @CompletionPercentage, [Status] = @Status WHERE [id] = @id">
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
                        <asp:Parameter Name="Type" Type="Int32" />
                        <asp:Parameter Name="ModificationDate" Type="DateTime" />
                        <asp:Parameter Name="CustomerId" Type="Int32" />
                        <asp:Parameter Name="InitialStartDate" Type="DateTime" />
                        <asp:Parameter Name="StartDate" Type="DateTime" />
                        <asp:Parameter Name="InitialEndDate" Type="DateTime" />
                        <asp:Parameter Name="EndDate" Type="DateTime" />
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="ProjectManager" Type="Int32" />
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
                        <asp:Parameter Name="Type" Type="Int32" />
                        <asp:Parameter Name="CustomerId" Type="Int32" />
                        <asp:Parameter Name="InitialStartDate" Type="DateTime" />
                        <asp:Parameter Name="InitialEndDate" Type="DateTime" />
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="Description" Type="String" DefaultValue=" " />
                        <asp:Parameter Name="ProjectManager" Type="Int32" />
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
                    SelectCommand="PrjAPlist" SelectCommandType="StoredProcedure"
                    DeleteCommand="DELETE FROM [ActionPlans] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [ActionPlans] ([ProjectId], [ActionId], [Responsible1], [Responsible2], [Description], [AttachmentName], [Attachment], [Deadline], [Status], [MeetingDate]) VALUES (@ProjectId, 5, @Responsible1, @Responsible2, @Description, @AttachmentName, @Attachment, @Deadline, @Status, GetDate())" 
                    UpdateCommand="UPDATE [ActionPlans] SET [Responsible1] = @Responsible1, [Responsible2] = @Responsible2, [Description] = @Description, [Deadline] = @Deadline, [Status] = @Status WHERE [id] = @id">
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
                        <asp:Parameter Name="Responsible2" Type="Int32" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Deadline" Type="DateTime" />
                        <asp:Parameter Name="Status" Type="Byte" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ProjectId" Type="Int32" />
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
                    SelectCommand="PrjMeetlist" SelectCommandType="StoredProcedure" 
                    DeleteCommand="DELETE FROM [Meetings] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [Meetings] ([ProjectId], [TimeFrom], [TimeTo], [Kind], [Subject], [Consultant], [Comments], [NewBusiness], [AttachmentName], [Attachment], [Status]) VALUES (@ProjectId, @TimeFrom, @TimeTo, 13, @Subject, @Consultant, '', '', @AttachmentName, @Attachment, @Status)" 
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
                        <asp:Parameter Name="Subject" Type="String" DefaultValue=" " />
                        <asp:Parameter Name="Consultant" Type="Int32" />
                        <asp:Parameter Name="Status" Type="Byte" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ProjectId" Type="Int32" />
                        <asp:Parameter Name="TimeFrom" Type="DateTime" />
                        <asp:Parameter Name="TimeTo" Type="DateTime" />
                        <asp:Parameter Name="Subject" Type="String" />
                        <asp:Parameter Name="Consultant" Type="Int32" />
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
                    SelectCommand="SELECT [id], [ProjectId], [VersionNo], [Comments] FROM [SystemVersion]" 
                    DeleteCommand="DELETE FROM [SystemVersion] WHERE [ProjectId] = @ProjectId" >
                    <InsertParameters>
                        <asp:Parameter Name="ProjectId" Type="Int32" />
                    </InsertParameters>
                    <DeleteParameters>
                        <asp:ControlParameter Name="ProjectId" Type="Int32" ControlID="ddlPrjCode" PropertyName="SelectedValue" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:ObjectDataSource ID="objdsActionType" runat="server" 
                    SelectMethod="VariousTypes" TypeName="Database">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Category = 'ActionType'" Name="Category" Type="String" />
                        <asp:Parameter DefaultValue="Description" Name="OrderBy" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
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
                        <asp:Parameter DefaultValue="Advent" Name="Function" Type="String" />
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
                <asp:ObjectDataSource ID="objdsPrjStatus" runat="server" 
                    SelectMethod="VariousTypes" TypeName="Database">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Category = 'ProjectStatus'" Name="Category" Type="String" />
                        <asp:Parameter DefaultValue="Description" Name="OrderBy" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
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
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td>
                <asp:ObjectDataSource ID="objdsMeetStat" runat="server" 
                    SelectMethod="VariousTypes" TypeName="Database">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Category = 'MeetingStatus'" Name="Category" Type="String" />
                        <asp:Parameter DefaultValue="Description" Name="OrderBy" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsConsultantsNN" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="UsersByTypeNoone" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="include" Name="Function" Type="String" />
                        <asp:Parameter DefaultValue="Consultant,Partner" Name="UserType" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="sqldsProgress" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    DeleteCommand="DELETE FROM [Progress] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [Progress] ([ProjectId], [Writer], [Comments]) VALUES (@ProjectId, @Writer, @Comments)" 
                    SelectCommand="SELECT [id], [Datestamp], [ProjectId], [Writer], [Comments] FROM [Progress] WHERE ([ProjectId] = @ProjectId) ORDER BY [Datestamp] DESC" 
                    UpdateCommand="UPDATE [Progress] SET [Writer] = @Writer, [Comments] = @Comments WHERE [id] = @id">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlPrjCode" Name="ProjectId" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Writer" Type="Int32" />
                        <asp:Parameter Name="Comments" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ProjectId" Type="Int32" />
                        <asp:Parameter Name="Writer" Type="Int32" />
                        <asp:Parameter Name="Comments" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:ObjectDataSource ID="objdsPrjType" runat="server" 
                    SelectMethod="VariousTypes" TypeName="Database">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Category = 'ProjectType'" Name="Category" Type="String" />
                        <asp:Parameter DefaultValue="Description" Name="OrderBy" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsPrjManagers" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" SelectCommand="UsersByType" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="include" Name="Function" Type="String" />
                        <asp:Parameter DefaultValue="Consultant,ProjectManager,FoodDirector,OrgDirector,ITDirector" 
                            Name="UserType" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td></td>
        </tr>
    </table>
</asp:Content>

