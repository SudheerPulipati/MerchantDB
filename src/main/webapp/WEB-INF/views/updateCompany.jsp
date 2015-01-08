<script type="text/javascript">
	$(document).ready(function() {
		$("#updateBtn").click(function(){
			$("form").attr("action","updateCompany");
		});
		$("#deleteBtn").click(function(){
			$("form").attr("action","deleteCompany");
		});
		$.ajax({
			url : 'viewCompanyJSON',
			type : 'GET',
			data : 'companyId=1000001',
			crossDomain : true,
			success : function(data) {
				var jsonData = $.parseJSON(data);
				console.log(jsonData);
				$("[name = companyName]").val(jsonData.companyName);
				$("[name = streetName]").val(jsonData.streetName);
				$("[name = city]").val(jsonData.city);
				$("[name= state]").val(jsonData.state);
				$("[name= pinCode]").val(jsonData.pinCode);
				$("[name= email]").val(jsonData.email);
				$("[name= phoneNumber]").val(jsonData.phoneNumber);
				$("[name= tinNumber]").val(jsonData.tinNumber);
				if (jsonData.slipsIndicator == "Yes") {
					$("#yesInd").attr("checked", true);
				} else {
					$("#noInd").attr("checked", true);
				}

			},
			error : function() {
				window.location.href = "createCompany";
			}
		});

	});
</script>
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
			<input type="hidden" name="companyId" value="${companyId}" /> <input
				type="submit" style="margin-left: 40%" id="updateBtn" value="Update"><input
				type="submit" id="deleteBtn" value="Delete">
		</form>
	</div>