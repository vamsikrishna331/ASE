<%@ include file="header.jsp"%>

<%@ page import="java.sql.*" import="databaseconnection.databasecon"  %>
<%

int ses=(Integer)session.getAttribute("i");
String u=(String)session.getAttribute("u");
System.out.println(ses);
Connection con1 = databasecon.getconnection();
	Statement st1 = con1.createStatement();

int ii=st1.executeUpdate("update register set session="+ses+" where un='"+u+"' " );
%>
<form method="post" action="test1.jsp">
	


<table align="center" width="80%" cellpadding="20" cellspacing="20" >
<tr><td><h2>Select Correct Option for following </table>
<table align="center" width="80%" cellpadding="" cellspacing="" >

<% Connection con = databasecon.getconnection();
	Statement st = con.createStatement();

	ResultSet rs=st.executeQuery("select * from test1");
	
	while(rs.next())
	{
	%>
<tr><td><font color=red><h2><%=rs.getString(1)%>)<td><img src="view.jsp?id=<%=rs.getString(1)%>" alt="" width="120" height="99" /><table><tr>
				
				<td><input type="radio"  name="<%=rs.getString(1)%>" value="1" checked = "checked" ><%=rs.getString(3)%>
				<td><input type="radio" name="<%=rs.getString(1)%>" value="2"><%=rs.getString(4)%>
				<td><input type="radio" name="<%=rs.getString(1)%>" value="3"><%=rs.getString(5)%>
				<td><input type="radio" name="<%=rs.getString(1)%>" value="4"><%=rs.getString(6)%>
				</table>
				<br><br>
<%}
	%>
<tr><td><input type="submit">
</table>
</form>
<%@ include file="footer.jsp"%>



