<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<meta name="viewreport" content="width=device-width, initial-scale=1.0">
<title>Traveller Details</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<link
	href="https://fonts.googleapis.com/css?family=Raleway&display=swap"
	rel="stylesheet" />
<script src="https://kit.fontawesome.com/92e9dde9ec.js"
	crossorigin="anonymous"></script>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	background: #fff;
	font-family: 'Raleway', sans-serif;
	color: #fff;
	height: 100vh;
}
.banner .navbar {
	margin-top: 2%;
}
.banner .navbar-brand {
	color: #fff;
	font-size: 1.8em;
	font-weight: 700;
	margin-left: 7%;
}
.banner .nav {
	margin-right: 7%;
}
.banner .nav li a {
	color: #aaa;
	font-size: 1.5em;
}
.banner p {
	font-size: 2em;
	font-weight: 500;
	letter-spacing: 2px;
}
.booking {
	margin-left: 8%;
	margin-bottom: 2%;
	border-radius: 5px;
}
</style>
</head>
<body>
	<div class="container-fluid banner">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-md">
					<div class="navbar-brand text-dark">
						<a href="book-flight.jsp" class="text-decoration-none text-dark"><i class="fas fa-plane"></i>FlyAway</a>
					</div>
				</nav>
			</div>
			<div class="col-md-12">
				<h2 class="text-center text-dark">FlyAway Ticket Booking</h2>
			</div>
		</div>
	</div>
	<div class="row align-items-center" style="width: 100%;">
		<div class="col-md-2 bg-secondary booking">
			<p class="mt-3">Traveller details:</p>
			<form name="contact-form" action="TravellerDetails" method="post">
				<div class="mb-3">
					<label for="pname" class="col-form-label">Name:</label> <input
						type="text" class="form-control" id="pname" name="pname" required>
				</div>
				<div class="mb-3">
					<label for="pemail" class="col-form-label">Email:</label> <input
						type="text" class="form-control" id="pemail" name="pemail" required>
				</div>
				<div class="mb-3">
					<label for="phone" class="col-form-label">Phone:</label> <input
						type="number" class="form-control" id="phone" name="phone" required>
				</div>
					<input type="submit" class="btn btn-primary mb-3" value="Submit">					
			</form>
		</div>
		<div class="col-md-4">
			<img src="./assets/booking.svg" alt="">
		</div>
	</div>
	<footer class="bg-light text-center text-lg-start">
  <!-- Copyright -->
  <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
    � 2022 Copyright:
    <a class="text-dark" href="https://mdbootstrap.com/">Developed by Dakamanbha Ryngkhlem</a>
  </div>
  <!-- Copyright -->
</footer>
</body>
</html>