
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;

/**
 * Servlet implementation class VehicleUpdateServlet
 */
@WebServlet("/VehicleUpdateServlet")
public class VehicleUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
		super.init();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection connection = null;
		PrintWriter out = response.getWriter();
		try {
			String connectionURL = "jdbc:mysql://localhost:3306/vehiclepool";

			
			// get the variables entered in the form

			String sempId = request.getParameter("empId");
			String ssource = request.getParameter("source");
			String sdestination = request.getParameter("destination");
			String sseats = request.getParameter("seats");
			String sexpense = request.getParameter("expenses");
			String sjourneyDate = request.getParameter("journeyDate");
			String sjourneyTime = request.getParameter("journeyTime");

			// Date to String
			SimpleDateFormat sd = new SimpleDateFormat("dd/MM/yyyy");
			Date date = sd.parse(sjourneyDate);
			SimpleDateFormat sdfdate = new SimpleDateFormat("yyyy-MM-dd");
			String sdate = sdfdate.format(date);

			// Time to string
			SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
			Date time = sdf.parse(sjourneyTime);
			SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
			String stime = sdfTime.format(time);

			// Load the database driver
			Class.forName("com.mysql.jdbc.Driver");
			// Get a Connection to the database
			connection = DriverManager.getConnection(connectionURL, "root", "");
			// Add the data into the database
			String sql = "update vehicleregister set employeeId=?,source=?,destination=?,seats=?,expense=?,journeyDate=?,journeyTime=? where employeeId="
					+ sempId + "";
			PreparedStatement pst;
			pst = connection.prepareStatement(sql);
			pst.setString(1, sempId);
			pst.setString(4, sseats);
			pst.setString(5, sexpense);
			pst.setString(2, ssource);
			pst.setString(3, sdestination);
			pst.setString(6, sdate);
			pst.setString(7, stime);
			
			int i = pst.executeUpdate();
			if (i > 0) {
				String insertquery = "update mastergroup set source=?,destination=?,time=?,seats=?,empId=? where empId="+sempId+"";
				pst = connection.prepareStatement(insertquery);
				pst.setString(1, ssource);
				pst.setString(2, sdestination);
				pst.setString(3, stime);
				pst.setString(4, sseats);
				pst.setString(5, sempId);
				pst.executeUpdate();

				response.sendRedirect("/Vehiclepool/vehiclePooling.com/updateveh.jsp");
			
				
		}
	
			pst.close();
		}
		catch (Exception e) {
			response.sendRedirect("/Vehiclepool/vehiclePooling.com/vehicleRegister.jsp");
			out.print(e);
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
