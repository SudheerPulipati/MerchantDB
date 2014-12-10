
<style type="text/css">
#balSheetReportContainer {
	padding: 2%;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		
			$("input[name='balSheetDateSelect']").click(function(){
				if($('input:radio[name=balSheetDateSelect]:checked').val()=="onDate"){
					$("#bsFromDateLbl").html("Date ");
					$("#bsToDateLbl").hide();
					$("#balSheetToDate").val("");
					$("#balSheetToDate").hide();
				}else if($('input:radio[name=balSheetDateSelect]:checked').val()=="betweenDate"){
					$("#bsFromDateLbl").html("From ");
					$("#bsToDateLbl").html("To ");
					$("#bsToDateLbl").show();
					$("#balSheetToDate").show();
					$("#balSheetFromDate").val("");
				}
			});
			$("#balSheetFromDate").datepicker({ dateFormat: 'yy-mm-dd' });
			$("#balSheetToDate").datepicker({ dateFormat: 'yy-mm-dd' });
			$("#balSheetReportContainer").hide();
		$("#showBalSheet").click(function(){
			$("#balSheetReportContainer").show();
		$('#balanceSheetReport').dataTable({
			"destroy":true,
			"processing" : true,
			"pagingType" : "full_numbers",
			"ajax" : {
				"url" : "balanceSheetReportJSON",
				"type" : "POST",
				"data" : {
					startDate: $("#balSheetFromDate").val(),
					endDate:$("#balSheetToDate").val()
					}
			},
			"columns" : [ {
				"data" : "liabilities"
			}, {
				"data" : "amount1"
			}, {
				"data" : "assets"
			}, {
				"data" : "amount2"
			}]
		});
		});
	});
</script>
	<table style="width: 100%">
		<tr>
			<td><input type="radio" name="balSheetDateSelect" value="onDate"
				id="balSheetDateSelect">On Date &nbsp; <input type="radio"
				name="balSheetDateSelect" value="betweenDate" id="balSheetDateSelect">Between
				Date</td>
			<td><span id="bsFromDateLbl">Date:</span><input type="text"
				id="balSheetFromDate">&nbsp; <span id="bsToDateLbl"
				style="display: none">To:</span><input type="text" id="balSheetToDate"
				style="display: none"></td>
			<td><input type="button" value="Show" id="showBalSheet">
			</td>
		</tr>
	</table>
	<div id="balSheetReportContainer">
		<table id="balanceSheetReport">
			<thead>
				<tr>
					<th>Liabilities</th>
					<th>Amount</th>
					<th>Assets</th>
					<th>Amount</th>
				</tr>
			</thead>
		</table>
	</div>
