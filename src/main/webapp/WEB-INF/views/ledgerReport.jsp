<style type="text/css">
td.details-control {
	background: url('images/details_open.png') no-repeat center center;
	cursor: pointer;
}

tr.details td.details-control {
	background: url('images/details_close.png') no-repeat center center;
}

#ledgerReportContainer {
	padding: 2%;
}
</style>
<script type="text/javascript">
	var childCount = 0;
	var ledgerReportArray = new Array();
	function format(d, data) {
		childTable_header = '<center><table class="display dataTable" border=1 style="border: 0px solid #C0C0C0;color:blue" id = "LedgDet_'+childCount+'">'
				+ '<thead>'
				+ '<th>Date</th>'
				+ '<th>Credit</th>'
				+ '<th>Debit</th>'
				+ '<th>Balance</th>'
				+ '<th>Mode</th>'
				+ '<th>Remarks</th>'
		'</thead>' + '<tbody>';
		childTable_footer = '</tbody>' + '</table></center>';

		childTable_body = '<tr><td>' + data.date + '</td><td>' + data.credit
				+ '</td><td>' + data.debit + '</td><td>' + data.balance
				+ '</td><td>' + data.mode + '</td><td>' + data.remarks
				+ '</td></tr>';
		/* if (typeof d.ledgerReportDetailTOList != 'undefined'){
			for (i = 0; i < d.ledgerReportDetailTOList.length; i++) {
				data = d.ledgerReportDetailTOList[i];
				childTable_body += '<tr>'+
								  '<td>'+ data.date +'</td>'+
								  '<td>'+ data.credit +'</td>'+
								  '<td>'+ data.debit +'</td>'+
								  '<td>'+ data.balance +'</td>'+
								  '<td>'+ data.mode +'</td>'+
								  '<td>'+ data.remarks +'</td>'+
								  '</tr>';
				console.log('COUNT : '+i+'\n'+childTable_body+'\n');	
			}
			 }else{
				 console.log("INSIDE EXCEPTION\n");
			 } */

		childCount++;
		return childTable_header + childTable_body + childTable_footer;
		/* return 'Ledger Name: '+d.ledgerName+'<br/>'+
			   'Ledger Group: '+d.ledgerGroup+'<br/>'+
			   'City Group: '+d.cityGroup+'<br/>'+
			   'Details: '+d.ledgerReportDetailTOList[0].credit; */

	}

	$(document)
			.ready(
					function() {
						var dt = $('#ledgerReportTable').DataTable({
							"processing" : true,
							"serverSide" : false,
							"ajax" : "ledgerReportJSON",
							"columnDefs" : [ {
								"targets" : [ 4 ],
								"visible" : false,
								"searchable" : false
							} ],
							"columns" : [ {
								"class" : "details-control",
								"orderable" : false,
								"data" : null,
								"defaultContent" : ""
							}, {
								"data" : "ledgerName"
							}, {
								"data" : "ledgerGroup"
							}, {
								"data" : "cityGroup"
							}, {
								"data" : "ledgerReportDetailTOList"
							} ],
							"order" : [ [ 1, 'asc' ] ]
						});
						$("#ledgerReportTable tr td:first-child").html(
								'<img src="http://i.imgur.com/SD7Dz.png">');
						// Array to track the ids of the details displayed rows
						var detailRows = [];

						$('#ledgerReportTable tbody')
								.on(
										'click',
										'tr td:first-child',
										function() {
											var tr = $(this).closest('tr');
											var row = dt.row(tr);
											var idx = $.inArray(tr.attr('id'),
													detailRows);
											if (row.child.isShown()) {
												tr.removeClass('details');
												row.child.hide();

												// Remove from the 'open' array
												detailRows.splice(idx, 1);
											} else {
												tr.addClass('details');
												for (i = 0; i < row.data().ledgerReportDetailTOList.length; i++) {
													row
															.child(
																	format(
																			row
																					.data(),
																			row
																					.data().ledgerReportDetailTOList[i]))
															.show();
												}
												console
														.log("LIST LENGTH : "
																+ row.data().ledgerReportDetailTOList.length
																+ "\n");
												console
														.log("0th ELEMENT : "
																+ row.data().ledgerReportDetailTOList[0].date)
														+ "\n";
												//$("#LedgDet_0 tbody").append(childTable_body);
												/* $('#LedgDet_'+childCount).DataTable({
													"processing" : true,
													"serverSide" : false
													}); */
												// Add to the 'open' array
												if (idx === -1) {
													detailRows.push(tr
															.attr('id'));
												}
											}
										});

						// On each draw, loop over the `detailRows` array and show any child rows
						dt.on('draw', function() {
							$.each(detailRows, function(i, id) {
								$('#' + id + ' td:first-child')
										.trigger('click');
							});
						});
					});
</script>
<div id="ledgerReportContainer">
	<table id="ledgerReportTable" class="display dataTable" border=1
		style="border: 0px solid #C0C0C0">
		<thead>
			<tr>
				<th></th>
				<th>Ledger Name</th>
				<th>Ledger Group</th>
				<th>CityGroup</th>
				<th>Details</th>
			</tr>
		</thead>
	</table>
</div>
