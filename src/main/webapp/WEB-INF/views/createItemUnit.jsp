<div class="adminMenuTitle">
	Create Item Unit
	<hr
		style="border: none; height: 1px; width: 40%; background-color: #505050"
		align="left" />
</div>
<form action="/merchantdb/saveItemUnit" method="post">
	<p style="color:blue">${success}</p>
	<table>
		<tr>
			<td>Unit Name</td>
			<td><input type="text" name="unitName"></td>
		</tr>
		<tr>
			<td>Weight(kgs)</td>
			<td><input type="text" name="weight"></td>
		</tr>
		<tr>
			<td colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td><input type="submit" value="Save"></td>
			<td><input type="reset" value="Clear"></td>
		</tr>
	</table>
	</form>
</body>
</html>