<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Squawk.aspx.vb" Inherits="SchedulePointeShell.Squawk" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Squawk</title>

    <link href="../Content/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="../Content/bootstrap-datepicker3.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">

        function ValidateInput() {
		        var blnValid = true;
		        var strAlert = '';

		        if (blnValid == true) {
		            return true;
		        }
		        else {
		            alert('Please make the appropriate changes:\n' + strAlert);
		            return false;
		        }
		    }

		    function EnableClosedControls() {
		        if (document.getElementById('chkClose').checked) {
		            document.getElementById('lblClosedDate').style.visibility = 'visible';
		            document.getElementById('txtClosedDate').style.visibility = 'visible';
		            document.getElementById('hypClosedDate').style.visibility = 'visible';
		        }
		        else {
		            document.getElementById('lblClosedDate').style.visibility = 'hidden';
		            document.getElementById('txtClosedDate').style.visibility = 'hidden';
		            document.getElementById('hypClosedDate').style.visibility = 'hidden';
		        }
		    }

		    function GetPilotID(source, eventArgs) {

		        var str = eventArgs.get_value();

		        var arr = new Array();
		        arr = str.split(':');

		        var arrValues = new Array();
		        arrValues = arr[0].split('=');
		        document.getElementById('txtPilotPartyID').value = arrValues[1];
		        arrValues = arr[1].split('=');
		        document.getElementById('txtPilotID').value = arrValues[1];
		        arrValues = arr[2].split('=');
		        document.getElementById('txtPilotIsInstructor').value = arrValues[1];
		        if (document.getElementById('txtPartyTypeID').value != 1) {
		            arrValues = arr[3].split('=');

		            var txt = document.getElementById('txtPilotNotes');
		            if (txt.value.length == 0) {
		                txt.value = arrValues[1];
		            } else {
		                txt.value = txt.value + ' ' + arrValues[1];
		            }
		        }
		    }

		</script>
</head>
<body>
    <form id="form1" runat="server" class="form-horizontal" >
        <div class="container">
            <div style="padding-top:10px;padding-bottom:5px;">
			    <asp:label id="lblHeader" runat="server" CssClass="h4" >Edit Squawk</asp:label>
            </div>
            <div>
                <div id="lblMessage" runat="server" class="alert">ResponseMessage
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        </div>
            </div>
            <div class="form-group">
        	    <asp:label id="Label1" runat="server" CssClass="col-sm-4 control-label" >Aircraft</asp:label>
                <div class="col-sm-8">
            	    <asp:label id="lblAircraft" runat="server" CssClass="col-sm-4 control-label" ></asp:label>
                </div>
            </div>
            <div class="form-group">
			    <asp:label id="lblDate" runat="server" CssClass="col-sm-4 control-label" >Date</asp:label>
                <div class="col-sm-8">
                    <asp:textbox id="txtDate" runat="server" tabIndex="1" CssClass = "form-control input-sm  date-picker-sp"></asp:textbox>
                </div>
            </div>
            <div class="form-group">
			    <asp:label id="lblPilot" runat="server" CssClass="col-sm-4 control-label" >Pilot</asp:label>
                <div class="col-sm-8">
                    <asp:TextBox ID="txtPilotName" runat="server" tabIndex="2" CssClass = "form-control input-sm"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
			    <asp:label id="lblCategory" runat="server" CssClass="col-sm-4 control-label" > Category</asp:label>
                <div class="col-sm-8">
    			    <asp:dropdownlist id="ddlCategory" tabIndex="3" runat="server"  CssClass = "form-control input-sm"></asp:dropdownlist>
                </div>
            </div>
            <div class="form-group">
			    <asp:label id="lblDescription" runat="server" CssClass="col-sm-4 control-label" >Description</asp:label>
                <div class="col-sm-8">
			        <asp:textbox id="txtDescription" tabIndex="4" runat="server" TextMode="MultiLine" CssClass = "form-control input-sm"></asp:textbox>
                </div>
            </div>
            <div class="form-group">
			    <asp:label id="lblTach" runat="server" CssClass="col-sm-4 control-label" > Tach</asp:label>
                <div class="col-sm-8">
    			    <asp:textbox id="txtTachTime" tabIndex="5" runat="server" CssClass = "form-control input-sm"></asp:textbox>
                </div>
            </div>
            <div class="form-group">
			    <asp:label id="lblResolution" runat="server" CssClass="col-sm-4 control-label" >Resolution</asp:label>
                <div class="col-sm-8">
			        <asp:textbox id="txtResolution" tabIndex="6" runat="server" TextMode="MultiLine" CssClass = "form-control input-sm"></asp:textbox>
                </div>
            </div>
            <div class="form-group">
			    <asp:label id="lblClose" runat="server" CssClass="col-sm-4 control-label" >Close</asp:label>
                <div class="col-sm-8">
                    <asp:checkbox id="chkClose" tabIndex="7" runat="server" ></asp:checkbox>
                </div>
            </div>
            <div class="form-group">
				<asp:label id="lblClosedDate" runat="server" CssClass="col-sm-4 control-label">Date</asp:label>
                <div class="col-sm-8">
                    <asp:textbox id="txtClosedDate" runat="server" tabIndex="8" CssClass = "form-control input-sm"></asp:textbox>
                </div>
            </div>
            <div class="footer navbar-fixed-bottom" style="background-color:gainsboro;">
                <div style="padding:5px;float:right;">
                    <asp:LinkButton ID="cmdSave" runat="server" 
                        CssClass="btn btn-default">
                            <span aria-hidden="true" class="glyphicon glyphicon-floppy-disk"></span>&nbsp;&nbsp;Save
                    </asp:LinkButton>
                    <asp:LinkButton ID="cmdCancel" runat="server" 
                        CssClass="btn btn-default">
                            <span aria-hidden="true" class="glyphicon glyphicon-remove-circle"></span>&nbsp;&nbsp;Cancel
                    </asp:LinkButton>
                    <asp:LinkButton ID="cmdDelete" runat="server" 
                        CssClass="btn btn-default">
                            <span aria-hidden="true" class="glyphicon glyphicon-trash"></span>&nbsp;&nbsp;Delete
                    </asp:LinkButton>
                </div>
            </div>
        </div>
        <asp:textbox id="txtID" runat="server"  Visible="False"></asp:textbox>
        <asp:textbox id="txtCompanyID" runat="server"  Visible="False"></asp:textbox>
        <asp:textbox id="txtPlaneID" runat="server"  Visible="False"></asp:textbox>
		<asp:textbox id="txtMessageXML" runat="server"  Visible="False"></asp:textbox>
    </form>
    <script src="../Scripts/jquery-3.1.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/bootstrap.min.js" type="text/javascript"></script>
    <script src="../Scripts/bootstrap-datepicker.js" type="text/javascript"></script>
    <script src="../Scripts/bootstrap3-typeahead.min.js" type="text/javascript"></script>
    <script src="../Scripts/bootbox.min.js" type="text/javascript"></script>
    <script src="../Scripts/validator.js" type="text/javascript"></script>

    <script type="text/javascript">

            $(document).ready(function () {

                $('.date-picker-sp').datepicker({
                    format: "mm/dd/yyyy",
                    todayBtn: "linked",
                    todayHighlight: true,
                    autoclose: true
                }).on('changeDate', function (ev) {
                    $(this).datepicker('hide');
                });
            });

            $(function () {
                $('#<%= cmdSave.ClientID %>').click(function () {
                });
            });

            $(function () {
                $('#<%=txtPilotName.ClientID%>').typeahead({
                    hint: true,
                    highlight: true,
                    minLength: 1
                    , source: function (request, response) {
                        $.ajax({
                            url: '<%=ResolveUrl("~/Flight.NET/Squawk.aspx/GetCompletionList") %>',
                            data: "{ strPrefix: '" + request + "',strKey:'" + $('#hidCompanyID').val() + "'}",
                            dataType: "json",
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            success: function (data) {
                                items = [];
                                map = {};
                                $.each(data.d, function (i, item) {
                                    var id = item.split(':')[0];
                                    var name = item.split(':')[1];
                                    map[name] = { id: id, name: name };
                                    items.push(name);
                                });
                                response(items);
                                $(".dropdown-menu").css("height", "auto");
                            },
                            error: function (response) {
                                alert(response.responseText);
                            },
                            failure: function (response) {
                                alert(response.responseText);
                            }
                        });
                    },
                    updater: function (item) {
                        $('[id*=txtPilotName]').val(map[item].id);
                        return item;
                    }
                });
            });
    </script>
</body>
</html>
