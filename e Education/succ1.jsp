
<%@ include file="header.jsp"%>
<%@ page import="java.sql.*" import="databaseconnection.databasecon" import="java.util.*"  import="javax.swing.JOptionPane" %>
<%

int count=(Integer)session.getAttribute("count");
System.out.println(count);
%>
<h2><font color=#990000>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Your Score <font color=red><%=count%>/10
</font></font>

<br><br><br>


<%

if(count>7)
{
%>
			<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font color=#ff00ff>Congratulation, Your Done Great Job..<br>
</font>			
						
					
<%
}
else{
	%>
<h2><font color=#990000>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;This is not good enough..  <font color=red><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="test2.jsp">Continue..</a>
</font>
<%
}
%>
<br><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="window.open('ans2.jsp', 'newwindow', 'width=330, height=180'); return false;">Click to See Anwers</a>
<br><br><br><br>
<%@ include file="footer.jsp"%>