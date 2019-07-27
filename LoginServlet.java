
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
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

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
		super.init();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection connection = null;

		try {
			String connectionURL = "jdbc:mysql://localhost:3306/vehiclepool";

			PrintWriter out = response.getWriter();
			// get the variables entered in the form
			String semail = request.getParameter("email");
			String spassword = request.getParameter("password");

			// Load the database driver-------------------------------
			Class.forName("com.mysql.jdbc.Driver");

			// Get a Connection to the database
			connection = DriverManager.getConnection(connectionURL, "root", "");

			String encryptedPassword = "null";
			String sql1 = "select password from register where email=?";
			PreparedStatement pst1 = connection.prepareStatement(sql1);
			pst1.setString(1, semail);
			ResultSet i1 = pst1.executeQuery();
			if (i1.next()) {
				encryptedPassword = i1.getString(1);
			}
			// decryption----------------------------
			StandardPBEStringEncryptor decryptor = new StandardPBEStringEncryptor();
			decryptor.setPassword("password");

			String decrypted = decryptor.decrypt(encryptedPassword);
			

			// Add the data into the database---------------------------
			String sql = "select email,empId from register where email=?";

			// --------------------------------------------------------
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setString(1, semail);
			if (spassword.equals(decrypted)==true) {
				

				ResultSet i = pst.executeQuery();

				String sempId = "null";
				while (i.next()) {
					sempId = i.getString(2);
					// session
					HttpSession session = request.getSession();
					session.setAttribute("email", semail);
					session.setAttribute("empId", sempId);
					if (session.getAttribute("email") != null) {
						response.sendRedirect("/Vehiclepool/vehiclePooling.com/options.jsp");
						
					}
				}
			}

			else {
				response.sendRedirect("/Vehiclepool/vehiclePooling.com/logiin.jsp");
				
			}

			pst.close();
		}

		catch (Exception e) {
			System.out.println(e);
		} finally {
			// Always close the database connection.
			try {
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				System.out.println(e);
			}
		}

	}

}
