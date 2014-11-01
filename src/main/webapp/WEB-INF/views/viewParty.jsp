<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Company</title>
<script type="text/javascript" src="./js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css"
	href="./css/jquery.dataTables.css">
<style type="text/css">
.ui-dialog .ui-dialog-content {
	background: none repeat scroll 0 0 transparent;
	border: 0 none;
	overflow: auto;
	padding: 0.5em 1em;
	position: relative;
	font-size: 0.7em;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('#viewParty').dataTable({
			"processing" : true,
			"pagingType" : "full_numbers",
			"serverSide" : true,
			"ajax" : {
				"url" : "http://localhost:8080/merchantdb/viewPartyJSON",
				"type" : "POST"
			},
			"columnDefs" : [ {
				"targets" : [ 0 ],
				"visible" : false,
				"searchable" : false
			}, {
				"targets" : [ 1 ],
				"visible" : false,
				"searchable" : false
			}, {
				"targets" : [ 6 ],
				"visible" : false,
				"searchable" : false
			}, {
				"targets" : [ 7 ],
				"visible" : false,
				"searchable" : false
			}, {
				"targets" : [ 8 ],
				"visible" : false,
				"searchable" : false
			} ],
			"columns" : [ {
				"data" : "partyID"
			}, {
				"data" : "companyID"
			}, {
				"data" : "partyName"
			}, {
				"data" : "partyType"
			}, {
				"data" : "ledgerGroupName"
			}, {
				"data" : "cityGroup"
			}, {
				"data" : "streetName"
			}, {
				"data" : "city"
			}, {
				"data" : "telephone"
			} ]
		});
		var table = $('#viewParty').DataTable();
		$('#viewParty tbody').on('click', 'tr', function() {
			var rowData = table.row(this).data();
			$("[name = partyName]").val(rowData.partyName);
			$("[name = partyType]").val(rowData.partyType);
			$("[name = streetName]").val(rowData.streetName);
			$("[name = city]").val(rowData.city);
			$("[name = telephone]").val(rowData.telephone);
			$("[name = partyID]").val(rowData.partyID);
			$("#dialog").dialog();
		});
	});
</script>
</head>
<body>
	<a
		href="/merchantdb/createParty?companyID=<%=request.getParameter("companyID")%>"
		style="text-decoration: none"><input type="button"
		value="Create Party"></a>
	<table id="viewParty">
		<thead>
			<tr>
				<th>PartyID</th>
				<th>CompanyID</th>
				<th>PartyName</th>
				<th>PartyType</th>
				<th>LedgerGroupName</th>
				<th>CityGroup</th>
				<th>StreetName</th>
				<th>City</th>
				<th>Telephone#</th>
			</tr>
		</thead>
	</table>
	<div id="dialog" title="Update Ledger Group" style="display: none">
		<form action="/merchantdb/updateParty" method="post">
			<input type="hidden" name="partyID" value="">
			<center>
				<h3>Create Party</h3>
				<p>${partyUpdationStatus}</p>
				<table align="center">
					<tr>
						<td>Party Name</td>
						<td><input type="text" name="partyName" /></td>
					</tr>
					<tr>
						<td>Party Type</td>
						<td><select name="partyType">
								<option value="select">Select</option>
								<option value="Trade Creditor">Trade Creditor</option>
								<option value="Trade Debtor">Trade Debtor</option>
								<option value="Owner">Owner</option>
								<option value="Employee">Employee</option>
						</select></td>
					</tr>
					<tr>
						<td>Street Name</td>
						<td><input type="text" name="streetName" /></td>
					</tr>
					<tr>
						<td>City</td>
						<td><input type="text" name="city" /></td>
					</tr>
					<tr>
						<td>Telephone#</td>
						<td><input type="text" name="telephone" /></td>
					</tr>
					<tr>
						<td><br></td>
					</tr>
					<tr>
						<td colspan="2"><input type="Submit" value="Update">
							<input type="reset" value="Clear"><input type="button"
							value="Close"></td>
					</tr>
				</table>
			</center>
		</form>
	</div>
</body>
</html>