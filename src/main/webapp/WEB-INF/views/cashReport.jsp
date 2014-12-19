
<style type="text/css">
#cashReportContainer {
	padding: 2%;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		
			$("input[name='cashBookDate']").click(function(){
				if($('input:radio[name=cashBookDate]:checked').val()=="onDate"){
					$("#cbFromDateLbl").html("Date ");
					$("#cbToDateLbl").hide();
					$("#cashBookToDate").val("");
					$("#cashBookToDate").hide();
				}else if($('input:radio[name=cashBookDate]:checked').val()=="betweenDate"){
					$("#cbFromDateLbl").html("From ");
					$("#cbToDateLbl").html("To ");
					$("#cbToDateLbl").show();
					$("#cashBookToDate").show();
					$("#cashBookFromDate").val("");
				}
			});
			$("#cashBookFromDate").datepicker({ dateFormat: 'yy-mm-dd' });
			$("#cashBookToDate").datepicker({ dateFormat: 'yy-mm-dd' });
			$("#cashReportContainer").hide();
		$("#showCashBook").click(function(){
			$("#cashReportContainer").show();
		$('#cashbookReport').dataTable({
			"destroy":true,
			"processing" : true,
			"pagingType" : "full_numbers",
			"ajax" : {
				"url" : "cashbookReportJSON",
				"type" : "POST",
				"data" : {
					startDate: $("#cashBookFromDate").val(),
					endDate:$("#cashBookToDate").val()
					}
			},
			"columns" : [ {
				"data" : "partyName"
			}, {
				"data" : "modifiedDate"
			}, {
				"data" : "credit"
			}, {
				"data" : "debit"
			}, {
				"data" : "remarks"
			}]
		});
		});
	});
</script>

	<table style="width: 100%">
		<tr>
			<td><input type="radio" name="cashBookDate" value="onDate"
				id="cashBookDate">On Date &nbsp; <input type="radio"
				name="cashBookDate" value="betweenDate" id="cashBookDate">Between
				Date</td>
			<td><span id="cbFromDateLbl">Date:</span><input type="text"
				id="cashBookFromDate">&nbsp; <span id="cbToDateLbl"
				style="display: none">To:</span><input type="text" id="cashBookToDate"
				style="display: none"></td>
			<td><input type="button" value="Show" id="showCashBook">
			</td>
		</tr>
	</table>
	<div id="cashReportContainer">
		<table id="cashbookReport" class="display dataTable" cellspacing="0"
		border=1 role="grid" style="border: 0px solid #C0C0C0">
			<thead>
				<tr>
					<th>Party Name</th>
					<th>Date</th>
					<th>Credit</th>
					<th>Debit</th>
					<th>Remarks</th>
				</tr>
			</thead>
		</table>
	</div>
