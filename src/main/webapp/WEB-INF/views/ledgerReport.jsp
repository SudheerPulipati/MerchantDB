<script type="text/javascript" src="./js/dklfPagination.js"></script>
<script type="text/javascript" src="./js/report/ledgerReportScript.js"></script>

<table style="width: 100%">
	<tr>
		<td><input type="radio" name="ledgerReportDate" value="onDate"
			id="ledgerReportDate" checked="checked">On Date &nbsp; <input
			type="radio" name="ledgerReportDate" value="betweenDate"
			id="ledgerReportDate">Between Date</td>
		<td><span id="lrFromDateLbl">Date:</span><input type="text"
			id="ledgerReportFromDate">&nbsp; <span id="lrToDateLbl"
			style="display: none">To:</span><input type="text"
			id="ledgerReportToDate" style="display: none"></td>
		<td><input type="button" value="Show" id="showLedgerReport">
		</td>
	</tr>
</table>
<div id="ledgerReportContainer">
	<fieldset id="filterReport">
		<legend>Filter Ledger Report</legend>
		<table>
			<tr>
				<td style="border: 1px solid gray" class="filterType"><input
					type="radio" name="filterType" id="filterType" value="LedgerGroup" />LedgerGroup</td>
				<td style="border: 1px solid gray" class="filterType"><input
					type="radio" name="filterType" id="filterType" value="CityGroup" />CityGroup</td>
				<td style="border: 1px solid gray" class="filterType"><input
					type="radio" name="filterType" id="filterType" value="Parties" />Parties</td>
				<td style="border: 1px solid gray" class="filterType"><input
					type="radio" name="filterType" id="filterType" value="Items" />Items</td>
			</tr>
			<tr id="filterByLedgerName" class="filterTypeValues"
				style="display: none">
				<td colspan="3"><select id="ledgerNameFilter" multiple
					style="width: 100%"></select></td>
			</tr>
			<tr id="filterByLedgerGroup" style="display: none"
				class="filterTypeValues">
				<td colspan="3"><select id="ledgerGroupFilter" multiple
					style="width: 100%"></select></td>
			</tr>
			<tr id="filterByCityGroup" style="display: none"
				class="filterTypeValues">
				<td colspan="3"><select id="cityGroupFilter" multiple
					style="width: 100%"></select></td>
			</tr>
		</table>
	</fieldset>
	<div id="ledgerReportFilter"></div>
	<style type="text/css">
#ledgerReportTable {
	display: none;
}

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
/* #applyFilter{
margin-left:20px;
margin-top:10px;
} */
</style>
	<div id="ledgerPagination" style="float: right">
		<table>
			<tr>
				<td><input type="button" id="pagination_prev"
					class="pagination_button" value="Previous"></td>
				<td id="pagination_detail" class="pagination_text"></td>
				<td><input type="button" id="pagination_next"
					class="pagination_button" value="Next"></td>
			</tr>
		</table>
	</div>
	<table id="ledgerReportTable" style="width: 100%; border: 1px solid"
		border=1>
		<thead>
		</thead>
		<tbody>
		</tbody>
	</table>
	
	 
</div>