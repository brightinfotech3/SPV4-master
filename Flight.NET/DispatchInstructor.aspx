<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="DispatchInstructor.aspx.vb" Inherits="SchedulePointeShell.DispatchInstructor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="server">
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
    <table width="100%">
        <tr>
            <td align="center">
			<table border="0">
				<tr>
					<td></td>
				</tr>
				<tr>
					<td ></td>
					<td width="5"></td>
					<td colspan="6" align="left"><asp:label id="lblMessage" style="Z-INDEX: 118" runat="server" CssClass="BodyMessage" ForeColor="Black"
							Height="24px">Label</asp:label></td>
				</tr>
				<tr>
					<td align="right" valign="top"><asp:label id="lblPilot" runat="server" Width="148px" CssClass="BodyTextFieldLabels"> Pilot</asp:label></td>
					<td width="5"></td>
                    <td align="left">
                        <asp:label id="lblPilotName" runat="server" Width="168px" CssClass="BodyText"></asp:label>
                        <asp:TextBox ID="txtPilotName" runat="server" Width="150px" AutoCompleteType="Disabled" TabIndex="1"></asp:TextBox>

                        <br/>
						<asp:label id="lblFindText" runat="server" CssClass="BodyText" Width="208px">Enter first few letters of last name and select from the list or </asp:label>
                        <br />
						<asp:hyperlink id="hypFind" tabIndex="2" runat="server" CssClass="BodyAnchor" 
                            Width="80px">find more...</asp:hyperlink>
                    </td>
                    <td valign="top" rowspan="5">
                        <div style="overflow:auto;height:inherit;max-height:100px;width:100px">
                            <asp:Table ID="tblPilotCache" runat="server">
                            </asp:Table>
                        </div>
                    </td>
				</tr>
				<tr>
					<td align="right">
						<asp:label id="lblSelectAnInstructor" runat="server" CssClass="BodyTextFieldLabels" Width="144px">Select an Instructor</asp:label></td>
					<td width="5"></td>
					<td  align="left">
						<asp:listbox id="lstInstructors" tabIndex="3" runat="server" Width="208px" Height="96px" SelectionMode="Multiple"></asp:listbox></td>
					<td></td>
				</tr>
				<tr>
					<td align="right">
						<asp:label id="lblSelectAnAircraft" runat="server" CssClass="BodyTextFieldLabels" Width="144px">Select an Aircraft</asp:label></td>
					<td width="5"></td>
					<td  align="left">
						<asp:listbox id="lstAircraft" tabIndex="3" runat="server" Width="208px" Height="96px" SelectionMode="Multiple"></asp:listbox></td>
					<td></td>
				</tr>
				<tr>
					<td align="right"></td>
					<td width="5"></td>
					<td  align="left">
						<asp:button id="btnClear" tabIndex="4" runat="server" Text="Clear Selection(s)"></asp:button></td>
					<td></td>
				</tr>
				<tr>
					<td align="right">
						<asp:label id="lblInstructorGroundTime" runat="server" CssClass="BodyTextFieldLabels" Width="164px"> Instructor Ground Time</asp:label></td>
					<td width="5"></td>
					<td  align="left">
						<asp:textbox id="txtGroundTime" tabIndex="5" runat="server" Width="168px"></asp:textbox></td>
					<td></td>
				</tr>
				<tr>
					<td align="right">
						<asp:label id="lblDispatchDate" runat="server" CssClass="BodyTextFieldLabels" Width="112px"> Dispatch Date </asp:label></td>
					<td width="5"></td>
					<td  align="left">
						<asp:textbox id="txtDispatchDate" tabIndex="6" runat="server" Width="168px"></asp:textbox></td>
					<td></td>
				</tr>
				<tr>
					<td align="right" ><asp:label id="lblDispatchNotesDesc" runat="server" Width="140px" CssClass="BodyTextFieldLabels">Dispatch Notes</asp:label></td>
					<td align="left"  width="5"></td>
					<td align="left"  colspan="5">
                        <asp:textbox id="txtDispatchNotes" tabIndex="7" 
                            runat="server" Width="293px" TextMode="MultiLine" Height="58px"></asp:textbox></td>
					<td></td>
				</tr>
				<tr>
					<td align="right">
						<asp:label id="lblClose" runat="server" CssClass="BodyTextFieldLabels" Width="100px"> Close</asp:label></td>
					<td width="5"></td>
					<td  align="left">
						<asp:CheckBox id="chkClosed" tabIndex="8" runat="server"></asp:CheckBox></td>
					<td></td>
				</tr>
				<tr>
					<td align="right">
						<asp:label id="lblPilotNotes" runat="server" CssClass="BodyTextFieldLabels" Width="97px">Pilot Notes</asp:label></td>
					<td width="5"></td>
					<td  align="left">
						<asp:textbox id="txtPilotNotes" tabIndex="9" runat="server" Width="292px" Height="58px" ReadOnly="True"></asp:textbox></td>
					<td></td>
				</tr>
                <tr>
					<td align="right" ><asp:label id="lblDepartment" runat="server" Width="132px" CssClass="BodyTextFieldLabels">Location</asp:label></td>
					<td align="left"  width="5"></td>
					<td align="left" ><asp:dropdownlist id="ddlDepartment" tabIndex="9" runat="server" Width="175px"></asp:dropdownlist></td>
					<td></td>
                </tr>
                <tr><td>&nbsp;</td></tr>
				<tr>
                    <td></td>
					<td colspan="10" align="center" >
						<asp:button id="btnSave" tabIndex="10" runat="server" Text="Save"></asp:button>
						<asp:button id="btnSaveInvoice" tabIndex="11" runat="server" Text="Save &amp; Invoice"></asp:button>
						<asp:button id="btnSavePrint" tabIndex="12" runat="server" Text="Save &amp; Print" CausesValidation="False"></asp:button>
						<asp:button id="btnSaveClose" tabIndex="13" runat="server" Text="Save &amp; Close" ></asp:button>
						<asp:button id="btnCancel" tabIndex="14" runat="server" Text="Cancel" CausesValidation="False"></asp:button>
						<asp:button id="btnDelete" tabIndex="15" runat="server" Text="Delete" CausesValidation="False"></asp:button>
					</td>
					<td></td>
				</tr>
				<tr>
					<td align="right"></td>
					<td width="5"></td>
					<td >
						<asp:textbox id="txtPilotIsInstructor" runat="server" Width="32px" Visible="False"></asp:textbox>
						<asp:textbox id="txtID" runat="server" Width="32px" Visible="False"></asp:textbox>
						<asp:textbox id="txtPilotPartyID" runat="server" Width="32px" Visible="False"></asp:textbox>
						<asp:textbox id="txtScheduleID" runat="server" Width="32px" Visible="False"></asp:textbox>
						<asp:textbox id="txtStatus" runat="server" Width="32px" Visible="False"></asp:textbox>
						<asp:textbox id="txtOriginatingPage" runat="server" Visible="False" Width="32px"></asp:textbox>
						<asp:textbox id="txtMessageXML" runat="server" Width="32px" Visible="False"></asp:textbox></td>
					<td></td>
				</tr>
			</table>
            </td>
        </tr>
    </table>
</asp:Content>
