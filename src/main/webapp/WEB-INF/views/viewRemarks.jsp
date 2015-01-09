<script type="text/javascript">
	$(document).ready(function() {
		$('#viewRemarks').dataTable({
			"processing" : true,
			"ajax" : {
				"url" : "/merchantdb/viewRemarksJSON",
				"type" : "POST"
			},
			"columns" : [ {
				"data" : "remarks"
			} ]
		});
		var table = $('#viewRemarks').DataTable();
		$('#viewRemarks tbody').on('click', 'tr', function() {
			var rowData = table.row(this).data();
			$("#dialog").dialog({
				height : 350,
				width : 600,
				draggable : false,
				modal : true,
				autoOpen : false,
				buttons : {
					"Close" : function() {
						$(this).dialog("close");
					}
				}
			});
			$("#dialog").dialog("open");
			$(".ui-dialog-titlebar").hide();
			$("[name = companyID]").val(rowData.companyID);
			$("[name = remarksID]").val(rowData.remarksID);
			$("[name = remarks]").val(rowData.remarks);
		});
		$(".button").click(function() {
			var buttonName = $(this).val();
			if (buttonName == "Update") {
				$("form").attr("action", "updateRemark");
			} else {
				$("form").attr("action", "deleteRemark");
			}
		});
	});
</script>
<div class="adminMenuTitle">
	View Remarks
	<hr
		style="border: none; height: 1px; width: 40%; background-color: #505050"
		align="left" />
</div>
<div class="dataTableDiv">
	<table id="viewRemarks" class="display dataTable" cellspacing="0"
		border=1 role="grid" style="border: 0px solid #C0C0C0">
		<thead>
			<tr id="row">
				<th>Remark</th>
			</tr>
		</thead>

	</table>
	<div id="dialog" style="display: none; text-size: 10px">
		<span style="font-size: 22px;">Remarks Form</span>
		<hr
			style="border: none; height: 1px; width: 70%; background-color: #505050"
			align="left" />
		<form method="post" action="/merchantdb/updateRemark"
			style="margin-left: 25%">
			<input type="hidden" name="companyID" /> <input type="hidden"
				name="remarksID" /> <br /> <br />
			<table id="UpdateCGTable"
				style="border: 1px solid #8080B2; padding: 10px">
				<tr>
					<td>Remark</td>
					<td><input type="text" name="remarks" /></td>
				</tr>
				<tr>
					<td><input type="submit" value="Update" class="button"></td>
					<td><input type="Submit" value="Delete" class="button"></td>
				</tr>
			</table>
		</form>
	</div>
</div>
</div>