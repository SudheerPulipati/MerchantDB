var itemsPerPage = 20;
var startIndex = 0;
var endIndex = itemsPerPage;
var currentPhase =0;
var minPhase = 0;
var maxPhase =0;
function loadPagination(totRows){
    if(totRows<=itemsPerPage){
	hidePagination(totRows);
    } else{
	currentPhase = 1;
	maxPhase = totRows/itemsPerPage;
	initNavigators(totRows);
	processPaginate(totRows,startIndex,endIndex)
    }
}
function hidePagination(totalItems){
    $("#pagination_prev").hide();
    $("#pagination_next").hide();
    $("#pagination_detail").html("showing "+totalItems+" results.");
}

function initNavigators(totRows){
     if(currentPhase <= 1){
	 $("#pagination_prev").hide();
	 $("#pagination_detail").html("showing first 20 results ");
     } else if(currentPhase >= (maxPhase)){
	 $("#pagination_next").hide();
	 $("#pagination_detail").html("showing results "+startIndex+"-"+totRows);
     } else{
	 $("#pagination_prev").show();
	 $("#pagination_next").show();
	 $("#pagination_detail").html("showing results "+startIndex+"-"+endIndex);
     }
}

function onNext(totRows){
    startIndex += itemsPerPage; 
    endIndex += itemsPerPage;
    processPaginate(totRows,startIndex,endIndex);
    currentPhase++;
    initNavigators(totRows);
    
}
function onPrev(totRows){
    startIndex -= itemsPerPage; 
    endIndex -= itemsPerPage;
    currentPhase--;
    processPaginate(totRows,startIndex,endIndex);
    initNavigators();
}
function processPaginate(totRows,startIndex,endIndex){
    for(var i=0;i<=totRows;i++){
	if(i <= startIndex){
	    $(".rowNum"+i).closest("tr").hide();
	} else if(i > endIndex){
	    $(".rowNum"+i).closest("tr").hide();
	} else{
	    $(".rowNum"+i).closest("tr").show();
	}
    }
}