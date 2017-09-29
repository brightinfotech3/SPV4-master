<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="DispatchInstructor.aspx.vb" Inherits="SchedulePointeShell.DispatchInstructor" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="server">

    <style>
        .sharat {
            width: 100%;
            height: auto;
            background-color: rgba(234, 234, 234, 0.31);
            overflow: hidden;
            padding: 0 0 30px 0;
        }

            .sharat p {
                float: left;
                display: inline;
                text-align: right;
                margin: 0 61px 5px 0;
                width: 20%;
              
            }
            .btn-primary {
    color: #fff;
    background-color: #337ab7;
    border-color: #2e6da4;
    padding: 5px 5px;
        border-radius: 5px;
    margin: 3px 4px;
    width: 100%;
}
    </style>





















    <script language="JavaScript" type="text/javascript">
        // Launches a full window.

        function ValidateInput() {
            var blnValid = true;
            var blnConfirm = false;
            var blnInstructorsExist = true;

            var strAlert = '';

            if (document.getElementById('<%= lstInstructors.ClientID %>') == null) { blnInstructorsExist = false; }

            if (document.getElementById('<%= chkClosed.ClientID %>').checked) {
                if (blnInstructorsExist) {
                    if ((document.getElementById('<%= lstInstructors.ClientID %>').selectedIndex > -1) && (document.getElementById('<%= txtGroundTime.ClientID %>').value == 0)) {
		                    strAlert = strAlert + 'You have not entered in the Instructors Ground Time.\n';
		                    blnValid = true;
		                    blnConfirm = true;
		                }
		            }
                }

                if ((document.getElementById('txtPilotID').value) == '0') {
                    strAlert = 'You must select a Pilot.\n';
                    blnValid = false;
                }

                if (blnInstructorsExist) {
                    if (document.getElementById('<%= lstInstructors.ClientID %>').selectedIndex < 0 && document.getElementById('<%= lstAircraft.ClientID %>').selectedIndex < 0) {

                        strAlert = strAlert + 'You must select an Instructor and or an Aircraft.\n';
                        blnValid = false;
                    }
                } else {
                    if (document.getElementById('<%= lstAircraft.ClientID %>').selectedIndex < 0) {

                        strAlert = strAlert + 'You must select an Aircraft.\n';
                        blnValid = false;
                    }
                }

                var ddl = document.getElementById('<%= ddlDepartment.ClientID %>');
            if (ddl) {
                if (ddl.options[ddl.selectedIndex].value == 0) {
                    strAlert = strAlert + 'You must select a Location.\n';
                    blnValid = false;
                }
            }
            if (blnValid == true) {
                if (blnConfirm == true) {
                    if (confirm('Save this record with the following conditions?\n' + strAlert)) {
                        return true;
                    }
                    else {
                        return false;
                    }
                }
                else {
                    return true;
                }
            }
            else {
                alert('Please make the appropriate changes:\n' + strAlert);
                return false;
            }
        }

        function ConfirmNoInvoice() {
            if (confirm('Are you sure you dont want to Invoice this Dispatch?')) {
                return true;
            }
            else {
                return false;
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

                var txt = document.getElementById('<%=txtPilotNotes.ClientID %>');
		            if (txt.value.length == 0) {
		                txt.value = arrValues[1];
		            } else {
		                txt.value = txt.value + ' ' + arrValues[1];
		            }
                }

                document.forms[0].submit();
            }

            function LoadPilot(str) {

                var arr = new Array();
                arr = str.split(':');

                var arrValues = new Array();
                arrValues = arr[0].split('=');
                document.getElementById('<%=txtPilotName.ClientID %>').value = arrValues[1];
                arrValues = arr[1].split('=');
                document.getElementById('txtPilotPartyID').value = arrValues[1];
                arrValues = arr[2].split('=');
                document.getElementById('txtPilotID').value = arrValues[1];
                arrValues = arr[3].split('=');
                document.getElementById('txtPilotIsInstructor').value = arrValues[1];

                if (document.getElementById('txtPartyTypeID').value == 1) {
                    arrValues = arr[4].split('=');

                    var txt = document.getElementById('<%=txtPilotNotes.ClientID %>');
		            if (txt.value.length == 0) {
		                txt.value = arrValues[1];
		            } else {
		                txt.value = txt.value + ' ' + arrValues[1];
		            }
                }

                document.forms[0].submit();
            }
            function ConfirmDelete() {
                if (confirm('Are you sure you dont want to Delete/Undo this Dispatch?')) {
                    return true;
                }
                else {
                    return false;
                }
            }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <section class="container">
            <div class="container-page">
                <div id="Div1" runat="server" class="alert">
                    ResponseMessage
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div style="padding-left: 5px;">
                    <h4>
                        <asp:Label ID="lblMessage" Style="Z-INDEX: 118" runat="server" CssClass="BodyMessage" ForeColor="Black"
                            Height="24px">Label</asp:Label></h4>
                </div>
                <div class="tab-content">
                    <div id="sectionAircraft" class="tab-pane fade in active">

                        <div class="sharat">
                            <div class="col-sm-8 col-sm-offset-2" style="padding-top: 15px;">

                                <div class="form-group">
                                    <p style="
    margin:20px 60px 30px 0px;
">
                                        <asp:Label ID="lblPilot" runat="server"  CssClass="BodyTextFieldLabels"> Pilot</asp:Label></p>

                                    <asp:Label ID="lblPilotName" runat="server" CssClass="BodyText"></asp:Label>
                                    <asp:TextBox ID="txtPilotName" runat="server" CssClass="form-control" AutoCompleteType="Disabled" TabIndex="1" required></asp:TextBox>
                                    <div style="display: inline;" class="help-block with-errors"></div>
                                </div>


                                <h6 style="
    display: inline;
    float: left;
">
                                    <asp:Label ID="lblFindText" runat="server" CssClass="BodyText" Width="208px">Enter first few letters of last name and select from the list or </asp:Label>
                                    <asp:HyperLink ID="hypFind" TabIndex="2" runat="server" CssClass="BodyAnchor">find more...</asp:HyperLink>
                                </h6>


                                <div class="row">
                                    <div style="overflow: auto; height: inherit; max-height: 100px; width: 100px">
                                        <asp:Table ID="tblPilotCache" runat="server">
                                        </asp:Table>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <p>
                                        <asp:Label ID="lblSelectAnInstructor" runat="server" CssClass="BodyTextFieldLabels" Width="144px">Select an Instructor</asp:Label></p>

                                    <asp:ListBox ID="lstInstructors" CssClass="form-control" TabIndex="3" runat="server" Width="100%" Height="96px" SelectionMode="Multiple"></asp:ListBox>
                                </div>
                                <div class="form-group">

                                    <p>
                                        <asp:Label ID="lblSelectAnAircraft" runat="server" CssClass="BodyTextFieldLabels" Width="144px">Select an Aircraft</asp:Label></p>

                                    <asp:ListBox ID="lstAircraft" CssClass="form-control" TabIndex="3" runat="server" Width="100%" Height="96px" SelectionMode="Multiple"></asp:ListBox>

                                </div>
                                <asp:Button ID="btnClear" TabIndex="4" runat="server" Text="Clear Selection(s)" CssClass="btn-primary" style="margin: 21px auto;display: inherit;"></asp:Button>

                                <div class="form-group">

                                    <p>
                                        <asp:Label ID="lblInstructorGroundTime" runat="server" CssClass="BodyTextFieldLabels" Width="164px"> Instructor Ground Time</asp:Label></p>

                                    <asp:TextBox ID="txtGroundTime" TabIndex="5" CssClass="form-control" runat="server" Width="100%"></asp:TextBox>
                                </div>
                                <div class="form-group">

                                    <p>
                                        <asp:Label ID="lblDispatchDate" runat="server" CssClass="BodyTextFieldLabels" Width="112px"> Dispatch Date </asp:Label></p>

                                    <asp:TextBox ID="txtDispatchDate" CssClass="form-control" TabIndex="6" runat="server" Width="100%"></asp:TextBox>
                                </div>
                                <div class="form-group">

                                    <p>
                                        <asp:Label ID="lblDispatchNotesDesc" runat="server" Width="140px" CssClass="BodyTextFieldLabels">Dispatch Notes</asp:Label></p>

                                    <asp:TextBox ID="txtDispatchNotes" TabIndex="7" CssClass="form-control" runat="server" Width="100%" TextMode="MultiLine" Height="58px"></asp:TextBox>
                                </div>
                                <div class="form-group">

                                    <p>
                                        <asp:Label ID="lblClose" runat="server" CssClass="BodyTextFieldLabels" Width="100px"> Close</asp:Label></p>

                                    <asp:CheckBox ID="chkClosed" TabIndex="8" CssClass="form-control" runat="server" style="width: 281px;display: initial;"></asp:CheckBox>
                                </div>
                                <div class="form-group">

                                    <p>
                                        <asp:Label ID="lblPilotNotes" runat="server" CssClass="BodyTextFieldLabels" Width="97px">Pilot Notes</asp:Label></p>

                                    <asp:TextBox ID="txtPilotNotes" CssClass="form-control" TabIndex="9" runat="server" Width="100%" Height="58px" ReadOnly="True"></asp:TextBox>
                                </div>
                                <div class="form-group">

                                    <p>
                                        <asp:Label ID="lblDepartment" runat="server" Width="132px" CssClass="BodyTextFieldLabels">Location</asp:Label></p>

                                    <asp:DropDownList ID="ddlDepartment" CssClass="form-control" TabIndex="9" runat="server" Style="width: 100%; margin-bottom: 18px;"></asp:DropDownList>
                                </div>

                                <div class="btm_btn text-center">

                        <div class="col-md-2 col-xs-12">  <asp:Button ID="btnSave" TabIndex="10" runat="server" Text="Save" CssClass="btn-primary"></asp:Button></div>
                             <div class="col-md-2 col-xs-12">   <asp:Button ID="btnSaveInvoice" TabIndex="11" runat="server" Text="Save &amp; Invoice" CssClass="btn-primary"></asp:Button> </div>
                            <div class="col-md-2 col-xs-12">    <asp:Button ID="btnSavePrint" TabIndex="12" runat="server" Text="Save &amp; Print" CausesValidation="False" CssClass="btn-primary"></asp:Button></div>
                            <div class="col-md-2 col-xs-12">    <asp:Button ID="btnSaveClose" TabIndex="13" runat="server" Text="Save &amp; Close" CssClass="btn-primary"></asp:Button> </div>
                           <div class="col-md-2 col-xs-12">    <asp:Button ID="btnCancel" TabIndex="14" runat="server" Text="Cancel" CausesValidation="False" CssClass="btn-primary"></asp:Button></div>
                           <div class="col-md-2 col-xs-12">    <asp:Button ID="btnDelete" TabIndex="15" runat="server" Text="Delete" CausesValidation="False" CssClass="btn-primary"></asp:Button></div>

                                    </div>


                                <asp:TextBox ID="txtPilotIsInstructor" runat="server" Width="32px" Visible="False"></asp:TextBox>
                                <asp:TextBox ID="txtID" runat="server" Width="32px" Visible="False"></asp:TextBox>
                                <asp:TextBox ID="txtPilotPartyID" runat="server" Width="32px" Visible="False"></asp:TextBox>
                                <asp:TextBox ID="txtScheduleID" runat="server" Width="32px" Visible="False"></asp:TextBox>
                                <asp:TextBox ID="txtStatus" runat="server" Width="32px" Visible="False"></asp:TextBox>
                                <asp:TextBox ID="txtOriginatingPage" runat="server" Visible="False" Width="32px"></asp:TextBox>
                                <asp:TextBox ID="txtMessageXML" runat="server" Width="32px" Visible="False"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

</asp:Content>
