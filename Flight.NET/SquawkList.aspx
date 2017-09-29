<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SquawkList.aspx.vb" Inherits="SchedulePointeShell.SquawkList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Aircraft Squawks</title>
    <link href="../Content/bootstrap.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row" style="padding-top:10px;padding-bottom:5px;">
                <div class="col-sm-4" style="text-align:left;">
			        <asp:label id="lblViewSquawks" runat="server"  CssClass="h4">View Squawks</asp:label>
                </div>
                <div class="col-sm-8">
                    <div style="float:right;">
                    </div>
                </div>
            </div>
            <div class="row" style="padding:5px;">
                <div class="col-sm-6">
                    <asp:LinkButton ID="cmdAdd" runat="server" 
                        CssClass="btn btn-primary">
                            <span aria-hidden="true" class="glyphicon glyphicon-plus"></span>&nbsp;&nbsp;Add
                    </asp:LinkButton>
                    <asp:LinkButton ID="cmdClose" runat="server" 
                        CssClass="btn btn-default">
                            <span aria-hidden="true" class="glyphicon glyphicon-remove"></span>&nbsp;&nbsp;Close
                    </asp:LinkButton>
                    <asp:LinkButton ID="hypDownload" runat="server" ToolTip="Download"
                        CssClass="btn btn-default">
                            <span aria-hidden="true" class="glyphicon glyphicon-download"></span>
                    </asp:LinkButton>
                </div>
                <div class="col-sm-6" style="float:right;">
                    <div style="float:right;">
                        <asp:radiobutton id="rdOpen" runat="server" CssClass="radio-inline" Text="Open" Checked="True" AutoPostBack="True" GroupName="Status"></asp:radiobutton>
                        <asp:radiobutton id="rdClosed" runat="server" CssClass="radio-inline" Text="Closed" AutoPostBack="True" GroupName="Status"></asp:radiobutton>
                        <asp:radiobutton id="rdAll" runat="server" CssClass="radio-inline" Text="All" AutoPostBack="True" GroupName="Status"></asp:radiobutton>
                    </div>
                </div>
            </div>
            <div class="row" style="padding:5px;">
                <div class="col-sm-12">
			        <div id="lblMessage" runat="server" class="alert">ResponseMessage
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        </div>
                </div>
            </div>
            <div class="row" style="padding:5px;">
                <div class="col-sm-12">
                    <asp:datagrid id="dgSquawks" runat="server" CssClass="table table-hover table-condensed" AllowCustomPaging="True"
					    PageSize="50" AllowPaging="True" AutoGenerateColumns="False">
					    <Columns>
						    <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="Squawk.aspx?SquawkID={0}"
							    DataTextField="SquawkDate" HeaderText="Date" DataTextFormatString="{0:MM/dd/yyyy}"></asp:HyperLinkColumn>
						    <asp:BoundColumn DataField="SquawkTypeCategory" HeaderText="Category"></asp:BoundColumn>
						    <asp:BoundColumn DataField="Description" HeaderText="Description"></asp:BoundColumn>
						    <asp:BoundColumn DataField="TachTime" HeaderText="Tach Time"></asp:BoundColumn>
						    <asp:BoundColumn DataField="PilotName" HeaderText="Pilot"></asp:BoundColumn>
						    <asp:BoundColumn DataField="ClosedDescription" HeaderText="Closed"></asp:BoundColumn>
						    <asp:BoundColumn DataField="ClosedDate" HeaderText="Closed Date"  DataFormatString="{0:MM/dd/yyyy}"></asp:BoundColumn>
					    </Columns>
					    <PagerStyle Position="TopAndBottom" Mode="NumericPages"></PagerStyle>
				    </asp:datagrid>
                </div>
            </div>
        </div>
        <asp:textbox id="txtPlaneID" runat="server" Width="32px" Visible="False"></asp:textbox>
    </form>

    <script src="../Scripts/jquery-3.1.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>
