var globalResponse = "";
$(document)
		.ready(
				function() {
					$.ajax({
						"url" : "ledgerReportJSON",
						"type" : "POST",
						"success" : function(responseJson) {
							setResponse(jQuery.parseJSON(responseJson));
							populateLedgerNames(getResponse());
							populateLedgerGroup(getResponse());
							populateCityGroup(getResponse());
							initTable(getResponse());
						}
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
					$("#applyFilter").change(
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
							});
					$('input[type=radio][name=filterType]').change(function() {
						if ("ledgerName" === this.value) {
							$("#filterByLedgerName").show();
							$("#filterByLedgerGroup").hide();
							$("#filterByCityGroup").hide();
						} else if ("ledgerGroup" === this.value) {
							$("#filterByLedgerName").hide();
							$("#filterByLedgerGroup").show();
							$("#filterByCityGroup").hide();
						} else if ("cityGroup" === this.value) {
							$("#filterByLedgerName").hide();
							$("#filterByLedgerGroup").hide();
							$("#filterByCityGroup").show();
						}
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
				});