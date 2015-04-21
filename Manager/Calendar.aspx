<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="Manager.Calendar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server"> 

    <link href="Content/Site.css" rel="stylesheet" type="text/css" />

    <!-- helper libraries -->
    <script src="Scripts/jquery-1.5.1.min.js" type="text/javascript"></script>

    <!-- daypilot libraries -->
    <script src="Scripts/DayPilot/daypilot-all.min.js" type="text/javascript"></script> 

    <div class="main">
        <div style="float:left; width: 160px;">
            <div id="nav"></div>
        </div>
        <div style="margin-left: 160px;">
            <div id="dp"></div>
        </div>

            <script type="text/javascript">

                var nav = new DayPilot.Navigator("nav");
                nav.showMonths = 3;
                nav.skipMonths = 3;
                nav.selectMode = "week";
                nav.onTimeRangeSelected = function (args) {
                    dp.startDate = args.day;
                    dp.update();
                    loadEvents();
                };
                nav.init();

                var dp = new DayPilot.Calendar("dp");
                dp.viewType = "Week";

                dp.onEventMoved = function (args) {
                    $.post("backend/move",
                            {
                                id: args.e.id(),
                                newStart: args.newStart.toString(),
                                newEnd: args.newEnd.toString()
                            },
                            function () {
                                console.log("Moved.");
                            });
                };

                dp.onEventResized = function (args) {
                    $.post("backend/resize",
                            {
                                id: args.e.id(),
                                newStart: args.newStart.toString(),
                                newEnd: args.newEnd.toString()
                            },
                            function () {
                                console.log("Resized.");
                            });
                };

                // event creating
                dp.onTimeRangeSelected = function (args) {
                    popcontact('newReservation.aspx?start= ' + args.start + '&end=' + args.end);
                    dp.clearSelection();
                };

                function createRes(rStart, rEnd, name) {
                    alert("name: " + name)
                    var nm = name.split("$");
                    alert("nm[1]: " + nm[1])
                    var e = new DayPilot.Event({
                        start: rStart,
                        end: rEnd,
                        id: DayPilot.guid(),
                        //resource: args.resource,
                        text: nm[1]
                    });
                    dp.events.add(e);

                    $.post("backend/create",
                            {
                                start: rStart.toString(),
                                end: rEnd.toString(),
                                name: name
                            },
                            function () {
                                console.log("Created.");
                            });

                };

                dp.onEventClick = function (args) {
                    if (confirm('Do you wish to delete reservation?')) {

                    }

                };

                dp.init();

                loadEvents();

                function loadEvents() {
                    var start = dp.visibleStart();
                    var end = dp.visibleEnd();

                    $.post("backend/events",
                    {
                        start: start.toString(),
                        end: end.toString()
                    },
                    function (data) {
                        //console.log(data);
                        dp.events.list = data;
                        dp.update();
                    });
                }

                function popcontact(URL) {
                    var popup_width = 600
                    var popup_height = 400
                    day = new Date();
                    id = day.getTime();
                    eval("page" + id + " = window.open(URL, '" + id + "', 'toolbar=0,scrollbars=1,location=0,statusbar=0,menubar=0,resizable=1,width='+popup_width+',height='+popup_height+'');");
                }
                
            </script>

            <script type="text/javascript">
                $(document).ready(function () {
                    $("#theme").change(function (e) {
                        dp.theme = this.value;
                        dp.update();
                    });
                });
            </script>

        </div>
</asp:Content>
