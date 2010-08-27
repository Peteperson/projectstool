﻿<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="ProjectList.aspx.vb" Inherits="ProjectList" Theme="MainSkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br />
    <table id="subPageMainTable">
        <tr>
            <td class="title">
                <table style="width:100%">
                    <tr>
                        <td><asp:ImageButton ID="btnRemovePaging1" ImageUrl="~/Images/Paging3_32x32.png" runat="server" ToolTip="Ενεργοποίηση/Απενεργοποίηση σελιδοποίησης" /></td>
                        <td style="width:100%" align="center">Λίστα Έργων</td>
                        <td><asp:ImageButton ID="btnPrint" runat="server" ToolTip="Εκτύπωση σελίδας" 
                                ImageUrl="~/Images/Icons/Print1_32x32.png" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td id="tdBelowTitle">
                <img alt="info" src="Images/Icons/Logs_24x24.png" />:
                Συμπληρώστε τον κωδικό τού έργου ή τον τίτλο του και πατήστε 
                &quot;Αναζήτηση&quot; προκειμένου να φιλτράρετε τα αποτελέσματα:<br />
                Subproject:
                <asp:TextBox ID="txtPrjId" runat="server" SkinID="txtTextCenter"></asp:TextBox>
                &nbsp;&nbsp;Τίτλος έργου:
                <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>&nbsp;&nbsp;
                <asp:Button ID="btnFindPrj" runat="server" Text="Αναζήτηση" /><br />
                <div style="height: 5px"></div>
                <table id="tblStatus" style="width: 100%">
                    <tr>
                        <td class="ShowStatus">Προβολή έργων που βρίσκονται σε κατάσταση:</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButtonList ID="rblStatus" runat="server" RepeatDirection="Horizontal" 
                                DataSourceID="sqldsPrjStatus" DataTextField="Description" 
                                DataValueField="id" AutoPostBack="True" RepeatColumns="5">
                            </asp:RadioButtonList>
                        </td>
                        <td valign="bottom" align="right"><asp:Button ID="btnClearFilter" runat="server" Text="Remove filtering" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td id="tdMeetings">
                <asp:GridView ID="gvProjects" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" 
                    DataSourceID="sqldsProjects" SkinID="gridviewSkinList" ShowFooter="True">
                    <Columns>
                        <asp:BoundField DataField="A/A" HeaderText="A/A" ReadOnly="True" 
                            SortExpression="A/A" />
                        <asp:BoundField DataField="Code" HeaderText="Κωδικός" 
                            SortExpression="Code" />
                        <asp:TemplateField HeaderText="SubProject" SortExpression="SubProject">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnSubProject" runat="server" CausesValidation="True" CommandArgument='<%# Bind("ProjectId") %>'
                                                CommandName="SelSubProject" Text='<%# Bind("SubProject") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Title" HeaderText="Τίτλος έργου" 
                            SortExpression="Title" />
                        <asp:TemplateField HeaderText="Πελάτης" SortExpression="Customer">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnCust" runat="server" CommandArgument='<%# Bind("Customer") %>'
                                                CommandName="SelCompany" Text='<%# Bind("Customer") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Supervisor" HeaderText="Project manager" ReadOnly="True" 
                            SortExpression="Supervisor" />
                        <asp:BoundField DataField="Consultant" HeaderText="Σύμβουλος" 
                            SortExpression="Consultant" ReadOnly="True" />
                        <asp:TemplateField HeaderText="Λήξη" SortExpression="InitialEndDate">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("InitialEndDate", "{0:dd/MM/yyyy}") %>' ToolTip='<%# Bind("EndDate", "Πραγματική ημ/νία λήξης: {0:dd/MM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="CompletionPercentage" HeaderText="(%)" 
                            SortExpression="CompletionPercentage" />
                        <asp:TemplateField HeaderText="Status" SortExpression="Status">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="ddlPrjStatus" Font-Size="8pt" runat="server" DataSourceID="sqldsPrjStatus" 
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
                                <asp:CheckBox id="chkSelected" runat="server"></asp:CheckBox>
                                <asp:Label ID="lblId" runat="server" Text='<%# Bind("ProjectId") %>' Visible="false"></asp:Label>
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
        </tr>-->
    </table>
    <table>
        <tr>
            <td>
                <asp:SqlDataSource ID="sqldsProjects" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="ProjectsList" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserId" SessionField="UserId" Type="Int16" />
                        <asp:ControlParameter ControlID="txtPrjId" Name="SubProject" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtTitle" Name="Title" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="rblStatus" DefaultValue="0" Name="Status" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsPrjStatus" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="TypesByCategory" SelectCommandType="StoredProcedure"
                    UpdateCommand="UPDATE [Projects] SET [Status] = @Status WHERE id = @id">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="ProjectStatus" Name="Category" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Status" Type="Int16" />
                        <asp:Parameter Name="id" Type="Int16" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td></td>
            <td></td>
        </tr>
    </table>
</asp:Content>

