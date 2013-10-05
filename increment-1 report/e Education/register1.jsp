<%@ page import="java.sql.*"%>


<%! String name, lname, addr, city, state, zip, tele, email, un, pwd;
	int i=0;
%>
<%
try{
Class.forName("com.mysql.jdbc.Driver"); 
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/online","root","root");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select max(id) from register");
if(rs.next())
{
	i=rs.getInt(1);
	++i;
}
}
catch(Exception e){
System.out.println("Exception Occured");}

name=request.getParameter("name");
lname=request.getParameter("lname");
addr=request.getParameter("addr");
city=request.getParameter("city");
state=request.getParameter("state");
 zip=request.getParameter("zip");
tele=request.getParameter("tele");
 email=request.getParameter("email");
pwd=request.getParameter("pwd");
System.out.println(pwd);
%>
<%
Class.forName("com.mysql.jdbc.Driver"); 
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/online","root","root");
Statement st=con.createStatement();
un="user110"+i;
int q= st.executeUpdate("insert into register values('"+i+"','"+name+"','"+lname+"','"+addr+"','"+city+"','"+state+"','"+zip+"','"+tele+"','"+email+"', '"+un+"', '"+pwd+"')");


if(q>0)
{
	response.sendRedirect("register.jsp?id="+un+"");
	//response.sendRedirect("register.jsp?message=succ");
}
else
	response.sendRedirect("register.jsp?message=fail");


%>
