<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %>
<%@ page import="com.simplilearn.beans.FlightDetails" %>
<%@ page import="com.simplilearn.dao.FlightDetailsDaoImpl" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<meta name="viewreport" content="width=device-width, initial-scale=1.0">
<title>FlyAway</title>

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
<style>
body {
	margin: 0;
	padding: 0;
	background: #fff;
	font-family: 'Raleway', sans-serif;
	color: #fff;
}
.banner {
	height: 100vh;
	width: 100%;
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
	font-weight: 500;
	letter-spacing: 2px;
}
.login {
	margin-left: 50%;
}
tr:nth-child(even) {
	background-color: #D6EEEE;
}
tr:hover {
	background-color: #D6EEEE;
}
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
</head>
<body>
<%
	if(session.getAttribute("email") == null)
		response.sendRedirect("admin-homepage.jsp");
	%>
	<div
		class="container-fluid banner justify-content-center align-items-center">
		<div class="row g-2">
			<div class="col-md-12">
				<nav class="navbar navbar-md">
					<div class="navbar-brand text-dark">
						<a href="index.jsp" class="text-decoration-none text-dark"><i
							class="fas fa-plane"></i>FlyAway</a>
					</div>
					<ul class="nav">
						<li class="nav-item"><a class="nav-link text-dark"
							href="admin-homepage.jsp"><i class="fas fa-user-cog"></i> Admin Login</a>
						</li>
					</ul>
				</nav>
			</div>
			<div class="col-md-12 text-center text-dark">
				<h2>Admin Dashboard</h2>
				<p>
					You are logged in as :
					<%= session.getAttribute("email") %>
					and password is :
					<%= session.getAttribute("password") %>
				</p>
			</div>
		</div>
		<div class="row g-2">
			<div class="col-md-12 d-flex justify-content-center m-2">
				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#flight">Add Flight</button>
				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#change">Change Password</button>
				<a href="Logout"><button class="btn btn-danger">Logout</button></a>
			</div>
		</div>
		<div class="container">
			<div class="row text-dark">
				<div class="col-md-12 mb-3">
					<p class="lead text-center m-3">Flight Table Data</p>
					<table style="width: 100%; text-align: center;">
						<tr>
							<th>Id</th>
							<th>Flight Number</th>
							<th>Airline</th>
							<th>Source</th>
							<th>Destination</th>
							<th>Date</th>
							<th>Time</th>
							<th>Ticket Price</th>
						</tr>
						<tr>
						<%
							FlightDetailsDaoImpl dao = new FlightDetailsDaoImpl();
							List<FlightDetails> flights = dao.getAllFlights();
							for(FlightDetails flight : flights)
							{
								out.print("<tr>");
								out.print("<td>"+ flight.getFlightId() + "</td>");
								out.print("<td>"+ flight.getFlightNumber() +"</td>");
								out.print("<td>"+ flight.getFlightName() +"</td>");
								out.print("<td>"+ flight.getSource() +"</td>");
								out.print("<td>"+ flight.getDestination() +"</td>");
								out.print("<td>"+ session.getAttribute("departOn") + "</td>");
								out.print("<td>"+ flight.getTime() + "</td>");
								out.print("<td>"+ flight.getPrice() +"</td>");
								out.print("</tr>");
							}
						%>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- Password Change Modal -->
	<div class="modal fade" id="change" tabindex="-1">
		<div class="modal-dialog text-dark">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="enrollLabel">Change Password</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="ChangePassword" method="POST">
						<div class="mb-3">
							<label for="email" class="col-form-label">Email:</label> <input
								type="text" class="form-control" id="email" name="email"
								required>
						</div>
						<div class="mb-3">
							<label for="newpass" class="col-form-label">New Password:</label>
							<input type="password" class="form-control" id="newpass"
								name="newpass" required>
						</div>
						<div class="mb-3">
							<label for="password" class="col-form-label">Confirm
								Password:</label> <input type="password" class="form-control"
								id="password" name="password" required>
						</div>
						<input class="btn btn-primary mb-3" type="submit" value="Change">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Add Flight Modal -->
	<div class="modal fade" id="flight" tabindex="-1">
		<div class="modal-dialog text-dark">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="enrollLabel">Add Flight</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="AddFlights" method="POST">
						<div class="mb-3">
							<label for="flightNumber" class="col-form-label">Flight
								Number:</label> <input type="text" class="form-control"
								id="flightNumber" name="flightNumber" required>
						</div>
						<div class="mb-3">
							<label for="airline" class="col-form-label">Airline:</label> <input
								type="text" class="form-control" id="airline" name="flightName"
								required>
						</div>
						<div class="mb-3">
							<label for="source" class="col-form-label">Source:</label> <input
								type="text" class="form-control" id="source" name="source"
								required>
						</div>
						<div class="mb-3">
							<label for="destination" class="col-form-label">Destination:</label>
							<input type="text" class="form-control" id="destination"
								name="destination" required>
						</div>
						<div class="mb-3">
							<label for="date" class="col-form-label">Date:</label> <input
								type="date" class="form-control" id="time" name="departOn" required>
						</div>
						<div class="mb-3">
							<label for="time" class="col-form-label">Time:</label> <input
								type="time" class="form-control" id="time" name="time" required>
						</div>
						<div class="mb-3">
							<label for="price" class="col-form-label">Price:</label> <input
								type="text" class="form-control" id="price" name="price"
								required>
						</div>
						<input class="btn btn-primary mb-3" type="submit" value="Add">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
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