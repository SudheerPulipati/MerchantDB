var globalResponse = "";
var ledgerReport = null;
$(document)
		.ready(
				function() {
					var onDateFlag = false;
					var betweenFlag = false;
					$("input[name='ledgerReportDate']").click(
							function() {
								if ($('input:radio[name=ledgerReportDate]:checked')
										.val() == "onDate") {
									$("#lrFromDateLbl").html("Date ");
									$("#lrToDateLbl").hide();
									$("#ledgerReportToDate").val("");
									$("#ledgerReportToDate").hide();
									onDateFlag = true;
									betweenFlag = false;
								} else if ($(
										'input:radio[name=ledgerReportDate]:checked')
										.val() == "betweenDate") {
									$("#lrFromDateLbl").html("From ");
									$("#lrToDateLbl").html("To ");
									$("#lrToDateLbl").show();
									$("#ledgerReportToDate").show();
									$("#ledgerReportFromDate").val("");
									onDateFlag = false;
									betweenFlag = true;
								}
							});
					/*$("#ledgerReportFromDate").datepicker({
						dateFormat : 'yy-mm-dd'
					});
					$("#ledgerReportToDate").datepicker({
						dateFormat : 'yy-mm-dd'
					});*/
					//$("#ledgerReportContainer").hide();
					$("#showLedgerReport").click(function() {
						$.ajax({
							"url" : "ledgerReportJSON",
							"type" : "POST",
							"data": {filterBy:"LedgerGroup",startDate:"",endDate:""},
							"success" : function(responseJson) {
								/*setResponse(jQuery.parseJSON(responseJson));
								populateLedgerNames(getResponse());
								populateLedgerGroup(getResponse());
								populateCityGroup(getResponse());
								initTable(getResponse());*/
							}
						});
					});
					 
					function setResponse(response) {
						globalResponse = response;
					}
					function getResponse() {
						return globalResponse;
					}
					function populateLedgerNames(response) {
						for (i = 0; i < response.length; i++) {
							if ($("#ledgerNameFilter option[value='"
									+ response[i].ledgerName + "']").length == 0) {
								$('#ledgerNameFilter').append(
										$('<option></option>').val(
												response[i].ledgerName).html(
												response[i].ledgerName));
							}
						}
					}
					function populateLedgerGroup(response) {
						for (i = 0; i < response.length; i++) {
							if ($("#ledgerGroupFilter option[value='"
									+ response[i].ledgerGroup + "']").length == 0) {
								$('#ledgerGroupFilter').append(
										$('<option></option>').val(
												response[i].ledgerGroup).html(
												response[i].ledgerGroup));
							}
						}
					}
					function populateCityGroup(response) {
						for (i = 0; i < response.length; i++) {
							if ($("#cityGroupFilter option[value='"
									+ response[i].cityGroup + "']").length == 0) {
								$('#cityGroupFilter').append(
										$('<option></option>').val(
												response[i].cityGroup).html(
												response[i].cityGroup));
							}
						}
					}
					function getRowColour(rowNum){
						return 0 === rowNum%2?"#CCC":"#FFF";
					}
					function initTable(response) {
						$("#ledgerReportTable tbody").empty();
						var totalMainRow = 0;
						for (var index = 0; index < response.length; index++) {
							rowContent = "";
							var newRow = true;
							var rowSpan = response[index].ledgerReportDetailTOList.length;
							for (var innerIndex = 0; innerIndex < rowSpan; innerIndex++) {
								rowContent += '<tr style="background:'+getRowColour(index)+'">';
								if (newRow == true) {
									rowContent += '<td rowspan = "' + rowSpan
											+ '" class="rowNum' + index + '">'
											+ response[index].ledgerName
											+ '</td>';
									rowContent += '<td rowspan = "' + rowSpan
											+ '">'
											+ response[index].ledgerGroup
											+ '</td>';
									rowContent += '<td rowspan = "' + rowSpan
											+ '">' + response[index].cityGroup
											+ '</td>';
									newRow = false;
									totalMainRow++;
								}
								rowContent += '<td class="rowNum'
										+ index
										+ '">'
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
						loadPagination(totalMainRow);
					}
					function filterByLedgerName(response, ledgerNames) {
						$("#ledgerReportTable tbody").empty();
						var filteredByLedgerNameRow = 0;
						for (var index = 0; index < response.length; index++) {
							if ($.inArray(response[index].ledgerName,
									ledgerNames) > -1) {
								rowContent = "";
								var newRow = true;
								var rowSpan = response[index].ledgerReportDetailTOList.length;
								for (var innerIndex = 0; innerIndex < rowSpan; innerIndex++) {
									rowContent += '<tr style="background:'+getRowColour(index)+'">';
									if (newRow == true) {
										rowContent += '<td rowspan = "'
												+ rowSpan + '">'
												+ response[index].ledgerName
												+ '</td>';
										rowContent += '<td rowspan = "'
												+ rowSpan + '">'
												+ response[index].ledgerGroup
												+ '</td>';
										rowContent += '<td rowspan = "'
												+ rowSpan + '">'
												+ response[index].cityGroup
												+ '</td>';
										newRow = false;
										filteredByLedgerNameRow++;
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
								$("#ledgerReportTable tbody")
										.append(rowContent);
							}
						}
						loadPagination(filteredByLedgerNameRow);
					}
					function filterByLedgerGroup(response, ledgerGroup) {
						$("#ledgerReportTable tbody").empty();
						var filteredByLedgerGroupRow = 0;
						for (var index = 0; index < response.length; index++) {
							if ($.inArray(response[index].ledgerGroup,
									ledgerGroup) > -1) {
								rowContent = "";
								var newRow = true;
								var rowSpan = response[index].ledgerReportDetailTOList.length;
								for (var innerIndex = 0; innerIndex < rowSpan; innerIndex++) {
									rowContent += '<tr style="background:'+getRowColour(index)+'">';
									if (newRow == true) {
										rowContent += '<td rowspan = "'
												+ rowSpan + '">'
												+ response[index].ledgerName
												+ '</td>';
										rowContent += '<td rowspan = "'
												+ rowSpan + '">'
												+ response[index].ledgerGroup
												+ '</td>';
										rowContent += '<td rowspan = "'
												+ rowSpan + '">'
												+ response[index].cityGroup
												+ '</td>';
										newRow = false;
										filteredByLedgerGroupRow++;
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
								$("#ledgerReportTable tbody")
										.append(rowContent);
							}
						}
						loadPagination(filteredByLedgerGroupRow);
					}
					
					function filterByCityGroup(response, cityGroup) {
						$("#ledgerReportTable tbody").empty();
						var filteredByCityGroupRow = 0;
						for (var index = 0; index < response.length; index++) {
							if ($.inArray(response[index].cityGroup,
									cityGroup) > -1) {
								rowContent = "";
								var newRow = true;
								var rowSpan = response[index].ledgerReportDetailTOList.length;
								for (var innerIndex = 0; innerIndex < rowSpan; innerIndex++) {
									rowContent += '<tr style="background:'+getRowColour(index)+'">';
									if (newRow == true) {
										rowContent += '<td rowspan = "'
												+ rowSpan + '">'
												+ response[index].ledgerName
												+ '</td>';
										rowContent += '<td rowspan = "'
												+ rowSpan + '">'
												+ response[index].ledgerGroup
												+ '</td>';
										rowContent += '<td rowspan = "'
												+ rowSpan + '">'
												+ response[index].cityGroup
												+ '</td>';
										newRow = false;
										filteredByCityGroupRow++;
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
								$("#ledgerReportTable tbody")
										.append(rowContent);
							}
						}
						loadPagination(filteredByCityGroupRow);
					}
					/*--------ACTIONS----------------------------------------------------------------------------------*/
					/*$("#applyFilter").change(
							function() {
								if ($("#applyFilter").is(':checked')) {
									$("#filterReport").show();
								} else {
									$("#filterReport").hide();
									$('input[name="filterType"]').attr(
											'checked', false);
									$('#ledgerNameFilter option').attr(
											'selected', false);
									$('#ledgerGroupFilter option').attr(
											'selected', false);
									$('#cityGroupFilter option').attr(
											'selected', false);
									initTable(getResponse());
								}
							});*/
					$('input[type=radio][name=filterType]').change(function() {
						showReport(this.value);
					});
					
					$("#ledgerNameFilter").change(function(e) {
						ledgerNames = $(e.target).val();
						if (ledgerNames != null) {
							filterByLedgerName(getResponse(), ledgerNames);
						} else {
							initTable(getResponse());
						}
					});
					$("#ledgerGroupFilter").change(function(e) {
						ledgerGroups = $(e.target).val();
						if (ledgerGroups != null) {
							filterByLedgerGroup(getResponse(), ledgerGroups);
						} else {
							initTable(getResponse());
						}
					});
					$("#cityGroupFilter").change(function(e) {
						cityGroups = $(e.target).val();
						if (cityGroups != null) {
							filterByCityGroup(getResponse(), cityGroups);
						} else {
							initTable(getResponse());
						}
					});
					/**
					 * Shows Ledger report filtred by ledgerGroup.
					 */
					function showReport(filterBy){
						displayReportTable(filterBy);
						$("#ledgerReportTable").show();
						getReport(filterBy);
						 
					}
					/**
					 * Prepares the headers for the report table.
					 */
					function displayReportTable(primaryColumn){
						$("#ledgerReportTable thead").empty();
						$("#ledgerReportTable tbody").empty();
						$("#ledgerReportTable thead").append("<th>"+primaryColumn+"</th>");
						$("#ledgerReportTable thead").append("<th>Ledger Name</th>");
						$("#ledgerReportTable thead").append("<th>Type</th>");
						$("#ledgerReportTable thead").append("<th>Date</th>");
						$("#ledgerReportTable thead").append("<th>Details</th>");
						$("#ledgerReportTable thead").append("<th>Cr/Dr</th>");
						$("#ledgerReportTable thead").append("<th>Close Balance</th>");
						$("#ledgerReportTable thead").append("<th>Open Balance</th>");
					}
					
					/**
					 * Fetch data from database by doing ajax call
					 */
					function getReport(filterBy){
						$.ajax({
							"url" : "ledgerReportJSON",
							"type" : "POST",
							"data": {filterBy:filterBy,startDate:"2014-01-01",endDate:"2016-01-01"},
							"beforeSend": function() {
								$("#ledgerReportTable tbody").append("<tr><td colspan='8'>Loading Data....</td></tr>");
					           },
							"success" : function(responseJson) {
								 ledgerReport = jQuery.parseJSON(responseJson);
								 populateReport(filterBy);
							}
						});
					}
					
					/**
					 * Populates all data from JSON to table.
					 */
					function populateReport(filterBy){
						$("#ledgerReportTable tbody").empty();
						var rowSpanIndex = 0;
						var item = "";
						var breakRow = 0;
						var htmlData = "";
						$(ledgerReport.items).each(function(index){
							htmlData+="<tr>";
							if("LedgerGroup" == filterBy){
								if(item != ledgerReport.items[index].ledgerGroupID){
									item = ledgerReport.items[index].ledgerGroupID;
									var count = 0;
									for(i=0;i<ledgerReport.items.length;i++){
										if(ledgerReport.items[index].ledgerGroupID == ledgerReport.items[i].ledgerGroupID){
											count++;
										}
									}
									htmlData+="<td rowspan='"+count+"'>"+ledgerReport.items[index].ledgerGroupID+"</td>";
								}
							} else if("CityGroup" == filterBy){
								if(item != ledgerReport.items[index].cityGroupID){
									item = ledgerReport.items[index].cityGroupID;
									var count = 0;
									for(i=0;i<ledgerReport.items.length;i++){
										if(ledgerReport.items[index].cityGroupID == ledgerReport.items[i].cityGroupID){
											count++;
										}
									}
									htmlData+="<td rowspan='"+count+"'>"+ledgerReport.items[index].cityGroupID+"</td>";
								}
							} else if("Parties" == filterBy || "Items" == filterBy){
								if(item != ledgerReport.items[index].ledgerAccountID){
									item = ledgerReport.items[index].ledgerAccountID;
									var count = 0;
									for(i=0;i<ledgerReport.items.length;i++){
										if(ledgerReport.items[index].ledgerAccountID == ledgerReport.items[i].ledgerAccountID){
											count++;
										}
									}
									htmlData+="<td rowspan='"+count+"'>"+ledgerReport.items[index].ledgerAccountID+"</td>";
								}
							} 
							htmlData+="<td>"+ledgerReport.items[index].ledgerAccountName+"</td>";
							htmlData+="<td>"+ledgerReport.items[index].trnasactionType+"</td>";
							htmlData+="<td>"+ledgerReport.items[index].transactionDate+"</td>";
							htmlData+="<td>"+ledgerReport.items[index].transactionDetails+"</td>";
							htmlData+="<td>"+ledgerReport.items[index].Cr_Dr+"</td>";
							htmlData+="<td>"+ledgerReport.items[index].closeBalance+"</td>";
							htmlData+="<td>"+ledgerReport.items[index].openBalance+"</td>";
							htmlData+="</tr>";
						});
						
						$("#ledgerReportTable tbody").append(htmlData);
					}
				});