<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<title>${me.first_name}'s&nbsp;Courses</title>
</head>
<body>

	<nav class="navbar navbar-expand-lg fixed-top navbar-light bg-light">
		<div class="container">
			<span class="h1">Notes</span>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarmenu" aria-controls="navbarmenu"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse ml-3" id="navbarmenu">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link" href="myfeed"><i
							class="material-icons align-top">home</i> My Feed </a></li>
					<li class="nav-item active"><a class="nav-link"
						href="mycourses"><i class="material-icons align-top">collections_bookmark</i>
							Courses </a></li>
					<li class="nav-item"><a class="nav-link" href="myfriends"><i
							class="material-icons align-top">group</i> Students </a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="createNoteDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"><i class="material-icons align-top">create</i>
							Create Note </a>
						<div class="dropdown-menu" aria-labelledby="createNoteDropdown">
							<a class="dropdown-item" href="uploadfromtext"><i
								class="material-icons align-top">text_fields</i> From Text </a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="uploadfromimage"><i
								class="material-icons align-top">add_a_photo</i> From Image </a>
						</div></li>
				</ul>
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
		<h1 class="display-4">Courses I Follow</h1>
		<div class="row">
			<c:forEach var="course" items="${courselist}">
				<div class="col-sm-3">
					<div class="card bg-light">
						<div class="card-body">
							<h4 class="card-title">
								<c:out value="${course.course_name}" />
							</h4>
							<a href="course/${course.course_id}" role="button"
								class="btn btn-primary">View</a>
						</div>
					</div>
				</div>
			</c:forEach>
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