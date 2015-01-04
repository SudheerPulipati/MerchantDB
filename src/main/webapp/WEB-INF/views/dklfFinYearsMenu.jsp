<%@ page import="java.util.List,com.dkl.merchantdb.to.FinancialBookTO"%>

<p class="background boldfont">Book Menu</p>
<div class="background yearlist" style="align: left">
	<ul class="currentYear">
		<%
			if (session.getAttribute("financialYears") != null) {
				List<FinancialBookTO> financialBookTOs = (List<FinancialBookTO>) session.getAttribute("financialYears");
				for (FinancialBookTO financialBookTO : financialBookTOs) {
		%>
		<li><b><a class="finYear" href="#" id=<%=financialBookTO.getFinancialYear()%>><%=financialBookTO.getFinancialYear()%></a></b>
			<ul class="subList_<%=financialBookTO.getFinancialYear()%>" style="display:none">
				<li><a href="purchaseOrder">Purchase</a></li>
				<li><a href="sales">Sales</a></li>
				<li><a href="#">Cash Receipt</a></li>
				<li><a href="#">Cash Payment</a></li>
				<li><a href="#">Cash Journal</a></li>
				<li><a href="#">Stock Journol</a></li>
				<li><a
					href="viewReports?fbid=<%=financialBookTO.getFinBookId()%>">Reports</a></li>
			</ul> <%
 	}
 	}
 	if ("clerk".equalsIgnoreCase((String) session.getAttribute("userRole"))) {
 %>
			<ul>
				<li><a href="purchaseOrder">Purchase</a></li>
				<li><a href="sales">Sales</a></li>
				<li><a href="#">Cash Receipt</a></li>
				<li><a href="#">Cash Payment</a></li>
				<li><a href="#">Cash Journal</a></li>
				<li><a href="#">Stock Journol</a></li>
			</ul></li>
		<%
			}
		%>
	</ul>
</div>
