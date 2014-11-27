<%@ page import="java.util.List,com.dkl.merchantdb.to.CompanyTO"%>
	
		<p class="background boldfont">Company</p>
		<div class="background">
			<a href="createCompany" class="lineBorder currentlink">Create</a>
			<ul class="companies">
				<%
					if (session.getAttribute("companyList") != null) {
						List<CompanyTO> companyTOs = (List<CompanyTO>) session.getAttribute("companyList");
						for (CompanyTO companyTO : companyTOs) {
				%>
				<li><b><%=companyTO.getCompanyName()%></b><a
					href="editCompany?companyId=<%=companyTO.getCompanyID()%>" class="companyEdit">Edit</a><a
					href="adminView?companyId=<%=companyTO.getCompanyID()%>" class="companyAdmin">Admin</a></li>
				<%
					}
					}
				%>
			</ul>
		</div>
		
<!-- 	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- 	<script -->
<!-- 		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> -->
<!-- 	<!-- Include all compiled plugins (below), or include individual files as needed --> 
<!-- 	<script src="js/bootstrap.min.js"></script> -->
<!-- </body> -->
<!-- </html> -->