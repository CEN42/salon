<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Stylists.aspx.cs" Inherits="Manager.Stylists" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" OnInserting ="SqlDataSource1_Inserting"
        ConnectionString="<%$ ConnectionStrings:EZ SnipsConnectionString %>"
        SelectCommand="SELECT * FROM [StylistProfileInfoes]" DeleteCommand="DELETE FROM [StylistProfileInfoes] WHERE [Id] = @Id" InsertCommand="INSERT INTO [StylistProfileInfoes] ([FirstName], [LastName], [Email], [PhoneNumber]) VALUES (@FirstName, @LastName, @Email, @PhoneNumber)" UpdateCommand="UPDATE [StylistProfileInfoes] SET [FirstName] = @FirstName, [LastName] = @LastName, [Email] = @Email, [PhoneNumber] = @PhoneNumber WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="PhoneNumber" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="PhoneNumber" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <h2 class="text-center" style="color:white"><strong>Stylists</strong></h2>

    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" ShowFooter="true" OnRowCommand="GridView1_RowCommand" HorizontalAlign="Center">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
 
    <asp:TemplateField HeaderText="ID">
    <ItemTemplate><%# Eval("Id") %></ItemTemplate>
    <EditItemTemplate>
    <asp:TextBox runat="server" ID="styleID" Text='<%# Bind("Id")%>' />
    </EditItemTemplate>
    <FooterTemplate>
    <asp:TextBox runat="server" ID="txtID" Text='' />
    </FooterTemplate>
    </asp:TemplateField>
 
    <asp:TemplateField HeaderText="First Name">
    <ItemTemplate><%# Eval("FirstName") %></ItemTemplate>
    <EditItemTemplate>
    <asp:TextBox runat="server" ID="styleFirst" Text='<%# Bind("FirstName")%>' />
    </EditItemTemplate>
    <FooterTemplate>
    <asp:TextBox runat="server" ID="txtFirst" Text='' />
    </FooterTemplate>
    </asp:TemplateField>
 
    <asp:TemplateField HeaderText="Last Name">
    <ItemTemplate><%# Eval("LastName") %></ItemTemplate>
    <EditItemTemplate>
    <asp:TextBox runat="server" ID="styleLast" Text='<%# Bind("LastName")%>' />
    </EditItemTemplate>
    <FooterTemplate>
    <asp:TextBox runat="server" ID="txtLast" Text='' />
    </FooterTemplate>
    </asp:TemplateField>
 
    <asp:TemplateField HeaderText="Email">
    <ItemTemplate><%# Eval("Email") %></ItemTemplate>
    <EditItemTemplate>
    <asp:TextBox runat="server" ID="styleEmail" Text='<%# Bind("Email")%>' />
    </EditItemTemplate>
    <FooterTemplate>
    <asp:TextBox runat="server" ID="txtEmail" Text='' />
    </FooterTemplate>
    </asp:TemplateField>

    <asp:TemplateField HeaderText="Phone Number">
    <ItemTemplate><%# Eval("PhoneNumber") %></ItemTemplate>
    <EditItemTemplate>
    <asp:TextBox runat="server" ID="stylePhone" Text='<%# Bind("PhoneNumber")%>' />
    </EditItemTemplate>
    <FooterTemplate>
    <asp:TextBox runat="server" ID="txtPhone" Text='' />
    </FooterTemplate>
    </asp:TemplateField>
 
    <asp:TemplateField HeaderText="Action">
    <ItemTemplate>
    <asp:Button runat="server" ID="cmdEdit" Text="Edit" CommandName="Edit" />
    <asp:Button runat="server" ID="cmdDelete" OnClientClick="return confirm('Are you sure to delete')" Text="Delete" CommandName="Delete" />
    </ItemTemplate>
    <EditItemTemplate>
    <asp:Button runat="server" ID="cmdUpdate" Text="Update" CommandName="Update" />
    <asp:Button runat="server" ID="cmdCancel" Text="Cancel" CommandName="Cancel" />
    </EditItemTemplate>
    <FooterTemplate>
    <asp:Button runat="server" ID="cmdAdd" Text="Add Stylist" CommandName="New" />
    </FooterTemplate>
    </asp:TemplateField>
    </Columns>
 
        <EditRowStyle BackColor="#999999" />
 
    <EmptyDataTemplate>
        <table>
        <tr style="background:#FF6600;color:White"><th>ID</th><th>First Name
        </th><th>Last Name</th><th>Email</th><th>Phone Number</th><th>Action</th></tr>
        <tr>
        <td><asp:TextBox runat="server" ID="txtID" /></td>
        <td><asp:TextBox runat="server" ID="txtFirst" /></td>
        <td><asp:TextBox runat="server" ID="txtLast" /></td>
        <td><asp:TextBox runat="server" ID="txtEmail" /></td>
        <td><asp:TextBox runat="server" ID="txtPhone" /></td>
        <td><asp:Button runat="server" ID="cmdAdd" Text="Add Stylist" CommandName="EmptyNew" /></td>
        </tr>
        </table>
    </EmptyDataTemplate>

 
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

 
</asp:GridView>
    </asp:Content>