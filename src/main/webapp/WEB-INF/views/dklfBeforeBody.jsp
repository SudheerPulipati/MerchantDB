<div class="rightPanel">
	<style type="text/css">
/* FOR MODAL*/

/*  */
.rightPanel {
	float: left;
	width: 79.8%;
	border: 1px solid #00365B;
}

.adminMenu {
	border-bottom: 1px solid #00365B;
	width: 100%;
}

.adminMenuSubTable td {
	font-size: 12px;
	padding: 0px;
}
.dataTableDiv {
	width: 42%;
 	padding-top: 3%; 
 	margin: auto; 
	height: 150px;
	padding-bottom:5%;
}
.adminMenuTitle {
	/* 	font-weight: lighter; */
	/*     font-size: 22px; */
	font-family: "Arial Black", Gadget, sans-serif;
	padding-left: 10px;
	padding-top: 10px;
	color: #202020
}

.ui-widget {
	font-family: "Arial Black", Gadget, sans-serif;
	font-size: 12px;
}

form {
	margin-left: 33.33%;
	margin-bottom: 5%;
}

thead {
	background-color: #00365B;
	color: white;
	font-family: "Arial Black", Gadget, sans-serif;
	font-size: small;
}

.cell {
	width: 135px;
	float: left;
	font-size: 12px;
	line-height: 25px;
	text-align: center;
}

.cell a.lineBorder {
	background: url("images/menuBg.jpg") no-repeat scroll -8px 30px #f2f2f2;
}
</style>
	<div class="adminMenu">
		<!-- 		<table cellspacing="6" class="adminMenuTable"> -->
		<!-- 			<tr> -->
		<!-- 				<td>Ledger Group</td> -->
		<!-- 				<td>City Group</td> -->
		<!-- 				<td>Party</td> -->
		<!-- 				<td>Item Unit</td> -->
		<!-- 				<td>Stock Point</td> -->
		<!-- 				<td>Item</td> -->
		<!-- 				<td>Remarks</td> -->
		<!-- 			</tr> -->
		<!-- 			<tr> -->
		<!-- 				<td> -->
		<!-- 					<table class="adminMenuSubTable"> -->
		<!-- 						<tr> -->
		<!-- 							<td><a href="createLedgerGroup">Create</a></td> -->
		<!-- 						</tr> -->
		<!-- 						<tr> -->
		<!-- 							<td><hr -->
		<!-- 									style="border: none; height: 1px; background-color: #505050" /></td> -->
		<!-- 						</tr> -->
		<!-- 						<tr> -->
		<!-- 							<td><a href="viewLedgerGroup">Edit/View</a></td> -->
		<!-- 						</tr> -->
		<!-- 					</table> -->
		<!-- 				</td> -->
		<!-- 				<td> -->
		<!-- 					<table class="adminMenuSubTable"> -->
		<!-- 						<tr> -->
		<!-- 							<td><a href="createCityGroup">Create</a></td> -->
		<!-- 						</tr> -->
		<!-- 						<tr> -->
		<!-- 							<td><hr -->
		<!-- 									style="border: none; height: 1px; background-color: #505050" /></td> -->
		<!-- 						</tr> -->
		<!-- 						<tr> -->
		<!-- 							<td><a href="viewCityGroup">Edit/View</a></td> -->
		<!-- 						</tr> -->
		<!-- 					</table> -->
		<!-- 				</td> -->
		<!-- 				<td> -->
		<!-- 					<table class="adminMenuSubTable"> -->
		<!-- 						<tr> -->
		<!-- 							<td><a href="createParty">Create</a></td> -->
		<!-- 						</tr> -->
		<!-- 						<tr> -->
		<!-- 							<td><hr -->
		<!-- 									style="border: none; height: 1px; background-color: #505050" /></td> -->
		<!-- 						</tr> -->
		<!-- 						<tr> -->
		<!-- 							<td><a href="viewParty">Edit/View</a></td> -->
		<!-- 						</tr> -->
		<!-- 					</table> -->
		<!-- 				</td> -->
		<!-- 				<td> -->
		<!-- 					<table class="adminMenuSubTable"> -->
		<!-- 						<tr> -->
		<!-- 							<td><a href="createItemUnit">Create</a></td> -->
		<!-- 						</tr> -->
		<!-- 						<tr> -->
		<!-- 							<td><hr -->
		<!-- 									style="border: none; height: 1px; background-color: #505050" /></td> -->
		<!-- 						</tr> -->
		<!-- 						<tr> -->
		<!-- 							<td><a href="viewItemUnit">Edit/View</a></td> -->
		<!-- 						</tr> -->
		<!-- 					</table> -->
		<!-- 				</td> -->
		<!-- 				<td> -->
		<!-- 					<table class="adminMenuSubTable"> -->
		<!-- 						<tr> -->
		<!-- 							<td><a href="createStockPoint">Create</a></td> -->
		<!-- 						</tr> -->
		<!-- 						<tr> -->
		<!-- 							<td><hr -->
		<!-- 									style="border: none; height: 1px; background-color: #505050" /></td> -->
		<!-- 						</tr> -->
		<!-- 						<tr> -->
		<!-- 							<td><a href="viewStockPoint">Edit/View</a></td> -->
		<!-- 						</tr> -->
		<!-- 					</table> -->
		<!-- 				</td> -->
		<!-- 				<td> -->
		<!-- 					<table class="adminMenuSubTable"> -->
		<!-- 						<tr> -->
		<!-- 							<td><a href="createItem">Create</a></td> -->
		<!-- 						</tr> -->
		<!-- 						<tr> -->
		<!-- 							<td><hr -->
		<!-- 									style="border: none; height: 1px; background-color: #505050" /></td> -->
		<!-- 						</tr> -->
		<!-- 						<tr> -->
		<!-- 							<td><a href="viewItem">Edit/View</a></td> -->
		<!-- 						</tr> -->
		<!-- 					</table> -->
		<!-- 				</td> -->
		<!-- 				<td> -->
		<!-- 					<table class="adminMenuSubTable"> -->
		<!-- 						<tr> -->
		<!-- 							<td><a href="createRemark">Create</a></td> -->
		<!-- 						</tr> -->
		<!-- 						<tr> -->
		<!-- 							<td><hr -->
		<!-- 									style="border: none; height: 1px; background-color: #505050" /></td> -->
		<!-- 						</tr> -->
		<!-- 						<tr> -->
		<!-- 							<td><a href="viewRemarks">Edit/View</a></td> -->
		<!-- 						</tr> -->
		<!-- 					</table> -->
		<!-- 				</td> -->
		<!-- 			</tr> -->
		<!-- 		</table> -->
		<table style="padding: 0px; margin: 0px">
			<tr>
				<td>
					<div class="cell">
						<p class="background boldfont">Ledger Group</p>
						<div class="background">
							<a class="lineBorder" href="createLedgerGroup">Create</a> <a
								href="viewLedgerGroup">Edit/View</a>
						</div>
					</div>

				</td>
				<td>
					<div class="cell">
						<p class="background boldfont">City Group</p>
						<div class="background">
							<a class="lineBorder" href="createCityGroup">Create</a> <a
								href="viewCityGroup">Edit/View</a>
						</div>
					</div>

				</td>
				<td>
					<div class="cell">
						<p class="background boldfont">Party</p>
						<div class="background">
							<a class="lineBorder" href="createParty">Create</a> <a
								href="viewParty">Edit/View</a>
						</div>
					</div>

				</td>
				<td>
					<div class="cell">
						<p class="background boldfont">Item Unit</p>
						<div class="background">
							<a class="lineBorder" href="createItemUnit">Create</a> <a
								href="viewItemUnit">Edit/View</a>
						</div>
					</div>

				</td>
				<td>
					<div class="cell">
						<p class="background boldfont">Stock Point</p>
						<div class="background">
							<a class="lineBorder" href="createStockPoint">Create</a> <a
								href="viewStockPoint">Edit/View</a>
						</div>
					</div>

				</td>
				<td>
					<div class="cell">
						<p class="background boldfont">Item</p>
						<div class="background">
							<a class="lineBorder" href="createItem">Create</a> <a
								href="viewItem">Edit/View</a>
						</div>
					</div>

				</td>
				<td>
					<div class="cell">
						<p class="background boldfont">Remarks</p>
						<div class="background">
							<a class="lineBorder" href="createRemark">Create</a> <a
								href="viewRemarks">Edit/View</a>
						</div>
					</div>

				</td>
			</tr>
		</table>
	</div>
	<!-- <div class="rightContent subMenu"> -->
	<!-- 			<div class="cell"> -->
	<!-- 				<p class="background boldfont">Ledger Group</p> -->
	<!-- 				<div class="background"> -->
	<!-- 					<a class="lineBorder currentlink" href="createLedgerGroup">Create</a> <a href="viewLedgerGroup" -->
	<!-- 						class="companyEdit">Edit/View</a> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 			<div class="cell"> -->
	<!-- 				<p class="background boldfont">City Group</p> -->
	<!-- 				<div class="background"> -->
	<!-- 					<a class="lineBorder" href="createCityGroup">Create</a> <a href="viewCityGroup" -->
	<!-- 						class="companyEdit">Edit/View</a> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 			<div class="cell"> -->
	<!-- 				<p class="background boldfont">Party</p> -->
	<!-- 				<div class="background"> -->
	<!-- 					<a class="lineBorder" href="createParty">Create</a> <a href="viewParty" -->
	<!-- 						class="companyEdit">Edit/View</a> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 			<div class="cell"> -->
	<!-- 				<p class="background boldfont">Item Unit</p> -->
	<!-- 				<div class="background"> -->
	<!-- 					<a class="lineBorder" href="createItemUnit">Create</a> <a href="viewItemUnit" -->
	<!-- 						class="companyEdit">Edit/View</a> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 			<div class="cell"> -->
	<!-- 				<p class="background boldfont">Stock Point</p> -->
	<!-- 				<div class="background"> -->
	<!-- 					<a class="lineBorder" href="createStockPoint">Create</a> <a href="viewStockPoint" -->
	<!-- 						class="companyEdit">Edit/View</a> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 			<div class="cell"> -->
	<!-- 				<p class="background boldfont">Item</p> -->
	<!-- 				<div class="background"> -->
	<!-- 					<a class="lineBorder" href="createItem">Create</a> <a href="viewItem" -->
	<!-- 						class="companyEdit">Edit/View</a> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 			<div class="cell"> -->
	<!-- 				<p class="background boldfont">Standard Remarks</p> -->
	<!-- 				<div class="background"> -->
	<!-- 					<a class="lineBorder" href="">Create</a> <a href="#" -->
	<!-- 						class="companyEdit">Edit/View</a> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 	</div>	 -->