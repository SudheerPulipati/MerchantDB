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
			href=<%=companyTO.getCompanyID()%> class="companyEdit">Edit</a><a
			href="adminView?companyId=<%=companyTO.getCompanyID()%>"
			class="companyAdmin">Admin</a> <input type="hidden" name="companyId"
			value=<%=companyTO.getCompanyID()%> id="compId" /></li>

		<%
			}
					}
		%>
	</ul>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		$(".companyEdit").click(function(event) {
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
	});
</script>