<%@ include file="header.jsp"%>
<%@ page  import="java.sql.*" import="databaseconnection.*" import="javax.swing.JOptionPane"%>
<%


String uid = request.getParameter("uid");
String pass= request.getParameter("pass");
%>
<center>
<table cellspacing=20>
<form method="post" action="">
	

<tr><td><a href="login.jsp?m=<%=uid%>,<%=pass%>"><h2>Beginer</a>
<tr><td><a href="login.jsp?m=<%=uid%>,<%=pass%>"><h2>Moderate</a>
<tr><td><a href="login.jsp?m=<%=uid%>,<%=pass%>"><h2>Expert</a>
</table>
</form>
<%@ include file="footer.jsp"%>