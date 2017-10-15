<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<spring:url value="/resources/js/js-myfeed.js" var="myfeedjs" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>${me.first_name}'sFeed</title>
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
				<a class="nav-item nav-link active" href="myfeed">My Feed <span
					class="sr-only">(current)</span></a> <a class="nav-item nav-link"
					href="mycourses">Courses</a> <a class="nav-item nav-link"
					href="myfriends">Students</a>
			</div>
			<span class="navbar-text"> ${me.email}</span>
			<form class="form-inline">
				<button class="btn btn-outline-danger ml-3" type="button">Logout</button>
			</form>
		</div>
	</div>
	</nav>
	<div class="container" style="margin-top: 80px;">
		<div class="card mb-3">
			<div class="card-body">
				<form>
					<div class="ui-widget">
						<input class="form-control form-control-lg" type="text"
							id="searchform" placeholder="Search">
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="container">
		<nav class="nav nav-tabs nav-fill" id="myTab" role="tablist"> <a
			class="nav-item nav-link active" id="nav-mynotes-tab"
			data-toggle="tab" href="#nav-mynotes" role="tab"
			aria-controls="nav-mynotes" aria-expanded="true">My Notes</a> <a
			class="nav-item nav-link" id="nav-mycourses-tab" data-toggle="tab"
			href="#nav-mycourses" role="tab" aria-controls="nav-mycourses">Feed
			from Courses</a> <a class="nav-item nav-link" id="nav-myfriends-tab"
			data-toggle="tab" href="#nav-myfriends" role="tab"
			aria-controls="nav-myfriends">Feed from Following</a> </nav>
		<div class="tab-content" id="nav-tabContent">
			<div class="tab-pane fade show active" id="nav-mynotes"
				role="tabpanel" aria-labelledby="nav-mynotes-tab">
				<c:forEach var="note" items="${notesbyme}">
					<div class="card my-2">
						<div class="card-body">
							<h4 class="card-title">
								<c:out value="${note.noteTitle}" />
							</h4>
							<h5 class="card-subtitle mb-2 text-muted">
								Uploaded to course <a href="course/${note.noteID}"><c:out
										value="${note.courseName}" /></a> for
								<c:out value="${note.noteDate}" />
							</h5>
							<p class="card-text">${note.noteContent}</p>
							<button type="button"
								class="note-like-btn btn btn-outline-success ">Like</button>
							<button type="button"
								class="note-edit-btn btn btn-outline-default ">Edit</button>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="tab-pane fade" id="nav-mycourses" role="tabpanel"
				aria-labelledby="nav-mycourses-tab">
				<c:forEach var="note" items="${notesfromcourses}">
					<div class="card my-2">
						<div class="card-body">
							<h4 class="card-title">
								<c:out value="${note.noteTitle}" />
							</h4>
							<h5 class="card-subtitle mb-2 text-muted">
								Uploaded to course <a href="course/${note.noteID}"><c:out
										value="${note.courseName}" /></a> for
								<c:out value="${note.noteDate}" /> by <a href="student/${note.studentID}"><c:out
										value="${note.firstName}"/><c:out value="${note.lastName}"/></a>
							</h5>
							<p class="card-text">${note.noteContent}</p>
							<button type="button"
								class="note-like-btn btn btn-outline-success ">Like</button>
							<button type="button"
								class="note-edit-btn btn btn-outline-default ">Edit</button>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="tab-pane fade" id="nav-myfriends" role="tabpanel"
				aria-labelledby="nav-myfriends-tab">
				<c:forEach  var="note" items="${notesfromstudents}">
					<div class="card my-2">
						<div class="card-body">
							<h4 class="card-title">
								<c:out value="${note.noteTitle}" />
							</h4>
							<h5 class="card-subtitle mb-2 text-muted">
								Uploaded to course <a href="course/${note.noteID}"><c:out
										value="${note.courseName}" /></a> for
								<c:out value="${note.noteDate}" /> by <a href="student/${note.studentID}"><c:out
										value="${note.firstName}"/><c:out value="${note.lastName}"/></a>
							</h5>
							<p class="card-text">${note.noteContent}</p>
							<button type="button"
								class="note-like-btn btn btn-outline-success ">Like</button>
							<button type="button"
								class="note-edit-btn btn btn-outline-default ">Edit</button>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
		integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
		integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="${myfeedjs}"></script>
</body>
</html>