<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"  
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<script type="text/javascript" src="./js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="./js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="./css/jquery-ui.css" />
<link rel="stylesheet" href="assets/style.css">
<link rel="stylesheet" type="text/css" href="./css/jquery.dataTables.css">
<script src="./js/jquery-ui.js"></script>
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
