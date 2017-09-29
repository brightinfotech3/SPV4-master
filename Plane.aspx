<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Plane.aspx.vb" Inherits="SchedulePointeShell.Plane" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="server">
        <script "JavaScript" type="text/javascript">

            function DisplaySquawks(lID) {
                addWindow = window.open('SquawkList.aspx?PlaneID=' + lID, 'Squawks', 'width=800,height=560,resizable=1,status=0,menubar=0,scrollbars=1,fullscreen=0');
                addWindow.focus();
            }

            function PrintFormDetail(id) {
		        addWindow = window.open('ReportMaintenanceDetailDownload.aspx?PlaneID=' + id + '&Print=1', 'Report', 'width=700,height=680,resizable=1,status=0,menubar=0,scrollbars=1,fullscreen=0');
		        addWindow.focus();
		    }

		    function DisplayFAASite(ad_id) {
		        var addWindow;

		        addWindow = window.open('https://www.faa.gov/regulations_policies/airworthiness_directives/search/?q=' + ad_id, 'width=760,height=800,resizable=1,status=0,menubar=0,scrollbars=1,fullscreen=0');
		        addWindow.focus();
		    }

		    function UploadDocuments(PartyID) {
		        addWindow = window.open('FileUpload.aspx?FileType=Document&PartyID=' + PartyID, 'FileUpload', 'width=500,height=400,resizable=1,status=1,menubar=1,scrollbars=1,fullscreen=0');
		        addWindow.focus();
		    }

		    function ValidateDelete() {

		        var strResource = 'Aircraft';

		        var intAppTypeID = document.getElementById('txtAppTypeID').value;
		        if (intAppTypeID == 2) {
		            strResource = document.getElementById('txtResourceDescriptor').value;
		        }

                bootbox.confirm({
                    message: "Are you sure you want to Delete this " + strResource + "?",
                    buttons: {
                        cancel: {
                            label: '<i class="glyphicon glyphicon-remove-circle"></i> Cancel'
                        },
                        confirm: {
                            label: '<i class="glyphicon glyphicon-ok-circle"></i> Confirm'
                        }
                    },
                    callback: function (result) {
                        if (result) {
                            $('#<%= hidDelete.ClientID %>').trigger('click');
                        }
                    }
                });

                return false;
		    }

            function VerifyDeleteFile(id) {

                document.getElementById('<%= hidGeneric.ClientID %>').value = id;

                bootbox.confirm({
                    message: "Are you sure you want to Delete this file?",
                    buttons: {
                        cancel: {
                            label: '<i class="glyphicon glyphicon-remove-circle"></i> Cancel'
                        },
                        confirm: {
                            label: '<i class="glyphicon glyphicon-ok-circle"></i> Confirm'
                        }
                    },
                    callback: function (result) {
                        if (result) {
                            $('#<%= hidRemoveFile.ClientID %>').trigger('click');
                        }
                    }
                });

                return false;

            }

            function ValidateDeleteImage(id) {

                document.getElementById('<%= hidGeneric.ClientID %>').value = id;

                bootbox.confirm({
                    message: "Are you sure you want to Delete this image?",
                    buttons: {
                        cancel: {
                            label: '<i class="glyphicon glyphicon-remove-circle"></i> Cancel'
                        },
                        confirm: {
                            label: '<i class="glyphicon glyphicon-ok-circle"></i> Confirm'
                        }
                    },
                    callback: function (result) {
                        if (result) {
                            $('#<%= hidRemoveImage.ClientID %>').trigger('click');
                        }
                    }
                });

                return false;

                //if (confirm("Are you sure you want to Delete this image?")) {
                //    return true;
                //}
                //else {
                //    return false;
                //}
            }
		    function CalculateTBO() {

		        document.getElementById('<%=lblHoursSinceOverhaul.ClientID%>').innerHTML = (document.getElementById('<%=txtTach1.ClientID%>').value - document.getElementById('<%=txtEngineOverhaul.ClientID%>').value);
            }
		    function DisplayPartyRates(lPartyID) {
		        addWindow = window.open('PartyRate.aspx?PartyID=' + lPartyID + '&CategoryID=1', 'PlaneRate', 'width=760,height=580,resizable=0,status=0,menubar=0,scrollbars=1,fullscreen=0');
		        addWindow.focus();
		    }

		    function DisplayLocations(lPartyID) {
		        addWindow = window.open('Locations.aspx?PartyID=' + lPartyID, 'Locations', 'width=550,height=480,resizable=1,status=0,menubar=0,scrollbars=1,fullscreen=0');
		        addWindow.focus();
		    }

		    function UploadLogo(ImageID) {
		        addWindow = window.open('FileUpload.aspx?ImageType=Aircraft&ImageID=' + ImageID, 'FileUpload', 'width=500,height=400,resizable=1,status=1,menubar=1,scrollbars=1,fullscreen=0');
		        addWindow.focus();
		    }

		    function PartyValidations(lPartyID) {
		        addWindow = window.open('PartyValidationParty.aspx?PartyID=' + lPartyID + '&PartyTypeID=2', 'ADs', 'width=550,height=480,resizable=1,status=0,menubar=0,scrollbars=1,fullscreen=0');
		        addWindow.focus();
		    }
		    function GetPilotID(source, eventArgs) {

		        var str = eventArgs.get_value();

		        var arr = new Array();
		        arr = str.split(':');

		        var arrValues = new Array();
		        arrValues = arr[0].split('=');
		        document.getElementById('txtVORChkPilotID').value = arrValues[1];
		    }
		    function DisplayPilotSearchPilotID(LastName) {
		        addWindow = window.open('PilotSearch.aspx?LastName=' + document.getElementById(LastName).value + '&ReturnID=true', 'PilotList', 'width=400,height=480,resizable=1,status=0,menubar=0,scrollbars=1,fullscreen=0');
		        addWindow.focus();
		    }
		    function OnCheckBoxCheckChanged(evt) {
		        var src = window.event != window.undefined ? window.event.srcElement : evt.target;
		        var isChkBoxClick = (src.tagName.toLowerCase() == "input" && src.type == "checkbox");
		        if (isChkBoxClick) {
		            var parentTable = GetParentByTagName("table", src);
		            var nxtSibling = parentTable.nextSibling;
		            if (nxtSibling && nxtSibling.nodeType == 1)//check if nxt sibling is not null & is an element node
		            {
		                if (nxtSibling.tagName.toLowerCase() == "div") //if node has children
		                {
		                    //check or uncheck children at all levels
		                    CheckUncheckChildren(parentTable.nextSibling, src.checked);
		                }
		            }
		            //check or uncheck parents at all levels
		            CheckUncheckParents(src, src.checked);
		        }
		    }

		    function CheckUncheckChildren(childContainer, check) {
		        var childChkBoxes = childContainer.getElementsByTagName("input");
		        var childChkBoxCount = childChkBoxes.length;
		        for (var i = 0; i < childChkBoxCount; i++) {
		            childChkBoxes[i].checked = check;
		        }
		    }

		    function CheckUncheckParents(srcChild, check) {
		        var parentDiv = GetParentByTagName("div", srcChild);
		        var parentNodeTable = parentDiv.previousSibling;

		        if (parentNodeTable) {
		            var checkUncheckSwitch;

		            if (check) //checkbox checked
		            {
		                var isAllSiblingsChecked = AreAllSiblingsChecked(srcChild);
		                if (isAllSiblingsChecked)
		                    checkUncheckSwitch = true;
		                else
		                    return; //do not need to check parent if any(one or more) child not checked
		            }
		            else //checkbox unchecked
		            {
		                checkUncheckSwitch = false;
		            }

		            var inpElemsInParentTable = parentNodeTable.getElementsByTagName("input");
		            if (inpElemsInParentTable.length > 0) {
		                var parentNodeChkBox = inpElemsInParentTable[0];
		                parentNodeChkBox.checked = checkUncheckSwitch;
		                //do the same recursively
		                CheckUncheckParents(parentNodeChkBox, checkUncheckSwitch);
		            }
		        }
		    }

		    function AreAllSiblingsChecked(chkBox) {
		        var parentDiv = GetParentByTagName("div", chkBox);
		        var childCount = parentDiv.childNodes.length;
		        for (var i = 0; i < childCount; i++) {
		            if (parentDiv.childNodes[i].nodeType == 1) //check if the child node is an element node
		            {
		                if (parentDiv.childNodes[i].tagName.toLowerCase() == "table") {
		                    var prevChkBox = parentDiv.childNodes[i].getElementsByTagName("input")[0];
		                    //if any of sibling nodes are not checked, return false
		                    if (!prevChkBox.checked) {
		                        return false;
		                    }
		                }
		            }
		        }
		        return true;
		    }

		    //utility function to get the container of an element by tagname
		    function GetParentByTagName(parentTagName, childElementObj) {
		        var parent = childElementObj.parentNode;
		        while (parent.tagName.toLowerCase() != parentTagName.toLowerCase()) {
		            parent = parent.parentNode;
		        }
		        return parent;
		    }

		    function LoadInspectionsComponents() {
		        document.getElementById('txtAction').value = 'LoadInspectionsComponents';
		        document.forms[0].submit();
		    }
		    function CopyInspectionsComponents() {
		        var addWindow;
		        var id = document.getElementById('txtPartyID').value;

		        addWindow = window.open('AddSubComponentCopy.aspx?ParentID=' + id + '&ParentTypeID=2', (new Date()).toString(), 'width=700,height=800,resizable=1,status=0,menubar=0,scrollbars=1,fullscreen=0');
		        addWindow.focus();
		    }
            function AddSubComponent(id) {
                var addWindow;
                addWindow = window.open('AddSubComponent.aspx?ParentID=' + id + '&ParentTypeID=2', (new Date()).toString(), 'width=700,height=800,resizable=1,status=0,menubar=0,scrollbars=1,fullscreen=0');
                addWindow.focus();
            }
            function AddInspection(ID) {
                var addWindow;
                var strComponent;

                strComponent = document.getElementById('<%=txtMake.ClientID%>').value + ' ' + document.getElementById('<%=txtModel.ClientID%>').value + ' ' + document.getElementById('<%=txtTailnumber.ClientID%>').value;
                addWindow = window.open('Inspection.aspx?ForeignID=' + ID + '&ForeignTypeID=2' + '&Descriptor=' + strComponent, 'Inspection', 'width=850,height=800,resizable=1,status=0,menubar=0,scrollbars=1,fullscreen=0');
                addWindow.focus();
            }
            function AddADs(ID) {
                var addWindow;
                var strComponent;

                strComponent = document.getElementById('<%=txtMake.ClientID%>').value + ' ' + document.getElementById('<%=txtModel.ClientID%>').value + ' ' + document.getElementById('<%=txtTailnumber.ClientID%>').value;
                addWindow = window.open('AirworthinessDirectives.aspx?ForeignID=' + ID + '&ForeignTypeID=2' + '&Descriptor=' + strComponent, 'Inspection', 'width=760,height=800,resizable=1,status=0,menubar=0,scrollbars=1,fullscreen=0');
                addWindow.focus();
            }
            function DisplayComponent(id) {
                var addWindow;
                addWindow = window.open('Component.aspx?ComponentID=' + id, (new Date()).toString(), 'width=1100,height=800,resizable=1,status=0,menubar=0,scrollbars=1,fullscreen=0');
                addWindow.focus();
            }

            function DisplayInspection(id) {
                var strComponent;
                var addWindow;

                strComponent = document.getElementById('<%=txtMake.ClientID%>').value + ' ' + document.getElementById('<%=txtModel.ClientID%>').value + ' ' + document.getElementById('<%=txtTailnumber.ClientID%>').value;
                addWindow = window.open('Inspection.aspx?ID=' + id + '&Descriptor=' + strComponent, 'Inspection', 'width=850,height=800,resizable=1,status=0,menubar=0,scrollbars=1,fullscreen=0');
                addWindow.focus();
            }

            function RemoveSubComponent(id) {
                if (ValidateDeleteComponent()) {
                    document.getElementById('txtComponentID').value = id;
                    document.getElementById('txtAction').value = 'RemoveSubComponent';
                    document.forms[0].submit();
                }
            }

            function RemoveInspection(ID) {

                bootbox.confirm({
                    message: "Are you sure you want to Delete this Inspection?",
                    buttons: {
                        cancel: {
                            label: '<i class="glyphicon glyphicon-remove-circle"></i> Cancel'
                        },
                        confirm: {
                            label: '<i class="glyphicon glyphicon-ok-circle"></i> Confirm'
                        }                    },
                    callback: function (result) {
                        if (result) {
                            document.getElementById('txtInspectionID').value = ID;
                            document.getElementById('txtAction').value = 'RemoveInspection';
                            document.forms[0].submit();
                        }
                    }
                });
            }
            function ValidateDeleteComponent() {
                if (confirm("Are you sure you want to Delete this Component?")) {
                    return true;
                }
                else {
                    return false;
                }
            }
            function ValidateDeleteInspection() {
                if (confirm("Are you sure you want to Delete this Inspection?")) {
                    return true;
                }
                else {
                    return false;
                }
            }

		</script>
    <style type="text/css">
        .borderless td, .borderless th {
            border:none !important; text-align:center;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <div>
            <div>
			    <div id="lblMessage" runat="server" class="alert">ResponseMessage
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			    </div>
                <div style="padding-left:5px;">
                    <h4><asp:Label ID="lblResource" runat="server" Text="Label"></asp:Label></h4>
                </div>
                <div id="AircraftTabs" style="clear:both;padding-top:5px;">
                    <ul class="nav nav-tabs">
                      <li><a id="aNav0" data-toggle="tab" href="#sectionAircraft">Aircraft</a></li>
                      <li><a id="aNav1" data-toggle="tab" href="#sectionRates">Rates</a></li>
                      <li><a id="aNav2" data-toggle="tab" href="#sectionWeightBalance">Weight and Balance</a></li>
                      <li><a id="aNav3" data-toggle="tab" href="#sectionCompassDeviation">Compass Deviation</a></li>
                      <li><a id="aNav4" data-toggle="tab" href="#sectionVSpeeds">V Speeds</a></li>
                      <li><a id="aNav5" data-toggle="tab" href="#sectionAircraftLog">Aircraft Log</a></li>
                      <li><a id="aNav6" data-toggle="tab" href="#sectionMaintenanceLog">Maintenance Log</a></li>
                      <li><a id="aNav7" data-toggle="tab" href="#sectionPilotCurrency">Pilot Currency</a></li>
                      <li><a id="aNav8" data-toggle="tab" href="#sectionDocuments">Documents</a></li>
                    </ul>
                </div>
                <div class="tab-content">
                    <div id="sectionAircraft" class="tab-pane fade in active">
                     <div class="container">
                        <div class="row">
                            <div class="col-sm-8" style="padding-top:15px;">
                                <div class="form-horizontal pull-right" style="width:90%;margin:0 auto;">
                                    <div class="form-group" style="padding-top:15px">
							            <asp:label id="lblMake" runat="server" CssClass="col-sm-4 control-label">Make</asp:label>
                                        <div class="col-sm-8">
    							            <asp:textbox id="txtMake" runat="server" TabIndex="1" CssClass="form-control input-sm" required></asp:textbox>
                                            <div style="display:inline;"  class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
							            <asp:label id="lblModel" runat="server" CssClass="col-sm-4 control-label"> Model</asp:label>
                                        <div class="col-sm-8">
							                <asp:textbox id="txtModel" tabIndex="1" runat="server" CssClass="form-control input-sm" required></asp:textbox>
                                            <div style="display:inline;"  class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
							            <asp:label id="lblTailNumber" runat="server" CssClass="col-sm-4 control-label">Tail Number</asp:label>
                                        <div class="col-sm-8">
    							            <asp:textbox id="txtTailNumber" tabIndex="2" runat="server" CssClass="form-control input-sm" required></asp:textbox>
                                            <div style="display:inline;"  class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
							            <asp:label id="lblAircraftIdentifier" runat="server" CssClass="col-sm-4 control-label">Aircraft Identifier</asp:label>
	                                    <div class="col-sm-8">
        						            <asp:textbox id="txtAircraftIdentifier" tabIndex="3" runat="server"  CssClass="form-control input-sm"></asp:textbox>
                                            <div style="display:inline;"  class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
							            <asp:label id="lblYear" runat="server" CssClass="col-sm-4 control-label">Year</asp:label>
                                        <div class="col-sm-8">
    							            <asp:textbox id="txtYear" tabIndex="4" runat="server"  CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                            <div style="display:inline;"  class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
							            <asp:label id="lblSerialNumber" runat="server" CssClass="col-sm-4 control-label"> Serial Number</asp:label>
	                                    <div class="col-sm-8">
						                    <asp:textbox id="txtSerialNumber" tabIndex="4" runat="server"  CssClass="form-control input-sm"></asp:textbox>
                                            <div style="display:inline;"  class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
            			                <asp:label id="lblEquipment" runat="server" CssClass="col-sm-4 control-label"> Equipment</asp:label>
                                        <div class="col-sm-8">
    							            <asp:textbox id="txtEquipment" tabIndex="5" runat="server" Height="50px" TextMode="MultiLine" CssClass="form-control input-sm"></asp:textbox>
                                            <div style="display:inline;"  class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
							            <asp:label id="lblNotes" runat="server" CssClass="col-sm-4 control-label" data-toggle="tooltip" title="Only Admins can see this field">Notes</asp:label>
                                        <div class="col-sm-8">
                                            <asp:textbox id="txtNotes" tabIndex="6" runat="server" Height="50px" TextMode="MultiLine" CssClass="form-control input-sm" data-toggle="tooltip" title="Only Admins can see this field"></asp:textbox>
                                            <div style="display:inline;"  class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:label id="lblFuelCapacity" runat="server" CssClass="col-sm-4 control-label">Fuel Capacity</asp:label>
                                        <div class="col-sm-8">
    							            <asp:textbox id="txtFuelCapacity" tabIndex="7" runat="server" CssClass="form-control input-sm"></asp:textbox>
                                            <div style="display:inline;"  class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
							            <asp:label id="Label13" runat="server" CssClass="col-sm-4 control-label">Gallons Per Hour</asp:label>
	                                    <div class="col-sm-8">
						                    <asp:textbox id="txtGallonsPerHour" tabIndex="7" runat="server" CssClass="form-control input-sm" type="number" step=".1"></asp:textbox>
                                            <div style="display:inline;"  class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
							            <asp:label id="lblTwin" runat="server" CssClass="col-sm-4 control-label">Twin </asp:label>
                                        <div class="col-sm-8">
    							            <asp:checkbox id="chkTwin" tabIndex="8" runat="server"></asp:checkbox>
                                            <div style="display:inline;"  class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
							            <asp:label id="lblIFRCertified" runat="server"  CssClass="col-sm-4 control-label">IFR Certified </asp:label>
                                        <div class="col-sm-8">
    							            <asp:checkbox id="chkIFRCertified" tabIndex="9" runat="server"></asp:checkbox>
                                            <div style="display:inline;"  class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
							            <asp:label id="lblJet" runat="server" CssClass="col-sm-4 control-label">Jet/Turbo Prop </asp:label>
                                        <div class="col-sm-8">
    							            <asp:checkbox id="chkJet" tabIndex="10" runat="server"></asp:checkbox>
                                            <div style="display:inline;"  class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
							            <asp:label id="Label17" runat="server" CssClass="col-sm-4 control-label">Simulator </asp:label>
                                        <div class="col-sm-8">
    							            <asp:checkbox id="chkSimulator" tabIndex="10" runat="server"></asp:checkbox>
                                            <div style="display:inline;"  class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
							            <asp:label id="Label19" runat="server" CssClass="col-sm-4 control-label">Ground Resource</asp:label>
                                        <div class="col-sm-8">
    							            <asp:checkbox id="chkGroundResource" tabIndex="10" runat="server"></asp:checkbox>
                                            <div style="display:inline;"  class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
							            <asp:label id="lblCruisingAltitude" runat="server" CssClass="col-sm-4 control-label">Cruising Altitude</asp:label>
                                        <div class="col-sm-8">
    							            <asp:textbox id="txtCruisingAltitude" tabIndex="11" runat="server" CssClass="form-control input-sm"></asp:textbox>
                                            <div style="display:inline;"  class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
							            <asp:label id="lblColorScheme" runat="server" CssClass="col-sm-4 control-label">Color Scheme</asp:label>
                                        <div class="col-sm-8">
    							            <asp:textbox id="txtColorScheme" tabIndex="12" runat="server" CssClass="form-control input-sm"></asp:textbox>
                                            <div style="display:inline;"  class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
							            <asp:label id="lblScheduleBuffer" runat="server" CssClass="col-sm-4 control-label">Schedule Buffer</asp:label>
                                        <div class="col-sm-8">
    							            <asp:textbox id="txtScheduleBuffer" tabIndex="13" runat="server" CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                            <div style="display:inline;"  class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
							            <asp:label id="lblTieDown" runat="server" CssClass="col-sm-4 control-label">Tie Down</asp:label>
                                        <div class="col-sm-8">
    							            <asp:textbox id="txtTieDown" tabIndex="14" runat="server" CssClass="form-control input-sm"></asp:textbox>
                                            <div style="display:inline;"  class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
							            <asp:label id="lblOverrideable" runat="server" CssClass="col-sm-4 control-label" data-toggle="tooltip" title="Members can schedule beyond the 'Max Hours to Schedule a(n) Aircraft' value from Company Setup"> Overrideable</asp:label>
                                        <div class="col-sm-8">
    							            <asp:checkbox id="chkOverrideable" tabIndex="15" runat="server" data-toggle="tooltip" title="Members can schedule beyond the 'Max Hours to Schedule a(n) Aircraft' value from Company Setup"></asp:checkbox>
                                            <div style="display:inline;"  class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
							            <asp:label id="lblIndependentresource" runat="server" CssClass="col-sm-4 control-label"> Independent Resource</asp:label>
                                        <div class="col-sm-8">
    							            <asp:checkbox id="chkIndependentresource" tabIndex="16" runat="server"></asp:checkbox>
                                            <div style="display:inline;"  class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
							            <asp:label id="Label2" runat="server" CssClass="col-sm-4 control-label"> Schedule Access</asp:label>
                                        <div class="col-sm-8">
    							            <asp:dropdownlist id="ddlScheduleAccessType" CssClass="form-control input-sm" tabIndex="17" runat="server"></asp:dropdownlist>
                                            <div style="display:inline;"  class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
							            <asp:label id="lblScheduleTurnAroundTime" runat="server" CssClass="col-sm-4 control-label">Schedule Turn Around Time</asp:label>
                                        <div class="col-sm-8">
    							            <asp:textbox id="txtScheduleTurnAroundTime" tabIndex="17" runat="server" Text="0" CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                            <div style="display:inline;"  class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
							            <asp:label id="lblSSID" runat="server"  CssClass="col-sm-4 control-label">SSID</asp:label>
                                        <div class="col-sm-8">
    							            <asp:textbox id="txtSSID" tabIndex="17" runat="server" CssClass="form-control input-sm"></asp:textbox>
                                            <div style="display:inline;"  class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
							            <asp:label id="lblCurrent" runat="server"  Visible="false" CssClass="col-sm-4 control-label"> Current</asp:label>
                                        <div class="col-sm-8">
                                            <asp:checkbox id="chkCurrent" runat="server" Visible="false" tabIndex="18"></asp:checkbox>
                                            <div style="display:inline;"  class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
							            <asp:label id="lblCharterXSync" runat="server" Visible="false" CssClass="col-sm-4 control-label"> Sync With CharterX</asp:label>
                                        <div class="col-sm-8">
    							            <asp:checkbox id="chkCharterXSync" tabIndex="19" Visible="false" runat="server"></asp:checkbox>
                                            <div style="display:inline;"  class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4" style="padding-top:15px;">
                                <div style="float:left;">
                                    <div style="padding:3px;font-size:small;">
                                    </div>
                                    <div style="padding:3px;font-size:small;">
                                    </div>
                                </div>
                                <div style="float:right;">
                                    <div>
                                        <div>
                                            <div style="float:left;font-size:small;">
                                                <asp:hyperlink id="hypUploadImage1" tabIndex="47" runat="server">Upload Image</asp:hyperlink>
                                            </div>
                                            <div style="float:right;font-size:small;">
                                                <asp:LinkButton ID="hypRemoveImage1" runat="server">Remove</asp:LinkButton>
                                            </div>
                                        </div>
                                        <div style="clear:both;float:right">
							                <asp:Image id="Image1" runat="server"></asp:Image>
                                        </div>
                                    </div>
                                    <div>
                                        <div>
                                            <div style="float:left;padding-top:15px;font-size:small;">
							                    <asp:hyperlink id="hypUploadImage2" tabIndex="47" runat="server">Upload Image</asp:hyperlink>
                                            </div>
                                            <div style="float:right;padding-top:15px;font-size:small;">
                                                <asp:LinkButton ID="hypRemoveImage2" runat="server">Remove</asp:LinkButton>
                                            </div>
                                        </div>
                                        <div style="float:right;clear:both;">
							                <asp:Image id="Image2" runat="server"></asp:Image>
                                        </div>
                                    </div>
                                    <div>
                                        <div>
                                            <div style="float:left;padding-top:15px;font-size:small;">
							                    <asp:hyperlink id="hypUploadImage3" tabIndex="47" runat="server">Upload Image</asp:hyperlink>
                                            </div>
                                            <div style="float:right;padding-top:15px;font-size:small;">
                                                <asp:LinkButton ID="hypRemoveImage3" runat="server">Remove</asp:LinkButton>
                                            </div>
                                        </div>
                                        <div style="float:right;clear:both;">
							                <asp:Image id="Image3" runat="server"></asp:Image>
                                        </div>
                                    </div>
                                </div>
                                </div>
                        </div>
                      </div>
                    </div>                
                    <div id="sectionRates" class="tab-pane fade">
                         <div class="container">
                            <div class="row">
                                <div class="col-sm-8" style="padding-top:15px;">
                                    <div class="form-horizontal pull-right" >
                                        <div class="form-group">
						                    <asp:label id="lblRates" runat="server" CssClass="col-sm-4 control-label"> Rates</asp:label>
                                            <div class="col-sm-8">
								                <div class="col-sm-8">
                                                    <asp:listbox id="lstrates" tabIndex="12" Height="100px" runat="server" CssClass="form-control input-sm"></asp:listbox>
                                                </div>
								                <div class="col-sm-4" style="text-align:left;">
								                    <asp:hyperlink id="hypEditrates" runat="server" >Edit Rates</asp:hyperlink>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
								            <asp:label id="lblRatePerHour" runat="server" CssClass="col-sm-4 control-label">Rate Per Hour</asp:label>
                                            <div class="col-sm-8">
                                                <div class="input-group">
                                                    <span id="spRatePerHour" runat="server" class="input-group-addon">$</span>
                                                    <asp:TextBox ID="txtrateperhour" runat="server" CssClass="form-control input-sm" type="number" step=".01"></asp:Textbox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
								            <asp:label id="lblBlockRatePerHour" runat="server" CssClass="col-sm-4 control-label">Block Rate Per Hour</asp:label>
                                            <div class="col-sm-8">
                                                <div class="input-group">
                                                    <span id="spBlockRatePerHour" runat="server" class="input-group-addon">$</span>
								                    <asp:textbox id="txtBlockRatePerHour" tabIndex="13" runat="server" CssClass="form-control input-sm" type="number" step=".01"></asp:textbox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
								            <asp:label id="lblLeaseBackRatePerHour" runat="server" CssClass="col-sm-4 control-label" data-toggle="tooltip" title="Only Admins can see this field">Lease Back Rate Per Hour</asp:label>
                                            <div class="col-sm-8">
                                                <div class="input-group">
                                                    <span class="input-group-addon">$</span>
								                    <asp:textbox id="txtLeaseBackRatePerHour" tabIndex="14" runat="server" CssClass="form-control input-sm"  type="number" step=".01" data-toggle="tooltip" title="Only Admins can see this field"></asp:textbox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
								            <asp:label id="lblInsurancePerMonth" runat="server" CssClass="col-sm-4 control-label" data-toggle="tooltip" title="Only Admins can see this field">Insurance Per Month</asp:label>
                                            <div class="col-sm-8">
                                                <div class="input-group">
                                                    <span class="input-group-addon">$</span>
								                    <asp:textbox id="txtInsurancePerMonth" tabIndex="15" runat="server" CssClass="form-control input-sm" type="number" step=".01" data-toggle="tooltip" title="Only Admins can see this field"></asp:textbox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
								            <asp:label id="lblTieDownPerMonth" runat="server" CssClass="col-sm-4 control-label" data-toggle="tooltip" title="Only Admins can see this field">Tie Down Per Month</asp:label>
                                            <div class="col-sm-8">
                                                <div class="input-group">
                                                    <span class="input-group-addon">$</span>
								                    <asp:textbox id="txtTieDownPerMonth" tabIndex="16" runat="server" CssClass="form-control input-sm" type="number" step=".01" data-toggle="tooltip" title="Only Admins can see this field"></asp:textbox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
								            <asp:label id="lblReportingOwner" runat="server" CssClass="col-sm-4 control-label" data-toggle="tooltip" title="Only Admins can see this field">Reporting Owner</asp:label>
                                            <div class="col-sm-8">
    								            <asp:textbox id="txtOwner" tabIndex="16" runat="server" CssClass="form-control input-sm" data-toggle="tooltip" title="Only Admins can see this field"></asp:textbox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:label id="lblEmailAddress" runat="server" CssClass="col-sm-4 control-label">Email Address</asp:label>
                                            <div class="col-sm-8">
                                                <asp:textbox id="txtEmailAddress" runat="server" tabIndex="9" CssClass="form-control input-sm" type="email" data-error="Invalid Email"></asp:textbox>
                                                <div class="help-block with-errors"></div>
                                            </div>
                                        </div>
                                        <div class="form-group">
								            <asp:label id="lblOwner" runat="server" CssClass="col-sm-4 control-label">Owners</asp:label>
                                            <div class="col-sm-4">
                                                <asp:GridView ID="dgOwners" runat="server" CssClass="table table-condensed" AutoGenerateColumns="False" data-toggle="tooltip" title="Only Admins can see this">
                                                    <Columns>
                                                        <asp:BoundField DataField="Description" />
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="sectionWeightBalance" class="tab-pane fade">
                         <div class="container">
                            <div class="row">
                                <div class="col-sm-8" style="padding-top:15px;">
                                    <div class="form-horizontal pull-right" style="width:90%;margin:0 auto;">
                                        <div class="form-group">
								            <asp:label id="Label25" runat="server" CssClass="col-sm-4 control-label"></asp:label>
								            <asp:label id="lblWeightBalanceHeaderDesc" runat="server" Width="300px" CssClass="col-sm-4 control-label"
									            ForeColor="Red">Warning, consult you POH for actual Weight and Balance calculations!</asp:label>
                                        </div>
                                        <div class="form-group">
								            <asp:label id="lblMaxGrossWeight" runat="server" CssClass="col-sm-4 control-label">Max Gross Weight</asp:label>
                                            <div class="col-sm-8">
								                <asp:textbox id="txtMaxGrossWeight" tabIndex="18" runat="server" CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                            </div>
                                        </div>
                                        <div class="form-group">
								            <asp:label id="lblBasicEmptyWeight" runat="server" CssClass="col-sm-4 control-label">Basic Empty Weight</asp:label>
                                            <div class="col-sm-8">
    								            <asp:textbox id="txtBasicEmptyWeight" tabIndex="19" runat="server"  CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                            </div>
                                        </div>
                                        <div class="form-group">
								            <asp:label id="lblMoment" runat="server" CssClass="col-sm-4 control-label">Moment (lb. -ins. / 1000) </asp:label>
                                            <div class="col-sm-8">
	    							            <asp:textbox id="txtMoment" tabIndex="20" runat="server"  CssClass="form-control input-sm" type="number" step=".01"></asp:textbox>
                                            </div>
                                        </div>
                                        <div class="form-group">
								            <asp:label id="lblUsefulLoad" runat="server" CssClass="col-sm-4 control-label"> Useful Load </asp:label>
                                            <div class="col-sm-8">
    								            <asp:textbox id="txtUsefulLoad" tabIndex="21" runat="server" CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                            </div>
                                        </div>
                                        <div class="form-group">
								            <asp:label id="lblPayload" runat="server" CssClass="col-sm-4 control-label">Payload</asp:label>
                                            <div class="col-sm-8">
    								            <asp:textbox id="txtPayload" tabIndex="22" runat="server"  CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="sectionCompassDeviation" class="tab-pane fade">
                         <div class="container">
                            <div class="row">
                                <div class="col-sm-8" style="padding-top:15px;">
                                    <div class="form-horizontal pull-right" style="width:90%;margin:0 auto;">
								        <table class="table borderless">
									        <tr>
										        <td>360
                                                </td>
										        <td >
											        030
                                                </td>
										        <td >
											        060
                                                </td>
										        <td >
											        090
                                                </td>
										        <td >
											        120
                                                </td>
										        <td >
											        150
                                                </td>
									        </tr>
									        <tr>
										        <td>
											        <asp:textbox id="txt360" tabIndex="23" runat="server"  CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                                </td>
										        <td>
											        <asp:textbox id="txt030" tabIndex="24" runat="server"  CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                                </td>
										        <td>
											        <asp:textbox id="txt060" tabIndex="25" runat="server"  CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                                </td>
										        <td>
											        <asp:textbox id="txt090" tabIndex="26" runat="server"  CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                                </td>
										        <td>
											        <asp:textbox id="txt120" tabIndex="27" runat="server"  CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                                </td>
										        <td>
											        <asp:textbox id="txt150" tabIndex="28" runat="server"  CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                                </td>
									        </tr>
									        <tr>
										        <td >
											        180
                                                </td>
										        <td >
											        210
                                                </td>
										        <td >
											        240
                                                </td>
										        <td >
											        270
                                                </td>
										        <td >
											        300
                                                </td>
										        <td >
											        330
                                                </td>
									        </tr>
									        <tr>
										        <td>
											        <asp:textbox id="txt180" tabIndex="29" runat="server"  CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                                </td>
										        <td>
											        <asp:textbox id="txt210" tabIndex="30" runat="server"  CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                                </td>
										        <td>
											        <asp:textbox id="txt240" tabIndex="31" runat="server"  CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                                </td>
										        <td>
											        <asp:textbox id="txt270" tabIndex="32" runat="server"  CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                                </td>
										        <td>
											        <asp:textbox id="txt300" tabIndex="33" runat="server"  CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                                </td>
										        <td>
											        <asp:textbox id="txt330" tabIndex="34" runat="server"  CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                                </td>
									        </tr>
								        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="sectionVSpeeds" class="tab-pane fade">
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-8" style="padding-top:15px;">
                                    <div class="form-horizontal pull-right" style="width:90%;margin:0 auto;">
                                        <div class="form-group">
							                <asp:label id="lblDesignation" runat="server"  CssClass="col-sm-4 control-label"> Designation</asp:label>
                                            <div class="col-sm-8">
			    				                <asp:dropdownlist id="ddlDesignation" runat="server" CssClass="form-control input-sm"></asp:dropdownlist>
                                            </div>
                                        </div>
                                        <div class="form-group">
							                <asp:label id="lblVcruise" runat="server"  CssClass="col-sm-4 control-label">Vcruise</asp:label>
                                            <div class="col-sm-8">
		    					                <asp:textbox id="txtVcruise" tabIndex="36" runat="server"  Text="0" CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                            </div>
                                        </div>
                                        <div class="form-group">
								            <asp:label id="lblVr" runat="server"  CssClass="col-sm-4 control-label">Vr (rotation)</asp:label>
                                            <div class="col-sm-8">
	    							            <asp:textbox id="txtVr" tabIndex="36" runat="server" CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                            </div>
                                        </div>
                                        <div class="form-group">
							                <asp:label id="lblVs1" runat="server"  CssClass="col-sm-4 control-label">Vs1 (stall clean)</asp:label>
                                            <div class="col-sm-8">
    							                <asp:textbox id="txtVs1" tabIndex="43" runat="server" CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                            </div>
                                        </div>
                                        <div class="form-group">
								            <asp:label id="lblVx" runat="server" CssClass="col-sm-4 control-label">Vx (best angle of climb) </asp:label>
                                            <div class="col-sm-8">
								                <asp:textbox id="txtVx" tabIndex="37" runat="server" CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                            </div>
                                        </div>
                                        <div class="form-group">
								            <asp:label id="lblVso" runat="server" CssClass="col-sm-4 control-label">Vso (stall dirty)</asp:label>
                                            <div class="col-sm-8">
								                <asp:textbox id="txtVso" tabIndex="44" runat="server" CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                            </div>
                                        </div>
                                        <div class="form-group">
								            <asp:label id="lblVy" runat="server"  CssClass="col-sm-4 control-label">Vy (best rate of climb)</asp:label>
                                            <div class="col-sm-8">
								                <asp:textbox id="txtVy" tabIndex="38" runat="server" CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                            </div>
                                        </div>
                                        <div class="form-group">
								            <asp:label id="lblVle" runat="server" CssClass="col-sm-4 control-label">Vle (max gear extended) </asp:label>
                                            <div class="col-sm-8">
								                <asp:textbox id="txtVle" tabIndex="45" runat="server" CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                            </div>
                                        </div>
                                        <div class="form-group">
								            <asp:label id="lblVa" runat="server" CssClass="col-sm-4 control-label">Va (design maneuvering)</asp:label>
                                            <div class="col-sm-8">
							    	            <asp:textbox id="txtVa" tabIndex="39" runat="server" CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                            </div>
                                        </div>
                                        <div class="form-group">
								            <asp:label id="lblVlo" runat="server" CssClass="col-sm-4 control-label">Vlo (max gear operating) </asp:label>
                                            <div class="col-sm-8">
						    		            <asp:textbox id="txtVlo" tabIndex="46" runat="server" CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                            </div>
                                        </div>
                                        <div class="form-group">
							                <asp:label id="lblVfe" runat="server" CssClass="col-sm-4 control-label">Vfe (max flap extended)</asp:label>
                                            <div class="col-sm-8">
					    		                <asp:textbox id="txtVfe" tabIndex="40" runat="server" CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                            </div>
                                        </div>
                                        <div class="form-group">
							                <asp:label id="lblVmc" runat="server" CssClass="col-sm-4 control-label">Vmc (min control) </asp:label>
                                            <div class="col-sm-8">
				    			                <asp:textbox id="txtVmc" tabIndex="47" runat="server" CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                            </div>
                                        </div>
                                        <div class="form-group">
								            <asp:label id="lblVno" runat="server" CssClass="col-sm-4 control-label"> Vno (max structural cruising) </asp:label>
                                            <div class="col-sm-8">
			    					            <asp:textbox id="txtVno" tabIndex="41" runat="server" CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                            </div>
                                        </div>
                                        <div class="form-group">
								            <asp:label id="lblVxse" runat="server" CssClass="col-sm-4 control-label">Vxse (best single engine angle of climb)</asp:label>
                                            <div class="col-sm-8">
		    						            <asp:textbox id="txtVxse" tabIndex="48" runat="server" CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                            </div>
                                        </div>
                                        <div class="form-group">
								            <asp:label id="lblVne" runat="server" CssClass="col-sm-4 control-label">Vne (never exceed) </asp:label>
                                            <div class="col-sm-8">
	    							            <asp:textbox id="txtVne" tabIndex="42" runat="server" CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                            </div>
                                        </div>
                                        <div class="form-group">
								            <asp:label id="lblVyse" runat="server" CssClass="col-sm-4 control-label">Vyse (best single engine rate of climb) </asp:label>
                                            <div class="col-sm-8">
    								            <asp:textbox id="txtVyse" tabIndex="49" runat="server" CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="sectionAircraftLog" class="tab-pane fade">
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-10" style="padding-top:15px;">
                                    <div class="form-horizontal pull-right">
                                        <div style="text-align:center;">
								                <asp:label id="lblAircraftLogHeaderDesc" runat="server" ForeColor="Red">Note:  All dates and times are when the event occured except ELT Battery Exp. Date and GPS Exp. Date!</asp:label>
                                        </div>
					                    <table class="table table-condensed borderless">
						                    <tr>
							                    <td >
                                                    <div id="fsLog" runat="server" class="panel panel-default">
                                                          <div class="panel-heading">
                                                            <h4 class="panel-title" style="text-align:left">Log</h4>
                                                          </div>
                                                          <div class="panel-body">
								                            <table class="table table-condensed">
                                                            <tr>
										                        <td style="text-align:right;">
											                            <asp:label id="Label15" runat="server" CssClass="control-label" > Maintenance Trigger</asp:label>
                                                                </td>
										                        <td>
											                            <asp:dropdownlist id="ddlMaintenanceTrigger" runat="server"  CssClass="form-control input-sm"></asp:dropdownlist>
                                                                </td>
										                        <td style="text-align:right;">
											                        <asp:label id="Label16" runat="server"  CssClass="control-label" >Airframe Time</asp:label></td>
										                        <td>
											                        <asp:textbox id="txtAirframeTotalTime" tabIndex="50" runat="server"  CssClass="form-control input-sm" type="number" step=".1"></asp:textbox></td>

										                        <td style="text-align:right;">
											                        <asp:label id="lblHoursUntilMaintenance" runat="server"  CssClass="control-label" >Hours Until Maint</asp:label></td>
										                        <td>
											                        <asp:textbox id="txtHoursUntilMaintenance" tabIndex="50" runat="server"  Enabled="false" Text="0" CssClass="form-control input-sm" type="number" step=".1"></asp:textbox></td>
                                                            </tr>
									                        <tr>
										                        <td style="text-align:right;">
											                        <asp:label id="lblCurrentHobbs" runat="server"  CssClass="control-label" >Current Hobbs</asp:label></td>
										                        <td>
											                        <asp:textbox id="txtCurrentHobbs" tabIndex="50" runat="server"  CssClass="form-control input-sm" type="number" step=".1"></asp:textbox></td>
										                        <td style="text-align:right;">
											                        <asp:label id="lblTach1" runat="server"   CssClass="control-label">Tach #1</asp:label></td>
										                        <td>
											                        <asp:textbox id="txtTach1" tabIndex="51" runat="server"  CssClass="form-control input-sm" type="number" step=".01"></asp:textbox></td>
										                        <td style="text-align:right;">
											                        <asp:label id="lblTach2" runat="server"  CssClass="control-label" >Tach #2</asp:label></td>
										                        <td>
											                        <asp:textbox id="txtTach2" tabIndex="52" runat="server"  CssClass="form-control input-sm" type="number" step=".01"></asp:textbox></td>
									                        </tr>
									                        <tr>
										                        <td style="text-align:right;">
											                        <asp:label id="lbl100hr" runat="server"  CssClass="control-label" >100 hr</asp:label>
										                        </td>
										                        <td>
                                                                    <div class="input-group" style="width: 100%">
											                            <asp:textbox id="txt100hr" tabIndex="53" runat="server"  CssClass="form-control input-sm" type="number" step=".1"></asp:textbox>
                                                                        <span class="input-group-addon"><asp:CheckBox ID="chk100NotApplicable" tabIndex="55" runat="server" /> n/a</span>
                                                                    </div>
										                        </td>
										                        <td style="text-align:right;">
											                        <asp:label id="lbl50hr" runat="server"  CssClass="control-label" >50 hr</asp:label>
										                        </td>
										                        <td>
                                                                    <div class="input-group" style="width: 100%">
											                            <asp:textbox id="txt50hr" tabIndex="54" runat="server"  CssClass="form-control input-sm" type="number" step=".1"></asp:textbox>
                                                                        <span class="input-group-addon"><asp:CheckBox ID="chk50NotApplicable" tabIndex="55" runat="server" /> n/a</span>
                                                                    </div>
										                        </td>
										                        <td style="text-align:right;">
											                            <asp:label id="lbl25hr" runat="server"   CssClass="control-label">25 hr</asp:label>
                                                                </td>
                                                                <td>
                                                                    <div class="input-group" style="width: 100%">
											                            <asp:textbox id="txt25hr" tabIndex="55" runat="server"  CssClass="form-control input-sm"  type="number" step=".1"></asp:textbox>
                                                                        <span class="input-group-addon"><asp:CheckBox ID="chk25NotApplicable" tabIndex="55" runat="server" /> n/a</span>
                                                                    </div>
                                                                
                                                                </td>
									                        </tr>
                                                            <tr>
										                        <td style="text-align:right;">
											                        <asp:label id="lbl100hrDate" runat="server"  CssClass="control-label" >100 hr Date</asp:label></td>
										                        <td>
											                        <asp:textbox id="txt100hrDate" tabIndex="55" runat="server"  CssClass="form-control input-sm"></asp:textbox>
                                                                </td>
										                        <td style="text-align:right;">
											                        <asp:label id="lbl50hrDate" runat="server"   CssClass="control-label">50 hr Date</asp:label></td>
										                        <td>
											                        <asp:textbox id="txt50hrDate" tabIndex="55" runat="server"  CssClass="form-control input-sm"></asp:textbox>
                                                                </td>
										                        <td style="text-align:right;">
											                        <asp:label id="lbl25hrDate" runat="server"  CssClass="control-label" >25 hr Date</asp:label></td>
										                        <td>
											                        <asp:textbox id="txt25hrDate" tabIndex="55" runat="server"  CssClass="form-control input-sm"></asp:textbox>
                                                                </td>
                                                            </tr>
									                        <tr>
										                        <td style="text-align:right;">
											                        <asp:label id="lblAnnualDate" runat="server"  CssClass="control-label" >Annual Date</asp:label></td>
										                        <td>
											                        <asp:textbox id="txtAnnualDate" tabIndex="56" runat="server" CssClass="form-control date-picker-sp"></asp:textbox>
										                        </td>
										                        <td style="text-align:right;">
											                        <asp:label id="lblPitotStatic" runat="server"  CssClass="control-label" >Pitot Static</asp:label></td>
										                        <td>
											                        <asp:textbox id="txtPitotStatic" tabIndex="57" runat="server"  CssClass="form-control date-picker-sp"></asp:textbox>
                                                                </td>
										                        <td style="text-align:right;">
											                        <asp:label id="Label18" runat="server"  CssClass="control-label" >Registration</asp:label></td>
										                        <td>
											                        <asp:textbox id="txtRegistration" tabIndex="57" runat="server"  CssClass="form-control date-picker-sp"></asp:textbox>
                                                                </td>
									                        </tr>
									                        <tr>
										                        <td style="text-align:right;">
											                        <asp:label id="lblElt" runat="server"   CssClass="control-label"> Elt</asp:label></td>
										                        <td>
											                        <asp:textbox id="txtElt" tabIndex="58" runat="server"  CssClass="form-control date-picker-sp"></asp:textbox>
                                                                </td>
										                        <td style="text-align:right;">
											                        <asp:label id="lbltransponder" runat="server"  CssClass="control-label" >Transponder</asp:label></td>
										                        <td>
											                        <asp:textbox id="txttransponder" tabIndex="59" runat="server"  CssClass="form-control date-picker-sp"></asp:textbox>
                                                                </td>
									                        </tr>
									                        <tr>
										                        <td style="text-align:right;">
											                        <asp:label id="lblEltBatteryDate" runat="server"  CssClass="control-label" >Elt Battery Exp. Date</asp:label></td>
										                        <td>
											                        <asp:textbox id="txtEltBatteryDate" tabIndex="60" runat="server"  CssClass="form-control date-picker-sp"></asp:textbox>
                                                                </td>
										                        <td style="text-align:right;">
											                        <asp:label id="Label1" runat="server"  CssClass="control-label" >GPS Exp. Date</asp:label></td>
										                        <td>
											                        <asp:textbox id="txtGPSDate" tabIndex="61" runat="server"  CssClass="form-control date-picker-sp"></asp:textbox>
                                                                </td>
									                        </tr>
                                                            <tr>
										                        <td style="text-align:right;">
											                        <asp:label id="lblCycles" runat="server"  CssClass="control-label" >Cycles</asp:label></td>
										                        <td>
											                        <asp:textbox id="txtCycles" tabIndex="62" runat="server"  CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                                                </td>
										                        <td style="text-align:right;">
											                        <asp:label id="lblLandings" runat="server"  CssClass="control-label" >Landings</asp:label></td>
										                        <td>
											                        <asp:textbox id="txtLandings" tabIndex="63" runat="server"  CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                                                </td>
                                                            </tr>
								                        </table>
                                                        </div>
                                                    </div>
							                    </td>
						                    </tr>
						                    <tr>
							                    <td >
                                                    <div id="fsVORCheck" runat="server" class="panel panel-default">
                                                          <div class="panel-heading">
                                                            <h4 class="panel-title" style="text-align:left">VOR Check</h4>
                                                          </div>
                                                          <div class="panel-body">
                                                                <table class="table table-condensed">
                                                                <tr>
										                            <td style="text-align:right;">
											                            <asp:label id="Label8" runat="server"  >Date</asp:label>
                                                                    </td>
										                            <td>
											                            <asp:textbox id="txtVORChkDate" tabIndex="64" runat="server"  CssClass="form-control date-picker-sp"></asp:textbox>
                                                                    </td>
										                            <td style="text-align:right;">
											                            <asp:label id="Label6" runat="server"  >Facility</asp:label>
                                                                    </td>
										                            <td>
											                            <asp:textbox id="txtVORChkFacility" tabIndex="65" runat="server"  CssClass="form-control input-sm"></asp:textbox>
                                                                    </td>
										                            <td style="text-align:right;">
											                            <asp:label id="Label7" runat="server"  >Frequency</asp:label>
                                                                    </td>
										                            <td>
											                            <asp:textbox id="txtVORChkFrequency" tabIndex="66" runat="server"  CssClass="form-control input-sm" type="number" step=".01"></asp:textbox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
										                            <td style="text-align:right;">
											                            <asp:label id="Label9" runat="server"  >Nav 1</asp:label>
                                                                    </td>
										                            <td>
											                            <asp:textbox id="txtVORChkNav1" tabIndex="67" runat="server" CssClass="form-control input-sm"  type="number" step="1"></asp:textbox>
                                                                    </td>
										                            <td style="text-align:right;">
											                            <asp:label id="Label10" runat="server"  >Nav 2</asp:label>
                                                                    </td>
										                            <td>
											                            <asp:textbox id="txtVORChkNav2" tabIndex="68" runat="server" CssClass="form-control input-sm" type="number" step="1" ></asp:textbox>
                                                                    </td>
										                            <td style="text-align:right;">
											                            <asp:label id="Label11" runat="server"  >Nav 3</asp:label>
                                                                    </td>
										                            <td>
											                            <asp:textbox id="txtVORChkNav3" tabIndex="69" runat="server" CssClass="form-control input-sm"  type="number" step="1"></asp:textbox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
										                            <td style="text-align:right;">
											                            <asp:label id="Label12" runat="server"  >Pilot</asp:label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtVORChkPilotName" runat="server"  tabIndex="69"  AutoCompleteType="Disabled" CssClass="form-control input-sm" data-toggle="tooltip" title="Enter first few letters of last name and select from the list"></asp:TextBox>
                                                                    </td>
									                                <td style="text-align:right;">
										                                <asp:label id="Label28" runat="server"  
                                                                            >Type</asp:label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:DropDownList ID="lstVORChkType" runat="server"  tabIndex="69" CssClass="form-control input-sm">
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td style="text-align:right;">
									                                    <asp:label id="lblFindPilot" runat="server" > </asp:label>
                                                                    </td>
                                                                </tr>
                                                        </table>
                                                        </div>
                                                    </div>                                                
							                    </td>
                                            </tr>
						                    <tr>
							                    <td >
                                                    <div id="fsEngine" runat="server" class="panel panel-default">
                                                          <div class="panel-heading">
                                                            <h4 class="panel-title" style="text-align:left">Engine</h4>
                                                          </div>
                                                          <div class="panel-body">
								                                <table class="table table-condensed">
                                                                <tr>
										                            <td style="text-align:right;">
											                            <asp:label id="Label3" runat="server"  >Last Engine Overhaul</asp:label>
                                                                    </td>
										                            <td>
											                            <asp:textbox id="txtEngineOverhaul" tabIndex="71" runat="server" CssClass="form-control input-sm"  type="number" step=".1"></asp:textbox>
                                                                    </td>
										                            <td style="text-align:right;">
											                            <asp:label id="Label4" runat="server"  >Engine TBO</asp:label>
                                                                    </td>
										                            <td>
											                            <asp:textbox id="txtEngineTBO" tabIndex="72" runat="server" CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                                                    </td>
										                            <td style="text-align:right;">
											                            <asp:label id="Label5" runat="server"  >Hours Since Overhaul</asp:label>
                                                                    </td>
										                            <td>
											                            <asp:label id="lblHoursSinceOverhaul" runat="server" ></asp:label>
                                                                    </td>
                                                                </tr>
                                                        </table>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
						                    <tr>
							                    <td >
                                                    <div id="fsAPU" runat="server" class="panel panel-default">
                                                          <div class="panel-heading">
                                                            <h4 class="panel-title" style="text-align:left">APU</h4>
                                                          </div>
                                                          <div class="panel-body">
								                                <table class="table table-condensed">
									                            <tr>
										                            <td style="text-align:right;">
											                            <asp:label id="lblCurrentAPU" runat="server"  >Total Time</asp:label></td>
										                            <td>
											                            <asp:textbox id="txtCurrentAPU" tabIndex="73" runat="server" CssClass="form-control input-sm" type="number" step=".1"></asp:textbox></td>
										                            <td style="text-align:right;">
											                            <asp:label id="lblAPUCycles" runat="server"  >Cycles</asp:label></td>
										                            <td>
											                            <asp:textbox id="txtAPUCycles" tabIndex="74" runat="server" CssClass="form-control input-sm" type="number" step="1"></asp:textbox>
                                                                    </td>
                                                                </tr>
                                                                </table>
                                                        </div>
                                                    </div>
                                            </tr>
						                    <tr>
							                    <td>
                                                    <div id="Div1" runat="server" class="panel panel-default">
                                                          <div class="panel-heading">
                                                            <h4 id="lgADs" runat="server" class="panel-title" style="text-align:left">Recurring Airworthiness Directives</h4>
                                                          </div>
                                                          <div class="panel-body">
								                            <asp:table id="tblCustomFields" runat="server" CssClass="table table-condensed"></asp:table>
                                                            </div>
                                                    </div>

                                                </td>
						                    </tr>
						                    <tr>
							                    <td>
								                    <asp:textbox id="txtID" runat="server"  Visible="False"></asp:textbox>
								                    <asp:textbox id="txtCompanyID" runat="server"  Visible="False"></asp:textbox>
								                    <asp:textbox id="txtOriginatingPage" runat="server"  Visible="False"></asp:textbox>
								                    <asp:textbox id="txtMessageXML" runat="server"  Visible="False"></asp:textbox></td>
							                    <td></td>
						                    </tr>
					                    </table>
                                    </div>
                                </div>
                                <div class="col-sm-2" style="padding-top:15px;">
                                    <div style="padding:3px;font-size:small;">
								        <asp:hyperlink id="hypADs" runat="server"  CssClass="BodyAnchor">Setup ADs</asp:hyperlink>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="sectionMaintenanceLog" class="tab-pane fade">
                         <div class="container">
                            <div class="row">
                                <div class="col-sm-3" style="padding:15px;text-align:center;">
                                    <asp:label id="Label14" runat="server">Maintenance Trigger:&nbsp;&nbsp;</asp:label>
                                    <strong><asp:label id="lblMaintenanceTrigger" runat="server"></asp:label></strong>
                                </div>
                                <div class="col-sm-3" style="padding:15px;text-align:center;">
                                    <div>
                                            <asp:label id="lblMaintenanceTimeDesc" runat="server" CssClass="control-label">Airframe Time:&nbsp;&nbsp;</asp:label>
							                <strong><asp:label id="lblMaintenanceTime" runat="server" CssClass="control-label" ></asp:label></strong>
                                    </div>
                                </div>
                                <div class="col-sm-3" style="padding:15px;text-align:center;">
                                    <div>
							                <asp:label id="lblHoursUntilMaintenanceDesc" runat="server" CssClass="control-label">Hours Until Maint:&nbsp;&nbsp;</asp:label>
							                <strong><asp:label id="lblHoursUntilMaintenance2" runat="server" CssClass="control-label" Text="0"></asp:label></strong>
                                    </div>
                                </div>
                                <div class="col-sm-3" style="padding:15px;text-align:center;">
                                    <div>
                                            <asp:Button ID="btnLoadLog" runat="server" Text="Refresh" OnClientClick="javascript:LoadInspectionsComponents();" CssClass="btn btn-default" />
                                            <asp:Button ID="btnCopyLog" runat="server" Text="Copy" OnClientClick="javascript:CopyInspectionsComponents(); return false;"  CssClass="btn btn-default"/>
                                            <asp:hyperlink id="hypDownloadMaintLog" ToolTip="Download" ImageUrl="~/Flight.NET/Images/Application/download.png" runat="server" ></asp:hyperlink>
                                            <asp:hyperlink id="hypPrintMaintLog" ToolTip="Print" ImageUrl="~/Flight.NET/Images/Application/print.png" runat="server" ></asp:hyperlink>
                                    </div>
                                </div>
                            </div>
                            <div>
                            <div runat="server" class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title" style="text-align:left">Inspections</h4>
                                    </div>
                                    <div class="form-inline">
                                        <div style="float:left;padding-left:20px;padding-top:15px;">
						                    <asp:hyperlink id="hypAddInspection" tabIndex="15" runat="server" >Add Inspection</asp:hyperlink>
                                            &nbsp;&nbsp;
						                    <asp:hyperlink id="hypAddADs" tabIndex="15" runat="server" >Add Airworthiness Directive(s)</asp:hyperlink>
                                        </div>
                                        <div style="float:right;">
                                            <div style="padding-right:20px;padding-top:15px;padding-bottom:15px;">
                                                <div class="form-group">
									                <asp:label id="Label20" runat="server" CssClass="control-label">Filter by</asp:label>
									                <asp:dropdownlist id="ddlInspectionFilter" tabIndex="17" runat="server" AutoPostBack="true" CssClass="form-control input-sm"></asp:dropdownlist>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div style="padding:15px;">
						                <asp:datagrid id="dgInspections" runat="server" CssClass="table table-hover table-condensed table-bordered" AutoGenerateColumns="False"  AllowSorting="True" GridLines="None">
							            
							                <HeaderStyle></HeaderStyle>
							                <Columns>
								                <asp:BoundColumn DataField="Notes" SortExpression="Notes" HeaderText="Description" HeaderStyle-HorizontalAlign="Center">
        
                                                </asp:BoundColumn>
								                <asp:HyperLinkColumn DataNavigateUrlField="Reference" SortExpression="Reference" DataNavigateUrlFormatString="javascript:DisplayFAASite('{0}')"
									                DataTextField="Reference" HeaderText="Reference">
        
                                                </asp:HyperLinkColumn>
								                <asp:BoundColumn DataField="IntervalType" HeaderText="Interval Type" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
								                <asp:BoundColumn DataField="Interval" HeaderText="Interval" DataFormatString="{0:0}" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" ></asp:BoundColumn>
								                <asp:HyperLinkColumn DataTextField="ActionType" HeaderText="Action" HeaderStyle-HorizontalAlign="Center" DataNavigateUrlField="ID" DataNavigateUrlFormatString="javascript: DisplayInspection({0});" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center"></asp:HyperLinkColumn>
								                <asp:BoundColumn DataField="LastDate" HeaderText="Completed" DataFormatString="{0:MM/dd/yyyy}" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="75px" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
								                <asp:BoundColumn DataField="LastValue" HeaderText="Hours/Cyles" DataFormatString="{0:0.00}" HeaderStyle-HorizontalAlign="Center"  ItemStyle-Width="75px" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
								                <asp:BoundColumn DataField="LastOverageValue" HeaderText="Over" DataFormatString="{0:0.00}" HeaderStyle-HorizontalAlign="Center"  ItemStyle-Width="75px" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
								                <asp:BoundColumn DataField="RemainingInterval" SortExpression="RemainingInterval" HeaderText="Remaining" DataFormatString="{0:0.00}" HeaderStyle-HorizontalAlign="Center"  ItemStyle-Width="75px" ItemStyle-HorizontalAlign="Right">
        
                                                </asp:BoundColumn>

                                                <asp:TemplateColumn ItemStyle-Width="30px">
                                                    <ItemTemplate>
                                                        <asp:HyperLink ID="hypEdit" Text='<%#IIf(DataBinder.Eval(Container.DataItem, "BuiltInInspectionID") > 0, "", "edit") %>' runat="server" NavigateUrl='<%# "javascript: DisplayInspection(" &  DataBinder.Eval(Container.DataItem, "ID") & ")" %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn ItemStyle-Width="30px">
                                                    <ItemTemplate>
                                                        <asp:HyperLink ID="hypRemove" Text='<%# iif(DataBinder.Eval(Container.DataItem, "BuiltInInspectionID") > 0, "", "remove") %>' runat="server" NavigateUrl='<%# "javascript: RemoveInspection(" &  DataBinder.Eval(Container.DataItem, "ID") & ")" %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
							                </Columns>
						                </asp:datagrid>
                                    </div>
                            </div>
                                                        
                            <div id="Div3" runat="server" class="panel panel-default">
                                <div class="panel-heading">
                                <h4 class="panel-title" style="text-align:left">Components</h4>
                            </div>
                            <div class="form-inline">
                                <div class="form-group" style="padding-left:20px;padding-top:15px;">
						            <asp:hyperlink id="hypAddComponent" tabIndex="15" runat="server" >Add&nbsp;&nbsp&nbsp;</asp:hyperlink>
                                    <div class="form-group">
									    <asp:label id="Label24" runat="server" > Filter by</asp:label>
									    <asp:dropdownlist id="ddlComponents" tabIndex="17" runat="server" AutoPostBack="true" CssClass="form-control input-sm"></asp:dropdownlist>
                                    </div>
                                </div>
                                <div class="form-group" style="float:right;padding-right:20px;padding-top:15px;">
									<asp:label id="Label22" runat="server"  > Filter by</asp:label>
									<asp:dropdownlist id="ddlComponentInspectionFilter" tabIndex="17" runat="server" AutoPostBack="true" CssClass="form-control input-sm"></asp:dropdownlist>
                                </div>
                            </div>
                            <div style="padding:15px;">
						        <asp:datagrid id="dgComponents" runat="server" AutoGenerateColumns="False" AllowSorting="true" CssClass="table table-hover table-condensed table-bordered">
							        <Columns>
								        <asp:BoundColumn DataField="Description" SortExpression="Description" HeaderText="Description" HeaderStyle-HorizontalAlign="Center">

                                        </asp:BoundColumn>
								        <asp:BoundColumn DataField="PartNumber" SortExpression="PartNumber" HeaderText="Part Number" HeaderStyle-HorizontalAlign="Center">

                                        </asp:BoundColumn>
								        <asp:BoundColumn DataField="SerialNumber" SortExpression="Serial Number" HeaderText="Serial Number" HeaderStyle-HorizontalAlign="Center" >

                                        </asp:BoundColumn>
								        <asp:BoundColumn DataField="Hours" HeaderText="Hours" DataFormatString="{0:0.00}" HeaderStyle-HorizontalAlign="Center"  ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
								        <asp:BoundColumn DataField="Cycles" HeaderText="Cycles" HeaderStyle-HorizontalAlign="Center"  ItemStyle-Width="75px" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
								        <asp:BoundColumn DataField="Notes" SortExpression="Notes" HeaderText="Description" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="200px">

                                        </asp:BoundColumn>
								        <asp:HyperLinkColumn DataNavigateUrlField="Reference" DataNavigateUrlFormatString="javascript:DisplayFAASite('{0}')"
									        DataTextField="Reference" SortExpression="Reference" HeaderText="Reference">

                                        </asp:HyperLinkColumn>
								        <asp:BoundColumn DataField="IntervalType" HeaderText="Interval Type" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
								        <asp:BoundColumn DataField="Interval" HeaderText="Interval" DataFormatString="{0:0}" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" ></asp:BoundColumn>
								        <asp:HyperLinkColumn  DataTextField="ActionType" HeaderText="Action" DataNavigateUrlField="InspectionID" DataNavigateUrlFormatString="javascript: DisplayInspection({0},false);" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:HyperLinkColumn>
								        <asp:BoundColumn DataField="LastDate" HeaderText="Completed" DataFormatString="{0:MM/dd/yyyy}" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
								        <asp:BoundColumn DataField="LastValue" HeaderText="Hours/Cyles" DataFormatString="{0:0.00}" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
								        <asp:BoundColumn DataField="RemainingInterval" SortExpression="RemainingInterval" HeaderText="Remaining" DataFormatString="{0:0.00}" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right">
                                        </asp:BoundColumn>

								        <asp:HyperLinkColumn Text="edit" DataNavigateUrlField="ID" DataNavigateUrlFormatString="javascript: DisplayComponent({0},false);" HeaderText="" ItemStyle-HorizontalAlign="Center"></asp:HyperLinkColumn>
								        <asp:HyperLinkColumn Text="remove" DataNavigateUrlField="ID" DataNavigateUrlFormatString="javascript: RemoveSubComponent({0});" ></asp:HyperLinkColumn>
							        </Columns>
						        </asp:datagrid>
                            </div>              
                                        </div>   
                                    </div>
                         </div>
                    </div>
                    <div id="sectionPilotCurrency" class="tab-pane fade">
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-8" style="padding-top:15px;">
                                    <div class="form-horizontal pull-right" style="width:90%;margin:0 auto;padding:20px;">
								        <asp:label id="lblPilotCurrencyHeaderDesc" runat="server"
									        ForeColor="Red">Note:  You must be using Dispatch and Enforce Aircraft Checkouts to Utilize this Field</asp:label>
                                    </div>
                                    <div class="form-horizontal pull-right" style="width:90%;margin:0 auto;padding:20px;">
                                        <div class="form-group">
								            <asp:label id="lblCurrencyInDays" runat="server" Width="168px" CssClass="col-sm-2 control-label" data-toggle="tooltip" title="Leave value at 0 for no limit">Currency in Days</asp:label>
                                            <div class="col-sm-8">
								                <asp:textbox id="txtCurrency" tabIndex="18" runat="server" Width="96px" CssClass="form-control input-sm" data-toggle="tooltip" title="Leave value at 0 for no limit" type="number" step="1"></asp:textbox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="sectionDocuments" class="tab-pane fade">
                        <div style="width:100%;width:50%;margin:0 auto;padding:15px;">
                            <div style="float:left;">
                                <asp:Table ID="tblFiles" runat="server" Width="200px" CssClass="table table-hover table-condensed">
                                </asp:Table>
                            </div>
                            <div style="float:left;padding-left:15px;">
                                <asp:LinkButton ID="btnUploadFile" runat="server" Width="100px"
                                    CssClass="btn btn-default">
                                        <span aria-hidden="true" class="glyphicon glyphicon-upload"></span>&nbsp;&nbsp;Upload
                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>
                    <div id="sectionLocationDeps" class="tab-pane fade">
                            <div>
                                <fieldset id="fsCourseLesson" runat="server">
                                    <legend class="col-sm-2 control-label">Locations and Departments</legend>
                                        <asp:Panel ID="Panel1" ScrollBars="Auto" runat="server">
                                        <asp:TreeView ID="tvDepartments" runat="server" NodeWrap="true"
                                            CssClass="col-sm-2 control-label"
                                            SelectedNodeStyle-BackColor="LightGray" >
                                        </asp:TreeView>
                                    </asp:Panel>
                                </fieldset>
                            </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer navbar-fixed-bottom" style="background-color:gainsboro;">
            <div style="width:50%;padding:5px;float:left;text-align:right;">
                            <asp:hyperlink id="hypSquawks" runat="server" >Squawks <span id="hypSquawkCount" runat="server" class="badge"></span></asp:hyperlink>
	                        <asp:hyperlink id="hypLocations" runat="server" >Switch Locations</asp:hyperlink>
            </div>
            <div style="width:50%;padding:5px;float:right;text-align:right;">
                            <asp:LinkButton ID="cmdSave" runat="server" Width="100px"
                                CssClass="btn btn-default">
                                    <span aria-hidden="true" class="glyphicon glyphicon-floppy-disk"></span>&nbsp;&nbsp;Save
                            </asp:LinkButton>
                            <asp:LinkButton ID="cmdCancel" runat="server" Width="100px"
                                CssClass="btn btn-default">
                                    <span aria-hidden="true" class="glyphicon glyphicon-remove-circle"></span>&nbsp;&nbsp;Cancel
                            </asp:LinkButton>
                            <asp:LinkButton ID="cmdDelete" runat="server" Width="100px"
                                CssClass="btn btn-default">
                                    <span aria-hidden="true" class="glyphicon glyphicon-trash"></span>&nbsp;&nbsp;Delete
                            </asp:LinkButton>
            </div>
        </div>

        <asp:TextBox ID="txtPartyID" runat="server" Visible="false"></asp:textbox>
        <asp:Button ID="hidDelete" runat="server" Text="Delete" CausesValidation="False" style="visibility:hidden;" />
        <asp:Button ID="hidRemoveImage" runat="server" Text="Delete" CausesValidation="False" style="visibility:hidden;" />
        <asp:Button ID="hidRemoveFile" runat="server" Text="Delete" CausesValidation="False" style="visibility:hidden;" />
        <asp:HiddenField ID="hidGeneric" runat="server" />
        <div style="clear:both;"></div>

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

                $('form').validator.Constructor.FOCUS_OFFSET=100
                $('form').validator()
            });

            function ValidateForm() {

                var blnValid = true;
                var strAlert = '';
                //var txt;

                var strMake = 'Make';
                var strModel = 'Model';
                var strTailnumber = 'Tail Number';

                var intAppTypeID = document.getElementById('txtAppTypeID').value;
                if (intAppTypeID == 2) {
                    strMake = document.getElementById('txtResourceDescriptor').value;
                    strModel = 'Type';
                    strTailnumber = 'Identifier';
                }
                if (document.getElementById('<%= txtMake.ClientID%>').value == '') {
                    strAlert = '</br>Invalid ' + strMake;
                    blnValid = false;
                }

                if (document.getElementById('<%= txtModel.ClientID%>').value == '') {
                    strAlert = strAlert + '</br>Invalid ' + strModel;
                    blnValid = false;
                }

                if (document.getElementById('<%= txtTailNumber.ClientID%>').value == '') {
                    strAlert = strAlert + '</br>Invalid ' + strTailnumber;
                    blnValid = false;
                }

                var validator = $("form").data("bs.validator");
                validator.validate();

                if (validator.hasErrors() || !blnValid) {
                    $('#AircraftTabs a[href="#sectionAircraft"]').tab('show');
                    bootbox.alert("Please correct the following errors:\n" + strAlert)
                    return false;
                } else {
                    return true;
                }
                //validator.validate({
                //    focusInvalid: false,
                //    invalidHandler: function (form, validator) {

                //        if (!validator.numberOfInvalids()) {
                //            alert('true')
                //            return true;
                //        }
                //        else {
                //            $('html, body').animate({
                //                scrollTop: $(validator.errorList[0].element).offset().top
                //            }, 1000);
                //            alert('false')
                //            return false;
                //        }
                //    }
                //});

                //var validator = $("form").data("bs.validator");
                //validator.validate();

            }

            $(function () {
                $('#<%= cmdSave.ClientID %>').click(function () {
                    return ValidateForm();
                });
            });

            $(function () {
                var tabName = $("[id*=hidTab]").val() != "" ? $("[id*=hidTab]").val() : "sectionAircraft";
                $('#AircraftTabs a[href="#' + tabName + '"]').tab('show');
                $("#AircraftTabs a").click(function () {
                    $("[id*=hidTab]").val($(this).attr("href").replace("#", ""));
                    if ($("[id*=hidTab]").val() == 'sectionMaintenanceLog')
                        LoadInspectionsComponents();
                });
            });

            $(function () {
                $('#<%=txtVORChkPilotName.ClientID%>').typeahead({
                    hint: true,
                    highlight: true,
                    minLength: 1
                    , source: function (request, response) {
                        $.ajax({
                            url: '<%=ResolveUrl("~/Flight.NET/Plane.aspx/GetCompletionList") %>',
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
                        $('[id*=txtVORChkPilotID]').val(map[item].id);
                        return item;
                    }
                        });
                    });
    </script>
</asp:Content>
