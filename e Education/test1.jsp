

<%@ page import="java.sql.*" import="databaseconnection.databasecon" import="java.util.*"  import="javax.swing.JOptionPane" %>
<%
int count=0;
String t1,t2;
Vector v=new Vector();
String u=(String)session.getAttribute("u");
System.out.println(u);
Vector s=new Vector();

s.add(request.getParameter("1"));
s.add(request.getParameter("2"));
s.add(request.getParameter("3"));
s.add(request.getParameter("4"));
s.add(request.getParameter("5"));
s.add(request.getParameter("6"));
s.add(request.getParameter("7"));
s.add(request.getParameter("8"));
s.add(request.getParameter("9"));
s.add(request.getParameter("10"));


Connection con1 = databasecon.getconnection();
Statement st1 = con1.createStatement();

ResultSet rs=st1.executeQuery("select ans from test1" );
while(rs.next())
{
	v.add(rs.getString(1));	
}
System.out.println(v.get(0)+"  "+v.get(9));

for(int i=0;i<10;i++)
{
	t1=(String)s.get(i);
	t2=(String)v.get(i);
	
	System.out.println("i="+i+"  "+t1.equals(t2));
	
	if(t1.equals(t2))
	{
		count++;
	}
}
	

System.out.println(count);
session.setAttribute("count",count);
response.sendRedirect("succ.jsp");

%>




