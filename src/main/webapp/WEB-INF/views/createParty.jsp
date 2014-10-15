<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Party</title>
</head>
<body>
	<form action="/merchantdb/saveParty" method="post">
		<center>
			<h3>Create Party</h3>
			<table align="center">
				<tr>
					<td colspan="2">${partyCreationStatus}<br> <br></td>
				</tr>
				<tr>
					<td>Party Name</td>
					<td><input type="text" name="partyName" /></td>
				</tr>
				<tr>
					<td>Party Type</td>
					<td><input type="text" name="partyType" /></td>
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
					<td><input type="text" name="ledgerGroupName" /></td>
				</tr>
				<tr>
					<td>City Group</td>
					<td><input type="text" name="cityGroup" /></td>
				</tr>
				<tr>
					<td><br></td>
				</tr>
				<tr>
					<td colspan="2"><input type="Submit" value="Save"> <input
						type="reset" value="Clear"><input type="Button"
						value="Close"></td>
				</tr>
			</table>
		</center>
	</form>
</body>
</html>