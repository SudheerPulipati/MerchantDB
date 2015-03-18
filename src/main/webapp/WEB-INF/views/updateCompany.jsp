<script src="./js/Company.js" type="text/javascript"></script>
<style>
#yesInd,#noInd {
	width: 20px;
	margin: 20px;
}
</style>
<div class="rightContent subMenu">
	<h4 class="rightHeader">Update Company</h4>
	<div class="leftForm">
		<form action="editCompany" method="post" id="updateForm">
			<p style="color: blue">${companyUpdationStatus}</p>
			<label>Company Name</label> <input type="text" name="companyName" />
			<label>Street Name</label> <input type="text" name="streetName" /> <label>City</label>
			<input type="text" name="city" /> <label>State</label> <input
				type="text" name="state" /> <label>Pincode</label> <input
				type="text" name="pinCode" /> <label>E-Mail</label> <input
				type="text" name="email" /> <label>Phone</label> <input type="text"
				name="phoneNumber" /> <label>TIN Number</label> <input type="text"
				name="tinNumber" /> <label>Ship System</label> <input type="radio"
				name="slipsIndicator" id="yesInd" value="Yes">Yes <input
				type="radio" name="slipsIndicator" id="noInd" value="No">No
			<input type="hidden" name="companyId" value="${companyId}" /> 
			<input type="hidden" id="firmList" name="firmNames" value="" />
			<fieldset style="margin-left: 26%;width:60%">
			<input type="text" id="firmName">
			<input type="button" id="addFirmBtn" value="Add Firm"><br />
				<legend>Firms:</legend>
				<table class="firmsTable" cellspacing=5>
					<tbody></tbody>
				</table>
			</fieldset>
			<br/>
			<input
				type="submit" style="margin-left: 40%" id="updateBtn" value="Update"><input
				type="submit" id="deleteBtn" value="Delete">
		</form>
	</div>
	<div id="firmModal" style="display: none" title="Update Firm">
	<input type="text" id="updatedFirmName">
	</div>