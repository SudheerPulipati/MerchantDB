<div class="rightContent subMenu">
<h4 class="rightHeader">Create Company</h4>

<form action="/merchantdb/saveCompany" method="post">
	
	<div class="leftForm">
				<p>${companyCreationStatus}</p>
				<label>Company Name</label>
				<input type="text" name="companyName" />
				<label>Street Name</label>
				<input type="text" name="streetName" />
				<label>City</label>
				<input type="text" name="city" />
				<label>State</label>
				<input type="text" name="state" />
				<label>Pincode</label>
				<input type="text" name="pinCode" />
				<label>E-Mail</label>
				<input type="text" name="email" />
				<label>Phone</label>
				<input type="text" name="phoneNumber" />
				<label>TIN Number</label>
				<input type="text" name="tinNumber" />
				<label>Ship System</label>
				<input type="radio" name="slipsIndicator" value="Yes">Yes
					<input type="radio" name="slipsIndicator" value="No">No
<!-- 				<input type="Submit" value="Save"> <input -->
<!-- 					type="reset" value="Clear"><input type="Button" -->
<!-- 					value="Close"> -->
	</div>
	<div class="buttons">
					<p class="firstLineButtons">
						<input type="submit" style="background:url('images/save.jpg');padding:5px">
						<img src="images/clear.jpg">
						<img src="images/close.jpg">
					</p>
				</div>
</form>