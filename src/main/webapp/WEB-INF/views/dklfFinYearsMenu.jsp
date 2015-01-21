<%@ page import="java.util.List,com.dkl.merchantdb.to.FinancialBookTO"%>

<p class="background boldfont">Book Menu</p>
<div class="background yearlist" style="align: left">
	<ul class="currentYear">
		<%
			String selectedYear = (String)session.getAttribute("fbid");
			if (session.getAttribute("financialYears") != null) {
				List<FinancialBookTO> financialBookTOs = (List<FinancialBookTO>) session.getAttribute("financialYears");
				for (FinancialBookTO financialBookTO : financialBookTOs) {
		%>
		<li><b><a class="finYear" href="#"
				id=<%=financialBookTO.getFinBookId()%>><%=financialBookTO.getFinancialYear()%></a></b>
			<ul class="subList_<%=financialBookTO.getFinBookId()%>"
				style="display: none; background: #ccf;">
				<li><a href="purchaseOrder">Purchase</a></li>
				<li><a href="sales">Sales</a></li>
				<li><a href="#">Cash Receipt</a></li>
				<li><a href="#">Cash Payment</a></li>
				<li><a href="#">Cash Journal</a></li>
				<li><a href="#">Stock Journol</a></li>
				<%
					if ("admin".equalsIgnoreCase((String) session.getAttribute("userRole"))) {
				%>
				<li><a
					href="viewReports?fbid=<%=financialBookTO.getFinBookId()%>">Reports</a></li>
				<%
					}
				%>
			</ul> <%
 	}
     	}
 %> <input type="hidden" id="fbid" value=<%=selectedYear%> />
</div>
<script>
	$(document).ready(function() {
		var selectedYear = $("#fbid").val();
		var temp = "";
		if (selectedYear != "") {
			$("#" + selectedYear).css({
				"background" : "#00365B",
				"color" : "white",
				"border" : "1px solid #BFA04D"
			});
			$(".subList_" + selectedYear).show(500);
			temp = selectedYear;
		}
		$(".finYear").on("click", function(event) {
			var finYearId = event.currentTarget.id;
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
		});
	});
</script>
<style>
.companyStyle {
	background: #00365B;
	border: 1px solid #BFA04D;
	margin-left: 3%;
	margin-right: 3%;
}
</style>