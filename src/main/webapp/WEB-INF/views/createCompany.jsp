<script>
$(document).ready(function(){
	var allValid = true;
	$("#createCompany").click(function(){
		validate("companyName");
		validate("streetName");
		validate("city");
		validate("state");
		validate("pinCode");
		validate("email");
		validate("phoneNumber");
		validate("tinNumber");
		if(allValid){
			alert("All fields are validated.");
			//$("#createCompanyForm").submit();
		}
	});
	$("#companyName").focusout(function(){
		validate("companyName");
	});
	$("#streetName").focusout(function(){
		validate("streetName");
	});
	$("#city").focusout(function(){
		validate("city");
	});
	$("#state").focusout(function(){
		validate("state");
	});
	$("#pinCode").focusout(function(){
		validate("pinCode");
	});
	$("#email").focusout(function(){
		validate("email");
	});
	$("#phoneNumber").focusout(function(){
		validate("phoneNumber");
	});
	$("#tinNumber").focusout(function(){
		validate("tinNumber");
	});
	function validate(id){
		if(isEmpty($("#"+id).val())){
			$("#"+id+"Info").html("This field can't be empty.");
			$("#"+id+"Info").show();
			allValid=false;
		}
		else{
			$("#"+id+"Info").hide();
			allValid=true;
		}
	}
	function isEmpty(string){
		isEmptyValue = false;
		if(string == null || string.trim()=="")
			isEmptyValue = true;
		return isEmptyValue;
	}
});
</script>
<style type="text/css">
[id$=Info]{
color:red;
text-align:right
}
</style>
<div class="rightContent subMenu">
<h4 class="rightHeader">Create Company</h4>

<form action="/merchantdb/saveCompany" method="post" id="createCompanyForm">
	
	<div class="leftForm" style="padding-left:100px">
	<p>${companyCreationStatus}</p>
	<table align="center">
	<tr>
		<td style="width:40%">Company name</td>
		<td><input type="text" name="companyName" id="companyName" /></td>
	</tr>
	<tr><td colspan="2" id="companyNameInfo" style="display:none"></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td style="width:40%">Street Name</td>
		<td><input type="text" name="streetName" id="streetName" /></td>
	</tr>
	<tr><td colspan="2" id="streetNameInfo" style="display:none"></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td style="width:40%">City</td>
		<td><input type="text" name="city" id="city" /></td>
	</tr>
	<tr><td colspan="2" id="cityInfo" style="display:none"></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td style="width:40%">State</td>
		<td><input type="text" name="state" id="state" /></td>
	</tr>
	<tr><td colspan="2" id="stateInfo" style="display:none"></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td style="width:40%">Pincode</td>
		<td><input type="text" name="pinCode" id="pinCode" /></td>
	</tr>
	<tr><td colspan="2" id="pinCodeInfo" style="display:none"></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td style="width:40%">Email</td>
		<td><input type="text" name="email" id="email" /></td>
	</tr>
	<tr><td colspan="2" id="emailInfo" style="display:none"></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td style="width:40%">Phone</td>
		<td><input type="text" name="phoneNumber" id="phoneNumber" /></td>
	</tr>
	<tr><td colspan="2" id="phoneNumberInfo" style="display:none"></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td style="width:40%">TIN Number</td>
		<td><input type="text" name="tinNumber" id="tinNumber" /></td>
	</tr>
	<tr><td colspan="2" id="tinNumberInfo" style="display:none"></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td style="width:40%">Ship System</td>
		<td><input type="radio" name="slipsIndicator" id="slipsIndicator" value="Yes">Yes
					<input type="radio" name="slipsIndicator" id="slipsIndicator" value="No">No</td>
	</tr>
	<tr><td colspan="2" id="slipsIndicatorInfo" style="display:none"></td></tr>
	<tr><td>&nbsp;</td></tr>
	</table>
				
				<!-- <label>Company Name</label>
				<input type="text" name="companyName" id="companyName" />
				<label id="companyNameInfo" style="display:none"></label>
				
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
					<input type="radio" name="slipsIndicator" value="No">No -->
<!-- 				<input type="Submit" value="Save"> <input -->
<!-- 					type="reset" value="Clear"><input type="Button" -->
<!-- 					value="Close"> -->
	</div>
	<div class="buttons">
					<p class="firstLineButtons">
						<input type="button" id="createCompany" style="background:url('images/save.jpg');padding:5px">
						<img src="images/clear.jpg">
						<img src="images/close.jpg">
					</p>
				</div>
</form>