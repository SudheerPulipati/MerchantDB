$(document).ready(function(){
	
	var firmList = [];
	if(getListFromValue($("#firmList").val()) != ""){
		firmList = getListFromValue($("#firmList").val());
	}
	populateFirmTable();
	$("#addFirmBtn").click(function(){
		var firm = $("#firmName").val();
		var firmID = Math.floor((Math.random() * 10000) + 1);
		firmList.push(firmID+":"+firm);
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
	
	 
	function getFirmID(firmText){
		return firmText.split(":")[0];
	}
	function getFirmaName(firmText){
		return firmText.split(":")[1];
	}
	function populateFirmTable(){
		$(".firmsTable tbody").html("");
		var row = "<tr>";
		$.each(firmList,function(index,value){
			if(0 == index%3 && index != 0){
				row += '</tr><tr><td id="'+getFirmID(value)+'">'+ getFirmaName(value)+' <span class="deleteFirm">X</span></td>';
			} else {
				row += '<td id="'+getFirmID(value)+'">'+ getFirmaName(value)+' <span class="deleteFirm">X</span></td>';
			} 
			 
		});
		$(".firmsTable tbody").append(row);
	}
	function getListFromValue(text){
		return text.split(",");
	}
});