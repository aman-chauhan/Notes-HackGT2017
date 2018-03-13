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
<title>${me.first_name}'s&nbsp;Image&nbsp;Upload</title>
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
						class="material-icons">home</i> My Feed <span class="sr-only">(current)</span></a>
					<a class="nav-item nav-link" href="mycourses"><i
						class="material-icons">label</i> Courses </a> <a
						class="nav-item nav-link" href="myfriends"><i
						class="material-icons">group</i> Students </a>
				</div>
				<span class="navbar-text"> ${me.email}</span>
				<form class="form-inline" action="logout" method="GET">
					<button class="btn btn-outline-danger ml-3" type="submit">Logout</button>
				</form>
			</div>
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
						<h1>Upload Image</h1>
					</div>
					<div class="card-body text-center">
						<form action="noteimage" method="POST" enctype="multipart/form-data"]>
							<div class="form-group">
								<label for="courseid">Select Course</label> <select
									class="form-control form-control-lg" id="courseid"
									name="courseid">
									<c:forEach var="course" items="${courses}">
										<option value="${course.course_id}">${course.course_id}&nbsp;-&nbsp;${course.course_name}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<label for="imageofnote">Select image from Gallery</label> <input
									type="file" class="form-control-file" id="imageofnote"
									name="imageofnote">
							</div>
							<input type="hidden" name="studentid" value="${me.student_id}">
							<button type="submit" class="btn btn-outline-primary">Submit</button>
						</form>
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