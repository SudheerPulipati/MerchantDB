
<style type="text/css">
#profitLossReportContainer {
	padding: 2%;
}
</style>
<script type="text/javascript">
	$(document).ready(
			function() {

				$("input[name='profitLossDate']").click(
						function() {
							if ($('input:radio[name=profitLossDate]:checked')
									.val() == "onDate") {
								$("#plFromDateLbl").html("Date ");
								$("#plToDateLbl").hide();
								$("#profitLossToDate").val("");
								$("#profitLossToDate").hide();
							} else if ($(
									'input:radio[name=profitLossDate]:checked')
									.val() == "betweenDate") {
								$("#plFromDateLbl").html("From ");
								$("#plToDateLbl").html("To ");
								$("#plToDateLbl").show();
								$("#profitLossToDate").show();
								$("#profitLossFromDate").val("");
							}
						});
				$("#profitLossFromDate").datepicker({
					dateFormat : 'yy-mm-dd'
				});
				$("#profitLossToDate").datepicker({
					dateFormat : 'yy-mm-dd'
				});
				$("#profitLossReportContainer").hide();
				$("#showProfitLoss").click(function() {
					$("#profitLossReportContainer").show();
					$('#profitLossReport').dataTable({
						"destroy" : true,
						"processing" : true,
						"pagingType" : "full_numbers",
						"ajax" : {
							"url" : "profitLossReportJSON",
							"type" : "POST",
							"data" : {
								startDate : $("#profitLossFromDate").val(),
								endDate : $("#profitLossToDate").val()
							}
						},
						"columns" : [ {
							"data" : "to"
						}, {
							"data" : "amount1"
						}, {
							"data" : "by"
						}, {
							"data" : "amount2"
						} ]
					});
				});
			});
</script>
<table style="width: 100%">
	<tr>
		<td><input type="radio" name="profitLossDate" value="onDate"
			id="profitLossDate">On Date &nbsp; <input type="radio"
			name="profitLossDate" value="betweenDate" id="profitLossDate">Between
			Date</td>
		<td><span id="plFromDateLbl">Date:</span><input type="text"
			id="profitLossFromDate">&nbsp; <span id="plToDateLbl"
			style="display: none">To:</span><input type="text"
			id="profitLossToDate" style="display: none"></td>
		<td><input type="button" value="Show" id="showProfitLoss">
		</td>
	</tr>
</table>
<div id="profitLossReportContainer">
	<table id="profitLossReport" class="display dataTable" border=1
		style="border: 0px solid #C0C0C0">
		<thead>
			<tr>
				<th>To</th>
				<th>Amount</th>
				<th>By</th>
				<th>Amount</th>
			</tr>
		</thead>
	</table>
</div>
