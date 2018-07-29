<%@page import="java.time.LocalDate"%>
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
<title>Find A Ride | VehiclePool.Com</title>
<link href="attachments/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="attachments/css/features.css" rel="stylesheet">
<link href="attachments/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!--  script>
	var request = new XMLHttpRequest();
	function sourceInfo() {
		var source = document.sourceinfo.source.value;
		var url = "searchlistajax.jsp?val=" + source;
		try {
			request.onreadystatechange = function() {
				if (request.readyState == 4) {
					var val = request.responseText;
					document.getElementById('mysource').innerHTML = val;
				}
			}//end of function  
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			alert("Unable to connect to server");
		}
	}
	function destinationInfo() {
		var destination = document.sourceinfo.destination.value;
		var url = "searchlistajax.jsp?val=" + destination;
		try {
			request.onreadystatechange = function() {
				if (request.readyState == 4) {
					var val = request.responseText;
					document.getElementById('mydestination').innerHTML = val;
				}
			}//end of function  
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			alert("Unable to connect to server");
		}
	}
</script>-->
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
	<div class="signup-form">
		<form method="GET" name="sourceinfo"
			action="/Vehiclepool/vehiclePooling.com/searchedvehicle.jsp">
			<h2>Search rides according to route!</h2>
			<hr>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon" id="mysource"></span> <input
						type="text" class="form-control" name="source"
						placeholder="Source" onkeyup="sourceInfo()">
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon" id="mydestination"></span> <input
						type="text" class="form-control" name="destination"
						placeholder="Destination" onkeyup="destinationInfo()">
				</div>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary btn-lg">Search</button>
			</div>
		</form>
	</div>
	<br>
	<div>
		<%
			try {
				String connectionURL = "jdbc:mysql://localhost:3306/Vehiclepool";
				Connection connection = null;
				Statement statement = null;
				// declare a resultset that uses as a table for output data from tha table.
				ResultSet rs = null;
				// Load JBBC driver "com.mysql.jdbc.Driver"
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				connection = DriverManager.getConnection(connectionURL, "root", "");
				statement = connection.createStatement();
				String QueryString = "SELECT * from mastergroup m,vehicleregister v where m.empId=v.employeeId and v.journeyDate=curdate()";
				rs = statement.executeQuery(QueryString);
		%>
		<h2 style="color: #ffffff;" align="center">
			Available Riders for
			<%=LocalDate.now()%></h2>
		<table style="table-layout: fixed;widht: 100%;" class="table-bordered" cellpadding="15" align="center">
			<tr
				style="background-color: #c0c0c0; color: black; text-transform: uppercase; font-weight: bold;">
				<th>Source</th>
				<th>Destination</th>
				<th>Time of Traveling</th>
				<th>No. of Seats</th>
				<th>To know more</th>
			</tr>
			<%
				while (rs.next()) {
			%>
			<tr style="background-color: #ffffff; color: black;">
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getTime(3)%></td>
				<td><%=rs.getInt(4)%></td>
				<td><form method="POST" action="ownerdetails.jsp">
						<input type="hidden" name="empid" value="<%=rs.getString(5)%>">
						<button type="submit" class="btn btn-success">Click Here</button>
					</form></td>
			</tr>
			<%
				}
			%>
			<%
				// close all the connections.
					rs.close();
					statement.close();
					connection.close();
				} catch (Exception ex) {
					out.println("Unable to connect to database.");
				}
			%>
		</table>
	</div>
	<br><br><br><br><br>
	<br>
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