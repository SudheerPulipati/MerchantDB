<style type="text/css">
#yesInd,#noInd {
	width: 20px;
	margin: 20px;
}

#createCompanyForm label.error {
	display: block;
	color: red;
	line-height: 0px;
	width:50%;
}

#createCompanyForm input.error {
	border: 1px solid red;
}
</style>
<div class="rightContent subMenu">
	<h4 class="rightHeader">Create Company</h4>

	<form action="saveCompany" method="post" id="createCompanyForm">

		<div class="leftForm" style="padding-left: 100px">
			<p><%if(request.getAttribute("status")!=null)request.getAttribute("status"); %></p>

			<label>Company Name</label> <input type="text" name="companyName"
				id="companyName" />  <label>Street Name</label> <input
				type="text" name="streetName" id="streetName" /> <label>City</label>
			<input type="text" name="city" id="city" /> <label>State</label> <input
				type="text" name="state" id="state" /> <label>Pincode</label> <input
				type="text" name="pinCode" id="pinCode" /> <label>E-Mail</label> <input
				type="text" name="email" id="email" /> <label>Phone</label> <input
				type="text" name="phoneNumber" id="phoneNumber" /> <label>TIN
				Number</label> <input type="text" name="tinNumber" id="tinNumber" /> <label>Ship
				System</label> <input type="radio" name="slipsIndicator" id="yesInd"
				value="Yes">Yes <input type="radio" name="slipsIndicator"
				id="noInd" value="No">No <input type="submit"
				style="margin-left: 40%" value="Create"> <input
				type="button" value="Cancel">
		</div>
	</form>