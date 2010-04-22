<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false" CodeFile="Error.aspx.vb" Inherits="Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <h3>An error has occured: <asp:Label ID="lblError" runat="server" Text="error" CssClass="ErrorMessage"></asp:Label>.
    </h3>
</asp:Content>

