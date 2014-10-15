<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Company</title>
<script type="text/javascript""<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
<script type="text/javascript"
	src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.css">
<script type="text/javascript">
	$(document).ready(function() {
		$('#viewParty').dataTable({
			"processing" : true,
			"serverSide" : true,
			"ajax" : {
				"url" : "http://localhost:8080/merchantdb/viewPartyJSON",
				"type" : "POST"
			},
			"columns" : [ {
				"data" : "partyName"
			}, {
				"data" : "partyType"
			}, {
				"data" : "streetName"
			}, {
				"data" : "city"
			}, {
				"data" : "telephone"
			}, {
				"data" : "ledgerGroupName"
			}, {
				"data" : "cityGroup"
			} ]
		});
	});
</script>
</head>
<body>
	<table id="viewParty">
		<thead>
			<tr>
				<th>PartyName</th>
				<th>PartyType</th>
				<th>StreetName</th>
				<th>City</th>
				<th>Telephone#</th>
				<th>LedgerGroupName</th>
				<th>CityGroup</th>
			</tr>
		</thead>
	</table>

</body>

</html>