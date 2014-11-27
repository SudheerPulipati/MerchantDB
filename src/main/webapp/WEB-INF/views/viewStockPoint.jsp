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
			"pagingType" : "full_numbers",
			"ajax" : {
				"url" : "/merchantdb/viewStockPointJSON",
				"type" : "POST",
			},
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
			$("#stockPointModal").dialog({
				height : 450,
				width : 600,
				draggable : false,
				modal : true,
				autoOpen: false,
				buttons: {
			        "Close": function () {
			            $(this).dialog("close");
			        }
				}
			});
			
			
			$("#stockPointModal").dialog("open");
			$(".ui-dialog-titlebar").hide();
			$("#updateStockPointTable").show();
			$("[name= stockID]").val(rowData.stockID);
			$("[name = stockPointName]").val(rowData.stockPointName);
			$("[name = stockPointAddress]").val(rowData.stockPointAddress);
			$("[name = stockPointCity]").val(rowData.stockPointCity);
			$("[name = stockPointState]").val(rowData.stockPointState);
			$("[name= stockPointPhone]").val(rowData.stockPointPhone);
			
		});
	});
</script>
</head>
<body>
	<div class="adminMenuTitle">
		View Stock Point
		<hr
			style="border: none; height: 1px; width: 40%; background-color: #505050"
			align="left" />
	</div>
	<div class="dataTableDiv" style ="width:70%">
		<table id="viewStockPoint" class="display datatable" cellspacing="0"
		border=1 role="grid" style="border: 0px solid #C0C0C0">
			<thead>
				<tr>
					<th>StockID</th>
					<th>UnitName</th>
					<th>Address</th>
					<th>City</th>
					<th>State</th>
					<th>Phone</th>
				</tr>
			</thead>
		</table>

		<div id="stockPointModal" title="Update Stock Point" style="display: none">
		<span style="font-size: 22px;">Stock Point Form</span>
		<hr
			style="border: none; height: 1px; width: 70%; background-color: #505050"
			align="left" />
			<br/><br/>
			<form action="/merchantdb/updateStockPoint" method="post" style="margin-left:25%;margin-bottom:auto">
				<input type="hidden" name="companyID"> <input type="hidden"
					name="stockID">
				<table id="updateStockPointTable" style="border:1px solid #8080B2; padding:10px">
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
	</div>
</body>