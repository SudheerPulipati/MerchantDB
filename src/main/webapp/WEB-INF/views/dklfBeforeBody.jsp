<div class="rightPanel">
	<style type="text/css">
/* FOR MODAL*/
#overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: #000;
	opacity: 0.5;
	filter: alpha(opacity = 50);
}

#modal {
	position: absolute;
	background: url(tint20.png) 0 0 repeat;
	background: rgba(0, 0, 0, 0.2);
	border-radius: 14px;
	padding: 8px;
}

#content {
	border-radius: 8px;
	background: #fff;
	padding: 20px;
}

#close {
	position: absolute;
	background: url(close.png) 0 0 no-repeat;
	width: 24px;
	height: 27px;
	display: block;
	text-indent: -9999px;
	top: -7px;
	right: -7px;
}

/*  */
.rightPanel {
	float: left;
	width: 75%;
	border: 1px solid #00365B;
}

.adminMenu {
	border-bottom: 1px solid #00365B;
	width: 100%;
	height: 120px;
}

.dataTableDiv {
	width: 42%;
 	padding-top: 3%; 
 	margin: auto; 
	height: 150px;
	padding-bottom:5%;
}

.adminMenuTable td {
	background-color: #E0E0E0;
	padding: 7px;
	text-align: center;
	width: 130px;
	font-family: "Arial", Gadget, sans-serif
}

.adminMenuSubTable td {
	font-size: 12px;
	padding: 0px;
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
	margin-bottom:5%;
}

thead {
	background-color: #00365B;
	color: white;
	font-family: "Arial Black", Gadget, sans-serif;
	font-size: small;
}
</style>
	<div class="adminMenu">
		<table cellspacing="6" class="adminMenuTable">
			<tr>
				<td>Ledger Group</td>
				<td>City Group</td>
				<td>Party</td>
				<td>Item Unit</td>
				<td>Stock Point</td>
				<td>Item</td>
				<td>Remarks</td>
			</tr>
			<tr>
				<td>
					<table class="adminMenuSubTable">
						<tr>
							<td><a href="createLedgerGroup">Create</a></td>
						</tr>
						<tr>
							<td><hr
									style="border: none; height: 1px; background-color: #505050" /></td>
						</tr>
						<tr>
							<td><a href="viewLedgerGroup">Edit/View</a></td>
						</tr>
					</table>
				</td>
				<td>
					<table class="adminMenuSubTable">
						<tr>
							<td><a href="createCityGroup">Create</a></td>
						</tr>
						<tr>
							<td><hr
									style="border: none; height: 1px; background-color: #505050" /></td>
						</tr>
						<tr>
							<td><a href="viewCityGroup">Edit/View</a></td>
						</tr>
					</table>
				</td>
				<td>
					<table class="adminMenuSubTable">
						<tr>
							<td><a href="createParty">Create</a></td>
						</tr>
						<tr>
							<td><hr
									style="border: none; height: 1px; background-color: #505050" /></td>
						</tr>
						<tr>
							<td><a href="viewParty">Edit/View</a></td>
						</tr>
					</table>
				</td>
				<td>
					<table class="adminMenuSubTable">
						<tr>
							<td><a href="createItemUnit">Create</a></td>
						</tr>
						<tr>
							<td><hr
									style="border: none; height: 1px; background-color: #505050" /></td>
						</tr>
						<tr>
							<td><a href="viewItemUnit">Edit/View</a></td>
						</tr>
					</table>
				</td>
				<td>
					<table class="adminMenuSubTable">
						<tr>
							<td><a href="createStockPoint">Create</a></td>
						</tr>
						<tr>
							<td><hr
									style="border: none; height: 1px; background-color: #505050" /></td>
						</tr>
						<tr>
							<td><a href="viewStockPoint">Edit/View</a></td>
						</tr>
					</table>
				</td>
				<td>
					<table class="adminMenuSubTable">
						<tr>
							<td><a href="createItem">Create</a></td>
						</tr>
						<tr>
							<td><hr
									style="border: none; height: 1px; background-color: #505050" /></td>
						</tr>
						<tr>
							<td><a href="viewItem">Edit/View</a></td>
						</tr>
					</table>
				</td>
				<td>
					<table class="adminMenuSubTable">
						<tr>
							<td><a href="createRemark">Create</a></td>
						</tr>
						<tr>
							<td><hr
									style="border: none; height: 1px; background-color: #505050" /></td>
						</tr>
						<tr>
							<td><a href="viewRemarks">Edit/View</a></td>
						</tr>
					</table>
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