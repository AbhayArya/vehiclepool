
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

@WebServlet("/VehicleRegServlet")
public class VehicleRegServlet extends HttpServlet {
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
			String svelName = request.getParameter("velName");
			String svelNo = request.getParameter("velNo");
			String sseats = request.getParameter("seats");
			String sexpense = request.getParameter("expense");
			String ssource = request.getParameter("source");
			String sdestination = request.getParameter("destination");
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
			String sql = "insert into vehicleregister values (?,?,?,?,?,?,?,?,?)";
			PreparedStatement pst;
			pst = connection.prepareStatement(sql);
			pst.setString(1, sempId);
			pst.setString(2, svelName);
			pst.setString(3, svelNo);
			pst.setString(4, sseats);
			pst.setString(5, sexpense);
			pst.setString(6, ssource);
			pst.setString(7, sdestination);
			pst.setString(8, sdate);
			pst.setString(9, stime);

			int i = pst.executeUpdate();
			if (i > 0) {
				
					// insert into mastergroup table
					String insertquery = "insert into mastergroup values (?,?,?,?,?)";
					pst = connection.prepareStatement(insertquery);
					pst.setString(1, ssource);
					pst.setString(2, sdestination);
					pst.setString(3, stime);
					pst.setString(4, sseats);
					pst.setString(5, sempId);
					int res = pst.executeUpdate();

					if (res > 0)
						response.sendRedirect("/Vehiclepool/vehiclePooling.com/successoff.jsp");
					else
						out.println("Error");
				}
			
			pst.close();
		} catch(MySQLIntegrityConstraintViolationException e) {
			response.sendRedirect("/Vehiclepool/vehiclePooling.com/vehicleRegister.jsp");
			out.print("plese check the information you have entered!");
		}
		catch (Exception e) {
			response.sendRedirect("/Vehiclepool/vehiclePooling.com/vehicleRegister.jsp");
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
