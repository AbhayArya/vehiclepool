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
<title>Login | VehiclePool.Com</title>
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
		</div>
	</nav>
	<div class="signup-form">
		<form action="/Vehiclepool/LoginServlet" method="post">
			<h2>Log In</h2>
			<hr>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"></span> <input type="email"
						class="form-control" name="email" placeholder="Email Address"
						required="required">
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"></span> <input type="password"
						class="form-control" name="password" placeholder="Password"
						required="required">
				</div>
				<font color="red">${requestScope.msg}</font>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary btn-lg">Log In</button>
			</div>
		</form>
		<div class="text-center">
			New User? <a href="signup.jsp">Signup here</a>
		</div>
	</div>
	<br>
	<br>
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