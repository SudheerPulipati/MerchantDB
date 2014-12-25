<script>
$(document).ready(function() {
	var response;
	var rowContent="";
	$.ajax({
		"url" : "ledgerReportJSON",
		"type" : "POST",
		"success" : function(responseJson){
			 
			response = jQuery.parseJSON(responseJson);
			for(i=0;i<response.length;i++){
				$('#ledgerNameFilter').append($('<option></option>')
									  .val(response[i].ledgerName)
									  .html(response[i].ledgerName));
			}
			initTable(response,null,null,null);
		}
	});
	$("#ledgerNameFilter").change(function(){
		var ledgerName = $('#ledgerNameFilter :selected').val();
		if(ledgerName === "select"){
			initTable(response, null, null, null);
		}
		else{
			populateLedgGrpFilter(ledgerName);
			filterByLedgerName(response,ledgerName);	
		}
	});
	
	$("#ledgerGroupFilter").change(function(){
		var ledgerName = $('#ledgerNameFilter :selected').val();
		var ledgerGroup = $('#ledgerGroupFilter :selected').val();
		
		if(ledgerGroup === "select"){
			filterByLedgerName(response, ledgerName);
		}
		else{
			//populateLedgGrpFilter(ledgerName);
			filterByLedgerGroup(response,ledgerName,ledgerGroup);	
		}
	});
	
	function populateLedgGrpFilter(ledgerName){
		$('#ledgerGroupFilter').empty();
		$('#ledgerGroupFilter').append($('<option></option>')
				  .val("select")
				  .html("Select"));
		for(var ledgerIndex = 0;ledgerIndex< response.length;ledgerIndex++){
			if(ledgerName === response[ledgerIndex].ledgerName){
				$('#ledgerGroupFilter').append($('<option></option>')
						  .val(response[ledgerIndex].ledgerGroup)
						  .html(response[ledgerIndex].ledgerGroup));
			}			
		}
	}
	function filterByLedgerName(response,ledgerName){
		$("#ledgerReportTable tbody").empty();
		for(var index =0;index<response.length;index++){
			if(ledgerName === response[index].ledgerName){
				rowContent = "";
				var newRow = true;
				var rowSpan = response[index].ledgerReportDetailTOList.length;
				for(var innerIndex=0;innerIndex<rowSpan;innerIndex++){
					rowContent += '<tr>';
					if(newRow == true){
						rowContent += '<td rowspan = "'+rowSpan+'">'+response[index].ledgerName+'</td>';
						rowContent += '<td rowspan = "'+rowSpan+'">'+response[index].ledgerGroup+'</td>';
						rowContent += '<td rowspan = "'+rowSpan+'">'+response[index].cityGroup+'</td>';
						newRow = false;
					} 
					 rowContent += '<td>'+response[index].ledgerReportDetailTOList[innerIndex].date+'</td>';
					 rowContent += '<td>'+response[index].ledgerReportDetailTOList[innerIndex].credit+'</td>';
					 rowContent += '<td>'+response[index].ledgerReportDetailTOList[innerIndex].debit+'</td>';
					 rowContent += '<td>'+response[index].ledgerReportDetailTOList[innerIndex].balance+'</td>';
					 rowContent += '<td>'+response[index].ledgerReportDetailTOList[innerIndex].mode+'</td>';
					 rowContent += '<td>'+response[index].ledgerReportDetailTOList[innerIndex].remarks+'</td>';
					 rowContent += '</tr>';
				}
				$("#ledgerReportTable tbody").append(rowContent);
			}
			}
		}
	function filterByLedgerGroup(response,ledgerName,ledgerGroup){
		$("#ledgerReportTable tbody").empty();
		for(var index =0;index<response.length;index++){
			if(ledgerName === response[index].ledgerName && ledgerGroup == response[index].ledgerGroup){
				rowContent = "";
				var newRow = true;
				var rowSpan = response[index].ledgerReportDetailTOList.length;
				for(var innerIndex=0;innerIndex<rowSpan;innerIndex++){
					rowContent += '<tr>';
					if(newRow == true){
						rowContent += '<td rowspan = "'+rowSpan+'">'+response[index].ledgerName+'</td>';
						rowContent += '<td rowspan = "'+rowSpan+'">'+response[index].ledgerGroup+'</td>';
						rowContent += '<td rowspan = "'+rowSpan+'">'+response[index].cityGroup+'</td>';
						newRow = false;
					} 
					 rowContent += '<td>'+response[index].ledgerReportDetailTOList[innerIndex].date+'</td>';
					 rowContent += '<td>'+response[index].ledgerReportDetailTOList[innerIndex].credit+'</td>';
					 rowContent += '<td>'+response[index].ledgerReportDetailTOList[innerIndex].debit+'</td>';
					 rowContent += '<td>'+response[index].ledgerReportDetailTOList[innerIndex].balance+'</td>';
					 rowContent += '<td>'+response[index].ledgerReportDetailTOList[innerIndex].mode+'</td>';
					 rowContent += '<td>'+response[index].ledgerReportDetailTOList[innerIndex].remarks+'</td>';
					 rowContent += '</tr>';
				}
				$("#ledgerReportTable tbody").append(rowContent);
			}
			}
		}
	
	function initTable(response,ledgerName,ledgerGroup,CityGroup){
		$("#ledgerReportTable tbody").empty();
		for(var index =0;index<response.length;index++){
				rowContent = "";
				var newRow = true;
				var rowSpan = response[index].ledgerReportDetailTOList.length;
				for(var innerIndex=0;innerIndex<rowSpan;innerIndex++){
					
					rowContent += '<tr>';
					if(newRow == true){
						rowContent += '<td rowspan = "'+rowSpan+'">'+response[index].ledgerName+'</td>';
						rowContent += '<td rowspan = "'+rowSpan+'">'+response[index].ledgerGroup+'</td>';
						rowContent += '<td rowspan = "'+rowSpan+'">'+response[index].cityGroup+'</td>';
						newRow = false;
					} 
					 rowContent += '<td>'+response[index].ledgerReportDetailTOList[innerIndex].date+'</td>';
					 rowContent += '<td>'+response[index].ledgerReportDetailTOList[innerIndex].credit+'</td>';
					 rowContent += '<td>'+response[index].ledgerReportDetailTOList[innerIndex].debit+'</td>';
					 rowContent += '<td>'+response[index].ledgerReportDetailTOList[innerIndex].balance+'</td>';
					 rowContent += '<td>'+response[index].ledgerReportDetailTOList[innerIndex].mode+'</td>';
					 rowContent += '<td>'+response[index].ledgerReportDetailTOList[innerIndex].remarks+'</td>';
					 rowContent += '</tr>';
				}
				$("#ledgerReportTable tbody").append(rowContent);
			}	
	}
});
</script>
<div id="ledgerReportContainer">
<div id="ledgerReportFilter">
Ledger Name <select id="ledgerNameFilter"><option value="select">Select</option></select><br/>
Ledger Group <select id="ledgerGroupFilter"><option value="select">Select</option></select><br/>
City Group <select id="cityGroupFilter"><option value="select">Select</option></select><br/>
</div>
<table id="ledgerReportTable" style="width:900px" border=1>
	<thead>
		<th>Ledger Name</th>
		<th>Ledger Group</th>
		<th>City Group</th>
		<th>Date</th>
		<th>Credit</th>
		<th>Debit</th>
		<th>Balanace</th>
		<th>Mode</th>
		<th>Remarks</th>
	</thead>
	<tbody>
	
	</tbody>
</table>
</div>