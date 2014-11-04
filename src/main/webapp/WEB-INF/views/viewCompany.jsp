<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Company</title>
<style type="text/css">
.ui-dialog .ui-dialog-content {
	background: none repeat scroll 0 0 transparent;
	border: 0 none;
	overflow: auto;
	padding: 0.5em 1em;
	position: relative;
	font-size: 0.7em;
}
</style>
<script type="text/javascript" src=".js/js/complete.js"></script>
<script src=".js/js/jquery-1.4.4.min.js" type="text/javascript"></script>
<script src=".js/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script type="text/javascript"
	src=".js/js/jquery.dataTables.editable.js"></script>
<script src=".js/js/jquery.jeditable.js" type="text/javascript"></script>
<script src=".js/js/jquery-ui.js" type="text/javascript"></script>
<script src=".js/js/jquery.validate.js" type="text/javascript"></script>
<script>
	$(document).ready(function() {
		$("#company").datatable({
			bJQueryUI : true,
			"sPaginationType" : "full_numbers",
		}).makeEditable({
			"sUpdateURL" : "/Company/UpdateCompanyData",
			"aoColumns" : [ {
			//Empty object is used for the default editable settings
			}, null,//null for read-only columns
			{
				indicator : 'Saving...',
				tooltip : 'Click to select town',
				loadtext : 'loading...',
				type : 'select',
				onblur : 'submit',
				data : "{'London':'London','Liverpool':'Liverpool'}"
			} ]
		});
	});
</script>
</head>
<body>
	<center>
		<h3>Update Company</h3>
		<table align="center" id="company">
			<thead>
				<tr>
					<th>Company ID</th>
					<th>City Group ID</th>
					<th>City Group Name</th>
				</tr>
			</thead>
			<tbody>
		<tr class="odd_gradeX" id="2">
			<td class="read_only"> A Trident(read only cell)</td>
			<td>Internet Explorer 4.0</td>
			<td>Win 95+</td>
		</tr>
		</tbody>
		</table>
	</center>
	<form method="post" action="/merchantdb/deleteCompany">
		<input type="hidden" name="companyID">
		<table align="center">
			<tr>
				<td><input type="submit" value="Remove Company"></td>
			</tr>
		</table>
	</form>
</body>

</html>