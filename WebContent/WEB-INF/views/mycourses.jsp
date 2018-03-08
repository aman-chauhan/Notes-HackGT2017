<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<title>${me.first_name}'s&nbsp;Courses</title>
</head>
<body>

	<nav class="navbar navbar-expand-lg fixed-top navbar-light bg-light">
	<div class="container">
		<span class="h1" class="navbar-brand">Notes</span>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarmenu" aria-controls="navbarmenu"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarmenu">
			<div class="navbar-nav ml-3 mr-auto">
				<a class="nav-item nav-link" href="myfeed"><i
					class="material-icons">home</i> My Feed </a> <a
					class="nav-item nav-link active" href="mycourses"><i
					class="material-icons">label</i> Courses <span class="sr-only">(current)</span></a>
				<a class="nav-item nav-link" href="myfriends"><i
					class="material-icons">group</i> Students </a>
			</div>
			<span class="navbar-text"> ${me.email}</span>
			<form class="form-inline" action="logout" method="GET">
				<button class="btn btn-outline-danger ml-3" type="submit">Logout</button>
			</form>
		</div>
	</div>
	</nav>

	<div class="container" style="margin-top: 95px;" id="clistcontainer">
		<h1 class="display-4">Courses I Follow</h1>
		<div class="card my-2">
			<div class="card-body">
				<h4 class="card-title">Course Name</h4>
				<button type="button" class="btn btn-outline-primary ">View</button>
			</div>
		</div>
		<div class="card my-2">
			<div class="card-body">
				<h4 class="card-title">Course Name</h4>
				<button type="button" class="btn btn-outline-primary ">View</button>
			</div>
		</div>
		<div class="card my-2">
			<div class="card-body">
				<h4 class="card-title">Course Name</h4>
				<button type="button" class="btn btn-outline-primary ">View</button>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>