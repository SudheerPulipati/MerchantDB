<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>fwd_tabs Demo</title>
<meta name="viewport" content="width=device-width, maximum-scale=1.0" />
<meta name="robots" content="index,follow" />
<style>
body {
	font-family: Arial, Helvetica, Sans-Serif;
	font-size: 80%;
}

h2 {
	margin: 0;
	padding: 0;
}
</style>
<link href="./css/styles.css" rel="stylesheet" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="./js/jquery.fwd_tabs.js"></script>
<script type="text/javascript" src="./js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css"
	href="./css/jquery.dataTables.css">
<script>
	$(function() {
		$(".tabs").fwd_tabs();
	});
</script>
</head>
<body>
	<div class="tabs">
		<ul class="tab-menu">
			<li><a href="http://localhost:8080/merchantdb/cashbookReport">Cash Book</a></li>
			<li><a href="http://localhost:8080/merchantdb/stockReport">Stock</a></li>
			<li><a href="http://localhost:8080/merchantdb/purchaseReport">Purchase</a></li>
			<li><a href="http://localhost:8080/merchantdb/salesReport">Sales</a></li>
		</ul>
	</div>
</body>
</html>