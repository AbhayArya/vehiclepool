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
<title>Signup | VehiclePool.Com</title>
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
		<form action="/Vehiclepool/SignupServlet" method="post">
			<h2>Sign Up</h2>
			<p>Please fill in this form to create an account!</p>
			<hr>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"></span> <input type="text"
						class="form-control" name="name" placeholder="Name"
						required="required">
				</div>
				
			</div>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"></span> <input type="text"
						pattern="^[0-9]*$" class="form-control" name="empId"
						placeholder="Employee ID" required="required">
				</div>
				<label for="empId">(only numeric)</label>
			</div>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"></span>
					<textarea type="text" class="form-control" name="address"
						placeholder="Address" required="required"></textarea>
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"></span> <input type="text"
						pattern="^[1-9]{1}[0-9]{9}*$" class="form-control" name="mobileno" placeholder="Contact No."
						required="required">
				</div>
				<label for="mobileno">(exactly 10 digits)</label>
			</div>
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
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary btn-lg">Sign
					Up</button>
			</div>
		</form>
		<div class="text-center">
			Already have an account? <a href="login.jsp">Login here</a>
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