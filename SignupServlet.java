

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    @Override
    public  void init() throws ServletException{
    	super.init(); 	
    }
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection connection=null;
		
		try {
		 String connectionURL = "jdbc:mysql://localhost:3306/vehiclepool";
		  
		  PrintWriter out=response.getWriter();
		  //get the variables entered in the form
		  String sname= request.getParameter("name");
		  String sempId= request.getParameter("empId");
		  String saddress= request.getParameter("address");
		  String smobileno = request.getParameter("mobileno");
		  String semail= request.getParameter("email");
		  String spassword= request.getParameter("password");
		  
		  //mobile verification----------------------------
		  
		  Pattern p=Pattern.compile("(0/91)?[7-9][0-9]{9}");
		  Matcher m=p.matcher(smobileno);
		 
		  //Encryption--------------------------------------
		  
		  String seed = "password";
		  StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();
		  encryptor.setPassword(seed);
		  String encryptedPassword= encryptor.encrypt(spassword);
		
		  // Load the database driver
		  
		  Class.forName("com.mysql.jdbc.Driver");
		  
		  // Get a Connection to the database
		  
		  connection = DriverManager.getConnection
		  (connectionURL, "root", ""); 
		  
		  //Email verification-----------------------------
		  boolean emailres=Emailverify.main(semail);
		  if(emailres==true && (m.find() && m.group().equals(smobileno)==true)) {
		  //Add the data into the database
		  String sql = 
		  "insert into register values (?,?,?,?,?,?)";
		  PreparedStatement pst = 
		  connection.prepareStatement(sql);
		  pst.setString(1, sname);
		  pst.setString(2, sempId);
		  pst.setString(3, saddress);
		  pst.setString(4, smobileno);
		  pst.setString(5, semail);
		  pst.setString(6, encryptedPassword);
		
		  int i= pst.executeUpdate();
		  if(i>0) {
			  response.sendRedirect("/Vehiclepool/vehiclePooling.com/login.jsp");
			  pst.close();
		  		  }
		  } else {
			  response.sendRedirect("/Vehiclepool/vehiclePooling.com/siignup.jsp");
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
