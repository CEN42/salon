<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newReservation.aspx.cs" Inherits="Manager.newReservation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="Scripts/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="Scripts/jquery-ui-1.10.4.custom.min.js" type="text/javascript"></script>
    <link href="Content/jquery-ui-1.10.4.custom.min.css" rel="stylesheet" type="text/css" />
    <!-- daypilot libraries -->
    <script src="Scripts/DayPilot/daypilot-all.min.js" type="text/javascript"></script>

    <script type="text/javascript" lang ="javascript">
        //var dp = window.opener.document.getElementById("dp");

        $(function () {
            $('#<%= fName.ClientID %>').autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "CustomersService.asmx/GetCustomerNames",
                        data: "{ 'searchTerm': '" + request.term + "' }",
                        type: "POST",
                        dataType: "json",
                        contentType: "application/json;charset=utf-8",
                        success: function (result) {
                            response(result.d);
                        },
                        error: function (result) {
                            alert('There is a problem processing your request');
                        }
                    });
                    
                },
                minLength: 0,
                focus: function(event, ui)
                {
                    $('#<%= fName.ClientID %>').val(ui.item.value);
                    return false;
                },
               select: function(event, ui)
               {
                   var termu = ui.item.value.split(' ');
                   $('#<%= fName.ClientID %>').val(termu[0]);
                   $('#<%= lName.ClientID %>').val(termu[1]);
                   $('#<%= Phone_Number.ClientID %>').val(termu[2]);
                   return false;
                }
            });
        });

        function create() {
            var client = document.getElementById("hdCustomer").value;
            var cID = document.getElementById("CustomerID").value;
            var tID = document.getElementById("TempID").value;
            var e = document.getElementById("ddlDynamic-1");
            var serviceValue = e.options[e.selectedIndex].value;
            var s = document.getElementById("DropDownListStylist");
            var stylistValue = s.options[s.selectedIndex].value;
            var rStart = document.getElementById("hdStart").value;
            var rEnd = document.getElementById("hdEnd").value;
            var stylist = document.getElementById("selectedStylist").value;
            var service = document.getElementById("selectedService").value;
            var name = serviceValue + '/' + stylistValue + '/' + tID + '/' + cID + '$' + client + "\nStylist: " +stylist + '\n' + service;
           

           try {
                    window.opener.createRes(rStart, rEnd, name);
               }
                  catch (err) { }
           window.close();
           return false;

        };

    </script> 
    <title>New Reservation</title>
</head>
<body>
    <form id="form1" runat="server"> 
    <div>
        <h1>New Reservation</h1> 
            <div>
                <table>
                    <tr>
                        <th><asp:Label runat="server" AssociatedControlID="fName" CssClass ="col-md-2 control-label">First Name </asp:Label></th>
                        <th><asp:TextBox ID="fName" runat="server" OnTextChanged="fName_TextChanged"></asp:TextBox></th>
                        <th><asp:TextBox ID="rDate" runat="server" TextMode="Date" OnTextChanged="rDate_TextChanged"></asp:TextBox></th>
                        
                    </tr>
                    <tr>
                        <th><asp:Label runat="server" AssociatedControlID="lName" CssClass ="col-md-2 control-label">&nbsp;Last Name </asp:Label></th>
                        <th><asp:TextBox ID="lName" runat="server" OnTextChanged="lName_TextChanged"></asp:TextBox></th>
                        <th><asp:TextBox ID="sTime" runat="server" TextMode="SingleLine" OnTextChanged="sTime_TextChanged"></asp:TextBox></th>
                    </tr>
                    <tr>
                        <th><asp:Label runat="server" AssociatedControlID="Phone_Number" CssClass ="col-md-2 control-label">&nbsp;Phone Number </asp:Label></th>
                        <th><asp:TextBox ID="Phone_Number" runat="server"></asp:TextBox></th>
                        <th><asp:TextBox ID="eTime" runat="server" TextMode="SingleLine" OnTextChanged="eTime_TextChanged"></asp:TextBox></th>
                    </tr>
                    <tr> 
                        <th><asp:Label runat="server" AssociatedControlID="pnlDropDownList" CssClass ="col-md-2 control-label">Service:  </asp:Label></th>
                        <th><asp:Panel ID="pnlDropDownList" runat="server"></asp:Panel></th>
                        <th><asp:LinkButton ID="btnAddDdl" runat="server">Add Service</asp:LinkButton></th>
                    </tr>
                    <tr>
                        <th><asp:Label runat="server" AssociatedControlID="DropDownListStylist" CssClass ="col-md-2 control-label">Stylist: </asp:Label></th>
                        <th><asp:Panel ID="pnlDropDownListStylist" runat="server" Width="300" HorizontalAlign="Center">
                            <asp:DropDownList ID="DropDownListStylist" runat="server" AppendDataBoundItems ="true" Width="170">
                            <Items>
                                <asp:ListItem Text="--Select--" Value="" />
                            </Items>
                        </asp:DropDownList>
                            </asp:Panel></th>
                    </tr>
                    <tr>
                        <th>

                        </th>
                        <th ><asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" /></th>
                        <th><asp:Button ID="btnConfirm" runat="server" Text="Confirm" OnClick="btnConfirm_Click" /></th>
                    </tr>
                </table>
            </div>
        <div>
            <asp:HiddenField ID="hdStart" runat="server" /> 
            <asp:HiddenField ID="hdEnd" runat="server" /> 
            <asp:HiddenField ID="hdCustomer" runat="server" />
            <asp:HiddenField ID="CustomerID" runat="server" />
            <asp:HiddenField ID="TempID" runat="server" />
            <asp:HiddenField ID="selectedStylist" runat="server" />
            <asp:HiddenField ID="selectedService" runat="server" />
        </div>
    </div>
    </form>
</body>
</html>
