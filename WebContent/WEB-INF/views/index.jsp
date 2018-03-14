<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<spring:url value="/resources/js/js-index.js" var="indexjs" />
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
<title>Notes</title>
</head>
<body>
	<nav class="navbar fixed-top navbar-light bg-light">
		<div class="container">
			<span class="h1">Notes</span>
			<form class="form-inline" action="login" method="POST">
				<input id="loginemail" name="loginemail" class="form-control mx-1"
					type="email" placeholder="Email-ID" aria-label="EMail"> <input
					id="loginpassword" name="loginpassword" class="form-control mx-1"
					type="password" placeholder="Password" aria-label="Password">
				<button class="btn btn-outline-primary mx-1" type="submit">Login
				</button>
			</form>
		</div>
	</nav>

	<div class="container" style="margin-top: 95px;">
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
		<div class="jumbotron">
			<div class="row align-items-center">
				<div class="col-sm-8">
					<h1 id="trgt" class="display-4 text-center">Sign Up</h1>
					<h3 id="msg" class="text-center hidden"></h3>
				</div>
				<div class="col-sm-4 align-items-center">
					<div class="form-group">
						<label for="inputfirstname">First Name</label> <input type="text"
							class="form-control" id="inputfirstname" placeholder="John">
					</div>
					<div class="form-group">
						<label for="inputlastname">Last Name</label> <input type="text"
							class="form-control" id="inputlastname" placeholder="Doe">
					</div>
					<div class="form-group">
						<label for="inputemail">Email ID</label> <input type="email"
							class="form-control" id="inputemail" aria-describedby="emailHelp"
							placeholder="john.doe@email.com">
					</div>
					<div class="form-group">
						<label for="inputpassword">Password</label> <input type="password"
							class="form-control" id="inputpassword">
					</div>
					<div class="form-group">
						<label for="repassword">Retype Password</label> <input
							type="password" class="form-control" id="repassword">
					</div>
					<button id="submit-signup" type="submit" class="btn btn-primary">Sign
						Up</button>
				</div>
			</div>
		</div>
	</div>

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
	<script src="${indexjs}"></script>
	<script src="${alertjs}"></script>
</body>
</html>