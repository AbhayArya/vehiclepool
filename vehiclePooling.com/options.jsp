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
<title>Select A Option | VehiclePool.Com</title>
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
		<form action="#" method="get">
			<div class="form-group" align="center">
				<a href="vehicleRegister.jsp"><img src="attachments/op1.png">
					<h4>Offer A Ride</h4></a>
			</div>
			<hr>
			<div class="form-group" align="center">
				<a href="findARide.jsp"><img src="attachments/op2.png">
					<h4>Find A Ride</h4></a>
			</div>
			<hr>
			<div class="form-group" align="center">
				<a href="status.jsp"><img src="attachments/op3.png">
					<h4>Check My Status</h4></a>
			</div>
		</form>
	</div>
	<br> <br>
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