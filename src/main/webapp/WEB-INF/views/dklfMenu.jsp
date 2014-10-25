<%@ page import="java.util.List,com.dkl.merchantdb.to.CompanyTO"%>
	<div class="leftMenu">
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
					href="adminView" class="companyAdmin">Admin</a></li>
				<%
					}
					}
				%>
			</ul>
		</div>
		<p class="background boldfont">Book Menu</p>
		<div class="background yearlist">
			<ul class="currentYear">
				<li>2014 - 2015
					<ul>
						<li><a href="#">Purchase</a></li>
						<li><a href="#">Sales</a></li>
						<li><a href="#">Cash Receipt</a></li>
						<li><a href="#">Cash Payment</a></li>
						<li><a href="#">Cash Journal</a></li>
						<li><a href="#">Stock Journol</a></li>
						<li><a href="#">Reports</a></li>
					</ul>
				</li>
			</ul>
			<ul>
				<li>2013 - 2014
					<ul>
						<li><a href="#">Purchase</a></li>
						<li><a href="#">Sales</a></li>
						<li><a href="#">Cash Receipt</a></li>
						<li><a href="#">Cash Payment</a></li>
						<li><a href="#">Cash Journal</a></li>
						<li><a href="#">Stock Journol</a></li>
						<li><a href="#">Reports</a></li>
					</ul>
				</li>
			</ul>
			<ul>
				<li>2012 - 2013
					<ul>
						<li><a href="#">Purchase</a></li>
						<li><a href="#">Sales</a></li>
						<li><a href="#">Cash Receipt</a></li>
						<li><a href="#">Cash Payment</a></li>
						<li><a href="#">Cash Journal</a></li>
						<li><a href="#">Stock Journol</a></li>
						<li><a href="#">Reports</a></li>
					</ul>
				</li>
			</ul>
			<ul>
				<li>2012 - 2011
					<ul>
						<li><a href="#">Purchase</a></li>
						<li><a href="#">Sales</a></li>
						<li><a href="#">Cash Receipt</a></li>
						<li><a href="#">Cash Payment</a></li>
						<li><a href="#">Cash Journal</a></li>
						<li><a href="#">Stock Journol</a></li>
						<li><a href="#">Reports</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
<!-- 	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- 	<script -->
<!-- 		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> -->
<!-- 	<!-- Include all compiled plugins (below), or include individual files as needed --> 
<!-- 	<script src="js/bootstrap.min.js"></script> -->
<!-- </body> -->
<!-- </html> -->