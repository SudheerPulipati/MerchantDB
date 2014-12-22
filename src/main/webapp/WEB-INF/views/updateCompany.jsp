<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
            url : 'viewCompanyJSON',
            type : 'GET',
            data: 'companyId=1000001',
            crossDomain: true,
            success : function(data){
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
        		if(jsonData.slipsIndicator == "Yes"){
        			$("#yesInd").attr("checked",true);
        		}else{
        			$("#noInd").attr("checked",true);
        		}
        		
            },
            error : function(){
                alert('error');
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
	<form action="/merchantdb/updateCompany" method="post">

		<div class="leftForm">
			<p style="color: blue">${companyUpdationStatus}</p>
			<label>Company Name</label> <input type="text" name="companyName" />
			<label>Street Name</label> <input type="text" name="streetName" /> <label>City</label>
			<input type="text" name="city" /> <label>State</label> <input
				type="text" name="state" /> <label>Pincode</label> <input
				type="text" name="pinCode" /> <label>E-Mail</label> <input
				type="text" name="email" /> <label>Phone</label> <input type="text"
				name="phoneNumber" /> <label>TIN Number</label> <input type="text"
				name="tinNumber" /> 
				<label>Ship System</label> <input type="radio"
				name="slipsIndicator" id="yesInd" value="Yes">Yes 
				<input type="radio"
				name="slipsIndicator" id="noInd" value="No">No
			<input type="hidden" name="companyId" value="${companyId}" />
			<input type="submit" style="margin-left:40%"
					value="Update"> <input type="button" value="Cancel">
		</div>
<!-- 		<div class="buttons" style="float:left;margin-left:10%"> -->
<!-- 				<input type="submit" -->
<!-- 					value="Submit"> <input type="button" value="Cancel"> -->
<!-- 					</div> -->
	</form>