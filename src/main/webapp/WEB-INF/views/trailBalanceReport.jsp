
<style type="text/css">
#trailBalReportContainer {
	padding: 2%;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		
			$("input[name='trailBalDate']").click(function(){
				if($('input:radio[name=trailBalDate]:checked').val()=="onDate"){
					$("#tbFromDateLbl").html("Date ");
					$("#tbToDateLbl").hide();
					$("#trailBalToDate").val("");
					$("#trailBalToDate").hide();
				}else if($('input:radio[name=trailBalDate]:checked').val()=="betweenDate"){
					$("#tbFromDateLbl").html("From ");
					$("#tbToDateLbl").html("To ");
					$("#tbToDateLbl").show();
					$("#trailBalToDate").show();
					$("#trailBalFromDate").val("");
				}
			});
			$("#trailBalFromDate").datepicker({ dateFormat: 'yy-mm-dd' });
			$("#trailBalToDate").datepicker({ dateFormat: 'yy-mm-dd' });
			$("#trailBalReportContainer").hide();
		$("#showTrailBal").click(function(){
			$("#trailBalReportContainer").show();
		$('#trailBalanceReport').dataTable({
			"destroy":true,
			"processing" : true,
			"pagingType" : "full_numbers",
			"ajax" : {
				"url" : "trailBalanceReportJSON",
				"type" : "POST",
				"data" : {
					startDate: $("#trailBalFromDate").val(),
					endDate:$("#trailBalToDate").val()
					}
			},
			"columns" : [ {
				"data" : "ledgerName"
			},{
				"data" : "credit"
			}, {
				"data" : "debit"
			}, {
				"data" : "remark"
			}]
		});
		});
	});
</script>
	<table style="width: 100%">
		<tr>
			<td><input type="radio" name="trailBalDate" value="onDate"
				id="trailBalDate">On Date &nbsp; <input type="radio"
				name="trailBalDate" value="betweenDate" id="trailBalDate">Between
				Date</td>
			<td><span id="tbFromDateLbl">Date:</span><input type="text"
				id="trailBalFromDate">&nbsp; <span id="tbToDateLbl"
				style="display: none">To:</span><input type="text" id="trailBalToDate"
				style="display: none"></td>
			<td><input type="button" value="Show" id="showTrailBal">
			</td>
		</tr>
	</table>
	<div id="trailBalReportContainer">
		<table id="trailBalanceReport" border="1">
			<thead>
				<tr>
					<th>Ledger Name</th>
					<th>Credit</th>
					<th>Debit</th>
					<th>Remarks</th>
				</tr>
			</thead>
		</table>
	</div>
