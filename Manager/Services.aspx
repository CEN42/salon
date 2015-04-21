<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="Manager.Services" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" OnInserting ="SqlDataSource1_Inserting"
        ConnectionString="<%$ ConnectionStrings:EZ SnipsConnectionString %>"
        DeleteCommand="DELETE FROM [Services] WHERE [serviceid] = @serviceid"
        InsertCommand="INSERT INTO [Services] ([serviceid], [servicetitle], [servicedesc], [amount]) VALUES (@serviceid, @servicetitle, @servicedesc, @amount)"
        SelectCommand="SELECT * FROM [Services]" UpdateCommand="UPDATE [Services] SET [servicetitle] = @servicetitle, [servicedesc] = @servicedesc, [amount] = @amount WHERE [serviceid] = @serviceid">
        <DeleteParameters>
            <asp:Parameter Name="serviceid" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="serviceid" Type="Int32" />
            <asp:Parameter Name="servicetitle" Type="String" />
            <asp:Parameter Name="servicedesc" Type="String" />
            <asp:Parameter Name="amount" Type="Double" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="servicetitle" Type="String" />
            <asp:Parameter Name="servicedesc" Type="String" />
            <asp:Parameter Name="amount" Type="Double" />
            <asp:Parameter Name="serviceid" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <h2 class="text-center" style="color:white"><strong>Services</strong></h2>

    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="serviceID" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" ShowFooter="true" OnRowCommand="GridView1_RowCommand" HorizontalAlign="Center">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
 
    <asp:TemplateField HeaderText="ID">
    <ItemTemplate><%# Eval("serviceid") %></ItemTemplate>
    <EditItemTemplate>
    <asp:TextBox runat="server" ID="servID" Text='<%# Bind("serviceid")%>' />
    </EditItemTemplate>
    <FooterTemplate>
    <asp:TextBox runat="server" ID="txtID" Text='' />
    </FooterTemplate>
    </asp:TemplateField>
 
    <asp:TemplateField HeaderText="Title">
    <ItemTemplate><%# Eval("servicetitle") %></ItemTemplate>
    <EditItemTemplate>
    <asp:TextBox runat="server" ID="servTitle" Text='<%# Bind("servicetitle")%>' />
    </EditItemTemplate>
    <FooterTemplate>
    <asp:TextBox runat="server" ID="txtTitle" Text='' />
    </FooterTemplate>
    </asp:TemplateField>
 
    <asp:TemplateField HeaderText="Description">
    <ItemTemplate><%# Eval("servicedesc") %></ItemTemplate>
    <EditItemTemplate>
    <asp:TextBox runat="server" ID="servDescription" Text='<%# Bind("servicedesc")%>' />
    </EditItemTemplate>
    <FooterTemplate>
    <asp:TextBox runat="server" ID="txtDescription" Text='' />
    </FooterTemplate>
    </asp:TemplateField>
 
    <asp:TemplateField HeaderText="Amount">
    <ItemTemplate><%# Eval("amount") %></ItemTemplate>
    <EditItemTemplate>
    <asp:TextBox runat="server" ID="servAmount" Text='<%# Bind("amount")%>' />
    </EditItemTemplate>
    <FooterTemplate>
    <asp:TextBox runat="server" ID="txtAmount" Text='' />
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
    <asp:Button runat="server" ID="cmdAdd" Text="Add Service" CommandName="New" />
    </FooterTemplate>
    </asp:TemplateField>
    </Columns>
 
        <EditRowStyle BackColor="#999999" />
 
    <EmptyDataTemplate>
        <table>
        <tr style="background:#FF6600;color:White"><th>ID</th><th>Title
        </th><th>Description</th><th>Amount</th><th>Action</th></tr>
        <tr>
        <td><asp:TextBox runat="server" ID="txtID" /></td>
        <td><asp:TextBox runat="server" ID="txtTitle" /></td>
        <td><asp:TextBox runat="server" ID="txtDescription" /></td>
        <td><asp:TextBox runat="server" ID="txtAmount" /></td>
        <td><asp:Button runat="server" ID="cmdAdd" Text="Add Service" CommandName="EmptyNew" /></td>
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