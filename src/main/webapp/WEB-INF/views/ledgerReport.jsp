<script type="text/javascript" src="./js/dklfPagination.js"></script>
<script type="text/javascript" src="./js/report/ledgerReportScript.js"></script>

<div id="ledgerReportContainer">
<input type="checkbox" name="applyFilter" id="applyFilter">Apply Filter<br/><br/>
<fieldset id="filterReport" style="display:none">
<legend>Filter Ledger Report</legend>
		<table>
			<tr>
				<td style="border: 1px solid gray; padding:5px" class="filterType"><input
					type="radio" name="filterType" id="filterType" value="ledgerName" />LedgerName</td>
				<td style="border: 1px solid gray" class="filterType"><input
					type="radio" name="filterType" id="filterType" value="ledgerGroup" />LedgerGroup</td>
				<td style="border: 1px solid gray" class="filterType"><input
					type="radio" name="filterType" id="filterType" value="cityGroup" />CityGroup</td>	
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
#applyFilter{
margin-left:20px;
margin-top:10px;
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