<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create City Group</title>
</head>
<body>
<form action="/merchantdb/saveItemUnit" method="post">
	<p style="color:blue">${success}</p>
	<table align="center">
		<tr>
			<td>Unit Name</td>
			<td><input type="text" name="unitName"></td>
		</tr>
		<tr>
			<td>Weight(kgs)</td>
			<td><input type="text" name="weight"></td>
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