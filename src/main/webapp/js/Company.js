$(document).ready(function(){
	var firmList = [];
	if(window.location.pathname.indexOf("updateCompany") >= 0){
		$.ajax({
			url : 'viewCompanyJSON',
			type : 'GET',
			data : 'companyId=1000001',
			crossDomain : true,
			success : function(data) {
				var jsonData = $.parseJSON(data);
				console.log(jsonData);
				$("[name = companyName]").val(jsonData.companyName);
				$("[name = streetName]").val(jsonData.streetName);
				$("[name = city]").val(jsonData.city);
				$("[name= state]").val(jsonData.state);
				$("[name= pinCode]").val(jsonData.pinCode);
				$("[name= email]").val(jsonData.email);
				$("[name= phoneNumber]").val(jsonData.phoneNumber);
				$("[name= tinNumber]").val(jsonData.tinNumber);
				if (jsonData.slipsIndicator == "Yes") {
					$("#yesInd").attr("checked", true);
				} else {
					$("#noInd").attr("checked", true);
				}
				$(jsonData.firmList).each(function(index,value){
					firmList.push(value.firmID+":"+value.firmName);
				});
				
				$("#firmList").val(firmList);
				if(getListFromValue($("#firmList").val()) != ""){
					firmList = getListFromValue($("#firmList").val());
				}
				populateFirmTable();
			},
			error : function() {
				window.location.href = "createCompany";
			}
		});
	} 
	$("#updateBtn").click(function(){
		$("form").attr("action","updateCompany");
	});
	$("#deleteBtn").click(function(){
		$("form").attr("action","deleteCompany");
	});
	
	
	$("#addFirmBtn").click(function(){
		var firm = $("#firmName").val();
		var firmID = Math.floor((Math.random() * 10000) + 1);
		firmList.push(firmID+":"+firm);
		companyId = $("#companyId").val();
		if(window.location.pathname.indexOf("updateCompany") >= 0){
			insrtFirm(firmID, firm, companyId);
		}
		populateFirmTable();
		$("#firmName").val("");
		
	});
	$(document).on('click', ".deleteFirm" , function(event) {
      event.preventDefault();
		var selectedFirmID = $(this).closest('td').attr("id"); 
		 
		firmList = jQuery.grep(firmList, function(value,index) {
						return getFirmID(value) !== selectedFirmID;
					});
		populateFirmTable();
	});
	
	$(document).on('click', ".firmNameSpan" , function(event) {
	      event.preventDefault();
	      if(window.location.pathname.indexOf("updateCompany") >= 0){
				editFirm($(this).closest('td').attr('id'));
			}
		});
	 
	function getFirmID(firmText){
		return firmText.split(":")[0];
	}
	function getFirmaName(firmText){
		return firmText.split(":")[1];
	}
	function populateFirmTable(){
		$("#firmList").val(firmList);
		$(".firmsTable tbody").html("");
		var row = '<tr id="firmRow">';
		$.each(firmList,function(index,value){
			if(0 == index%3 && index != 0){
				row += '</tr><tr id="firmRow"><td id="'+getFirmID(value)+'"><span class="firmNameSpan">'+ getFirmaName(value)+' </span><span class="deleteFirm">X</span></td>';
			} else {
				row += '<td id="'+getFirmID(value)+'"><span class="firmNameSpan">'+ getFirmaName(value)+'</span> <span class="deleteFirm">X</span></td>';
			} 
			
		});
		$(".firmsTable tbody").append(row);
	}
	function editFirm(id){
		var firmName = $(".firmsTable").find("#"+id).find(".firmNameSpan").text();
		$("#updatedFirmName").val(firmName);
		$("#firmModal").dialog({
			draggable : false,
			modal : true,
			autoOpen : false,
			buttons : {
				"Update" : function(){
					updateFirm(id, $("#updatedFirmName").val());
					$(".firmsTable").find("#"+id).find(".firmNameSpan").html($("#updatedFirmName").val());
				},
				"Close" : function() {
					$(this).dialog("close");
				}
			}
		});
		$("#firmModal").dialog("open");
	}
	function updateFirm(firmId, firmName){
		$.ajax({
			url : 'updateFirmByAjax',
			type : 'POST',
			data : {firmID:firmId,firmName:firmName},
			crossDomain : true,
			success : function(data) {
				alert("success");
			}
		});
		
	}
	
	function insrtFirm(firmId,firmName,companyId){
		alert("hre");
		$.ajax({
			url : 'insertFirmByAjax',
			type : 'POST',
			data : {companyID:companyId,firmID:firmId,firmName:firmName},
			crossDomain : true,
			success : function(data) {
				alert("hello");
			}
		});
	}
	function getListFromValue(text){
		return text.split(",");
	}
	
});