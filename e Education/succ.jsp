
<%@ include file="header.jsp"%>
<%@ page import="java.sql.*" import="databaseconnection.databasecon" import="java.util.*"  import="javax.swing.JOptionPane" %>
<%
String u=(String)session.getAttribute("u");

int count=(Integer)session.getAttribute("count");

%>
<h2><font color=#990000>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Your Score <font color=red><%=count%>/10
</font></font>

<br><br><br>


<%

if(count>7)
{
Connection con = databasecon.getconnection();
	Statement st = con.createStatement();

st.executeUpdate("update register set test2='on' where un='"+u+"'  ");
	
	
	%>	
			<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font color=#cc9900>Congrats, Your redirecting to Next Level<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="test2.jsp"><img src="images/next_level2.png" width="150" height="150" border="0" alt=""></a>
						
					
<%
}
else{
	%>
<h2><font color=#990000>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Get 8 marks for moving to next level test. <font color=red>
</font>

<%
}
%>

<br><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="#" onclick="window.open('ans.jsp', 'newwindow', 'width=330, height=180'); return false;">Click to See Anwers</a>
<br><br><br><br>
<%@ include file="footer.jsp"%>