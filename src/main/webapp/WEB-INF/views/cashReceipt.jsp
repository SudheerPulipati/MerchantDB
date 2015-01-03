 <script>
 
 	var firmNames = [];
	var partyNames =[];
	var narrationNames =[];
	var globalRemovedRowIds=[];
	
    var partyIDMap = new Map();
    var firmMap = new Map();
    var narrationMap = new Map();
    var cashReceiptNo=0;
 
 $(function(){
	 
	 $( "#txnDate" ).datepicker({
		    maxDate : 0,
		    beforeShow: function(){    
		           $(".ui-datepicker").css('font-size', 12) 
		    }
		});
	 
	 $(document).on('keypress', ".decimalClass",function (evt) {  
		 var charCode = (evt.which) ? evt.which : event.keyCode
	        if (charCode != 45 && (charCode != 46 || $(this).val().indexOf('.') != -1) && 
	                (charCode < 48 || charCode > 57)){
	        	return false;
	   		 } 
		});
	 
	 $(document).on('keypress', ".numberClass",function (e) {  
		  if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
		        //display error message
		        alert("Digits Only");
		        return false;
		    }
		});
	 
	 	$(document).on('click',".rowRemoveClass",function(){
		    var index = Number($(this).attr('id'));
		  	globalRemovedRowIds.push(index);
			$(this).parent().parent().remove();
			if(globalRemovedRowIds.length==totalRowCount){
				$("#noOfRows").val(0);
				$("#transactionTable").remove();
				$("transactionTableDiv").hide();
			}
		});
	 
	 
	  $.ajax({
	        url: 'getCashReceiptRequestData',
	        success: function(data) {
	        	$.each(data, function( key, val ) {
	        		if(key==='partyList'){
	        			$.each(val, function(objKey, objVal) {
	        				partyNames.push(objVal.partyName);
	        				partyIDMap.set(objVal.partyName,objVal.partyID);
	        			});
	        		}	        		
	        		if(key==='firmList'){
	        			$.each(val, function(objKey, objVal) {
	        				firmNames.push(objVal.firmName);
	        				firmMap.set(objVal.firmName,objVal.firmID);
	        			});
	        		}
	        		if(key==='narrationList'){
	        			$.each(val, function(objKey, objVal) {
	        				narrationNames.push(objVal.narration);
	        				narrationMap.set(objVal.narration, objVal.narrationID);
	        			});
	        		}
	        	});
	        }
	      });
	  
	
	 
 });
 
 
 var saveTransaction = function(){
		var cashTransactionTOs = [];
		var rows = new Number($("#noOfRows").val());
		for(var i=0;i<rows;i++){	
		
			var cashTransactionTO1={
					            "ledgerID":partyIDMap.get($("#row_"+i+"_col_0").val()),
								"ledgerName":$("#row_"+i+"_col_0").val(),										
								"firmID":firmMap.get($("#row_"+i+"_col_2").val()),
								"firmName":$("#row_"+i+"_col_2").val(),
								"amount":$("#row_"+i+"_col_1").val()
								}	
			cashTransactionTOs[i] = cashTransactionTO1;
		}
		//alert(cashTransactionTOs.length);	
		var transactionTO = {"bookID":'FY2013-14',
							 "transactionType":"CR",
							 "transactionDate":$("#txnDate").val(),
							 "ledgerID":partyIDMap.get('CASH'),
							 "ledgerName":"CASH",
							 "totalAmount": $("#totalAmount").val(),
							 "cashTransactionTOs":cashTransactionTOs}
			//alert(transactionTO.cashTransactionTOs[0].amount);
			 var jqxhr = $.ajax({
				 	url: 'createCashTransaction',
				 	type:'post',
				 	contentType: 'application/json',
				 	data: JSON.stringify(transactionTO), 
				 	success: function (data){
				 		if(data==="cashReceiptTxnSuccess"){
				 			alert("Successfully Saved");
				 			location.reload();
			            }else{
			            	alert("Some Technical Issue Occured");
			            }
			         },
			         error: function (jqXHR, exception) {
			        	 if (jqXHR.status === 0) {
			                 alert('Not connect.\n Verify Network.');
			             } else if (jqXHR.status == 404) {
			                 alert('Requested page not found. [404]');
			             } else if (jqXHR.status == 500) {
			                 alert('Internal Server Error [500].');
			             } else if (exception === 'parsererror') {
			                 alert('Requested JSON parse failed.');
			             } else if (exception === 'timeout') {
			                 alert('Time out error.');
			             } else if (exception === 'abort') {
			                 alert('Ajax request aborted.');
			             } else {
			                 alert('Uncaught Error.\n' + jqXHR.responseText);
			             }
			         }
				}); 
		
	};
	
	
	var globalTotalAmountTillNow =Number(0);
	var totalRowCount =0;
	
	
function createTransactionTable(){
		
		$("#transactionTable").remove();
			
		mytable = $('<table style="width:50%;" class="gridtable"></table>').attr({ id: "transactionTable"});
		var rows = new Number($("#noOfRows").val());
		var cols = new Number(6);
		var tr = [];
		
		var tableHeader = $('<thead></thead>');
		tableHeader.append($('<th style="width:2%;"></th>').text("S.No"));
		tableHeader.append($('<th style="width:20%;"></th>').text("Ledger Name"));
		tableHeader.append($('<th style="width:3%;"></th>').text("Amount"));
		tableHeader.append($('<th style="width:5%;"></th>').text("Firm"));
		tableHeader.append($('<th style="width:15%;"></th>').text("Remarks"));
		tableHeader.append($('<th style="width:5%;"></th>').text("Remove Row"));
		
		tableHeader.appendTo(mytable);	
		
		for (var i = 0; i < rows; i++) {
			var row = $('<tr></tr>').appendTo(mytable);
			$('<td>'+Number(i+1)+'</td>').appendTo(row);
			for (var j = 0; j < cols-1; j++) {
				var textbox = determineColumnType(i,j);
				$('<td style="text-align:center"></td>').append(textbox).appendTo(row); 
			}
			//console.log("TTTTT:"+row);
		}
		
		if(rows>0)
		{
			var row1 = $("<tr></tr>").appendTo(mytable);
			$("<td></td>").appendTo(row1);
			$("<th>Total Amount:</th>").appendTo(row1);
			$("<td><input type='text' readonly='readonly' id='totalAmount' class='decimalClass' value='0'/></td>").appendTo(row1);
			$("<td></td>").appendTo(row1);
			$("<td></td>").appendTo(row1);
			
			var row = $("<tr style='border-color:white'></tr>").appendTo(mytable);
			$("<td></td>").appendTo(row);
			$("<td colspan='2'><img src='images/save.jpg' id='saveTransactionButton' onclick='saveTransaction();'/>  <img src='images/clear.jpg' id='resetButton' onclick='createTransactionTable();'/></td>").appendTo(row);
			$("<td colspan='2'></td>").appendTo(row);
		}
		//console.log("TTTTT:"+mytable.html());
		mytable.appendTo("#transactionTableDiv");	
		
		enableAutocompleteForDynamicFields(rows);
		
		totalRowCount=rows;		
		
	};
	
	var enableAutocompleteForDynamicFields = function(rows){
		for(var i=0;i<rows;i++){
			//item name column
			  $("#row_"+i+"_col_0" ).autocomplete({
			      source: partyNames
			  });
			//stock point name column
			  $("#row_"+i+"_col_2" ).autocomplete({
			      source: firmNames
			  });
			//firm name column
			  $("#row_"+i+"_col_3" ).autocomplete({
			      source: narrationNames
			  });
		}
	};
	
		
	var calculateTotalAmount = function(){
		var rows = new Number($("#noOfRows").val());
		var totalAmount = new Number(0);
		for (var i = 0; i < rows; i++) {
			if(jQuery.inArray(Number(i),globalRemovedRowIds)==-1)
			totalAmount=totalAmount + Number($("#row_"+i+"_col_1" ).val());
		}
		$("#totalAmount" ).val(totalAmount);
	}

	var determineColumnType = function(rowcount,columnCount){
		if(columnCount==0){
			var textbox=$("<input name='partyName' type='text' id='row_"+rowcount+"_col_"+columnCount+"'/>");
			return textbox;
		}else if(columnCount==1){
			return $("<input class='decimalClass' onchange='calculateTotalAmount();' name='amount' type='text' id='row_"+rowcount+"_col_"+columnCount+"' value='0'/>");
		}else if(columnCount==2){
			return $("<input name='firmName' type='text' id='row_"+rowcount+"_col_"+columnCount+"'/>");
		}else if(columnCount==3){
			return $("<input name='remarks' type='text' id='row_"+rowcount+"_col_"+columnCount+"' />");
		}else if(columnCount==4){
			return $("<a class='rowRemoveClass' href='#' id='"+rowcount+"'>X</a>");
		}
	};
	
 </script>
<jsp:include page="calendarandgridtablecss.jsp"/>
			<h4 class="rightHeader">
				Cash Receipt
			</h4>
			<table class="gridtable" style="width:50%;">
				 <thead>
					 <tr>
						<th>Transaction Date:</th>
						<th># of Rows:</th>
					</tr>
				</thead>
				<tr>
					<td class="tdStyle1">
						<input type="text" id="txnDate">
					</td>
					<td class="tdStyle1">
						<input class="numberClass" type="text" id="noOfRows" onchange="createTransactionTable();">
					</td>
				  </tr>
				</table>
			<div id="transactionTableDiv">
			</div>	