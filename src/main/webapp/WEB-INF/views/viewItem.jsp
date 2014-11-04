<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
		$('#viewItem').dataTable({
			"processing" : true,
			"pagingType": "full_numbers",
			"ajax" : {
				"url" : "/merchantdb/viewItemJSON",
				"type" : "POST"
			},
			"columns" : [ {
				"data" : "itemGroupId"
			}, {
				"data" : "itemName"
			}, {
				"data" : "weight"
			} ]
		});
		var table = $('#viewItem').DataTable();
		$('#viewItem tbody').on('click', 'tr', function() {
			var rowData = table.row(this).data();
			$("[name = itemId]").val(rowData.itemId);
			$("[name = itemGroupId]").val(rowData.itemGroupId);
			$("[name = itemName]").val(rowData.itemName);
			$("[name = weight]").val(rowData.weight);
			$("#dialog").dialog();
		});
	});
</script>
</head>
<body>
	<table id="viewItem" class="display" cellspacing="0" width="100%">
		<thead>
			<tr>
				<th>Item Group Name</th>
				<th>Item Name</th>
				<th>Weight</th>
			</tr>
		</thead>

	</table>
	<div id="dialog" title="Update Item Unit"
		style="display: none; text-size: 10px">
		<form method="post" action="/merchantdb/updateItem">
			<input type="hidden" name="itemId" />
			<table id="UpdateCGTable">
				<tr>
					<td>Item Group Name</td>
					<td><input type="text" name="itemGroupId" /></td>
				</tr>
				<tr>
					<td>Item Name</td>
					<td><input type="text" name="itemName" /></td>
				</tr>
				<tr>
					<td>Weight</td>
					<td><input type="text" name="weight" /></td>
				</tr>
				<tr>
					<td><input type="submit" value="Update"></td>
				</tr>
			</table>
		</form>
		<form method="post" action="/merchantdb/deleteItem">
			<input type="hidden" name="itemId" />
			<table>
				<tr>
					<td><input type="submit" value="Remove"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>