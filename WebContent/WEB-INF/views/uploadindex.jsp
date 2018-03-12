<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<spring:url value="/resources/js/js-alert.js" var="alertjs" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<title>Upload - Login</title>
</head>
<body>
	<nav class="navbar fixed-top navbar-light bg-light">
		<div class="container">
			<span class="h1" class="navbar-brand">Notes</span>
		</div>
	</nav>
	<div class="container" style="margin-top: 120px;">
		<c:choose>
			<c:when test="${empty alert}">
			</c:when>
			<c:otherwise>
				<div class="alert alert-${alert.type} alert-dismissible fade show"
					role="alert">
					<strong>${alert.main} !</strong> ${alert.text}
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close" id="alertclose">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			</c:otherwise>
		</c:choose>

		<div class="row justify-content-sm-center">
			<div class="col-sm-4">
				<div class="card">
					<div class="card-header text-center">
						<h1>Login</h1>
					</div>
					<div class="card-body text-center">
						<form action="loginmobile" method="POST">
							<div class="form-group">
								<label for="inputemail">Email address</label> <input
									type="email" class="form-control form-control-lg text-center"
									name="inputemail" id="inputemail"
									placeholder="john.doe@email.com">
							</div>
							<div class="form-group">
								<label for="inputpassword">Password</label> <input
									type="password"
									class="form-control form-control-lg text-center"
									name="inputpassword" id="inputpassword" placeholder="johndoe4u">
							</div>
							<button type="submit" class="btn btn-outline-primary">Login</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<br /> <br />
		<div class="container text-center">
			Developed by <a href="https://github.com/aman-chauhan">aman-chauhan</a>
			| <a href="https://github.com/princemandlewala">priyance-mandlewala</a>
			| <a href="https://github.com/varoteamulya">amulya-varote</a> | <a
				href="https://github.com/aayushi-21">aayushi-agrawal</a><br /> With
			lots of caffeine <br /> At <a href="https://hackgt2017.devpost.com/">HackGt
				4 </a>
		</div>

		<script src="https://code.jquery.com/jquery-3.3.1.min.js"
			integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
			crossorigin="anonymous"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
			integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
			crossorigin="anonymous"></script>
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
			integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
			crossorigin="anonymous"></script>
		<script src="${alertjs}"></script>
	</div>
</body>
</html>