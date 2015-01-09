<script type="text/javascript">
	$(document).ready(function() {
		$('#viewCityGroup').dataTable({
			"processing" : true,
			"ajax" : {
				"url" : "/merchantdb/viewCityGroupJSON",
				"type" : "POST"
			},
			"columns" : [ {
				"data" : "cityGroupName"
			} ]
		});
		var table = $('#viewCityGroup').DataTable();
		$('#viewCityGroup tbody').on('click', 'tr', function() {
			var rowData = table.row(this).data();
			$("#cityGroupModal").dialog({
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
			$("#cityGroupModal").dialog("open");
			$(".ui-dialog-titlebar").hide();
			$("[name = companyID]").val(rowData.companyID);
			$("[name = cityGroupID]").val(rowData.cityGroupID);
			$("[name = cityGroupName]").val(rowData.cityGroupName);
		});
		$(".button").click(function(){
			var buttonName = $(this).val();
			if(buttonName == "Update"){
				$("form").attr("action","updateCityGroup");
			}else{
				$("form").attr("action","deleteCityGroup");
			}
		});
	});
</script>
<div class="adminMenuTitle">
	View City Group
	<hr
		style="border: none; height: 1px; width: 40%; background-color: #505050"
		align="left" />
</div>
<div class="dataTableDiv">
	<table id="viewCityGroup" class="display dataTable" cellspacing="0"
		border=1 role="grid" style="border: 0px solid #C0C0C0">
		<thead>
			<tr id="row">
				<th>City Group Name</th>
			</tr>
		</thead>

	</table>
	<div id="cityGroupModal" style="display: none; text-size: 10px">
		<span style="font-size: 22px;">City Group Form</span>
		<hr
			style="border: none; height: 1px; width: 70%; background-color: #505050"
			align="left" />
		<form method="post" action="/merchantdb/updateCityGroup"
			style="margin-left: 25%">
			<input type="hidden" name="companyID" /> <input type="hidden"
				name="cityGroupID" /> <br />
			<br />
			<table id="UpdateCGTable"
				style="border: 1px solid #8080B2; padding: 10px">
				<tr>
					<td>City Group Name</td>
					<td><input type="text" name="cityGroupName" /></td>
				</tr>
				<tr>
					<td><input type="submit" value="Update" class="button"></td>
					<td><input type="submit" value="Delete" class="button"></td>
				</tr>
			</table>
		</form>
	</div>
</div>
</div>