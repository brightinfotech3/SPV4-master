<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="PlaneList.aspx.vb" Inherits="SchedulePointeShell.PlaneList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="server">
	<script type="text/javascript">
		function DeletePlane(PlaneID) {
		    if (confirm("This action is not recommended, all Dispatch and Order records will be permanently Deleted!  Are you sure you want to do this?")) {
		        location.href = 'PlaneList.aspx?PlaneID=' + PlaneID + '&Action=Purge';
		    }
		    else {
		        location.href = 'PlaneList.aspx?Status=Deleted';
		    }
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <div style="width:50%;margin:0 auto;">
            <div style="padding:10px">
                <div style="display:inline;">
                    <asp:label id="lblHeader" CssClass="h4" runat="server" Width="292px"> Aircraft</asp:label>
                </div>
                <div style="display:inline;float:right"">
                    <asp:hyperlink id="hypLink" runat="server" NavigateUrl="PlaneListLink.aspx">+</asp:hyperlink>
                </div>
            </div>
			<div id="lblMessage" runat="server" class="alert">ResponseMessage
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
            <div style="padding:10px">
                <div style="display:inline;">
		            <asp:button id="cmdAdd" runat="server" CssClass="btn btn-primary" Text="Add"></asp:button>
                </div>
                <div style="display:inline;float:right">
                    <asp:radiobutton id="rdActive" CssClass="radio-inline" runat="server" Text="Active" Checked="True"
			            AutoPostBack="True" GroupName="Status"></asp:radiobutton>
                    <asp:radiobutton id="rdDeleted" CssClass="radio-inline" runat="server" Text="Deleted" AutoPostBack="True"
			            GroupName="Status"></asp:radiobutton>
                </div>
            </div>
            <div style="padding:10px;">
		        <asp:table id="tblMain" runat="server" CssClass="table table-hover table-condensed"></asp:table>
		        <asp:textbox id="txtMessageXML" runat="server" Width="32px" Visible="False"></asp:textbox>
            </div>
        </div>
    </div>
</asp:Content>
