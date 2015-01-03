
<style type="text/css">
#salesReportContainer {
	padding: 2%;
}
</style>
<script type="text/javascript">
    $(document)
	    .ready(
		    function() {

			$("input[name='salesDate']")
				.click(
					function() {
					    if ($(
						    'input:radio[name=salesDate]:checked')
						    .val() == "onDate") {
						$("#salesFromDateLbl").html(
							"Date ");
						$("#salesToDateLbl").hide();
						$("#salesToDate").val("");
						$("#salesToDate").hide();
					    } else if ($(
						    'input:radio[name=salesDate]:checked')
						    .val() == "betweenDate") {
						$("#salesFromDateLbl").html(
							"From ");
						$("#salesToDateLbl")
							.html("To ");
						$("#salesToDateLbl").show();
						$("#salesToDate").show();
						$("#salesFromDate").val("");
					    }
					});
			$("#salesFromDate").datepicker({
			    dateFormat : 'yy-mm-dd'
			});
			$("#salesToDate").datepicker({
			    dateFormat : 'yy-mm-dd'
			});
			$("#salesReportContainer").hide();
			$("#showSales").click(function() {
			    $("#salesReportContainer").show();
			    $('#stockReport').dataTable({
				"destroy" : true,
				"processing" : true,
				"pagingType" : "full_numbers",
				"ajax" : {
				    "url" : "stockReportJSON",
				    "type" : "POST",
				    "data" : {
					startDate : $("#salesFromDate").val(),
					endDate : $("#salesToDate").val()
				    }
				},

				"columns" : [ {
				    "data" : "itemGroup"
				}, {
				    "data" : "itemName"
				}, {
				    "data" : "itemBond"
				}, {
				    "data" : "stockPoint"
				}, {
				    "data" : "open"
				}, {
				    "data" : "purchase"
				}, {
				    "data" : "sale"
				}, {
				    "data" : "stockInHand"
				}]
			    });
			});
		    });
</script>
<table style="width: 100%">
	<tr>
		<td><input type="radio" name="salesDate" value="onDate"
			id="salesDate">On Date &nbsp; <input type="radio"
			name="salesDate" value="betweenDate" id="salesDate">Between
			Date</td>
		<td><span id="salesFromDateLbl">Date:</span><input type="text"
			id="salesFromDate">&nbsp; <span id="salesToDateLbl"
			style="display: none">To:</span><input type="text" id="salesToDate"
			style="display: none"></td>
		<td><input type="button" value="Show" id="showSales"></td>
	</tr>
</table>
<div id="stockReportContainer">
	<table id="stockReport" class="display dataTable" border=1
		style="border: 0px solid #C0C0C0">
		<thead>
			<tr>
				<th>Item Group</th>
				<th>Item Name</th>
				<th>Item Bond</th>
				<th>Stock Point</th>
				<th>Open</th>
				<th>Purchase</th>
				<th>Sale</th>
				<th>Stock in hand</th>
			</tr>
		</thead>
	</table>
</div>
