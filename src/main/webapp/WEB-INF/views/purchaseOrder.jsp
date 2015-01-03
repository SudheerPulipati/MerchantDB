

<head>
  <meta charset="utf-8">
  <title>DKLF</title>
  <jsp:include page="calendarandgridtablecss.jsp"/>
  <script>
  
	var firmNames = [];
	var partyNames =[];
	var stockPointNames =[];
	var itemNames =[];
	var itemBatchNames =[];
	var globalRemovedRowIds=[];
	  
	
	var stockPointMap = new Map();
	
	var itemMap = new Map();
	var itemBatchMap = new Map();
	var itemPricePerMap = new Map();
    var itemNoOfKgsMap = new Map();
    var partyIDMap = new Map();
    
    var firmMap = new Map();
    var companyMap = new Map();
    
	var globalTotalAmountTillNow =Number(0);
	var totalRowCount =0;
   
  $(function() {
	  
	  $("#submitButtonDiv").hide();
	  
	  $( "#datepicker" ).datepicker({
		    maxDate : 0,
		    beforeShow: function(){    
		           $(".ui-datepicker").css('font-size', 12) 
		    }
		});
	  
	  $(document).on('keypress', ".numberClass",function (e) {  
		  if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
		        //display error message
		        alert("Digits Only");
		        return false;
		    }
		  
		});
	  
	  $("#noOfItemsId").keypress(function (e) {
		     //if the letter is not digit then display error and don't type anything
		     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
		    	 alert("Digits Only");
		         return false;
		    }
		   });
	  
	  $(document).on('keypress', ".decimalClass",function (evt) {  
			 var charCode = (evt.which) ? evt.which : event.keyCode
		        if (charCode != 45 && (charCode != 46 || $(this).val().indexOf('.') != -1) && 
		                (charCode < 48 || charCode > 57)){
		        	return false;
		   		 } 
			});
	  
	  
	  $(document).on('click',".rowRemoveClass",function(){
		    var index = Number($(this).attr('id'));
		  	globalRemovedRowIds.push(index);
			$(this).parent().parent().remove();
			if(globalRemovedRowIds.length==totalRowCount){
				$("#noOfItemsId").val(0);
				$("#transactionTable").remove();
				$("#submitButtonDiv").hide();
			}
		});
	  
	 
      $.ajax({
        url: 'getRequestDataForPurchaseOrder',
        success: function(data) {
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
        				stockPointMap.set(objVal.stockPointName, objVal.stockPointID);
        			});
        		}
        		if(key==='firmList'){
        			$.each(val, function(objKey, objVal) {
        				firmNames.push(objVal.firmName);
        				firmMap.set(objVal.firmName,objVal.firmID);
        				companyMap.set(objVal.firmName,objVal.companyID);
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
        	
        	/*  alert(firmNames);
             alert(partyNames);
             alert(stockPointNames);
             alert(itemNames); 
        	 alert(itemMap.get("10 KG Karipuli"));
        	 alert(itemPricePerMap.get("10 KG Karipuli"));
        	 alert(itemNoOfKgsMap.get("10 KG Karipuli")); */
        	//alert(partyIDMap.get("BASAVAPPA"));
        }
      });
      
      $("#partyName" ).autocomplete({
	      source: partyNames
	    });
 
  });
  
  var getBatchId = function(rowCount) {
	    var text ="itemId="+itemMap.get($("#row_"+rowCount+"_col_0").val())+"&stockPointId="+stockPointMap.get($("#row_"+rowCount+"_col_1").val());
	    console.log(text);
	    $.ajax({
	        url: 'getAllItemBatch',
	        data:text,
	        success: function(data){
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
	        	 $("#row_"+rowCount+"_col_2").autocomplete({
	        	      source: itemBatchNames
	        	    });
	        	
	        }});
	};
	
	
	
	var enableAutocompleteForDynamicFields = function(rows){
		for(var i=0;i<rows;i++){
			//item name column
			  $("#row_"+i+"_col_0" ).autocomplete({
			      source: itemNames
			  });
			//stock point name column
			  $("#row_"+i+"_col_1" ).autocomplete({
			      source: stockPointNames
			  });
			//firm name column
			  $("#row_"+i+"_col_12" ).autocomplete({
			      source: firmNames
			  });
		}
	};
	
	
	function createTransactionTable(){
		
		$("#transactionTable").remove();
		$("#coolieAmountId").val(0);
		$("#transportExpenseId").val(0);
		$("#totalAmountId").val(0);
			
		mytable = $('<table style="width:72%;" class="gridtable"></table>').attr({ id: "transactionTable"});
		var rows = new Number($("#noOfItemsId").val());
		var cols = new Number(14);
		if(rows==0){
			$("#transactionTable").remove();
			$("#submitButtonDiv").hide();
			return false;
		}
		
		var tableHeader = $('<thead class="gridtable th"><tr></tr></thead>');
		tableHeader.append($('<th style="width:1%"></th>').text("S.No"));
		tableHeader.append($('<th style="width:20%"></th>').text("Item Name"));
		tableHeader.append($('<th style="width:20%"></th>').text("Stock Point"));
		tableHeader.append($('<th style="width:20%"></th>').text("Batch"));
		tableHeader.append($('<th style="width:1%"></th>').text("Quantity"));
		tableHeader.append($('<th style="width:1%"></th>').text("Weight"));
		tableHeader.append($('<th style="width:1%"></th>').text("Weight Diff"));
		tableHeader.append($('<th style="width:1%"></th>').text("Price Per"));
		tableHeader.append($('<th style="width:1%"></th>').text("Bill Price"));
		tableHeader.append($('<th style="width:1%"></th>').text("Unbilled Price"));
		tableHeader.append($('<th style="width:1%"></th>').text("Bill Amount"));
		tableHeader.append($('<th style="width:1%"></th>').text("Unbilled Amount"));
		tableHeader.append($('<th style="width:1%"></th>').text("Total Purchase Amount"));
		tableHeader.append($('<th style="width:1%"></th>').text("Firm"));
		tableHeader.append($('<th style="width:1%"></th>').text("Remove Row"));
		
		tableHeader.appendTo(mytable);	
		
		for (var i = 0; i < rows; i++) {
			var row = $('<tr></tr>').appendTo(mytable);
			$('<td>'+Number(i+1)+'</td>').appendTo(row);
			for (var j = 0; j < cols; j++) {
				var textbox = determineColumnType(i,j);
				$('<td style="text-align:center"></td>').append(textbox).appendTo(row); 
			}
		}
		//console.log("TTTTT:"+mytable.html());
		mytable.appendTo("#transactionTableDiv");	
		
		enableAutocompleteForDynamicFields(rows);
		
		totalRowCount=rows;		
		
		$("#submitButtonDiv").show();
		
	};

	var determineColumnType = function(rowcount,columnCount){
		if(columnCount==0){
			var textbox=$("<input name='itemName' type='text' id='row_"+rowcount+"_col_"+columnCount+"'/>");
			return textbox;
		}else if(columnCount==1){
			return $("<input  name='stockPointName' type='text' id='row_"+rowcount+"_col_"+columnCount+"' />");
		}else if(columnCount==2){
			return $("<input  name='batchName' type='text' id='row_"+rowcount+"_col_"+columnCount+"' onkeyup='getBatchId("+rowcount+");'/>");
		}else if(columnCount==3){
			return $("<input class='decimalClass' name='quantitynumber' type='text' id='row_"+rowcount+"_col_"+columnCount+"' value='0' onchange='doCalculations("+rowcount+");'/>");
		}else if(columnCount==4){
			return $("<input class='decimalClass' name='weight' type='text' id='row_"+rowcount+"_col_"+columnCount+"' readonly='readonly' value='0' onchange='doCalculations("+rowcount+");'/>");
		}else if(columnCount==5){
			return $("<input class='decimalClass' name='weightDifference' type='text' id='row_"+rowcount+"_col_"+columnCount+"' value='0' onchange='doCalculations("+rowcount+");'/>");
		}else if(columnCount==6){
			return $("<input class='decimalClass' name='pricePer' type='text' id='row_"+rowcount+"_col_"+columnCount+"' value='0' onchange='doCalculations("+rowcount+");'/>");
		}else if(columnCount==7){
			return $("<input class='decimalClass' name='billPrice' type='text' id='row_"+rowcount+"_col_"+columnCount+"' value='0' onchange='doCalculations("+rowcount+");'/>");
		}else if(columnCount==8){
			return $("<input class='decimalClass' name='unbilledPrice' type='text' id='row_"+rowcount+"_col_"+columnCount+"' value='0' onchange='doCalculations("+rowcount+");'/>");
		}else if(columnCount==9){
			return $("<input class='decimalClass' name='billAmount' type='text' id='row_"+rowcount+"_col_"+columnCount+"' readonly='readonly' value='0' onchange='doCalculations("+rowcount+");'/>");
		}else if(columnCount==10){
			return $("<input class='decimalClass' name='unbilledAmount' type='text' id='row_"+rowcount+"_col_"+columnCount+"' readonly='readonly' value='0' onchange='doCalculations("+rowcount+");'/>");
		}else if(columnCount==11){
			return $("<input class='decimalClass' name='totalPurchaseAmount' type='text' id='row_"+rowcount+"_col_"+columnCount+"' readonly='readonly' value='0' onchange='doCalculations("+rowcount+");'/>");
		}else if(columnCount==12){
			return $("<input name='firms' type='text' id='row_"+rowcount+"_col_"+columnCount+"' value='AN'/>");
		}else if(columnCount==13){
			return $("<a class='rowRemoveClass' href='#' id='"+rowcount+"'>X</a>");
		}
	};
	
	
var doCalculations = function(rowCount) {
		
	totalAmountTillNow = Number(0);
	
	
		for(var i=0;i<=rowCount;i++){	
			
			if(jQuery.inArray(Number(i),globalRemovedRowIds)==-1){
			
			if(stringFieldValidation("#row_"+i+"_col_"+0,(i+1),0,'Item Name')==false){
				$("#row_"+i+"_col_3").val(0);
				$("#row_"+i+"_col_5").val(0);
				$("#row_"+i+"_col_6").val(0);
				$("#row_"+i+"_col_7").val(0);
				$("#row_"+i+"_col_8").val(0);
				break;
			}
			if(stringFieldValidation("#row_"+i+"_col_"+1,(i+1),1,'Stock Point')==false){
				$("#row_"+i+"_col_3").val(0);
				$("#row_"+i+"_col_5").val(0);
				$("#row_"+i+"_col_6").val(0);
				$("#row_"+i+"_col_7").val(0);
				$("#row_"+i+"_col_8").val(0);
				break;
			}
			if(stringFieldValidation("#row_"+i+"_col_"+2,(i+1),2,'Batch')==false){
				$("#row_"+i+"_col_3").val(0);
				$("#row_"+i+"_col_5").val(0);
				$("#row_"+i+"_col_6").val(0);
				$("#row_"+i+"_col_7").val(0);
				$("#row_"+i+"_col_8").val(0);
				break;
			}
			
			//_col_3 is quantity of dynamic columns
			quantity=$("#row_"+i+"_col_3").val();
			
			console.log(quantity);
			//_col_0 is itemid of dynamic item name column
			noOfKgs=itemNoOfKgsMap.get($("#row_"+i+"_col_0").val());
			console.log($("#row_"+i+"_col_0").val()+'====noOfKgs=='+noOfKgs);
			//weight
			$("#row_"+i+"_col_4").val(Number(noOfKgs)*Number(quantity));
			console.log('weight...'+$("#row_"+i+"_col_4").val());
			
			itemMasterPricePer = itemPricePerMap.get($("#row_"+i+"_col_0").val());
			console.log('itemMasterPricePer...'+itemMasterPricePer);
			//pricePerId
			$("#row_"+i+"_col_6").val(itemMasterPricePer);
			console.log('pricePerId...'+$("#row_"+i+"_col_6").val());
			
			//billAmount=(weight*billPrice)/pricePer
			$("#row_"+i+"_col_9").val((Number($("#row_"+i+"_col_4").val())*Number($("#row_"+i+"_col_7").val()))/Number($("#row_"+i+"_col_6").val()));
			console.log('billAmount...'+$("#row_"+i+"_col_9").val());
			
			//unbilledAmount=(weight*unbilledPrice)/pricePer
			$("#row_"+i+"_col_10").val((Number($("#row_"+i+"_col_4").val())*Number($("#row_"+i+"_col_8").val()))/Number($("#row_"+i+"_col_6").val()));
			console.log('unbilledAmount...'+$("#row_"+i+"_col_10").val());
			
			//totalPurchaseAmount=(billAmount+unbilledAmount)
			$("#row_"+i+"_col_11").val(Number($("#row_"+i+"_col_9").val())+Number($("#row_"+i+"_col_10").val()));
			console.log('totalPurchaseAmount...'+$("#row_"+i+"_col_11").val());
			
			totalAmountTillNow  = totalAmountTillNow + Number($("#row_"+i+"_col_11").val());
			
			
			if($("#row_"+i+"_col_9").val()!=0){
				$("#row_"+i+"_col_12").val("");
			}else{
				$("#row_"+i+"_col_12").val("AN");
			}
			
			}
		}
		
		console.log("totalAmountTillNow.........."+totalAmountTillNow);
		$("#totalAmountId").val(totalAmountTillNow);
		globalTotalAmountTillNow = Number(totalAmountTillNow);
		
	};
	

	
	var totalAmountCalculation = function(){
		$("#totalAmountId").val(Number($("#transportExpenseId").val())+Number($("#coolieAmountId").val())+Number(globalTotalAmountTillNow));
	};
	
	var stringFieldValidation = function(objId,rowNumber,columnNumber,fieldName){
		 if($(objId).val()===undefined||$(objId).val()==null||$(objId).val().trim()===''){
			alert('Please Enter Correct Value in '+fieldName+' in row '+rowNumber);
			return false;
		  } 
		 return true;
	};
	
	var numberFieldValidation = function(objId,rowNumber,columnNumber,fieldName,greatherThanZeroFlag){
		if($(objId).val()===undefined||$(objId).val()==null||$(objId).val().trim()===''){
			alert('Please Enter Correct Numeric Value in '+fieldName+' in row '+rowNumber);
			return false;
		}else if(greatherThanZeroFlag=='Y'){
				if($(objId).val()<=0){
					alert('Value in '+fieldName+' in row '+rowNumber+' should be greater than zero');
					return false;
				}
		}
		return true;
	};
	
	
	var validateFields = function(){
		var continueValidatingFields = true;
		
		
		if($("#datepicker").val().trim()===''){
			alert('Purchase Date should not be empty');
			return false;
		}
		if($("#slipNoId").val().trim()===''){
			alert('Slip No should not be empty');
			return false;
		}
		if(partyIDMap.get($("#partyName").val())===undefined||partyIDMap.get($("#partyName").val())==null){
			alert('Invalid Party Name, please type and select from autocomplete list');
			return false;
		}
		
		
		
	   for(var i=0;i<totalRowCount;i++){
		   if(jQuery.inArray(Number(i),globalRemovedRowIds)==-1)
			{

			   if(itemNoOfKgsMap.get($("#row_"+i+"_col_"+0).val())===undefined){
					alert('Invalid Item Name in row'+(i+1)+', please type and select from autocomplete list');
					continueValidatingFields =false;
					break;
				}
			    if(stockPointMap.get($("#row_"+i+"_col_"+1).val())===undefined){
					alert('Invalid Stock Point in row'+(i+1)+', please type and select from autocomplete list');
					continueValidatingFields =false;
					break;
				}
			    if(firmMap.get($("#row_"+i+"_col_"+12).val())===undefined){
					alert('Invalid Firm Name in row'+(i+1)+', please type and select from autocomplete list');
					continueValidatingFields =false;
					break;
				}
		   
		   
		   
		   continueValidatingFields = stringFieldValidation("#row_"+i+"_col_"+0,(i+1),0,'Item Name');
		   if(continueValidatingFields)
		   continueValidatingFields = stringFieldValidation("#row_"+i+"_col_"+1,(i+1),1,'Stock Point');
		   if(continueValidatingFields)
		   continueValidatingFields = stringFieldValidation("#row_"+i+"_col_"+2,(i+1),2,'Batch');
		   if(continueValidatingFields)
		   continueValidatingFields = numberFieldValidation("#row_"+i+"_col_"+3,(i+1),3,'Quantity','Y');
		   if(continueValidatingFields)
		   continueValidatingFields = numberFieldValidation("#row_"+i+"_col_"+4,(i+1),4,'Weight','Y');
		   if(continueValidatingFields)
		   continueValidatingFields = numberFieldValidation("#row_"+i+"_col_"+5,(i+1),5,'Weight Difference','N');
		   if(continueValidatingFields)
		   continueValidatingFields = numberFieldValidation("#row_"+i+"_col_"+6,(i+1),6,'Price Per','Y');
		   if(continueValidatingFields)
		   continueValidatingFields = numberFieldValidation("#row_"+i+"_col_"+7,(i+1),7,'Bill Price','N');
		   if(continueValidatingFields)
		   continueValidatingFields = numberFieldValidation("#row_"+i+"_col_"+8,(i+1),8,'Unbilled Price','N');
		   if(continueValidatingFields)
		   continueValidatingFields = numberFieldValidation("#row_"+i+"_col_"+9,(i+1),9,'Bill Amount','N');
		   if(continueValidatingFields)
		   continueValidatingFields = numberFieldValidation("#row_"+i+"_col_"+10,(i+1),10,'Unbilled Amount','N');
		   if(continueValidatingFields)
		   continueValidatingFields = numberFieldValidation("#row_"+i+"_col_"+11,(i+1),11,'Total Purchase Amount','Y');
		   if(continueValidatingFields)
		   continueValidatingFields = stringFieldValidation("#row_"+i+"_col_"+12,(i+1),12,'Firm');
		   
		   if(!continueValidatingFields)
			break;	   
		  }
	   }
	   return continueValidatingFields;
	}
	
		
	var saveTransaction = function(rowCount){
		var itemTransactionTOs = [];
		
		rowCount =Number(rowCount-1);
		
		if(validateFields())
		{
			
			var newItemBatchIndFlag = function(){
				if(itemBatchMap.get($("#row_"+rowCount+"_col_2").val())===undefined){
					return "Y";
				}else{
					return "N";
				}
			};
			
			
			// find out duplicate quantities for batch name and stop processing until duplicate batches are merged
			var recordSetValues = $('input[name$="batchName"]').map(function (){
		          return this.value;
		    }).get();     
			var recordSetUniqueValues = recordSetValues.filter(function (itm, i, a){
			          return i == a.indexOf(itm);
			      });
			if (recordSetValues.length > recordSetUniqueValues.length)
			{ 
					alert("duplicate batch.. please merge the quantities for same batches");
					return false;
			}
			
			
				
		
				for(var i=0;i<=rowCount;i++)
				{
					if(jQuery.inArray(Number(i),globalRemovedRowIds)==-1)
					{
						
						var itemTransactionTO1={"bookID":'FY2013-14',
										"itemID":itemMap.get($("#row_"+i+"_col_0").val()),
										"itemName":$("#row_"+i+"_col_0").val(),
										"itemBatchID":itemBatchMap.get($("#row_"+i+"_col_2").val()),
										"itemBatchName":$("#row_"+i+"_col_2").val(),
										"weight":$("#row_"+i+"_col_4").val(),
										"weightDifference":$("#row_"+i+"_col_5").val(),
										"pricePer":itemPricePerMap.get($("#row_"+i+"_col_0").val()),
										"price1":$("#row_"+i+"_col_7").val(),
										"price2":$("#row_"+i+"_col_8").val(),
										"amount1":$("#row_"+i+"_col_9").val(),
										"amount2":$("#row_"+i+"_col_10").val(),
										"totalAmount":$("#row_"+i+"_col_11").val(),
										"firmID":firmMap.get($("#row_"+i+"_col_12").val()),
										"firmName":$("#row_"+i+"_col_12").val(),
										"quantity":$("#row_"+i+"_col_3").val(),
										"stockPointId":stockPointMap.get($("#row_"+i+"_col_1").val()),
										"stockPointName":$("#row_"+i+"_col_1").val(),
										"companyId":companyMap.get($("#row_"+i+"_col_12").val()),
										"newItemBatchInd":newItemBatchIndFlag(),
										"anavathFirmId":firmMap.get("AN"),
										"anavathFirmName":"AN"
										}	
			
					itemTransactionTOs.push(itemTransactionTO1);
					
					
					console.log('itemID...'+itemMap.get($("#row_"+i+"_col_0").val()));
					console.log('itemName...'+$("#row_"+i+"_col_0").val());
					console.log('itemBatchID...'+itemBatchMap.get($("#row_"+i+"_col_2").val()));
					console.log('itemBatchName...'+$("#row_"+i+"_col_2").val());
					console.log("weight...#row_"+rowCount+"_col_4"+$("#row_"+i+"_col_4").val());
					}
					
				}
				console.log('itemTransactionTOs..........'+itemTransactionTOs);
		
				var transactionTO = {"bookID":'FY2013-14',
						 "transactionType":"PURCHASE",
						 "transactionDate":$("#datepicker").val(),
						 "paymentMode":$("#paymentModeId").val(),
						 "ledgerID":partyIDMap.get($("#partyName").val()),
						 "ledgerName":$("#partyName").val(),
						 "totalAmount": $("#totalAmountId").val(),
						 "slipNo":$("#slipNoId").val(),
						 "wayBillNo":$("#wayBillNoId").val(),
						 "vehicleNo":$("#vehicleNoId").val(),
						 "itemTransactionTOs":itemTransactionTOs}
		
		if(itemTransactionTOs.length>0){		
			var jqxhr = $.ajax({
				 	url: 'saveTransaction',
				 	type:'post',
				 	contentType: 'application/json',
				 	data: JSON.stringify(transactionTO), 
				 	success: function (data){
				 		if(data==="purchaseOrderTxnSuccess"){
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
		
			}
		}
	};
	
		  
  </script>
</head>











  <div id="purchaseOrderContent">
	<h4 class="rightHeader">
		Purchase Order
	</h4>
	<table id="purchaseOrderTable" class="gridtable" style="width:72%;">
			<tr>
				<th>Purchase Date</th>
				<th>Payment Mode</th>
				<th>Way Bill#</th>
				<th>Vehicle#</th>
				<th>Slip#</th>
				<th>#of Items</th>
			</tr>
		<tbody>
			<tr>
				<td><input type="text" title="Please Select Date from Calendar" name="purchaseDate" id="datepicker"/></td>
				<td><select name="paymentMode" id="paymentModeId">
					 	<option value="credit">Credit</option>
					 	<option value="cash">Cash</option> 
					 </select> 
				</td>
				<td><input title="Please Enter the WayBill No" type="text" name="wayBillNo" id="wayBillNoId"/></td>
				<td><input title="Please Enter the Vehicle No" type="text" name="vehicleNo" id="vehicleNoId"/></td>
				<td><input title="Please Enter the Slip No" type="text" name="slipNo" id="slipNoId"/></td>
				<td><input title="Please Enter the No. of Items to be transacted" type="text" name="noOfItems" id="noOfItemsId" onchange="createTransactionTable();"/></td>
			</tr>
			<tr>
				<td colspan="6"><nobr></nobr></td>
			</tr>
			<tr>
				<th >Party Name</th>
				<td colspan="5"><input id="partyName" title="Please Enter first few characters of Party Name and select from Autocomplete"  type="text" name="partyName"/></td>
			</tr>
		</tbody>
	</table>
	<div id="transactionTableDiv">
	</div>	
	<div id="submitButtonDiv" >
		<table class="gridtable" style="width:72%;">
			<tr>
				<td style="width:52%;border-color:white;"></td>
				<th style="width:10%;border-color:white;" nowrap="nowrap">Transport Expense</th>
				<td style="width:10%;border-color:white;"><input class="decimalClass" type="text" title="Please Enter the Transport Expense" name="transportExpense" id="transportExpenseId" value="0" onchange="totalAmountCalculation();"/></td>
			</tr>
			<tr>
				<td style="width:52%;border-color:white;"></td>
				<th style="width:10%;border-color:white;" nowrap="nowrap">Coolie</th>
				<td style="width:10%;border-color:white;"><input class="decimalClass" type="text" title="Please Enter the Coolie Amount" name="coolieAmount" id="coolieAmountId" value="0" onchange="totalAmountCalculation();"/></td>
			</tr>
			<tr>
				<td style="width:52%;border-color:white;"></td>
				<th style="width:10%;border-color:white;" nowrap="nowrap">Total Amount</th>
				<td style="width:10%;border-color:white;"><input class="decimalClass" type="text" title="Total Sum of all above  shown Amounts " name="totalAmount" id="totalAmountId" value="0" readonly="readonly"/></td>
			</tr>
			<tr>
				<td colspan="3" style="width:10%;border-color:white;">
					<div class="buttons" style="float:right;border-color:green;">
						<p class="firstLineButtons" style="float:right;">
							<img src="images/save.jpg" onclick="saveTransaction(totalRowCount);"/>
							<img src="images/clear.jpg" onclick="createTransactionTable();"/>
							<img src="images/close.jpg" onclick="createTransactionTable();"/>
						</p>					
					</div>
				</td>
			</tr>
		</table>
		
	</div>	
 </div>
