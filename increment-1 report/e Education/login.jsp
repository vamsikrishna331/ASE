<%@ page  import="java.sql.*" import="databaseconnection.*"%>
<%
String pass=null,uid=null;

String a = request.getParameter("uid");
String b= request.getParameter("pass");
String name=null,u=null;



try
{
	Connection con1 = databasecon.getconnection();
	Statement st1 = con1.createStatement();
	String sss1 = "select * from register where un='"+a+"' && pwd='"+b+"'";
	ResultSet rs1=st1.executeQuery(sss1);
	if(rs1.next())
	{
		u=rs1.getString("un");
		name=rs1.getString("name");
		session.setAttribute("name",name);
		session.setAttribute("u",u);
		response.sendRedirect("user_home.jsp");
    }
	else
	{
     	response.sendRedirect("index.jsp?message=fail");
	}
}
catch(Exception e1)
{
out.println(e1.getMessage());
}

%>