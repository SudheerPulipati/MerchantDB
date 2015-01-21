<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"  
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<script type="text/javascript" src="./js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="./js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="./js/jquery.validate.min.js"></script>
<script
	src="http://jqueryvalidation.org/files/dist/additional-methods.min.js"></script>
<script type="text/javascript" src="./js/formValidation.js"></script>
<link rel="stylesheet" href="./css/jquery-ui.css" />
<link rel="stylesheet" href="assets/style.css">
<link rel="stylesheet" type="text/css"
	href="./css/jquery.dataTables.css">
<script src="./js/jquery-ui.js"></script>
<script>
	$(document).ready(function() {
		
		// 		var companyId = "";
		// 		$(".companyName").on("click", function(event) {
		// 			companyId = event.currentTarget.id;
		// 			alert($("#companyId").attr("value",companyId));
		// 		});
		// 		if ($("#companyId").val() != null) {
		// 			alert($("#companyId").val());
		// 			$("#" + companyId).addClass("companyStyle");
		// 		}
		
// 		$(".finYear").each(function() {
// 			var label = $(this).text(); // It will get current label text
// 			$("#" + label).click(function(event) {
// 				event.preventDefault();
// 				$(".subList_" + label).toggle();
// 			});
// 		});
	});
</script>
</head>
<body>
	<div class="body">
		<tiles:insertAttribute name="header" />
		<div class="leftMenu">
			<tiles:insertAttribute name="companiesMenu" />
			<tiles:insertAttribute name="finYearsMenu" />
		</div>
		<tiles:insertAttribute name="beforeBody" />
		<tiles:insertAttribute name="body" />
	</div>
</body>
</html>
