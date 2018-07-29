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
	</br>
	<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
		if (session.getAttribute("email") == null)
			response.sendRedirect("/Vehiclepool/vehiclePooling.com/login.jsp");
	%>
	<div>
		<%
			String file = "C:\\Users\\Abhay\\eclipse-workspace\\Vehiclepool\\WebContent\\vehiclePooling.com\\loginid.txt";
			HttpSession session1 = request.getSession(false);
			String id = (String) session1.getAttribute("empId");
			try {
				Connection connection = null;
				Statement statement = null;
				String connectionURL = "jdbc:mysql://localhost:3306/Vehiclepool";
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				connection = DriverManager.getConnection(connectionURL, "root", "");
				statement = connection.createStatement();
				String checkQuery = "select * from status where ownerid='" + id + "'";
				ResultSet res = statement.executeQuery(checkQuery);
				if (res.next()) {
					String QueryString = "SELECT r.name,r.mobileno,s.status from status s,register r where s.ownerid='"
							+ id + "' && r.empId=s.requesterid";
					ResultSet rs = statement.executeQuery(QueryString);
		%>
		<br>
		<h1 style="color: #ffffff;" align="center">Current Status</h1>
		<br>
		<h3 style="color: #ffffff;" align="center">Click on Mobile No.
			to chat with the rider!</h3>
		<br> <br>
		<%
			while (rs.next()) {
		%>
		<table style="table-layout: fixed;widht: 100%;" class="table-bordered" cellpadding="15" align="center">
			<tr
				style="background-color: #c0c0c0; color: black; text-transform: uppercase; font-weight: bold;">
				<th>Requester Name:</th>
				<th>Mobile No:</th>
				<th></th>
			</tr>
			<tr style="background-color: #ffffff; color: black;">
				<td><%=rs.getString(1)%></td>
				<td><a href="https://wa.me/91<%=rs.getString(2)%>"
					class="social-icon whatsapp" target="_blank"><%=rs.getString(2)%></a></td>
				<%
					String sts = rs.getString("s.status");
								if (sts.equals("Accepted")) {
				%>
				<td><form method="POST" action="/Vehiclepool/declineServlet">
						<input type="hidden" name="empid" value="<%=id%>">
						<button type="submit" class="btn btn-default">Decline</button>
					</form></td>
				<%
					} else if (sts.equals("requested")) {
				%>
				<td><form method="POST" action="/Vehiclepool/acceptServlet">
						<input type="hidden" name="empid" value="<%=id%>">
						<button type="submit" class="btn btn-default">Accept</button>
					</form></td>
			</tr>
		</table>
		<br>
		<%
			} else if (sts.equals("Decline")) {
		%>
		<h1>Request has been declined!</h1>
		<%
			}
					}
					// close all the connections.
					rs.close();
				} else {
					String QueryString = "SELECT r.name,r.mobileno,s.status,s.ownerid from status s,register r where s.requesterid='"
							+ id + "' && r.empId=s.ownerid";
					ResultSet rs = statement.executeQuery(QueryString);
		%>
		<br>
		<h1 style="color: #ffffff;" align="center">Current Status</h1>
		<br>
		<h3 style="color: #ffffff;" align="center">Click on Mobile No.
			to chat with the rider!</h3>
		<br> <br>

		<%
			while (rs.next()) {
						String sts = rs.getString("s.status");
						//System.out.println(sts);
						if (sts.equals("Accepted")) {
		%>
		<table style="table-layout: fixed;widht: 100%;" class="table-bordered" cellpadding="15" align="center">
			<tr
				style="background-color: #c0c0c0; color: black; text-transform: uppercase; font-weight: bold;">
				<th>Owner Name:</th>
				<th>Mobile No:</th>
				<th>Present Status:</th>
				<th></th>
			</tr>
			<tr style="background-color: #ffffff; color: black;">
				<td><%=rs.getString(1)%></td>
				<td><a href="https://wa.me/91<%=rs.getString(2)%>"
					class="social-icon whatsapp" target="_blank"><%=rs.getString(2)%></a></td>
				<td><%=rs.getString(3)%></td>
				<%
					
				%>
				<td><form method="POST" action="/Vehiclepool/declinereq">
						<input type="hidden" name="empid" value="<%=rs.getString(4)%>">
						<button type="submit" class="btn btn-default">Decline</button>
					</form></td>
			</tr>
		</table>

		<%
			} else if (sts.equals("requested")) {
		%>
		<table style="table-layout: fixed;widht: 100%;" class="table-bordered" cellpadding="15" align="center">
			<tr
				style="background-color: #c0c0c0; color: black; text-transform: uppercase; font-weight: bold;">
				<th>Owner Name:</th>
				<th>Mobile No:</th>
				<th>Present Status:</th>
				<th></th>
			</tr>
			<tr style="background-color: #ffffff; color: black;">
				<td><%=rs.getString(1)%></td>
				<td><a href="https://wa.me/91<%=rs.getString(2)%>"
					class="social-icon whatsapp" target="_blank"><%=rs.getString(2)%></a></td>
				<td><%=rs.getString(3)%></td>
				<td><form method="POST" action="/Vehiclepool/declinereq2">
						<input type="hidden" name="empid" value="<%=id%>">
						<button type="submit" class="btn btn-default">Decline</button>
					</form></td>
			</tr>
		</table>
		<%
			} else {
		%>
		<table style="table-layout: fixed;widht: 100%;" class="table-bordered" cellpadding="15" align="center">
			<tr
				style="background-color: #c0c0c0; color: black; text-transform: uppercase; font-weight: bold;">
				<th>Owner Name:</th>
				<th>Mobile No:</th>
				<th>Present Status:</th>
			</tr>
			<tr style="background-color: #ffffff; color: black;">
				<td><%=rs.getString(1)%></td>
				<td><a href="https://wa.me/91<%=rs.getString(2)%>"
					class="social-icon whatsapp" target="_blank"><%=rs.getString(2)%></a></td>
				<td><%=rs.getString(3)%></td>
			</tr>
		</table>
		<h1 align="center">Ride has been declined!</h1>
		<%
			}
		%>
		<br>
		<%
			}
					rs.close();
				}
				res.close();
				statement.close();
				connection.close();
			} catch (Exception ex) {
				out.println(ex);
			}
		%>
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