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
<%!
public int nullIntconv(String str)
{   
    int conv=0;
    if(str==null)
    {
        str="0";

	}
    
	else if((str.trim()).equals("null"))
    {
        str="0";
    
	}
    else if(str.equals(""))
    {
        str="0";
    }
    try{
        conv=Integer.parseInt(str);
    }
    catch(Exception e)
    {
		System.out.println("eeee");
    }
    return conv;
}
%>
<%
String file_name1=null;

    Connection conn = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/online","root", "root");

    ResultSet rsp = null;
    ResultSet rsr = null;
    
    PreparedStatement psp=null;
    PreparedStatement psr=null;
    
    int iShowRows=5;  // Number of records show on per page
    int iTotalSearchRecords=10;  // Number of pages index shown
    
    int iTotalRows=nullIntconv(request.getParameter("iTotalRows"));
    int iTotalPages=nullIntconv(request.getParameter("iTotalPages"));
    int iPageNo=nullIntconv(request.getParameter("iPageNo"));
    int cPageNo=nullIntconv(request.getParameter("cPageNo"));
    
    int iStartResultNo=0;
    int iEndResultNo=0;
    
    if(iPageNo==0)
    {
        iPageNo=0;
    }
    else{
        iPageNo=Math.abs((iPageNo-1)*iShowRows);
    }
    

    
    String sql1="SELECT SQL_CALC_FOUND_ROWS * FROM view limit "+iPageNo+","+iShowRows+"";

//System.out.println(sql1);
    psp=conn.prepareStatement(sql1);
    rsp=psp.executeQuery();
    
    //// this will count total number of rows
     String sqlRowCnt="SELECT FOUND_ROWS() as cnt";
     psr=conn.prepareStatement(sqlRowCnt);
     rsr=psr.executeQuery();
     
     if(rsr.next())
      {
         iTotalRows=rsr.getInt("cnt");
      }
%>
<html>
<head>


</head>
<body>
<form name="frm">
<input type="hidden" name="iPageNo" value="<%=iPageNo%>">
<input type="hidden" name="cPageNo" value="<%=cPageNo%>">
<input type="hidden" name="iShowRows" value="<%=iShowRows%>">
<table align="center" width="80%" cellpadding="20" cellspacing="20" >
<tr>
<td bgcolor=#acedf2 align="center"><font color=#ff6633 size=4 ><b>NAME</td>
<td bgcolor=#e4faf9 align="center"><font color=#ff6633 size=4 ><b>IMAGE</td>
<td bgcolor=#acedf2 align="center"><font color=#ff6633 size=4 ><b>AUDIO</td>
</tr>
<%
  while(rsp.next())
  {
  %>
    <tr>
      <td bgcolor=#acedf2 align="center"><font color="#990000"><b><%=rsp.getString(2)%></td>
      <td bgcolor=#e4faf9><img src="viewimage.jsp?id=<%=rsp.getString(1)%>" alt="" width="120" height="99" /></td>
      <td bgcolor=#acedf2><% file_name1=rsp.getString(4);
	%>
	<audio controls="controls">  
        <source src="Sounds\<%=file_name1%>" type="audio/mp3" />
        Your browser does not support the audio tag.
    </audio></td>
    </tr>
    <% 
 }
 %>
<%
  //calcu
        try{
            if(iTotalRows<(iPageNo+iShowRows))
            {
                iEndResultNo=iTotalRows;
            }
            else
            {
                iEndResultNo=(iPageNo+iShowRows);
            }
           
            iStartResultNo=(iPageNo+1);
            iTotalPages=((int)(Math.ceil((double)iTotalRows/iShowRows)));
        
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

%>
<tr>
<td bgcolor=#acedf2 colspan="3">
<div>
<%
        //// index of pages 
        
        int i=0;
        int cPage=0;
        if(iTotalRows!=0)
        {
        cPage=((int)(Math.ceil((double)iEndResultNo/(iTotalSearchRecords*iShowRows))));
        
        int prePageNo=(cPage*iTotalSearchRecords)-((iTotalSearchRecords-1)+iTotalSearchRecords);
        if((cPage*iTotalSearchRecords)-(iTotalSearchRecords)>0)
        {
         %>
          <a href="user_home.jsp?iPageNo=<%=prePageNo%>&cPageNo=<%=prePageNo%>"> << Previous</a>
         <%
        }
        
        for(i=((cPage*iTotalSearchRecords)-(iTotalSearchRecords-1));i<=(cPage*iTotalSearchRecords);i++)
        {
          if(i==((iPageNo/iShowRows)+1))
          {
          %>
           <a href="user_home.jsp?iPageNo=<%=i%>" style="cursor:pointer;color: red"><b><font size=4><%=i%>&nbsp;&nbsp;</b></a>
          <%
          }
          else if(i<=iTotalPages)
          {
          %>
           <a href="user_home.jsp?iPageNo=<%=i%>"><font size=4><%=i%>&nbsp;&nbsp;</a>
          <% 
          }
        }
        if(iTotalPages>iTotalSearchRecords && i<iTotalPages)
        {
         %>
         <a href="user_home.jsp?iPageNo=<%=i%>&cPageNo=<%=i%>"> >> Next</a> 
         <%
        }
        }
      %>
<b>Rows <%=iStartResultNo%> - <%=iEndResultNo%>   Total Result  <%=iTotalRows%> </b>
</div>
</td>
</tr>
</table>
</form>
</body>
</html>
<%
    try{
         if(psp!=null){
             psp.close();
         }
         if(rsp!=null){
             rsp.close();
         }
         
         if(psr!=null){
             psr.close();
         }
         if(rsr!=null){
             rsr.close();
         }
         
         if(conn!=null){
          conn.close();
         }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%>

<%@ include file="footer.jsp"%>