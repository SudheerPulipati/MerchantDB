<%@ page import="java.util.List,com.dkl.merchantdb.to.FinancialBookTO"%>
<p class="background boldfont">Book Menu</p>
<div class="background yearlist" style="align:center">
	<ul class="currentYear">
		<%
			if (session.getAttribute("financialYears") != null) {
				List<FinancialBookTO> financialBookTOs = (List<FinancialBookTO>) session.getAttribute("financialYears");
				for (FinancialBookTO financialBookTO : financialBookTOs) {
		%>
		<li><a
			href="viewReports?fbid=<%=financialBookTO.getFinBookId()%>"><b><%=financialBookTO.getFinancialYear()%></b></a></li>
		<%
			}
			}
		%>
	</ul>
</div>
