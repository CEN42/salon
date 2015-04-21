<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Clients.aspx.cs" Inherits="Manager.Clients" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        OnInserting="SqlDataSource1_Inserting"
        ConnectionString="<%$ ConnectionStrings:EZ_SnipsConnectionString %>"
        SelectCommand="SELECT * FROM [Customers]"
        DeleteCommand="DELETE FROM [Customers] WHERE [userid] = @userid"
        InsertCommand="INSERT INTO [Customers] ([lastname], [firstname],
            [email], [rewards], [phonenumber]) VALUES (@lastname, @firstname,
            @email, @rewards, @phonenumber)"
        UpdateCommand="UPDATE [Customers] SET [lastname] = @lastname,
            [firstname] = @firstname, [email] = @email, [rewards] = @rewards,
            [phonenumber] = @phonenumber WHERE [userid] = @userid">
        <DeleteParameters>
            <asp:Parameter Name="userid" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="lastname" Type="String" />
            <asp:Parameter Name="firstname" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="rewards" Type="Int32" />
            <asp:Parameter Name="phonenumber" Type="Int64" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="lastname" Type="String" />
            <asp:Parameter Name="firstname" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="rewards" Type="Int32" />
            <asp:Parameter Name="phonenumber" Type="Int64" />
            <asp:Parameter Name="userid" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="LoginTable" runat="server"
        OnInserting="LoginTable_Inserting"
        ConnectionString="<%$ ConnectionStrings:EZ_SnipsConnectionString %>"
        DeleteCommand="DELETE FROM [Login.tbl] WHERE [email] = @email"
        InsertCommand="INSERT INTO [Login.tbl] ([email], [password]) VALUES
            (@email, @password)" SelectCommand="SELECT * FROM [Login.tbl]"
        UpdateCommand="UPDATE [Login.tbl] SET [password] = @password WHERE
            [email] = @email">
        <DeleteParameters>
            <asp:Parameter Name="email" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="password" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="email" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <h2 class="text-center" style="color:white"><strong>Customers</strong></h2>

    <asp:GridView ID="GridView1" runat="server" AllowSorting="True"
        AutoGenerateColumns="False" DataKeyNames="userid" CellPadding="4"
        DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None"
        ShowFooter="True" OnRowCommand="GridView1_RowCommand"
        HorizontalAlign="Center">
        
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        
        <Columns>
 
        <asp:TemplateField HeaderText="User ID">
            <ItemTemplate><%# Eval("userid") %></ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox runat="server" ID="custID"
                    Text='<%# Bind("userid")%>' />
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox runat="server" ID="txtID" Text='' />
            </FooterTemplate>
        </asp:TemplateField>
 
        <asp:TemplateField HeaderText="Last Name">
            <ItemTemplate><%# Eval("lastname") %></ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox runat="server" ID="custLast"
                    Text='<%# Bind("lastname")%>' />
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox runat="server" ID="txtLast" Text='' />
            </FooterTemplate>
        </asp:TemplateField>
 
        <asp:TemplateField HeaderText="First Name">
            <ItemTemplate><%# Eval("firstname") %></ItemTemplate>
                <EditItemTemplate>
            <asp:TextBox runat="server" ID="custFirst"
                Text='<%# Bind("firstname")%>' />
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox runat="server" ID="txtFirst" Text='' />
            </FooterTemplate>
        </asp:TemplateField>
 
        <asp:TemplateField HeaderText="Email">
            <ItemTemplate><%# Eval("email") %></ItemTemplate>
                <EditItemTemplate>
            <asp:TextBox runat="server" ID="custEmail"
                Text='<%# Bind("email")%>' />
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox runat="server" ID="txtEmail" Text='' />
            </FooterTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Reward Points">
            <ItemTemplate><%# Eval("rewards") %></ItemTemplate>
                <EditItemTemplate>
            <asp:TextBox runat="server" ID="custReward"
                Text='<%# Bind("rewards")%>' />
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox runat="server" ID="txtRewards" Text='' />
            </FooterTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Phone Number">
            <ItemTemplate><%# Eval("phonenumber") %></ItemTemplate>
                <EditItemTemplate>
            <asp:TextBox runat="server" ID="custPhone"
                Text='<%# Bind("phonenumber")%>' />
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox runat="server" ID="txtPhone" Text='' />
            </FooterTemplate>
        </asp:TemplateField>
 
        <asp:TemplateField HeaderText="Action">
            <ItemTemplate>
                <asp:Button runat="server" ID="cmdEdit" Text="Edit"
                    CommandName="Edit" />
                <asp:Button runat="server" ID="cmdDelete"
                    OnClientClick="return confirm('Are you sure you want to delete?')"
                    Text="Delete" CommandName="Delete" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:Button runat="server" ID="cmdUpdate" Text="Update"
                    CommandName="Update" />
                <asp:Button runat="server" ID="cmdCancel" Text="Cancel"
                    CommandName="Cancel" />
            </EditItemTemplate>
            <FooterTemplate>
                <asp:Button runat="server" ID="cmdAdd" Text="Add Customer"
                    CommandName="New" />
            </FooterTemplate>
        </asp:TemplateField>
        
        </Columns>
 
        <EditRowStyle BackColor="#999999" />
 
        <EmptyDataTemplate>
            <table>

            <tr style="background:#FF6600;color:White">
                <th>User ID</th><th>Last Name</th><th>First Name</th>
                <th>Email</th><th>Reward Points</th><th>Phone Number</th>
                <th>Action</th>
            </tr>
            <tr>
                <td><asp:TextBox runat="server" ID="txtID" /></td>
                <td><asp:TextBox runat="server" ID="txtLast" /></td>
                <td><asp:TextBox runat="server" ID="txtFirst" /></td>
                <td><asp:TextBox runat="server" ID="txtEmail" /></td>
                <td><asp:TextBox runat="server" ID="txtRewards" /></td>
                <td><asp:TextBox runat="server" ID="txtPhone" /></td>
                <td><asp:Button runat="server" ID="cmdAdd" Text="Add Customer"
                    CommandName="EmptyNew" /></td>
            </tr>

            </table>
        </EmptyDataTemplate>

 
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White"
            HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True"
            ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

    </asp:GridView>

</asp:Content>