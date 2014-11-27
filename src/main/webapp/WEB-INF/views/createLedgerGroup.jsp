<div class="adminMenuTitle">
	Create Ledger Group
	<hr
		style="border: none; height: 1px; width: 40%; background-color: #505050"
		align="left" />
</div>

<form action="/merchantdb/saveLedgerGroup" method="post">

	<p>${partyCreationStatus}</p>
	<table>
		<tr>
			<td>Group Name</td>
			<td><input type="text" name="ledgGroupName"></td>
		</tr>
		<tr>
			<td>Group Type</td>
			<td><select name="ledgGroupType">
					<option value="select">Select</option>
					<option value="assets">Assests</option>
					<option value="liabilities">Liabilities</option>
					<option value="income">Income</option>
					<option value="expenditure">Expenditure</option>
			</select></td>
		</tr>
		<tr>
			<td><br></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="Save"><input
				type="reset" value="Clear"></td>
		</tr>
	</table>
</form>
