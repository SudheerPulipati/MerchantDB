<div class="adminMenuTitle">
	Create Stock Point
	<hr
		style="border: none; height: 1px; width: 40%; background-color: #505050"
		align="left" />
</div>
<form action="/merchantdb/saveStockPoint" method="post">
	<table>
		<tr>
			<td><br></td>
		</tr>
		<tr>
			<td>StockPoint Name</td>
			<td><input type="text" name="stockPointName"></td>
		</tr>
		<tr>
			<td>Address</td>
			<td><textArea name="stockPointAddress"></textArea></td>
		</tr>
		<tr>
			<td>City</td>
			<td><input type="text" name="stockPointCity"></td>
		</tr>
		<tr>
			<td>State</td>
			<td><input type="text" name="stockPointState"></td>
		</tr>
		<tr>
			<td>Telephone</td>
			<td><input type="text" name="stockPointPhone"></td>
		</tr>
		<tr>
			<td><br></td>
		</tr>
		<tr>
			<td><input type="submit" value="Save"></td>
			<td><input type="reset" value="Clear"></td>
		</tr>
	</table>
</form>
</body>