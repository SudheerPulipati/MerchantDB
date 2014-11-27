<div class="adminMenuTitle">
	Create Remarks
	<hr
		style="border: none; height: 1px; width: 40%; background-color: #505050"
		align="left" />
</div>
<form action="/merchantdb/saveRemark" method="post">
	<table>
		<tr>
			<td>${remarkCreationStatus }</td>
		</tr>
		<tr>
			<td>Remark</td>
			<td><input type="text" name="remarks"></td>
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
