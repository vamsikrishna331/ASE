<%@ page  import="java.sql.*" import="databaseconnection.*" import="javax.swing.JOptionPane"%>
<%
String pass=null,uid=null;

//String a = request.getParameter("uid");
//String b = request.getParameter("pass");
String m = request.getParameter("m");

String[] data=m.split(",");

String a=data[0];
String b=data[1];
String name=null,u=null,test2=null;



try
{
if(a.equals("admin")&&b.equals("admin"))
{
	response.sendRedirect("admin_home.jsp");
	}
	else{
	Connection con1 = databasecon.getconnection();
	Statement st1 = con1.createStatement();
	
	String sss1 = "select * from register where un='"+a+"' && pwd='"+b+"'";
	ResultSet rs1=st1.executeQuery(sss1);
	if(rs1.next())
	{

	%>

<%
		u=rs1.getString("un");
		name=rs1.getString("name");
		session.setAttribute("name",name);
		session.setAttribute("u",u);
		int i=rs1.getInt("session");
++i;
		session.setAttribute("i",i);
		test2=rs1.getString("test2");
		if(test2.equals("on"))
		{
			%>
			
			<%
		//JOptionPane.showMessageDialog(null, "Your First & Second Level Completed");
		//JOptionPane.showMessageDialog(null, "Redirecting to Next Level");
		response.sendRedirect("test2.jsp");
		}

		if(i>5&&!test2.equals("on"))
		{
//		JOptionPane.showMessageDialog(null, "Your First Level Completed");
	//	JOptionPane.showMessageDialog(null, "Redirecting to Next Level");
		response.sendRedirect("user_home2.jsp");
		}
		else
		response.sendRedirect("user_home.jsp");
    }
	else
	{
     	response.sendRedirect("index.jsp?message=fail");
	}
}
}
catch(Exception e1)
{
out.println(e1.getMessage());
}

%>