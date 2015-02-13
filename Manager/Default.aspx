<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Manager._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1 style="color:white"><img runat="server" src="~/Pictures/stock-vector-hair-scissors-icon-128209862_clipped_rev_1_clipped_rev_3.png" style="width:600px; height:300px" /> EZ Snips</h1>
        <p class="lead" style="color:white">Browse and select your salon/spa to go to the corresponding login in order to use EZ Snips' management tools.</p>
         <asp:DropDownList ID="SalonList" runat="server">
            <asp:ListItem>Search:</asp:ListItem>
            <asp:ListItem>Diego&#39;s Salon and Spa</asp:ListItem>
            <asp:ListItem>MasterCuts</asp:ListItem>
            <asp:ListItem>SuperCuts</asp:ListItem>
        </asp:DropDownList>
        <asp:Button CssClass="btn btn-primary btn-lg" runat="server" Text="Go &raquo;" OnClick="LoginGo_Click" />
    </div>


</asp:Content>
