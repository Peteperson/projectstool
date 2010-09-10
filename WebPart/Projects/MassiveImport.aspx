<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="MassiveImport.aspx.vb" Inherits="MassiveImport" Theme="MainSkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script language="javascript" type="text/javascript">
        function ShowStatValue(obj) {
            document.getElementById("lblStatusId").value = obj.value;
        }

        function ShowPrjValue(obj) {
            document.getElementById("lblProjectId").value = obj.value;
        }

        function ShowUserValue(obj) {
            document.getElementById("lblUserId").value = obj.value;
        }

        function ShowValue(obj, lbl) {
            document.getElementById(lbl).value = obj.value;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br />
    <table id="subPageMainTable">
        <tr>
            <td class="title">Μαζική εισαγωγή action plan</td>
        </tr>
        <tr>
            <td id="tdBelowTitle"><img alt="info" src="Images/Icons/Logs_24x24.png" />: Κάντε 
                paste τα data από το excel στο παρακάτω textbox και πατήστε &#39;Import Data&#39;. Τα data πρέπει να είναι τής μορφής: 
                <b>subprojectId</b>&lt;tab&gt;<b>περιγραφή</b>&lt;tab&gt;<b>υπεύθυνος1(id)</b>&gt;<b>υπεύθυνος2(id)</b>&lt;tab&gt;<b>deadline</b>&lt;tab&gt;<b>statusId</b>&lt;tab&gt;<b>σχόλια</b>. 
                <br />Μπορείτε να βρείτε τα projectId, υπεύθυνος1, υπεύθυνος2 και status με τη βοήθεια των παρακάτω controls.</td>
        </tr>
        <tr>
            <td align="center">
                <table cellpadding="3px" style="text-align:left">
                    <tr>
                        <td>SubProject:</td>
                        <td>
                            <asp:DropDownList ID="ddlProjects" runat="server" DataSourceID="sqldsProjects" 
                                DataTextField="SubProject" DataValueField="id" AutoPostBack="True">
                            </asp:DropDownList>
                        </td>
                        <td>id = </td>
                        <td><input id="lblProjectId" runat="server" class="lblHelpIds" type="text" readonly="readonly" /></td>
                    </tr>
                    <tr>
                        <td>Status</td>
                        <td>
                            <asp:DropDownList ID="ddlStatus" onchange="ShowValue(this, 'lblStatusId')" runat="server" DataSourceID="sqldsStatus" 
                                DataTextField="Description" DataValueField="id">
                            </asp:DropDownList>
                        </td>
                        <td>id =</td>
                        <td><input id="lblStatusId" class="lblHelpIds" type="text" readonly="readonly" /></td>
                    </tr>
                    <tr>
                        <td>User</td>
                        <td><asp:DropDownList ID="ddlUsers" onchange="ShowValue(this, 'lblUserId')" 
                                runat="server" DataSourceID="sqldsResponsibles" DataTextField="FullName" 
                                DataValueField="id" Font-Size="8pt">
                            </asp:DropDownList></td>
                        <td>id =</td>
                        <td><input id="lblUserId" class="lblHelpIds" type="text" readonly="readonly" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:TextBox ID="txtData" runat="server" TextMode="MultiLine" 
                    CssClass="txtMassiveImport" Wrap="false"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="btnImport" runat="server" Text="Import data" />
            </td>
        </tr>
        <tr>
            <td>Results :</td>
        </tr>
        <tr>
            <td align="center" style="border: solid 1px white">
                <div ID="lblResults" runat="server" style="min-height:15px;text-align:left; max-height: 150px; overflow:auto;"></div>
            </td>
        </tr>
        <tr>
            <td align="center"></td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:SqlDataSource ID="sqldsAP" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="SELECT TOP 10 * FROM [ActionPlans]" 
                    InsertCommand="INSERT INTO [ActionPlans] ([ProjectId], [ActionId], [Description], [Responsible1], [Responsible2], [Deadline], [Status], [Comments]) VALUES (@ProjectId, 5, @Description, @Responsible1, @Responsible2, @Deadline, @Status, @Comments)">
                    <InsertParameters>
                        <asp:Parameter Name="ProjectId" Type="Int32" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Responsible1" Type="Int32" />
                        <asp:Parameter Name="Responsible2" Type="Int32" />
                        <asp:Parameter Name="Deadline" Type="DateTime" />
                        <asp:Parameter Name="Status" Type="Int16" />
                        <asp:Parameter Name="Comments" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsProjects" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" SelectCommand="ProjectList" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserId" SessionField="UserId" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsStatus" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="TypesByCategory" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="ActionStatus" Name="Category" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="sqldsResponsibles" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="GetResponsible" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlProjects" Name="ProjectId" 
                            PropertyName="SelectedValue" Type="Int16" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

