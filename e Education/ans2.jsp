

<%@ page import="java.sql.*" import="databaseconnection.databasecon"  %>
<%

int ses=(Integer)session.getAttribute("i");
String u=(String)session.getAttribute("u");
System.out.println(ses);
Connection con1 = databasecon.getconnection();
Statement st1 = con1.createStatement();

int ii=st1.executeUpdate("update register set session="+ses+" where un='"+u+"' " );
%>
<form method="post" action="test2a.jsp">
	


<table  width="100%" cellpadding=""  >
<tr><td><h2>&nbsp;&nbsp;<font size="" color="#6699ff">Test2 Answers for following </table>
<table align="center" width="80%" cellpadding="" cellspacing="" ></font>

<% Connection con = databasecon.getconnection();
	Statement st = con.createStatement();

	ResultSet rs=st.executeQuery("select * from test2");
	
	while(rs.next())
	{
	%>
<tr><td><font color=red><h2><%=rs.getString(1)%>)
<td><audio controls="controls">  
        <source src="Sounds\<%=rs.getString(2)%>" type="audio/mp3" />
        Your browser does not support the audio tag.
    </audio>
<td>	<input type="text" name="<%=rs.getString(1)%>" value="<%=rs.getString(3)%> " readonly >			
				
<%}
	%>

</table>
</form>




