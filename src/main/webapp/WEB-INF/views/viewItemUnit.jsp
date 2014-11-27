<script type="text/javascript">
	$(document).ready(function() {
		$('#viewItemUnit').dataTable({
			"processing" : true,
			"ajax" : {
				"url" : "/merchantdb/viewItemUnitJson",
				"type" : "POST"
			},
			"columns" : [ {
				"data" : "unitName"
			}, {
				"data" : "weight"
			} ]
		});
		var table = $('#viewItemUnit').DataTable();
		$('#viewItemUnit tbody').on('click', 'tr', function() {
			var rowData = table.row(this).data();
			$("#itemUnitModal").dialog({
				height : 350,
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
			$("#itemUnitModal").dialog("open");
			$(".ui-dialog-titlebar").hide();
			$("[name = unitId]").val(rowData.unitId);
			$("[name = unitName]").val(rowData.unitName);
			$("[name = weight]").val(rowData.weight);
		});
	});
</script>
</head>
<body>
	<div class="adminMenuTitle">
		View Item Unit
		<hr
			style="border: none; height: 1px; width: 40%; background-color: #505050"
			align="left" />
	</div>
	<div class="dataTableDiv">
		<table id="viewItemUnit" class="display dataTable" cellspacing="0"
			border=1 role="grid" style="border: 0px solid #C0C0C0">
			<thead>
				<tr>
					<th>Unit Name</th>
					<th>Weight</th>
				</tr>
			</thead>
		</table>
		<br/>
		<div id="itemUnitModal" title="Update Item Unit" style="display: none">
			<span style="font-size: 22px;">Item Unit Form</span>
		<hr
			style="border: none; height: 1px; width: 70%; background-color: #505050"
			align="left" />
			<br/><br/>
			<form method="post" action="/merchantdb/updateItemUnit" style = "margin-left:25%">
				<input type="hidden" name="unitId" />
				<table id="UpdateCGTable" style="border:1px solid #8080B2; padding:10px">
					<tr>
						<td>Unit Name</td>
						<td><input type="text" name="unitName" /></td>
					</tr>
					<tr>
						<td>Weight</td>
						<td><input type="text" name="weight" /></td>
					</tr>
					<tr>
						<td><input type="submit" value="Update"></td>
						<td><input type="reset" value="Clear"></td>
					</tr>
				</table>
			</form>
			<form method="post" action="/merchantdb/deleteItemUnit">
				<input type="hidden" name="unitId" />
				<table>
					<tr>
						<td><input type="submit" value="Remove"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>