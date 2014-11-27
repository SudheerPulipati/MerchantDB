<script type="text/javascript">
	$(document).ready(function() {

		$('#viewLedgerGroup').dataTable({
			"processing" : true,
			"ajax" : {
				"url" : "/merchantdb/viewLedgerGroupJSON",
				"type" : "POST",
			},
			"columns" : [ {
				"data" : "ledgGroupName"
			}, {
				"data" : "ledgGroupType"
			} ]
		});
		var table = $('#viewLedgerGroup').DataTable();

		$('#viewLedgerGroup tbody').on('click', 'tr', function() {
			var rowData = table.row(this).data();
			$("#LedgerGroupModal").dialog({
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
			$("#LedgerGroupModal").dialog("open");
			$(".ui-dialog-titlebar").hide();
			$("[name = ledgGroupID]").val(rowData.ledgGroupID);
			$("[name = companyID]").val(rowData.companyID);
			$("[name = ledgGroupName]").val(rowData.ledgGroupName);
			$("[name= ledgGroupType]").val(rowData.ledgGroupType);
		});
	});
</script>
<div class="adminMenuTitle">
	View Ledger Group
	<hr
		style="border: none; height: 1px; width: 40%; background-color: #505050"
		align="left" />
</div>
<div class="dataTableDiv">
	<table id="viewLedgerGroup" class="display dataTable" cellspacing="0"
		border=1 role="grid" style="border: 0px solid #C0C0C0">
		<thead>
			<tr>
				<th>Group Name</th>
				<th>Group Type</th>
			</tr>
		</thead>
	</table>

	<div id="LedgerGroupModal" style="display:none">
		<span style="font-size: 22px;">Ledger Group Form</span>
		<hr
			style="border: none; height: 1px; width: 70%; background-color: #505050"
			align="left" />
		<form action="/merchantdb/updateLedgerGroup" method="post" style = "margin-left:25%;margin-bottom:auto">
			<input type="hidden" name="companyID"> <input type="hidden"
				name="ledgGroupID">
				<br/><br/>
			<table id="updateLedgerTable" style="border:1px solid #8080B2; padding:10px">
				<tr>
					<td>Group Name :</td>
					<td><input type="text" name="ledgGroupName"></td>
				</tr>
				<tr>
					<td>Group Type :</td>
					<td><select name="ledgGroupType">
							<option value="select">Select</option>
							<option value="assets">Assests</option>
							<option value="liabilities">Liabilities</option>
							<option value="income">Income</option>
							<option value="expenditure">Expenditure</option>
					</select></td>
				</tr>
				<tr>
					<td><input type="submit" value="Save"
						class="button"></td>
					<td><input type="reset" value="Clear" class="button"></td>
				</tr>
			</table>
		</form>
		<form action="/merchantdb/updateLedgerGroup" method="post">
			<input type="hidden" name="ledgGroupID"> <input type="submit"
				value="Remove" />
		</form>
	</div>
</div>
</div>