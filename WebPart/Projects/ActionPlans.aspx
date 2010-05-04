<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="ActionPlans.aspx.vb" Inherits="ActionPlans" Theme="MainSkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script language="javascript" type="text/javascript">
    function setCaretPosition(elemId, caretPos) {
        var elem = document.getElementById(elemId);

        if (elem != null) {
            if (elem.createTextRange) {
                var range = elem.createTextRange();
                range.move('character', caretPos);
                range.select();
            }
            else {
                if (elem.selectionStart) {
                    elem.focus();
                    elem.setSelectionRange(caretPos, caretPos);
                }
                else
                    elem.focus();
            }
        }
    }

    function TestFunc(obj) {
        var mask = "__/__/____";
        var str
        if (obj.value.length > 10) {
            obj.value = obj.value.substring(0, 10);
            return
        }
        myRegExp = /[^0-9]+/g;
        str = obj.value.replace(myRegExp, "");
        var sc
        debugger        
        if (str.length < 3) {
            sc = str.length;
            str = str + mask.substring(str.length);
        } else if (str.length < 5) {
            sc = str.length + 1;
            str = str.substring(0, 2) + "/" + str.substring(2) + mask.substring(str.length + 1);
        } else {
            sc = str.length + 2;
            str = str.substring(0, 2) + "/" + str.substring(2, 4) + "/" + str.substring(4) + mask.substring(str.length + 2);
        }
        document.getElementById("inpMT").value = str;
        //obj.value = str;
        //setCaretPosition(obj.id, sc)
        setCaretPosition("inpMT", sc)
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <br />
    <br />
    <table id="subPageMainTable">
        <tr>
            <td class="title">List of Actions</td>
        </tr>
        <tr>
            <td>Write a subproject id or part of it and press &quot;Find&quot; in order to 
                filter data
                <asp:TextBox ID="txtPrjId" runat="server" SkinID="txtTextCenter"></asp:TextBox>
                &nbsp;<asp:Button ID="btnFindPrj" runat="server" Text="Find" />
            </td>
        </tr>
        <tr>
            <td id="tdAP">
                <asp:GridView ID="gvAP" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" 
                    DataSourceID="sqldsAP" SkinID="gridviewSkin">
                    <Columns>
                        <asp:BoundField DataField="A/A" HeaderText="A/A" ReadOnly="True" 
                            SortExpression="A/A" />
                        <asp:TemplateField HeaderText="SubProject" SortExpression="SubProject">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnSubProject" runat="server" CausesValidation="True" CommandArgument='<%# Bind("ProjectId") %>'
                                                CommandName="SelSubProject" Text='<%# Bind("SubProject") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Customer" HeaderText="Customer" 
                            SortExpression="Customer" />
                        <asp:BoundField DataField="ActionType" HeaderText="ActionType" 
                            SortExpression="ActionType" />
                        <asp:BoundField DataField="Comments" HeaderText="Description" 
                            SortExpression="Comments" />
                        <asp:BoundField DataField="Responsible1" HeaderText="Responsible1" 
                            SortExpression="Responsible1" ReadOnly="True" />
                        <asp:BoundField DataField="Responsible2" HeaderText="Responsible2" 
                            ReadOnly="True" SortExpression="Responsible2" />
                        <asp:TemplateField HeaderText="AttachmentName" SortExpression="AttachmentName">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnDown" runat="server" CausesValidation="True" CommandArgument='<%# Bind("id") %>'
                                                CommandName="Download" Text='<%# Bind("AttachmentName") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Deadline *" HeaderStyle-Wrap="false" SortExpression="Deadline">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Deadline", "{0:dd/MM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>

                        <HeaderStyle Wrap="False"></HeaderStyle>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Status" HeaderText="Status" 
                            SortExpression="Status" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td align="right">(*): Default ordering</td>
        </tr>
        <tr>
            <td>
                <!--
                <asp:TextBox ID="txtMaskedText" onkeyup="TestFunc(this)" runat="server"></asp:TextBox>
                <input id="inpMT" type="text" /> 
                -->
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:SqlDataSource ID="sqldsAP" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="ActionPlanList" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserId" SessionField="UserId" Type="Int16" />
                        <asp:ControlParameter ControlID="txtPrjId" Name="SubProject" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
            <td></td>
            <td></td>
        </tr>
    </table>
</asp:Content>

