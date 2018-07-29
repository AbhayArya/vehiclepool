<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Selected Vehicle | VehiclePool.Com</title>
<link href="attachments/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="attachments/css/features.css" rel="stylesheet">
<link href="attachments/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="index.jsp"><img
				src="attachments/hlogo.png"> VehiclePool.Com</a>
			<form method="POST" action="/Vehiclepool/LogoutServlet">
				<button type="submit" class="btn btn-default">Logout</button>
			</form>
		</div>
	</nav>
	<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
		if (session.getAttribute("email") == null)
			response.sendRedirect("/Vehiclepool/vehiclePooling.com/login.jsp");
	%>
	</br>
	<div>
		<%
			String id = request.getParameter("empid");
			try {
				Connection connection = null;
				Statement statement = null;
				String connectionURL = "jdbc:mysql://localhost:3306/Vehiclepool";
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				connection = DriverManager.getConnection(connectionURL, "root", "");
				statement = connection.createStatement();
				String QueryString = "SELECT r.name,v.vehName,v.vehNo,v.seats,v.expense,v.journeyTime,r.mobileno from vehicleregister v,register r where v.employeeId=r.empId && v.employeeId="
						+ id + "";
				ResultSet rs = statement.executeQuery(QueryString);
		%>
		<h1 style="color: #ffffff;" align="center">VEHICLE DETAILS</h1>
		<br>
		<h3 style="color: #ffffff;" align="center">Click on Mobile No.
			to chat with the rider!</h3>
		<br>
		<br>
		<table style="table-layout: fixed;widht: 100%;" class="table-bordered" cellpadding="15" align="center">
			<tr
				style="background-color: #c0c0c0; color: black; text-transform: uppercase; font-weight: bold;">
				<th>Owner Name</th>
				<th>Vehicle Name</th>
				<th>Vehicle No.</th>
				<th>No. of Seats</th>
				<th>Approx. Expense</th>
				<th>Time of Journey</th>
				<th>Whatsapp No.</th>
				<th></th>
			</tr>
			<%
				while (rs.next()) {
			%>
			<tr style="background-color: #ffffff; color: black;">
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getInt(4)%></td>
				<td>Rs. <%=rs.getInt(5)%></td>
				<td><%=rs.getTime(6)%></td>
				<td><a href="https://wa.me/91<%=rs.getString(7)%>"
					class="social-icon whatsapp" target="_blank"><%=rs.getString(7)%></a></td>
				<td><form method="POST" action="/Vehiclepool/statusServlet">
						<input type="hidden" name="empid" value="<%=id%>">
						<button type="submit" class="btn btn-default">Request For
							Ride</button>
					</form></td>
			</tr>
			<%
				}
					// close all the connections.
					rs.close();
					statement.close();
					connection.close();
				} catch (Exception ex) {
					out.println("unable to connect databases");
				}
			%>
		</table>
	</div>
	<div class="copyright py-4 text-center text-white fixed-bottom">
		<div class="container">
			<small>Copyright &copy; VehiclePool.Com 2018| All Rights
				Reserved | Contact Us: +91 69696 96969</small>
		</div>
	</div>
	<!-- Bootstrap core JavaScript -->
	<script src="attachments/jquery/jquery.min.js"></script>
	<script src="attachments/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>