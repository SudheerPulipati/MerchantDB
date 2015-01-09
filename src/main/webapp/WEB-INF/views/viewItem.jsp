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

<script type="text/javascript">
	$(document).ready(function() {
		$('#viewItem').dataTable({
			"processing" : true,
			"ajax" : {
				"url" : "/merchantdb/viewItemJSON",
				"type" : "POST"
			},
			"columns" : [ {
				"data" : "unitName"
			}, {
				"data" : "itemName"
			}, {
				"data" : "itemNoOfKgs"
			} ]
		});
		var table = $('#viewItem').DataTable();
		$('#viewItem tbody').on('click', 'tr', function() {
			var rowData = table.row(this).data();
			
			$("#itemModal").dialog({
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
			$("#itemModal").dialog("open");
			$(".ui-dialog-titlebar").hide();
			$("[name = itemId]").val(rowData.itemId);
			$("[name = unitName]").val(rowData.unitName);
			$("[name = itemName]").val(rowData.itemName);
			$("[name = itemNoOfKgs]").val(rowData.itemNoOfKgs);
		});
		$(".button").click(function(){
			var buttonName = $(this).val();
			if(buttonName == "Update"){
				$("form").attr("action","updateItem");
			}else{
				$("form").attr("action","deleteItem");
			}
		});
	});
</script>
</head>
<body>
	<div class="adminMenuTitle">
		View Item
		<hr
			style="border: none; height: 1px; width: 40%; background-color: #505050"
			align="left" />
	</div>
	<div class="dataTableDiv">
		<table id="viewItem" class="display datatable" cellspacing="0"
		border=1 role="grid" style="border: 0px solid #C0C0C0">
			<thead>
				<tr>
					<th>Item Group Name</th>
					<th>Item Name</th>
					<th>Weight</th>
				</tr>
			</thead>

		</table>
		<div id="itemModal" title="Update Item Unit"
			style="display: none; text-size: 10px">
			<span style="font-size: 22px;">Item Form</span>
		<hr
			style="border: none; height: 1px; width: 70%; background-color: #505050"
			align="left" />
			<br/><br/>
			<form method="post" action="/merchantdb/updateItem" style = "margin-left:25%">
				<input type="hidden" name="itemId" />
				<table id="UpdateCGTable" style="border:1px solid #8080B2; padding:10px">
					<tr>
						<td>Item Group Name</td>
						<td><input type="text" name="unitName" /></td>
					</tr>
					<tr>
						<td>Item Name</td>
						<td><input type="text" name="itemName" /></td>
					</tr>
					<tr>
						<td>Weight</td>
						<td><input type="text" name="itemNoOfKgs" /></td>
					</tr>
					<tr>
						<td><input type="submit" value="Update" class="button"></td>
						<td><input type="submit" value="Delete" class="button"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>