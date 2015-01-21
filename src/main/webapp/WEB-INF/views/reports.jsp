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

thead {
	background-color: #00365B;
	color: white;
	font-family: "Arial Black", Gadget, sans-serif;
	font-size: small;
}

.dataTableDiv {
	width: 42%;
	padding-top: 3%;
	margin: auto;
	height: 150px;
	padding-bottom: 5%;
}

table {
	border: 0px solid #C0C0C0;
}
</style>
<link href="./css/styles.css" rel="stylesheet" />
<script src="./js/jquery-1.11.1.min.js"></script>
<script src="./js/jquery.fwd_tabs.js"></script>
<script type="text/javascript" src="./js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css"
	href="./css/jquery.dataTables.css">
<link rel="stylesheet" href="assets/style.css">
<script>
	$(function() {
		$(".tabs").fwd_tabs();
		$("#cashBook").click();
		var selectedItem = $("#companyId").val();
		if (selectedItem != null) {
			$("#" + selectedItem).addClass("companyStyle");
			$(".companyName_" + selectedItem).css("color", "white");
			$(".companyEdit_" + selectedItem).css({
				"color" : "white",
				"display" : "inline"
			});
			$(".companyAdmin_" + selectedItem).css({
				"color" : "white",
				"display" : "inline"
			});
		}
		$(".companyName_" + selectedItem).on('mouseenter', function() {
			$(this).css('color', 'grey');
		});
		$(".companyName_" + selectedItem).on('mouseleave', function() {
			$(this).css('color', 'white');
		});
		$(".companyEdit_" + selectedItem).on('mouseenter', function() {
			$(this).css('color', 'grey');
		});
		$(".companyEdit_" + selectedItem).on('mouseleave', function() {
			$(this).css('color', 'white');
		});
		$(".companyAdmin_" + selectedItem).on('mouseenter', function() {
			$(this).css('color', 'grey');
		});
		$(".companyAdmin_" + selectedItem).on('mouseleave', function() {
			$(this).css('color', 'white');
		});
		$(".companyEdit_" + selectedItem).click(function(event) {
			event.preventDefault();
			$.ajax({
				url : 'editCompany',
				type : 'POST',
				data : 'companyId=' + $(this).attr('href'),
				crossDomain : true,
				success : function(data) {
					window.location.href = "updateCompany";
				},
				error : function() {
					alert('error');
				}
			});
		});
		var selectedYear = $("#fbid").val();
		var temp = "";
		if (selectedYear != "" ) {
			$("#" + selectedYear).css({
				"background" : "#00365B",
				"color" : "white",
				"border" : "1px solid #BFA04D"
			});
			$(".subList_" + selectedYear).show(500);
			temp=selectedYear;
		}
		
		$(".finYear").on("click", function(event) {
			var finYearId = event.currentTarget.id;
			//if (selectedYear == finYearId) {
				$("#" + finYearId).css({
					"background" : "#00365B",
					"color" : "white",
					"border" : "1px solid #BFA04D"
				});
				$("#" + temp).css({
					"background" : "",
					"color" : "",
					"border" : ""
				});
				event.preventDefault();
				$(".subList_" + finYearId).show(500);
				$(".subList_" + temp).hide(500);
				temp = finYearId;

			//}
		});
	});
</script>
</head>
<body>
	<div class="tabs">
		<ul class="tab-menu">
			<li><a href="cashbookReport" id="cashBook">Cash Book</a></li>
			<li><a href="stockReport">Stock</a></li>
			<li><a href="ledgerReport">Ledger</a></li>
			<li><a href="purchaseReport">Purchase</a></li>
			<li><a href="salesReport">Sales</a></li>
			<li><a href="trailBalanceReport">Trail Balance</a></li>
			<li><a href="balanceSheetReport">Balance Sheet</a></li>
			<li><a href="profitLossReport">Profit & Loss</a></li>
		</ul>
	</div>
</body>
</html>