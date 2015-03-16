<script type="text/javascript">
	$(document).ready(function() {
		$('#viewParty').dataTable({
			"processing" : true,
			"pagingType" : "full_numbers",
			"ajax" : {
				"url" : "/merchantdb/viewPartyJSON",
				"type" : "POST"
			},
			"columns" : [ {
				"data" : "partyName"
			}, {
				"data" : "partyType"
			}, {
				"data" : "ledgerGroupId"
			}, {
				"data" : "cityGroupId"
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
			$("#partyGroupModal").dialog({
				height : 450,
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
			$("#partyGroupModal").dialog("open");
			$(".ui-dialog-titlebar").hide();
			$("[name = partyName]").val(rowData.partyName);
			$("[name = partyType]").val(rowData.partyType);
			$("[name = streetName]").val(rowData.streetName);
			$("[name = city]").val(rowData.city);
			$("[name = telephone]").val(rowData.telephone);
			$("[name = partyID]").val(rowData.partyID);

			count = 0;
		});
		$(".button").click(function() {
			var buttonName = $(this).val();
			if (buttonName == "Update") {
				$("form").attr("action", "updateParty");
			} else {
				$("form").attr("action", "deleteParty");
			}
		});
	});
</script>
<div class="adminMenuTitle">
	View Party
	<hr
		style="border: none; height: 1px; width: 40%; background-color: #505050"
		align="left" />
</div>
<div class="dataTableDiv" style="width: 72%;">
	<table id="viewParty" class="display dataTable" cellspacing="0"
		border=1 role="grid" style="border: 0px solid #C0C0C0">
		<thead style="background-color: #00365B; color: white; font-family:"ArialBlack", Gadget, sans-serif">
			<tr>
				<th>Party Name</th>
				<th>Party Type</th>
				<th>LedgerGroup Name</th>
				<th>City Group</th>
				<th>Street Name</th>
				<th>City</th>
				<th>Telephone</th>
			</tr>
		</thead>
	</table>
	<div id="partyGroupModal" style="display: none">
		<span style="font-size: 22px;">Party Form</span>
		<hr
			style="border: none; height: 1px; width: 70%; background-color: #505050"
			align="left" />
		<br /> <br />
		<form action="/merchantdb/updateParty" method="post"
			style="margin-left: 25%">
			<input type="hidden" name="partyID" value="">
			<table style="border: 1px solid #8080B2; padding: 10px">
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
					<td><input type="Submit" value="Update" class="button"></td>
					<td><input type="Submit" value="Delete" class="button"></td>
				</tr>
			</table>
		</form>
	</div>
</div>
</div>
