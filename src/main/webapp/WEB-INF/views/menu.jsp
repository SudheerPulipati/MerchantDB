<script>
	$(document).ready(function() {
						$.ajax({
									url : "/merchantdb/viewCompanyListJSON",
									type : "POST",
									success : function(json) {
										var companyList = jQuery
												.parseJSON(json).data;
										for (var i = 0; i < companyList.length; i++) {
											$("#companyList")
													.append(
															'<li>'
																	+ companyList[i].companyName
																	+ '<ul style="width:150px">'+
																	'<li><a href="/merchantdb/viewCompany?companyID='+companyList[i].companyID+'">Edit</a></li>'
																   +'<li>Admin<ul style="width:150px"><li><a href="/merchantdb/viewCityGroup?companyID='+companyList[i].companyID+'">CityGroup</a></li><li><a href="/merchantdb/viewLedgerGroup?companyID='+companyList[i].companyID+'">Ledger Group</a></li><li><a href="/merchantdb/viewParty?companyID='+companyList[i].companyID+'">Party</a></li></ul>'
																	+ '</li></ul></li>');
										}
										$("#companyList").menu();
									}
								});
					});
</script>
<style type="text/css">
#companyList {
	font-size: 12px
}
</style>
<h4 style="text-align: center;">Companies</h4>
<hr />
<a style="text-decoration: none !important;"
	href="/merchantdb/createCompany"><input type="button"
	value="Create Company" /></a>
<ul id="companyList">
</ul>

