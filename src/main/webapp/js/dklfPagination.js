var itemsPerPage = 20;
var startIndex = 0;
var endIndex = itemsPerPage;
var currentPhase = 0;
var minPhase = 0;
var maxPhase = 0;
var totRows = 0;

function setTotRows(totalRows) {
	totRows = totalRows;
}
function getTotRows() {
	return totRows;
}

function loadPagination(totalRows) {
	console.log("Total Rows to be paginated::"+totalRows);
	setTotRows(totalRows);
	if (getTotRows() <= itemsPerPage) {
		hidePagination(getTotRows());
	} else {
		currentPhase = 1;
		maxPhase = getTotRows() / itemsPerPage;
		initNavigators(getTotRows());
		processPaginate(getTotRows(), startIndex, endIndex)
	}
}
function hidePagination(totalItems) {
	$("#pagination_prev").hide();
	$("#pagination_next").hide();
	$("#pagination_detail").html("showing " + totalItems + " results.");
}

function initNavigators(totRows) {
	console.log("Max Phase::"+maxPhase);
	if (currentPhase <= 1) {
		$("#pagination_prev").hide();
		$("#pagination_next").show();
		$("#pagination_detail").html("showing first 20 results ");
	} else if (currentPhase >= (maxPhase)) {
		$("#pagination_next").hide();
		$("#pagination_prev").show();
		$("#pagination_detail").html(
				"showing results " + startIndex + "-" + totRows);
	} else {
		console.log("Pagination Loaded");
		$("#pagination_prev").show();
		$("#pagination_next").show();
		$("#pagination_detail").html(
				"showing results " + startIndex + "-" + endIndex);
	}
}
$("#pagination_next").click(function() {
	onNext();
});
$("#pagination_prev").click(function() {
	onPrev();
});
function onNext() {
	totRows = getTotRows();
	startIndex += itemsPerPage;
	endIndex += itemsPerPage;
	processPaginate(totRows, startIndex, endIndex);
	currentPhase++;
	initNavigators(totRows);

}
function onPrev() {
	totRows = getTotRows();
	startIndex -= itemsPerPage;
	endIndex -= itemsPerPage;
	currentPhase--;
	processPaginate(totRows, startIndex, endIndex);
	initNavigators();
}
function processPaginate(totRows, startIndex, endIndex) {
	console.log("Start Index:"+startIndex+" End Index::"+endIndex);
	for (var i = 0; i <= totRows; i++) {
		if (i < startIndex) {
			$(".rowNum" + i).closest("tr").hide();
		} else if (i > endIndex) {
			$(".rowNum" + i).closest("tr").hide();
		} else {
			$(".rowNum" + i).closest("tr").show();
		}
	}
}