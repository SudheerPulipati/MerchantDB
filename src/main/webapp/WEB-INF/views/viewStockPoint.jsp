<head>
<script type="text/javascript" src="./js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css"
	href="./css/jquery.dataTables.css">
<style type="text/css">
#dialog {
	font-size: 12px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('#viewStockPoint').dataTable({
			"processing" : true,
			"ajax" : {
				"url" : "/merchantdb/viewStockPointJSON",
				"type" : "POST",
			},
			"columnDefs" : [ {
				"targets" : [ 0 ],
				"visible" : false,
				"searchable" : false
			} ],
			"columns" : [ {
				"data" : "stockID"
			}, {
				"data" : "stockPointName"
			}, {
				"data" : "stockPointAddress"
			}, {
				"data" : "stockPointCity"
			}, {
				"data" : "stockPointState"
			}, {
				"data" : "stockPointPhone"
			} ]
		});
		
		var table = $('#viewStockPoint').DataTable();

		$('#viewStockPoint tbody').on('click', 'tr', function() {
			var rowData = table.row(this).data();
			$("#updateStockPointTable").show();
			$("[name= stockID]").val(rowData.stockID);
			$("[name = stockPointName]").val(rowData.stockPointName);
			$("[name = stockPointAddress]").val(rowData.stockPointAddress);
			$("[name = stockPointCity]").val(rowData.stockPointCity);
			$("[name = stockPointState]").val(rowData.stockPointState);
			$("[name= stockPointPhone]").val(rowData.stockPointPhone);
			$("#dialog").dialog();
		});
	});
</script>
</head>
<body>
	<table id="viewStockPoint" class="display" cellspacing="0" width="100%">
		<thead>
			<tr>
				<th>Stock Point ID</th>
				<th>Unit Name</th>
				<th>Address</th>
				<th>City</th>
				<th>State</th>
				<th>Phone</th>
			</tr>
		</thead>
	</table>

	<div id="dialog" title="Update Stock Point" style="display: none">
		<form action="/merchantdb/updateStockPoint" method="post">
			<input type="hidden" name="companyID"> <input type="hidden"
				name="stockID">
			<table id="updateStockPointTable">
				<tr>
					<td>StockPoint Name</td>
					<td><input type="text" name="stockPointName"></td>
				</tr>
				<tr>
					<td>Address</td>
					<td><textArea name="stockPointAddress"></textArea></td>
				</tr>
				<tr>
					<td>City</td>
					<td><input type="text" name="stockPointCity"></td>
				</tr>
				<tr>
					<td>State</td>
					<td><input type="text" name="stockPointState"></td>
				</tr>
				<tr>
					<td>Telephone</td>
					<td><input type="text" name="stockPointPhone"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="Save"><input
						type="reset" value="Clear"></td>
				</tr>
			</table>
		</form>
		<form action="/merchantdb/deleteStockPoint" method="post">
			<input type="hidden" name="stockID"> <input type="submit"
				value="Remove" />
		</form>
	</div>
</body>