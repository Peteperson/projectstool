<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="ProjectList.aspx.vb" Inherits="ProjectList" Theme="MainSkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br />
    <br />
    <table id="subPageMainTable">
        <tr>
            <td class="title">Meetings</td>
        </tr>
        <tr>
            <td id="tdMeetings">
                <asp:GridView ID="gvProjects" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" 
                    DataSourceID="sqldsProjects" SkinID="gridviewSkinSmall">
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
                        <asp:BoundField DataField="Supervisor" HeaderText="Supervisor" ReadOnly="True" 
                            SortExpression="Supervisor" />
                        <asp:BoundField DataField="Consultant" HeaderText="Consultant" 
                            SortExpression="Consultant" ReadOnly="True" />
                        <asp:BoundField DataField="InitialEndDate" HeaderText="InitialEndDate" 
                            SortExpression="InitialEndDate" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField DataField="CompletionPercentage" HeaderText="Completion (%)" 
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
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
    </table>
</asp:Content>

