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
<title>${me.first_name}'s&nbsp;Friends</title>
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
						class="nav-item nav-link" href="mycourses"><i
						class="material-icons">label</i> Courses </a> <a
						class="nav-item nav-link active " href="myfriends"><i
						class="material-icons">group</i> Students <span class="sr-only">(current)</span></a>
				</div>
				<span class="navbar-text"> ${me.email}</span>
				<form class="form-inline" action="logout" method="GET">
					<button class="btn btn-outline-danger ml-3" type="submit">Logout</button>
				</form>
			</div>
		</div>
	</nav>

	<div class="container" style="margin-top: 95px;" id="clistcontainer">
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
		<h1 class="display-4 mb-3">Students I Follow/Who Follow Me</h1>
		<nav class="nav nav-tabs nav-fill" id="myTab" role="tablist">
			<a class="nav-item nav-link active" id="nav-ifollow-tab"
				data-toggle="tab" href="#nav-ifollow" role="tab"
				aria-controls="nav-ifollow" aria-expanded="true">Who I Follow</a> <a
				class="nav-item nav-link" id="nav-followme-tab" data-toggle="tab"
				href="#nav-followme" role="tab" aria-controls="nav-followme">Who
				Follow Me</a>
		</nav>
		<div class="tab-content" id="nav-tabContent">
			<div class="tab-pane fade show active" id="nav-ifollow"
				role="tabpanel" aria-labelledby="nav-ifollow-tab">
				<div class="card my-2">
					<div class="card-body">
						<h4 class="card-title">Student Name</h4>
						<h6 class="card-subtitle mb-2 text-muted">Student Email</h6>
						<button type="button" class="btn btn-outline-primary ">View</button>
					</div>
				</div>
				<div class="card my-2">
					<div class="card-body">
						<h4 class="card-title">Student Name</h4>
						<h6 class="card-subtitle mb-2 text-muted">Student Email</h6>
						<button type="button" class="btn btn-outline-primary ">View</button>
					</div>
				</div>
			</div>
			<div class="tab-pane fade" id="nav-followme" role="tabpanel"
				aria-labelledby="nav-followme-tab">
				<div class="card my-2">
					<div class="card-body">
						<h4 class="card-title">Student Name</h4>
						<h6 class="card-subtitle mb-2 text-muted">Student Email</h6>
						<button type="button" class="btn btn-outline-primary ">View</button>
						<button type="button" class="btn btn-outline-info ">Follow
							Back</button>
					</div>
				</div>
				<div class="card my-2">
					<div class="card-body">
						<h4 class="card-title">Student Name</h4>
						<h6 class="card-subtitle mb-2 text-muted">Student Email</h6>
						<button type="button" class="btn btn-outline-primary ">View</button>
						<button type="button" class="btn btn-outline-info ">Follow
							Back</button>
					</div>
				</div>
			</div>
		</div>
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
</body>
</html>