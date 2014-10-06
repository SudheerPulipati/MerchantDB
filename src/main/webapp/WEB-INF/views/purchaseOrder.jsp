<!DOCTYPE html>
<html>
<head>
<script src="WEB-INF/js/jquery.js">
	
</script>
<script>
	$(document)
			.ready(
					function() {
						var cnt = 2;
						$("#addRow")
								.click(
										function() {
											$('#purchaseOrder tr')
													.last()
													.after(
															'<tr><td><input type="text" name="itemType" size="5"></td><td><input type="text" name="itemName" size="5"></td><td><input type="text" name="bond" size="5"></td><td><input type="text" name="stockPoint" size="5"></td><td><input type="text" name="quantity" size="5"></td><td><input type="text" name="weight" size="5"></td><td><input type="text" name="weightDiff" size="5"></td><td><input type="text" name="pricePer" size="5"></td><td><input type="text" name="billPrice" size="5"></td><td><input type="text" name="billAmt" size="5"></td><td><input type="text" name="unBillAmt" size="5"></td><td><input type="text" name="totalAmt" size="5"></td><td><input type="text" name="firm" size="5"></td></tr>');
											cnt++;
										});

						$("#removeRow").click(function() {
							if ($('#purchaseOrder tr').size() > 2) {
								$('#purchaseOrder tr:last-child').remove();
							} else {
								alert('One row should be present in table');
							}
						});

					});
</script>
</head>
<body>
	<div style="height: 100%; width: 100%">
	<label>${success}</label>
		<form action='/merchantdb/savePurchaseOrder' method="POST">
			<div style="height: 90%; width: 100%; overflow-y: scroll">
				<table id="purchaseOrder" border="1">
					<tr>
						<th>Item Type</th>
						<th>Item Name</th>
						<th>Bond</th>
						<th>Stock Point</th>
						<th>Quantity</th>
						<th>Weight</th>
						<th>Weight Difference</th>
						<th>Price per</th>
						<th>Bill Price</th>
						<th>Bill Amount</th>
						<th>Unbilled Amount</th>
						<th>Total Amount</th>
						<th>Firm</th>
					</tr>
					<tr>
						<td><input type="text" name="itemType" size="5"></td>
						<td><input type="text" name="itemName" size="5"></td>
						<td><input type="text" name="bond" size="5"></td>
						<td><input type="text" name="stockPoint" size="5"></td>
						<td><input type="text" name="quantity" size="5"></td>
						<td><input type="text" name="weight" size="5"></td>
						<td><input type="text" name="weightDiff" size="5"></td>
						<td><input type="text" name="pricePer" size="5"></td>
						<td><input type="text" name="billPrice" size="5"></td>
						<td><input type="text" name="billAmt" size="5"></td>
						<td><input type="text" name="unBillAmt" size="5"></td>
						<td><input type="text" name="totalAmt" size="5"></td>
						<td><input type="text" name="firm" size="5"></td>
					</tr>
				</table>
			</div>
			<div style="height: 10%; width: 100%; margin-left: 70%">
				<input type='button' id='addRow' value="Add Row" /> <input
					type='button' id='removeRow' value="Remove Row" /> <input
					type='submit' value="Save" />
			</div>
		</form>
	</div>
</body>
</html>