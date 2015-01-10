<script type="text/javascript" src="./js/dklfPagination.js"></script>
<script>
    $(document)
	    .ready(
		    function() {
			var totRows = 0;
			var response;
			var rowContent = "";
			var ledgerNames;
			var ledgerGroups;
			$('.filterType').hide();
			$("#applyFilter").change(function(){
			    //alert($("#isAgeSelected").is(':checked'));
			 if($("#applyFilter").is(':checked')){
			    $('.filterType').show();
			    $("#ledgerPagination").hide();
			} if(!$("#applyFilter").is(':checked')){
			    $('input[name="filterType"]').attr('checked', false);
			    $('.filterType').hide(); 
			    $('.filterTypeValues').hide();
			    $("#ledgerPagination").show();
			} 
			});
			$('input[type=radio][name=filterType]').change(
				function() {
				    if ("ledgerName" === this.value) {
					$("#filterByLedgerGroup").hide();
					$("#filterByLedgerName").show();
					//$("#ledgerPagination").hide();
				    } else if ("ledgerGroup" === this.value) {
					$("#filterByLedgerGroup").show();
					$("#filterByLedgerName").hide();
					//$("#ledgerPagination").hide();
				    } else{
					//$("#ledgerPagination").show();
				    }
				});
			$
				.ajax({
				    "url" : "ledgerReportJSON",
				    "type" : "POST",
				    "success" : function(responseJson) {

					response = jQuery
						.parseJSON(responseJson);
					for (i = 0; i < response.length; i++) {
					    if ($("#ledgerNameFilter option[value='"
						    + response[i].ledgerName
						    + "']").length == 0) {
						$('#ledgerNameFilter')
							.append(
								$(
									'<option></option>')
									.val(
										response[i].ledgerName)
									.html(
										response[i].ledgerName));
					    }
					}
					for (i = 0; i < response.length; i++) {
					    if ($("#ledgerGroupFilter option[value='"
						    + response[i].ledgerGroup
						    + "']").length == 0) {
						$('#ledgerGroupFilter')
							.append(
								$(
									'<option></option>')
									.val(
										response[i].ledgerGroup)
									.html(
										response[i].ledgerGroup));
					    }
					}
					initTable(response,false);
					 
				    }
				});
			$("#ledgerNameFilter").change(function(e) {
			    ledgerNames = $(e.target).val();
			    if (ledgerNames != null) {
				filterByLedgerName(response, ledgerNames);
			    } else {
				initTable(response, true);
			    }
			});
			$("#ledgerGroupFilter").change(function(e) {
			    ledgerGroups = $(e.target).val();
			    console.log("CHANGED "+ledgerGroups+" :: "+$(e.target).length);
			    if (ledgerGroups != null) {
				filterByLedgerGroup(response, ledgerGroups);
			    } else {
				initTable(response,true);
			    }
			});

			/* $("#ledgerGroupFilter").change(function(){
				var ledgerName = $('#ledgerNameFilter :selected').val();
				var ledgerGroup = $('#ledgerGroupFilter :selected').val();
				
				if(ledgerGroup === "select"){
					filterByLedgerName(response, ledgerName);
				}
				else{
					//populateLedgGrpFilter(ledgerName);
					filterByLedgerGroup(response,ledgerName,ledgerGroup);	
				}
			}); */

			function populateLedgGrpFilter(ledgerName) {
			    $('#ledgerGroupFilter').empty();
			    /* $('#ledgerGroupFilter').append($('<option></option>')
			    		  .val("select")
			    		  .html("Select")); */
			    for (var ledgerIndex = 0; ledgerIndex < response.length; ledgerIndex++) {
				if (ledgerName === response[ledgerIndex].ledgerName) {
				    $('#ledgerGroupFilter')
					    .append(
						    $('<option></option>')
							    .val(
								    response[ledgerIndex].ledgerGroup)
							    .html(
								    response[ledgerIndex].ledgerGroup));
				}
			    }
			}
			function filterByLedgerName(response, ledgerNames) {
			    $("#ledgerReportTable tbody").empty();
			    for (var index = 0; index < response.length; index++) {
				if ($.inArray(response[index].ledgerName,
					ledgerNames) > -1) {
				    rowContent = "";
				    var newRow = true;
				    var rowSpan = response[index].ledgerReportDetailTOList.length;
				    for (var innerIndex = 0; innerIndex < rowSpan; innerIndex++) {
					rowContent += '<tr>';
					if (newRow == true) {
					    rowContent += '<td rowspan = "'+rowSpan+'">'
						    + response[index].ledgerName
						    + '</td>';
					    rowContent += '<td rowspan = "'+rowSpan+'">'
						    + response[index].ledgerGroup
						    + '</td>';
					    rowContent += '<td rowspan = "'+rowSpan+'">'
						    + response[index].cityGroup
						    + '</td>';
					    newRow = false;
					}
					rowContent += '<td>'
						+ response[index].ledgerReportDetailTOList[innerIndex].date
						+ '</td>';
					rowContent += '<td>'
						+ response[index].ledgerReportDetailTOList[innerIndex].credit
						+ '</td>';
					rowContent += '<td>'
						+ response[index].ledgerReportDetailTOList[innerIndex].debit
						+ '</td>';
					rowContent += '<td>'
						+ response[index].ledgerReportDetailTOList[innerIndex].balance
						+ '</td>';
					rowContent += '<td>'
						+ response[index].ledgerReportDetailTOList[innerIndex].mode
						+ '</td>';
					rowContent += '<td>'
						+ response[index].ledgerReportDetailTOList[innerIndex].remarks
						+ '</td>';
					rowContent += '</tr>';
				    }
				    $("#ledgerReportTable tbody").append(
					    rowContent);
				}
			    }
			}
			function filterByLedgerGroup(response, ledgerGroups) {
			    $("#ledgerReportTable tbody").empty();
			    for (var index = 0; index < response.length; index++) {
				if ($.inArray(response[index].ledgerGroup,
					ledgerGroups) > -1) {
				    rowContent = "";
				    var newRow = true;
				    var rowSpan = response[index].ledgerReportDetailTOList.length;
				    for (var innerIndex = 0; innerIndex < rowSpan; innerIndex++) {
					rowContent += '<tr>';
					if (newRow == true) {
					    rowContent += '<td rowspan = "'+rowSpan+'">'
						    + response[index].ledgerName
						    + '</td>';
					    rowContent += '<td rowspan = "'+rowSpan+'">'
						    + response[index].ledgerGroup
						    + '</td>';
					    rowContent += '<td rowspan = "'+rowSpan+'">'
						    + response[index].cityGroup
						    + '</td>';
					    newRow = false;
					}
					rowContent += '<td>'
						+ response[index].ledgerReportDetailTOList[innerIndex].date
						+ '</td>';
					rowContent += '<td>'
						+ response[index].ledgerReportDetailTOList[innerIndex].credit
						+ '</td>';
					rowContent += '<td>'
						+ response[index].ledgerReportDetailTOList[innerIndex].debit
						+ '</td>';
					rowContent += '<td>'
						+ response[index].ledgerReportDetailTOList[innerIndex].balance
						+ '</td>';
					rowContent += '<td>'
						+ response[index].ledgerReportDetailTOList[innerIndex].mode
						+ '</td>';
					rowContent += '<td>'
						+ response[index].ledgerReportDetailTOList[innerIndex].remarks
						+ '</td>';
					rowContent += '</tr>';
				    }
				    $("#ledgerReportTable tbody").append(
					    rowContent);
				}
			    }
			}

			function initTable(response,isFilteredData) {
			    $("#ledgerReportTable tbody").empty();
			    
			    for (var index = 0; index < response.length; index++) {
				rowContent = "";
				var newRow = true;
				var rowSpan = response[index].ledgerReportDetailTOList.length;
				for (var innerIndex = 0; innerIndex < rowSpan; innerIndex++) {

				    rowContent += '<tr>';
				    if (newRow == true) {
					rowContent += '<td rowspan = "'+rowSpan+'" class="rowNum'+totRows+'">'
						+ response[index].ledgerName
						+ '</td>';
					rowContent += '<td rowspan = "'+rowSpan+'">'
						+ response[index].ledgerGroup
						+ '</td>';
					rowContent += '<td rowspan = "'+rowSpan+'">'
						+ response[index].cityGroup
						+ '</td>';
					newRow = false;
					totRows++;
				    }
				    rowContent += '<td class="rowNum'+totRows+'">'
					    + response[index].ledgerReportDetailTOList[innerIndex].date
					    + '</td>';
				    rowContent += '<td>'
					    + response[index].ledgerReportDetailTOList[innerIndex].credit
					    + '</td>';
				    rowContent += '<td>'
					    + response[index].ledgerReportDetailTOList[innerIndex].debit
					    + '</td>';
				    rowContent += '<td>'
					    + response[index].ledgerReportDetailTOList[innerIndex].balance
					    + '</td>';
				    rowContent += '<td>'
					    + response[index].ledgerReportDetailTOList[innerIndex].mode
					    + '</td>';
				    rowContent += '<td>'
					    + response[index].ledgerReportDetailTOList[innerIndex].remarks
					    + '</td>';
				    rowContent += '</tr>';
				}
				$("#ledgerReportTable tbody").append(rowContent);
			    }
			    if(!isFilteredData){
				loadPagination(totRows);
			    }
			}
			$("#pagination_next").click(function(){
			    onNext(totRows);
			});
			$("#pagination_prev").click(function(){
			    onPrev(totRows);
			});
		    });
</script>
<div id="ledgerReportContainer">
	<table>
		<tr>
		 <td colspan=2>
		 <input type="checkbox" name="applyFilter" id="applyFilter">Apply Filter
		 </td>
		</tr>
		<tr>
			<td style="border: 1px solid gray" class="filterType"><input type="radio"
				name="filterType" id="filterType" value="ledgerName" />Filter By
				LedgerName</td>
			<td style="border: 1px solid gray" class="filterType"><input type="radio"
				name="filterType" id="filterType" value="ledgerGroup" />Filter By
				LedgerGroup</td>
		</tr>
		<tr id="filterByLedgerName" class="filterTypeValues" style="display: none">
			<td colspan="2"><select id="ledgerNameFilter" multiple
				style="width: 100%"></select></td>
		</tr>
		<tr id="filterByLedgerGroup" style="display: none" class="filterTypeValues">
			<td colspan="2"><select id="ledgerGroupFilter" multiple
				style="width: 100%"></select></td>
		</tr>
	</table>
	<div id="ledgerReportFilter"></div>
	<style type="text/css">
#ledgerReportTable tbody tr:nth-child(even) {
	background: #CCC
}

#ledgerReportTable tbody tr:nth-child(odd) {
	background: #FFF
}

#ledgerReportTable td {
	border-right: 1px solid;
	border-bottom: 1px solid
}
</style>
<div id="ledgerPagination" style="float:right">
		<table>
			<tr>
				<td><input type="button" id="pagination_prev" class="pagination_button" value="Previous"></td>
				<td id="pagination_detail" class="pagination_text"></td>
				<td><input type="button" id="pagination_next" class="pagination_button" value="Next"></td>
			</tr>
		</table>
	</div>
	 
	
	<table id="ledgerReportTable" style="width: 100%; border: 1px solid"
		border=1>
		<thead>
			<th>Ledger Name</th>
			<th>Ledger Group</th>
			<th>City Group</th>
			<th>Date</th>
			<th>Credit</th>
			<th>Debit</th>
			<th>Balanace</th>
			<th>Mode</th>
			<th style="width: 400px">Remarks</th>
		</thead>
		<tbody>
		</tbody>
	</table>
	
</div>