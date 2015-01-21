<%@ page import="java.util.List,com.dkl.merchantdb.to.CompanyTO"%>

<p class="background boldfont">Company</p>
<div class="background">

	<%
		String selectedItem = (String) session.getAttribute("selectedItem");
			if (session.getAttribute("companyList") != null) {
	%>
	<a href="createCompany" class="lineBorder currentlink">Create</a>
	<ul class="companies">
		<%
			List<CompanyTO> companyTOs = (List<CompanyTO>) session.getAttribute("companyList");
				for (CompanyTO companyTO : companyTOs) {
		%>
		<li id="<%=companyTO.getCompanyID()%>"><b> <a
				href="viewFinYears?companyId=<%=companyTO.getCompanyID()%>"
				class="companyName_<%=companyTO.getCompanyID()%>"><%=companyTO.getCompanyName()%></a></b> <%
 	if ("admin".equalsIgnoreCase((String) session.getAttribute("userRole"))) {
 %> <a href=<%=companyTO.getCompanyID()%> class="companyEdit_<%=companyTO.getCompanyID()%>" style="display:none">Edit</a><a
			href="adminView?companyId=<%=companyTO.getCompanyID()%>"
			class="companyAdmin_<%=companyTO.getCompanyID()%>" style="display:none">Admin</a> <%
 	}
 %></li>

		<%
			}
			}
		%>
	</ul>
	<input type="hidden" id="companyId" value=<%=selectedItem%> />
</div>

<style>
.companyStyle {
	background: #00365B;
	border: 1px solid #BFA04D;
	margin-left: 3%;
	margin-right:3%;
}
</style>
<script>
	$(document).ready(function() {
		var selectedItem = $("#companyId").val();
		if (selectedItem != null) {
			$("#" + selectedItem).addClass("companyStyle");
			$(".companyName_"+selectedItem).css("color","white");
			$(".companyEdit_"+selectedItem).css({"color":"white","display":"inline"});
			$(".companyAdmin_"+selectedItem).css({"color":"white","display":"inline"});
		}
		$(".companyName_"+selectedItem).on('mouseenter', function () {
			$(this).css('color','grey');
		});
		$(".companyName_"+selectedItem).on('mouseleave', function () {
			$(this).css('color','white');
		});
		$(".companyEdit_"+selectedItem).on('mouseenter', function () {
			$(this).css('color','grey');
		});
		$(".companyEdit_"+selectedItem).on('mouseleave', function () {
			$(this).css('color','white');
		});
		$(".companyAdmin_"+selectedItem).on('mouseenter', function () {
			$(this).css('color','grey');
		});
		$(".companyAdmin_"+selectedItem).on('mouseleave', function () {
			$(this).css('color','white');
		});
		$(".companyEdit_"+selectedItem).click(function(event) {
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