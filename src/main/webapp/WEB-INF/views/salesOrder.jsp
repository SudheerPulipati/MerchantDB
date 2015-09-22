<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>DKL</title>
		<link rel="stylesheet" href="assets/custom/style.css">
		<jsp:include page="calendarandgridtablecss.jsp"/>
		
<script>

 var firmNames = [];
 var partyNames =[];
 var stockPointNames =[];
 var itemBatchNames =[];
 var itemNames =[];
 var finBookId = '${fibId}';// value obtained from spring controller and saved in javascript
 var globalRemovedRowIds =[];
 var totalRowsInitallyDesigned = 0;
 
 
 var stockPointMap = new Map();
 var itemMap = new Map();
 var itemBatchMap = new Map();
 var itemPricePerMap = new Map();
 var itemNoOfKgsMap = new Map();
 var partyIDMap = new Map();
 var firmMap = new Map();
 
  $(function() {
	  
	  $("#itemsTableDiv").hide();
	  
	  $("#datepicker").datepicker({
		    maxDate : 0,
		    dateFormat: 'mm/dd/yy', 
		    gotoCurrent: true,
		    beforeShow: function(){    
		           $(".ui-datepicker").css('font-size', 12) 
		    }
		}).datepicker('setDate',"0");
	  
	  
	  $(document).on('keypress', ".decimalClass",function (evt) {  
			 var charCode = (evt.which) ? evt.which : event.keyCode
		        if (charCode != 45 && (charCode != 46 || $(this).val().indexOf('.') != -1) && 
		                (charCode < 48 || charCode > 57)){
		        	return false;
		   		 }
			 
			 var text = $(this).val();

			  if ((text.indexOf('.') != -1) &&
			    (text.substring(text.indexOf('.')).length > 2) &&
			    (event.which != 0 && event.which != 8) &&
			    ($(this)[0].selectionStart >= text.length - 2)) {
			    event.preventDefault();
			  }
			});
	  
	  
	  $(document).on('keypress', ".numberClass",function (e) {  
		  if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)){
		        //display error message
		        alert("Digits Only");
		        return false;
		    }
		});
	  
	  
	  $.ajax({
	        url: 'getRequestDataForSalesOrder',
	        success: function(data) {
	        	console.log(data);
	        	$.each(data, function( key, val ) {
	        		if(key==='partyList'){
	        			$.each(val, function(objKey, objVal) {
	        				partyNames.push(objVal.partyName);
	        				partyIDMap.set(objVal.partyName,objVal.partyID);
	        			});
	        		}
	        		if(key==='stockPointList'){
	        			$.each(val, function(objKey, objVal) {
	        				stockPointNames.push(objVal.stockPointName);
	        				stockPointMap.set(objVal.stockPointName, objVal.stockID);
	        				console.log("====="+objVal.stockID);
	        			});
	        		}
	        		if(key==='firmList'){
	        			$.each(val, function(objKey, objVal) {
	        				firmNames.push(objVal.firmName);
	        				firmMap.set(objVal.firmName,objVal.firmID);
	        			});
	        		}
	        		if(key==='itemMasterList'){
	        			$.each(val, function(objKey, objVal) {
	        				itemNames.push(objVal.itemName);
	        				itemMap.set(objVal.itemName, objVal.itemID);
	        				itemPricePerMap.set(objVal.itemName, objVal.pricePer);
	        				itemNoOfKgsMap.set(objVal.itemName, objVal.noOfKgs);
	        			});
	        		}
	        	});
	        	 //alert(firmNames);
	             //alert(partyNames);
	             //alert(stockPointNames);
	             //console.log('itemNames...'+itemNames);
	             //console.log('itemMap...'+itemMap);
	             //console.log('itemPricePerMap...'+itemPricePerMap);
	             //console.log('itemNoOfKgsMap...'+itemNoOfKgsMap);
	        }
	      });
	  
	  
	  	$("#partyName" ).autocomplete({
	      source: partyNames
	    });
	  
	  
	  
	  
  });
  
  
  
  var getBatchId = function(rowCount) {
	    var text ="itemId="+itemMap.get($("#row_"+rowCount+"_col_2").val())+"&stockPointId="+stockPointMap.get($("#row_"+rowCount+"_col_3").val());
	    console.log(text);
	    $.ajax({
	        url: 'getItemBatch',
	        data:text,
	        success: function(data){
	        	
	        	//console.log(data);
	        	
	        	if(data.itemBatchName==null){
	        		itemBatchNames.length=0;
	        		//itemBatchMap.clear();
	        	}	        	
	        	$.each(data, function(objKey, objVal) {
	        		itemBatchNames.length=0;
	        		//itemBatchMap.clear();
	        		itemBatchNames.push(objVal.itemBatchName);
	        		itemBatchMap.set(objVal.itemBatchName, objVal.itemBatchID);
  			});
	        	//batch name
	        	 $("#row_"+rowCount+"_col_4").autocomplete({
	        	      source: itemBatchNames
	        	    });
	        	
	        }});
	};
  
  
  function populateSaleRows(saleRowCount){
	  
	  var saleTransTable = $("#saleTransTable");
	  
	  $("#saleTransTable > tbody > tr").remove();
	  
	  var populateRows = 0;
	  if(saleRowCount==0){
		  $("#itemsTableDiv").hide();
	  }else{
		  $("#itemsTableDiv").show();
		  populateRows = saleRowCount;
	  }
	  
	  var cols= 11;
	  
	  if(populateRows>0){
		  totalRowsInitallyDesigned = populateRows;
		  var rows = new Number(populateRows);	
		  for (var i = 0; i < rows; i++) {
			    var row_id = "row_"+i;
			  	var row = $('<tr id='+row_id+'></tr>').appendTo(saleTransTable);
				$('<td>'+Number(i+1)+'</td>').appendTo(row);
				for (var j = 1; j <= cols; j++) {
					var textbox = determineColumnType(i,j);
					$('<td style="text-align:center"></td>').append(textbox).appendTo(row); 
				}
		  }
	  }
	  globalRemovedRowIds =[];
	  enableAutocompleteForDynamicFields(populateRows);
  }
  
  
  function removeRow(rowId){
	  console.log(rowId);
	  var saleTransTable = $("#saleTransTable");
	  var row_id = "row_"+rowId;
	 // console.log(row_id);
	  globalRemovedRowIds.push(row_id);
	  $('#'+row_id).remove();
	  var tbodyRowCount = $('#saleTransTable >tbody >tr').length;
	  var totalInitalRows =  Number($('#noOfItems').val());
	  $('#noOfItems').val(totalInitalRows-1);
	  
	  if(tbodyRowCount==0){
		  $("#itemsTableDiv").hide();
		  $("#noOfItems").val(0);
		  globalRemovedRowIds =[];
		  
		  $("#totalQuantity").val(0);
		  $("#totalWeight").val(0);
		  $("#totalWeightDiff").val(0);
		  $("#totalCoolieAmt").val(0);
		  
		  $("#totalAmt").val(0);
		  $("#gunnyBagAmt").val(0);
		  $("#totalPaidAmt").val(0);
		  $("#totalBalance").val(0);
		  
	  }else{
		  calculateTotalQuantity();
		  calculateTotalWeight();
		  calculateTotalWeightDiff();
	  }
	  
	  
	  
  }
  
  var enableAutocompleteForDynamicFields = function(rows){
		//console.log(rows);
	  for(var i=0;i<rows;i++){
			//item name column
			  $("#row_"+i+"_col_2" ).autocomplete({
			      source: itemNames
			  });
			  
		    //stock point name column
			  $("#row_"+i+"_col_3" ).autocomplete({
			      source: stockPointNames
			  });
		}
	};  
	
	
  var calculateRequiredFields = function(rowCount){
	  var itemName = $("#row_"+rowCount+"_col_2" ).val();
	  var stockPoint = $("#row_"+rowCount+"_col_3" ).val();
	  var batch = $("#row_"+rowCount+"_col_4" ).val();
	  var price = $("#row_"+rowCount+"_col_9" ).val();

	  if(itemName.length>0 && stockPoint.length >0 && batch.length >0){
		  
		  var quantity = $("#row_"+rowCount+"_col_5" ).val();
		  
		  if(quantity>0){
			  var weightDiff = $("#row_"+rowCount+"_col_7" ).val();
			  if(weightDiff=''){
				  $("#row_"+rowCount+"_col_7" ).val(0);
			  }
			  
			//setting weight value based on quantity and itemNoOfKgsMap
			  $("#row_"+rowCount+"_col_6" ).val(quantity*itemNoOfKgsMap.get(itemName));
			
			//setting price per value
			  $("#row_"+rowCount+"_col_8" ).val(itemPricePerMap.get(itemName));
			
			  //amount calculation	
			  if(price>0){
				  var weightPlusWeightDiff = Number($("#row_"+rowCount+"_col_6" ).val()) + Number($("#row_"+rowCount+"_col_7" ).val());
				  
				  var weightPlusWeightDiffMultiplyPrice = weightPlusWeightDiff * Number($("#row_"+rowCount+"_col_9" ).val());
				  
				  var amount = weightPlusWeightDiffMultiplyPrice/$("#row_"+rowCount+"_col_8" ).val();
				  //alert(amount);
				  $("#row_"+rowCount+"_col_10" ).val(amount);
				  
				  calculateTotalAmountForTrans();
				  
			  }else{
				  //alert('Please enter Correct value for Price .. its a mandatory field for Amount Calculation');
			  }	
			  
				//setting total quantity
				calculateTotalQuantity();
				
				//setting total weight
				calculateTotalWeight();
				
				//setting total weight difference
				calculateTotalWeightDiff();
				
				//setting total coolie amount
				//calculateTotalCoolieAmt();
			  
		  }else{
			  $("#row_"+rowCount+"_col_5" ).val(0);
			  $("#row_"+rowCount+"_col_6" ).val(0);
			  $("#row_"+rowCount+"_col_7" ).val(0);
			  $("#row_"+rowCount+"_col_8" ).val(0);
			  $("#row_"+rowCount+"_col_9" ).val(0);
			  $("#row_"+rowCount+"_col_10" ).val(0);
			 // alert('Please enter Quantity .. its a mandatory field for Amount Calculation');
		  }
	  }else{
		  $("#row_"+rowCount+"_col_5" ).val(0);
		  $("#row_"+rowCount+"_col_6" ).val(0);
		  $("#row_"+rowCount+"_col_7" ).val(0);
		  $("#row_"+rowCount+"_col_8" ).val(0);
		  $("#row_"+rowCount+"_col_9" ).val(0);
		  $("#row_"+rowCount+"_col_10" ).val(0);
		  //alert('Please enter ItemName StockPoint and Batch First');
	  }
  }	
  
  
  var calculateTotalAmountForTrans = function(){
	  var totalAmount = Number(0);
	  for (var k = 0; k < totalRowsInitallyDesigned; k++) {
		  if(jQuery.inArray('row_'+Number(k),globalRemovedRowIds)==-1){
			  console.log('k..calculateTotalAmount......'+$("#row_"+k+"_col_10" ).val());
			  totalAmount = Number(totalAmount) + Number($("#row_"+k+"_col_10" ).val());
		  }
	  }
	  console.log('totalAmount..'+totalAmount);
	  totalAmount = totalAmount.toFixed(2)
	  $("#unRoundedAmount").val(totalAmount);
	  $("#totalAmt").val(Math.round(totalAmount));
	  var totalPaid = $("#totalPaidAmt").val();
	  var totalBal = Number($("#totalAmt").val())-Number(totalPaid);
	  $("#totalBalanceAmt").val(Math.round(totalBal));
  }
  
  var calcTotalBal = function(){
	  
	  var totalPaid = $("#totalPaidAmt").val();
	  if(totalPaid>=0){
		  var totalBal = Number($("#totalAmt").val())-Number(totalPaid);
		  $("#totalBalanceAmt").val(Math.round(totalBal));
	  }else{
		  alert('total paid cannot be negative');
		  $("#totalPaidAmt").val(0);
	  }
  }
  
  
  var calculateTotalQuantity = function(){
	  console.log('totalRowsInitallyDesigned..'+totalRowsInitallyDesigned);
	  console.log('globalRemovedRowIds..'+globalRemovedRowIds);
	  console.log('$("#row_0_col_5" ).val()..'+$("#row_0_col_5" ).val());
	  var totalQuantity = Number(0);
	  for (var k = 0; k < totalRowsInitallyDesigned; k++) {
		  if(jQuery.inArray('row_'+Number(k),globalRemovedRowIds)==-1){
			  console.log('k..calculateTotalQuantity......'+$("#row_"+k+"_col_5" ).val());
			  totalQuantity = Number(totalQuantity) + Number($("#row_"+k+"_col_5" ).val());
		  }
	  }
	  console.log('totalQuantity..'+totalQuantity);
	  $("#totalQuantity").val(totalQuantity);
  }
  
  var calculateTotalWeight = function(){
	  console.log('totalRowsInitallyDesigned.....'+totalRowsInitallyDesigned);
	  console.log('globalRemovedRowIds..'+globalRemovedRowIds);
	  console.log('$("#row_0_col_6" ).val()..'+$("#row_0_col_6" ).val());
	  var totalWeight = Number(0);
	  for (var k = 0; k < totalRowsInitallyDesigned; k++) {
		  if(jQuery.inArray('row_'+Number(k),globalRemovedRowIds)==-1){
			  console.log('k...calculateTotalWeight.......'+$("#row_"+k+"_col_6" ).val());
			  totalWeight = Number(totalWeight) + Number($("#row_"+k+"_col_6" ).val());
		  }
	  }
	  console.log('totalWeight..'+totalWeight);
	  $("#totalWeight").val(totalWeight);
  }
  
  var calculateTotalWeightDiff = function(){
	  console.log('totalRowsInitallyDesigned..'+totalRowsInitallyDesigned);
	  console.log('globalRemovedRowIds..'+globalRemovedRowIds);
	  console.log('$("#row_0_col_7" ).val()..'+$("#row_0_col_7" ).val());
	  var totalWeightDiff = Number(0);
	  for (var k = 0; k < totalRowsInitallyDesigned; k++) {
		  if(jQuery.inArray('row_'+Number(k),globalRemovedRowIds)==-1){
			  console.log('k...calculateTotalWeightDiff.......'+$("#row_"+k+"_col_7" ).val());
			  totalWeightDiff = Number(totalWeightDiff) + Number($("#row_"+k+"_col_7" ).val());
		  }
	  }
	  console.log('totalWeightDiff..'+totalWeightDiff);
	  $("#totalWeightDiff").val(totalWeightDiff);
  }
  
    
  
  
  var determineColumnType = function(rowcount,columnCount){
		if(columnCount==1){
			var textbox=$("<input name='itemType' type='text' id='row_"+rowcount+"_col_"+columnCount+"'/>");
			return textbox;
		}else if(columnCount==2){
			return $("<input  name='itemName' type='text' id='row_"+rowcount+"_col_"+columnCount+"' />");
		}else if(columnCount==3){
			return $("<input  name='stockPointName' type='text' id='row_"+rowcount+"_col_"+columnCount+"'/>");	
		}else if(columnCount==4){
			return $("<input  name='batchName' type='text' id='row_"+rowcount+"_col_"+columnCount+"' onkeyup='getBatchId("+rowcount+");'/>");
		}else if(columnCount==5){
			return $("<input class='decimalClass' value='0' name='quantityNumber' type='text' id='row_"+rowcount+"_col_"+columnCount+"' onchange='calculateRequiredFields("+rowcount+");'/>");
		}else if(columnCount==6){
			return $("<input class='decimalClass' value='0' name='weight' readonly type='text' id='row_"+rowcount+"_col_"+columnCount+"'/>");
		}else if(columnCount==7){
			return $("<input class='decimalClass'  value='0' name='weightDifference' type='text' id='row_"+rowcount+"_col_"+columnCount+"' onchange='calculateRequiredFields("+rowcount+");'/>");
		}else if(columnCount==8){
			return $("<input class='decimalClass' value='0' name='pricePer' readonly type='text' id='row_"+rowcount+"_col_"+columnCount+"'/>");
		}else if(columnCount==9){
			return $("<input class='decimalClass' value='0' name='price' type='text' id='row_"+rowcount+"_col_"+columnCount+"' onchange='calculateRequiredFields("+rowcount+");'/>");
		}else if(columnCount==10){
			return $("<input class='decimalClass' value='0' name='rowAmount' readonly type='text' id='row_"+rowcount+"_col_"+columnCount+"'/>");
		}else if(columnCount==11){
			return $("<a class='rowRemoveClass' title='Delete Row' onClick='removeRow("+rowcount+")' href='#'>X</a>");
		}
	};
	
	
	
	var saveSaleTransaction = function(){
		var itemTransactionTOs = [];
		var currentRowCount =  $('#saleTransTable >tbody >tr').length;
		
		
		var partyValue = $("#partyName").val();
		
		if(partyValue===''){
			alert('Please enter a Party Name for Sale Transaction');
			return false;
		}
		
		for(var i=0;i<currentRowCount;i++)
		{
			if(jQuery.inArray(Number(i),globalRemovedRowIds)==-1)
			{
				var itemTransactionTO1={"bookID":finBookId,
										"itemID":itemMap.get($("#row_"+i+"_col_2").val()),
										"itemName":$("#row_"+i+"_col_2").val(),
										"stockPointId":stockPointMap.get($("#row_"+i+"_col_3").val()),
										"stockPointName":$("#row_"+i+"_col_3").val(),
										"itemBatchID":itemBatchMap.get($("#row_"+i+"_col_4").val()),
										"itemBatchName":$("#row_"+i+"_col_4").val(),
										"quantity":$("#row_"+i+"_col_5").val(),
										"weight":$("#row_"+i+"_col_6").val(),
										"weightDifference":$("#row_"+i+"_col_7").val(),
										"pricePer":$("#row_"+i+"_col_8").val(),
										"price1":$("#row_"+i+"_col_9").val(),
										"amount1":$("#row_"+i+"_col_10").val(),
										"firmID":firmMap.get("DVR"),
										"firmName":"DVR",
										}	

				itemTransactionTOs.push(itemTransactionTO1);
			}
		}		
		
		var transactionTO = {"bookID":finBookId,
				 "transactionType":"SALE",
				 "transactionDate":$("#datepicker").val(),
				 "paymentMode":$("#paymentMode").val(),
				 "ledgerID":partyIDMap.get($("#partyName").val()),
				 "ledgerName":$("#partyName").val(),
				 "slipNo":$("#slipNo").val(),
				 "coolieAmount":$("#totalCoolieAmt").val(),
				 "gunnyBagAmount":$("#gunnyBagAmt").val(),
				 "totalAmount":$("#totalAmt").val(),
				 "totalPaid":$("#totalPaidAmt").val(),
				 "narration":$("#narration").val(),				 
				 "itemTransactionTOs":itemTransactionTOs}
		
		
		if(itemTransactionTOs.length>0){		
			var jqxhr = $.ajax({
				 	url: 'saveSaleTransaction',
				 	type:'post',
				 	contentType: 'application/json',
				 	data: JSON.stringify(transactionTO), 
				 	success: function (data){				 		
				 		if(data==="saleOrderTxnSuccess"){
				 			alert("Successfully Saved");
				 			//location.reload();
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
			                 //alert('Uncaught Error.\n' + jqXHR.responseText);
			            	 alert('Exception Occured at Server Side..Please contact Server Administrator');
			             }
			         }
				});
		
			}
		
	}
	
	
	var goHome = function(){
		var baseUrl = window.location.origin;
		window.location.replace(baseUrl+"/merchantdb/home");
	}
	
</script>
		
		
		
  </head>
  <body>
	<div class="body">
			<h4 class="rightHeader">
				Sale Order
			</h4>
				<table class="headerTable">
					<thead>
						<tr>
							<th>Sale Date</th>
							<th>Stock Update</th>
							<th>Payment Mode</th>
							<th>Slip #</th>
							<th># of Items</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" title="Please Select Date from Calendar" name="saleDate" id="datepicker"></td>
							<td><select id="stockUpdate"><option>Yes</option><option>No</option></select></td>
							<td><select style="width:90%" id="paymentMode"><option>CREDIT</option><option>CASH</option><option>PARTIAL</option></select></td>
							<td><input type="text" id="slipNo" name="slipNo"></td>
							<td><input type="text" name="noOfItems" id="noOfItems" class="numberClass" onchange="populateSaleRows(this.value);"></td>
						</tr>
					</tbody>
				</table>
			
			<div id="itemsTableDiv">	
				<p class="left-indent">
					Party Name:<input type="text" title="Please Enter first few characters of Party Name and select from Autocomplete" style="width:50%" id="partyName" name="partyName">
				</p>
				<table class="headerTable itemstable" id="saleTransTable">
					<thead>
						<tr>
							<th>S.No</th>
							<th>Item type</th>
							<th>Item Name</th>
							<th>Stock Point</th>
							<th>Batch</th>
							<th>Quantity</th>
							<th>Weight</th>
							<th>Weight Difference</th>
							<th>Price Per</th>
							<th>Price</th>
							<th>Amount</th>
							<th title="Delete Rows">X</th>
						</tr>
					</thead>
					<tbody>
						
					</tbody>
					<tfoot>
						<tr>
							<td colspan="5">Total</td>							
							<td><input class="decimalClass" type="text" readonly="readonly" value="0" id="totalQuantity" name="totalQuantity"></td>
							<td><input class="decimalClass" type="text" readonly="readonly" value="0" id="totalWeight" name="totalWeight"></td>
							<td><input class="decimalClass" type="text" readonly="readonly" value="0" id="totalWeightDiff" name="totalWeightDiff"></td>
							<td colspan="2">Un Rounded Amount</td>
							<td><input class="decimalClass" readonly="readonly" type="text" value="0" id="unRoundedAmount" name="unRoundedAmount"></td>
						</tr>
						<tr>
							<td colspan="5">Coolie</td>	
							<td><input class="decimalClass" type="text" value="0" id="totalCoolieAmt" name="totalCoolieAmt"></td>
							<td colspan="4">Total Amount</td>
							<td><input class="decimalClass" readonly="readonly" type="text" value="0" id="totalAmt" name="totalAmt"></td>
						</tr>
						<tr>
							<td colspan="5">Gunny Bag</td>	
							<td><input class="decimalClass" type="text" value="0" id="gunnyBagAmt" name="gunnyBagAmt"></td>
							<td colspan="4">Total Paid</td>
							<td><input class="decimalClass" type="text" value="0" id="totalPaidAmt" name="totalPaidAmt" onchange="calcTotalBal();"></td>
						</tr>
						<tr>
							<td class="empty" colspan="5"></td>	
							<td class="empty"></td>	
							<td colspan="4">Total Balance</td>
							<td><input class="decimalClass" type="text" value="0" id="totalBalanceAmt" name="totalBalanceAmt"></td>
						</tr>
					</tfoot>
				</table>
				<div class="buttons">
					<p class="firstLineButtons">
						<img src="images/save.jpg" onclick="saveSaleTransaction();">
						<img src="images/clear.jpg" onclick="location.reload();">
						<img src="images/close.jpg" onclick="goHome();">
					</p>					
				</div>
			</div>
		</div>
  </body>
</html>