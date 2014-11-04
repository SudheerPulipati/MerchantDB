<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create City Group</title>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script>
$(document).ready(function(){
	$("#unitName").blur(function(){
		$.ajax({url: '/merchantdb/getWeight', type: 'GET', data: { 'unitName' : $(this).val() }})
		  .done(function(response){
		    $("#weight").val(response);
		  });
	});
});

</script>
</head>
<body>
<form action="/merchantdb/saveItem" method="post">
	<p style="color:blue">${itemCreationStatus}</p>
	<table align="center">
		<tr>
			<td>Item Group Name</td>
			<td><input type="radio" name="itemGroupId" value="1">Jaggery</td>
			<td><input type="radio" name="itemGroupId" value = "2">Tamarind</td>
			<td><input type="radio" name="itemGroupId" value="3">Red Chillies</td>
			<td><input type="radio" name="itemGroupId" value="4">Soap Nuts</td>
		</tr>
		<tr>
			<td>Item Name</td>
			<td><input type="text" name="itemName"></td>
		</tr>
		<tr>
			<td>Unit Name</td>
			<td><input type="text" name="unitName" id="unitName"></td>
			<td>Weight(kgs)</td>
			<td><input type="text" name="weight" id="weight" style = "background:#DBD7D9" readonly></td>
		</tr>
		<tr>
			<td>Price per</td>
			<td><input type="radio" name="pricePer" value="10Kg">10Kg</td>
			<td><input type="radio" name="pricePer" value="Unit Name">Unit Name</td>
		</tr>
		<tr>
			<td></td>
			<td><input type="button" name="" value="Town"></td>
			<td><input type="button" name="" value="OutOfTown"></td>
			<td><input type="button" name="" value="Sale"></td>
		</tr>
		<tr>
			<td>Coolie</td>
			<td><input type="text" name="townCoolie"></td>
			<td><input type="text" name="outOfTownCoolie"></td>
			<td><input type="text" name="unloadingCoolie"></td>
		</tr>
		<tr>
			<td>Sales Tax</td>
			<td><input type="radio" name="salesTaxExcemption" value="Yes">Yes</td>
			<td><input type="radio" name="salesTaxExcemption" value="No">No</td>
		</tr>
		
		<tr>
			<td>Display Ind</td>
			<td><input type="radio" name="displayInd" value="Yes">Yes</td>
			<td><input type="radio" name="displayInd" value="No">No</td>
		</tr>
		
		<tr>
			<td colspan="2">&nbsp;</td>
		</tr>
		<tr>
		<td><input type="submit" value="Create"></td>
		</tr>
	</table>
	</form>
</body>
</html>