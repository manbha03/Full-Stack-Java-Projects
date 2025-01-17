<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %>
<%@ page import="com.simplilearn.beans.FlightDetails" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout</title>

   <link rel="stylesheet" type="text/css"
        href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<link
	href="https://fonts.googleapis.com/css?family=Raleway&display=swap"
	rel="stylesheet" />
<script src="https://kit.fontawesome.com/92e9dde9ec.js"
	crossorigin="anonymous"></script>
<style>
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
<% 	List<FlightDetails> flights = (List<FlightDetails>) session.getAttribute("flights"); 
						for(FlightDetails flight : flights){
							session.setAttribute("price", flight.getPrice());
							session.setAttribute("flightNumber", flight.getFlightNumber());
							session.setAttribute("airline", flight.getFlightName());
						}
						Integer n = Integer.parseInt((String)session.getAttribute("travellers"));
						Integer p = Integer.parseInt((String)session.getAttribute("price"));
						Integer total = n*p;
						session.setAttribute("total", total);
					%>
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
		<div class="col-md-2 booking d-flex flex-column">
			<div class="card bg-secondary">
				<div class="card-header">Ticket Details</div>
				<div class="card-body">
					<h5 class="card-title">From <%= session.getAttribute("source") %> to <%= session.getAttribute("destination") %></h5>
					<p class="card-text">No. of Traveller(s): <%= session.getAttribute("travellers") %></p>
				</div>
			</div>
			<br>
			<div class="col-md-12 bg-secondary" style="width: 100%;">
				<p class="mt-3">Card details:</p>
				<form name="contact-form" action="CardDetails" method="post">
					<div class="mb-3">
						<label for="cardname" class="col-form-label">Name:</label> <input
							type="text" class="form-control" id="cardname" name="cardname" required>
					</div>
					<div class="mb-3">
						<label for="card-num" class="col-form-label">Card Number:</label>
						<input type="number" class="form-control" id="card-num" name="cardnum" required>
					</div>
					<div>
					<p>Total: <%= session.getAttribute("travellers") %> x <%= session.getAttribute("price") %> = Rs. <%= total %></p>
					</div>
					<input type="submit" class="btn btn-primary mb-3" value="Confirm">				
				</form>
			</div>
		</div>
		<div class="col-md-4">
			<img src="./img/background.jpg" alt="journey" style="height: 80vh;">
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