<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<div class="adminMenuTitle">
	Create Party
	<hr
		style="border: none; height: 1px; width: 40%; background-color: #505050"
		align="left" />
</div>
	<form action="/merchantdb/saveParty" method="post">
			<p>${partyCreationStatus}</p>
			<table>
				<tr>
					<td>Party Name</td>
					<td><input type="text" name="partyName" /></td>
				</tr>
				<tr>
					<td>Party Type</td>
					<td><select name="partyType">
							<option value="select">Select</option>
							<option value="Trade Creditor">Trade Creditor</option>
							<option value="Trade Debtor">Trade Debtor</option>
							<option value="Owner">Owner</option>
							<option value="Employee">Employee</option>
							<option value="Person">Person</option>
							<option value="Misc">Misc</option>
					</select></td>
				</tr>
				<tr>
					<td>Street Name</td>
					<td><input type="text" name="streetName" /></td>
				</tr>
				<tr>
					<td>City</td>
					<td><input type="text" name="city" /></td>
				</tr>
				<tr>
					<td>Telephone#</td>
					<td><input type="text" name="telephone" /></td>
				</tr>
				<tr>
					<td>Ledger Group Name</td>
					<td>	
						<select name="ledgerGroupName" id="ledgerGroupName">
							<c:forEach items="${ledgerGroupList}" var="element"> 
								<option value="${element.ledgGroupID}">${element.ledgGroupName}</option>
							</c:forEach>	
						</select>
					</td>
				</tr>
				<tr>
					<td>City Group</td>
					<td><select name="cityGroup" id="cityGroup">
							<c:forEach items="${cityGroupList}" var="element"> 
								<option value="${element.cityGroupID}">${element.cityGroupName}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td><br></td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="Submit" value="Save"> 
					<input	type="reset" value="Clear"></td>
				</tr>
			</table>
	</form>
