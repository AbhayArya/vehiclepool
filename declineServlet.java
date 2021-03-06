

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class statusServlet
 */
@WebServlet("/declineServlet")
public class declineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    @Override
    public  void init() throws ServletException{
    	super.init(); 	
    }
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection connection=null;
		
		 PrintWriter out=response.getWriter();
		try {
			java.sql.Statement statement=null;
		 String connectionURL = "jdbc:mysql://localhost:3306/vehiclepool";
		 String status="Decline";
		 HttpSession session1=request.getSession(false);
		 String id=(String)session1.getAttribute("empId");
		  // Load the database driver
		  Class.forName("com.mysql.jdbc.Driver");
		  // Get a Connection to the database
		  connection = DriverManager.getConnection
		  (connectionURL, "root", ""); 
		  //Add the data into the database
		  statement =  connection.createStatement();
		  String query2="select requesterid,status from status where ownerId="+id+"";
		//  PreparedStatement pst3 = 
			//	  connection.prepareStatement(query2);
		  
		  ResultSet res2=statement.executeQuery(query2);
		  while(res2.next()) {
			  String sts=res2.getString("status");
		  System.out.println(sts);
		  if(sts.equals("Accepted")==true) {
		  String query="update mastergroup set seats=seats+"+1+" where empId='"+id+"'";
		  String sql = " update status set status='"+status+"'where ownerid='"+id+"'";
				  PreparedStatement pst = 
				  connection.prepareStatement(sql);
				  PreparedStatement pst1 = 
						  connection.prepareStatement(query);
				  int j=pst1.executeUpdate();
				  int i= pst.executeUpdate();
		  if(i>0) {
			   response.sendRedirect("/Vehiclepool/vehiclePooling.com/cancelreq.jsp");
		  		  }
		  pst.close();
		  }
		}
		}
		  catch(Exception e){
			  System.out.println(e);
		  }
		
		  finally {
		  // Always close the database connection.
		  try {
		  if (connection != null) connection.close();
		  }
		  catch (SQLException e) {
			  System.out.println(e);
		  }
		  }
	}
	

}
