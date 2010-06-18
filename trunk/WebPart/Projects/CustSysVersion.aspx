﻿<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="CustSysVersion.aspx.vb" Inherits="CustSysVersion" Theme="MainSkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br />
    <table id="subPageMainTable">
        <tr>
            <td class="title">System design</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="centered" style="padding-bottom:5px">In case of multiple projects, select one from the list:
                <asp:DropDownList ID="ddlPrjCode" runat="server" DataSourceID="sqldsPrjCodes" 
                    DataTextField="SubProject" DataValueField="id" AutoPostBack="True">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="padding-top: 40px">&nbsp;</td>
        </tr>
        <tr class="title">
            <td>Processes</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gvProcesses" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" DataKeyNames="id" 
                    DataSourceID="sqldsProcesses" SkinID="gridviewSkin">
                    <Columns>
                        <asp:BoundField DataField="Code" HeaderText="Code" SortExpression="Code" />
                        <asp:BoundField DataField="Description" HeaderText="Description" 
                            SortExpression="Description" />
                        <asp:BoundField DataField="Status" HeaderText="Status" 
                            SortExpression="Status" />
                        <asp:BoundField DataField="StatusDate" HeaderText="StatusDate" 
                            SortExpression="StatusDate" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField DataField="Responsible" HeaderText="Responsible" 
                            ReadOnly="True" SortExpression="Responsible" />
                        <asp:BoundField DataField="Comments" HeaderText="Comments" 
                            SortExpression="Comments" />
                    </Columns>
                </asp:GridView>
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
                &nbsp;</td>
            <td>
                <asp:SqlDataSource ID="sqldsProcesses" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    DeleteCommand="DELETE FROM [Processes] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [Processes] ([SystemVersionId], [Code], [Description], [Status], [StatusDate], [Responsible], [Comments]) VALUES (@SystemVersionId, @Code, @Description, @Status, @StatusDate, @Responsible, @Comments)" 
                    SelectCommand="CustProcesses" 
                    
                    UpdateCommand="UPDATE [Processes] SET [SystemVersionId] = @SystemVersionId, [Code] = @Code, [Description] = @Description, [Status] = @Status, [StatusDate] = @StatusDate, [Responsible] = @Responsible, [Comments] = @Comments WHERE [id] = @id" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlPrjCode" Name="ProjectId" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="SystemVersionId" Type="Int16" />
                        <asp:Parameter Name="Code" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Status" Type="Int32" />
                        <asp:Parameter Name="StatusDate" DbType="DateTime" />
                        <asp:Parameter Name="Responsible" Type="Int32" />
                        <asp:Parameter Name="Comments" Type="String" DefaultValue=" " />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="SystemVersionId" Type="Int16" />
                        <asp:Parameter Name="Code" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Status" Type="Int32" />
                        <asp:Parameter Name="StatusDate" DbType="DateTime" />
                        <asp:Parameter Name="Responsible" Type="Int32" />
                        <asp:Parameter Name="Comments" Type="String" DefaultValue=" " />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>&nbsp;</td>
            <td>
                &nbsp;</td>
            <td></td>
        </tr>
    </table>
</asp:Content>
