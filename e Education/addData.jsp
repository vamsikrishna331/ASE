<%@ include file="Aheader.jsp"%>

<h1>&nbsp;&nbsp;&nbsp;<font color=#006699>Welcome to Admin</h1>



	<form action="UploadImage" enctype="multipart/form-data" name="productForm" id="productForm"><br><br>
		<table width="400px" align="center" border=0 style="background-color:ffeeff;">
			<tr>
<td><h2>Upload Content <td><h2>for Users</h3>
			</tr>

			<tr>
				<td align="center" colspan=2>&nbsp;</td>
			</tr>


			<tr>
				<td><h3>Name </td>
				<td>
					<input type="text" name="name" required>
				<td>
			</tr>


			<tr>
				<td><h3>Image </td>
				<td>
					<input type="file" name="file" id="file" required>
				<td>
			</tr>



			<tr>
				<td><h3>Audio </td>
				<td>
					<input type="file" name="audio" required>
				<td>
			</tr>

			<tr>
				<td></td>
				<td><input type="submit" name="Submit" value="UPLOAD"></td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>

		</table>
	</form>
	
</body>
<%@ include file="footer.jsp"%>

</html>