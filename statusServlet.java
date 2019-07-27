

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

/**
 * Servlet implementation class statusServlet
 */
@WebServlet("/statusServlet")
public class statusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    @Override
    public  void init() throws ServletException{
    	super.init(); 	
    }
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection connection=null;
		 PrintWriter out=response.getWriter();
		try {
			 HttpSession session1=request.getSession(false);
			 String id=(String)session1.getAttribute("empId");
		 String connectionURL = "jdbc:mysql://localhost:3306/vehiclepool";
		  
		 String ownerid=request.getParameter("empid");
		 String requesterid=String.valueOf(id);//request.getParameter("");
		 String status="requested";
		  // Load the database driver
		  Class.forName("com.mysql.jdbc.Driver");
		  // Get a Connection to the database
		  connection = DriverManager.getConnection
		  (connectionURL, "root", ""); 
		  //Add the data into the database
		  String sql = 
		  "insert into status values (?,?,?)";
		  PreparedStatement pst = 
		  connection.prepareStatement(sql);
		  pst.setString(1, ownerid);
		  pst.setString(2, requesterid);
		  pst.setString(3, status);
		  int i= pst.executeUpdate();
		  if(i>0) {
			  response.sendRedirect("/Vehiclepool/vehiclePooling.com/successreq.jsp");
		  		  }
		  pst.close();
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
