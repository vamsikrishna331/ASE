
<%@ include file="header.jsp"%>
<%@ page import="java.sql.*" import="databaseconnection.databasecon" import="java.util.*"  import="javax.swing.JOptionPane" %>
<%

int count=(Integer)session.getAttribute("count");
System.out.println(count);
%>
<h2><font color=#990000>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Your Score <font color=red><%=count%>/10
</font></font>
<br><br><br><br><br><br><br><br>
<%@ include file="footer.jsp"%>