
<style type="text/css">
#datatableContainer {
	padding: 2%;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		
			$("input[name='dateSelect']").click(function(){
				if($('input:radio[name=dateSelect]:checked').val()=="onDate"){
					$("#dateLabel1").html("Date ");
					$("#dateLabel2").hide();
					$("#datepicker2").val("");
					$("#datepicker2").hide();
				}else if($('input:radio[name=dateSelect]:checked').val()=="betweenDate"){
					$("#dateLabel1").html("From ");
					$("#dateLabel2").html("To ");
					$("#dateLabel2").show();
					$("#datepicker2").show();
					$("#datepicker1").val("");
				}
			});
			$("#datepicker1").datepicker({ dateFormat: 'yy-mm-dd' }).val();
			$("#datepicker2").datepicker({ dateFormat: 'yy-mm-dd' }).val();
			$("#datatableContainer").hide();
		$("#showbtn").click(function(){
			$("#datatableContainer").show();
		$('#saleReport').dataTable({
			"destroy":true,
			"processing" : true,
			"pagingType" : "full_numbers",
			"ajax" : {
				"url" : "http://localhost:8080/merchantdb/salesReportJSON",
				"type" : "POST",
				"data" : {
					startDate: $("#datepicker1").datepicker({ dateFormat: 'yy-mm-dd' }).val(),
					endDate:$("#datepicker2").datepicker({ dateFormat: 'yy-mm-dd' }).val()
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
			},{
				"data" : "salesDate"
			},{
				"data" : "stockPoint"
			},{
				"data" : "quantity"
			},{
				"data" : "billPrice"
			},{
				"data" : "unbilledPrice"
			}]
		});
		});
	});
</script>
	<table style="width: 100%">
		<tr>
			<td><input type="radio" name="dateSelect" value="onDate"
				id="dateSelect">On Date &nbsp; <input type="radio"
				name="dateSelect" value="betweenDate" id="dateSelect">Between
				Date</td>
			<td><span id="dateLabel1">Date:</span><input type="text"
				id="datepicker1">&nbsp; <span id="dateLabel2"
				style="display: none">To:</span><input type="text" id="datepicker2"
				style="display: none"></td>
			<td><input type="button" value="Show" id="showbtn">
			</td>
		</tr>
	</table>
	<div id="datatableContainer">
		<table id="saleReport">
			<thead>
				<tr>
					<th>SlipName</th>
					<th>Party Name</th>
					<th>Item Group</th>
					<th>Item Name</th>
					<th>Item Bond</th>
					<th>Sale Date</th>
					<th>Stock Point</th>
					<th>Quantity</th>
					<th>Bill Price</th>
					<th>Unbilled Price</th>
				</tr>
			</thead>
		</table>
	</div>
