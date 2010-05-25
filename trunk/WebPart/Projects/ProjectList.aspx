<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="ProjectList.aspx.vb" Inherits="ProjectList" Theme="MainSkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br />
    <table id="subPageMainTable">
        <tr>
            <td class="title">Project list</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="centered">Write a subproject id or part of it and press &quot;Find&quot; in order to filter data
                <asp:TextBox ID="txtPrjId" runat="server" SkinID="txtTextCenter"></asp:TextBox>
                &nbsp;<asp:Button ID="btnFindPrj" runat="server" Text="Find" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <table style="border: solid 1px white">
                    <tr>
                        <td align="center">Exclude status:</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButtonList ID="rblStatus" runat="server" RepeatDirection="Horizontal" 
                                DataSourceID="sqldsPrjStatus" DataTextField="Description" 
                                DataValueField="id" AutoPostBack="True">
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td align="center"><asp:Button ID="btnClearFilter" runat="server" Text="Remove filtering" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td id="tdMeetings">
                <asp:GridView ID="gvProjects" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" 
                    DataSourceID="sqldsProjects" SkinID="gridviewSkinList">
                    <Columns>
                        <asp:BoundField DataField="A/A" HeaderText="A/A" ReadOnly="True" 
                            SortExpression="A/A" />
                        <asp:BoundField DataField="Code" HeaderText="Code" 
                            SortExpression="Code" />
                        <asp:TemplateField HeaderText="SubProject" SortExpression="SubProject">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnSubProject" runat="server" CausesValidation="True" CommandArgument='<%# Bind("ProjectId") %>'
                                                CommandName="SelSubProject" Text='<%# Bind("SubProject") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Title" HeaderText="Title" 
                            SortExpression="Title" />
                        <asp:TemplateField HeaderText="Customer" SortExpression="Customer">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnCust" runat="server" CommandArgument='<%# Bind("Customer") %>'
                                                CommandName="SelCompany" Text='<%# Bind("Customer") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Supervisor" HeaderText="Supervisor" ReadOnly="True" 
                            SortExpression="Supervisor" />
                        <asp:BoundField DataField="Consultant" HeaderText="Consultant" 
                            SortExpression="Consultant" ReadOnly="True" />
                        <asp:BoundField DataField="InitialEndDate" HeaderText="InitialEndDate" 
                            SortExpression="InitialEndDate" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField DataField="CompletionPercentage" HeaderText="(%)" 
                            SortExpression="CompletionPercentage" />
                        <asp:BoundField DataField="Status" HeaderText="Status" 
                            SortExpression="Status" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td align="right">(*): Default ordering</td>
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
                        <asp:ControlParameter ControlID="txtPrjId" Name="SubProject" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="rblStatus" DefaultValue="0" Name="Status" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsPrjStatus" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="TypesByCategory" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="ProjectStatus" Name="Category" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td></td>
            <td></td>
        </tr>
    </table>
</asp:Content>

