
<%@ page import="java.sql.*" import="databaseconnection.databasecon"  %>
<table align="center" width="50%" cellpadding="20" cellspacing="20" >

<table align="center" width="50%" cellpadding="" cellspacing="" >

<% Connection con = databasecon.getconnection();
	Statement st = con.createStatement();

	ResultSet rs=st.executeQuery("select * from test1");
	
	while(rs.next())
	{
	%>
<tr><td><font color=red><h2><%=rs.getString(1)%>)<td><img src="view.jsp?id=<%=rs.getString(1)%>" alt="" width="60" height="99" />
<table><tr>
					<input type="hidden" name="sno" value="<%=rs.getString(1)%>">
				<td><h3><input type="radio"  name="<%=rs.getString(1)%>" value="1" checked = "checked" ><%=rs.getString(3)%>
				<td><h3><input type="radio" name="<%=rs.getString(1)%>" value="2"><%=rs.getString(4)%>
				<td><h3><input type="radio" name="<%=rs.getString(1)%>" value="3"><%=rs.getString(5)%>
				<td><h3><input type="radio" name="<%=rs.getString(1)%>" value="4"><%=rs.getString(6)%><tr><td><h3><br>Ans) Option <%=rs.getString(7)%>
				</table>
				<br><br>
<%}
	%>

</table>