<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Edit Ride Details | VehiclePool.Com</title>
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
	<div class="signup-form">
		<form action="/Vehiclepool/VehicleUpdateServlet" method="get">
			<h2>Update Ride Details</h2>
			<hr>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"></span> <input type="text"
						pattern="^[0-9]*$" class="form-control" name="empId" placeholder="Employee ID"
						required="required">
				</div>
				<label for="empId">(only numeric)</label>
			</div>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"></span> <input type="text"
						class="form-control" name="source" placeholder="Source"
						required="required">
				</div>
				<label for="source">(only alphabet)</label>
			</div>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"></span> <input type="text"
						class="form-control" name="destination" placeholder="Destination"
						required="required">
				</div>
				<label for="destination">(only alphabet)</label>
			</div>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"></span> <input type="text"
						pattern="^[0-9]*$" class="form-control" name="seats" placeholder="Available Seats"
						required="required">
				</div>
				<label for="seats">(only numeric)</label>
			</div>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"></span> <input type="text"
						pattern="^[0-9]*$" class="form-control" name="expenses"
						placeholder="Approx. Expense(per km)" required="required">
				</div>
				<label for="expenses">(only numeric)</label>
			</div>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"></span> <input type="text"
						class="form-control" name="journeyDate"
						placeholder="Date of Journey"
						required="required">
				</div>
				<label for="journeyDate">(in DD/MM/YYYY format)</label>
			</div>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"></span> <input type="text"
						class="form-control" name="journeyTime"
						placeholder="Time of Journey"
						required="required">
				</div>
				<label for="journeyTime">(in HH:MM:SS format)</label>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary btn-lg">Update</button>
			</div>
		</form>
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