package databaseconnection;
import java.sql.*;

public class databasecon
{
	static Connection con;
	public static Connection getconnection()
	{
 		
 			
		try
		{
			Class.forName("com.mysql.jdbc.Driver");	
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online","root","root");
		}
		catch(Exception e)
		{
			System.out.println(" database error:"+e);
		}
		return con;
	}
	
}
