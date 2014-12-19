
<style type="text/css">
#purchaseReportContainer {
	padding: 2%;
}
</style>
<script type="text/javascript">
	$(document).ready(
			function() {

				$("input[name='purchaseDate']").click(
						function() {
							if ($('input:radio[name=purchaseDate]:checked')
									.val() == "onDate") {
								$("#purchaseFromDateLbl").html("Date ");
								$("#purchaseToDateLbl").hide();
								$("#purchaseToDate").val("");
								$("#purchaseToDate").hide();
							} else if ($(
									'input:radio[name=purchaseDate]:checked')
									.val() == "betweenDate") {
								$("#purchaseFromDateLbl").html("From ");
								$("#purchaseToDateLbl").html("To ");
								$("#purchaseToDateLbl").show();
								$("#purchaseToDate").show();
								$("#purchaseFromDate").val("");
							}
						});
				$("#purchaseFromDate").datepicker({
					dateFormat : 'yy-mm-dd'
				});
				$("#purchaseToDate").datepicker({
					dateFormat : 'yy-mm-dd'
				});
				$("#purchaseReportContainer").hide();
				$("#showPurchases").click(function() {
					$("#purchaseReportContainer").show();
					$('#purchaseReport').dataTable({
						"destroy" : true,
						"processing" : true,
						"pagingType" : "full_numbers",
						"ajax" : {
							"url" : "purchaseReportJSON",
							"type" : "POST",
							"data" : {
								startDate : $("#purchaseFromDate").val(),
								endDate : $("#purchaseToDate").val()
							}
						},

						"columns" : [ {
							"data" : "slipName"
						}, {
							"data" : "partyName"
						}, {
							"data" : "itemGroup"
						}, {
							"data" : "itemName"
						}, {
							"data" : "itemBond"
						}, {
							"data" : "purchaseDate"
						}, {
							"data" : "stockPoint"
						}, {
							"data" : "quantity"
						}, {
							"data" : "billPrice"
						}, {
							"data" : "unbilledPrice"
						} ]
					});
				});
			});
</script>
<table style="width: 100%">
	<tr>
		<td><input type="radio" name="purchaseDate" value="onDate"
			id="purchaseDate">On Date &nbsp; <input type="radio"
			name="purchaseDate" value="betweenDate" id="purchaseDate">Between
			Date</td>
		<td><span id="purchaseFromDateLbl">Date:</span><input type="text"
			id="purchaseFromDate">&nbsp; <span id="purchaseToDateLbl"
			style="display: none">To:</span><input type="text"
			id="purchaseToDate" style="display: none"></td>
		<td><input type="button" value="Show" id="showPurchases">
		</td>
	</tr>
</table>
<div id="purchaseReportContainer">
	<table id="purchaseReport" class="display dataTable" border=1
		style="border: 0px solid #C0C0C0">
		<thead>
			<tr>
				<th>SlipName</th>
				<th>Party Name</th>
				<th>Item Group</th>
				<th>Item Name</th>
				<th>Item Bond</th>
				<th>Purchase Date</th>
				<th>Stock Point</th>
				<th>Quantity</th>
				<th>Bill Price</th>
				<th>Unbilled Price</th>
			</tr>
		</thead>
	</table>
</div>
