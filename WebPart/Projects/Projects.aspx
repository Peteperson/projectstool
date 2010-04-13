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
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Menu ID="mnuProjects" Width="168px" runat="server" Orientation="Horizontal"
                    StaticEnableDefaultPopOutImage="False" BackColor="Tan" ForeColor="Black" OnMenuItemClick="mnuProjects_MenuItemClick" StaticMenuItemStyle-CssClass="MenuItem" StaticHoverStyle-CssClass="SelectedMenuItem">
                <Items>
                    <asp:MenuItem ImageUrl="~/Images/Icons/Action_32x32.png" 
                                  Text="Action Plan" Value="0"></asp:MenuItem>
                    <asp:MenuItem ImageUrl="~/Images/Icons/Meetings3_32x32.png" 
                                  Text="Meetings" Value="1"></asp:MenuItem>
                    <asp:MenuItem ImageUrl="~/Images/Icons/Files232x32.png" 
                                  Text="Attachments" Value="2"></asp:MenuItem>
                </Items>
            </asp:Menu></td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:SqlDataSource ID="sqldsProjects" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    DeleteCommand="DELETE FROM [Employees] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [Employees] ([EmployeeType], [FirstName], [LastName], [Hired], [Active]) VALUES (@EmployeeType, @FirstName, @LastName, @Hired, @Active)" 
                    SelectCommand="SELECT * FROM [Employees]" 
                    
                    
                    
                    UpdateCommand="UPDATE [Employees] SET [EmployeeType] = @EmployeeType, [FirstName] = @FirstName, [LastName] = @LastName, [Hired] = @Hired, [Active] = @Active WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="EmployeeType" Type="Byte" />
                        <asp:Parameter Name="FirstName" Type="String" />
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="Hired" DbType="Date" />
                        <asp:Parameter Name="Active" Type="Boolean" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="EmployeeType" Type="Byte" />
                        <asp:Parameter Name="FirstName" Type="String" />
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="Hired" DbType="Date" />
                        <asp:Parameter Name="Active" Type="Boolean" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
            <td>
                <asp:SqlDataSource ID="sqldsType" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:cnMain %>" 
                    SelectCommand="SELECT [id], [Description] FROM [VariousTypes] WHERE ([Category] = @Category)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="ProjectTabs" Name="Category" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td></td>
        </tr>
    </table>
</asp:Content>

