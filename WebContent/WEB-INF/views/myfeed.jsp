<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<spring:url value="/resources/js/js-myfeed.js" var="myfeedjs" />
<spring:url value="/resources/js/js-alert.js" var="alertjs" />
<spring:url value="/resources/accountProfile.png" var="profilepic" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<title>${me.first_name}'s&nbsp;Feed</title>
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
					<li class="nav-item active"><a class="nav-link" href="myfeed"><i
							class="material-icons align-top">home</i> My Feed </a></li>
					<li class="nav-item"><a class="nav-link" href="mycourses"><i
							class="material-icons align-top">collections_bookmark</i> Courses
					</a></li>
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
		<div class="row">
			<div class="col-md-3" style="text-align: center;">
				<div class="card">
					<img class="card-img-top" src="${profilepic}" alt="Profile Pic">
					<div class="card-body">
						<h3 class="card-title">${me.first_name}&nbsp;${me.last_name}</h3>
						<p class="card-text">"I am only Human."</p>
					</div>
				</div>
			</div>
			<div class="col-md-9">
				<div class="card mb-3">
					<div class="card-body">
						<form>
							<input class="form-control form-control-lg text-center"
								type="text" id="searchform" placeholder="Search">
						</form>
					</div>
				</div>
				<div class="card">
					<div class="card-header">
						<nav class="nav nav-tabs nav-fill card-header-tabs" id="myTab"
							role="tablist">
							<a class="nav-item nav-link active" id="nav-mynotes-tab"
								data-toggle="tab" href="#nav-mynotes" role="tab"
								aria-controls="nav-mynotes" aria-expanded="true">My Notes</a> <a
								class="nav-item nav-link" id="nav-mycourses-tab"
								data-toggle="tab" href="#nav-mycourses" role="tab"
								aria-controls="nav-mycourses">Feed from Courses</a> <a
								class="nav-item nav-link" id="nav-myfriends-tab"
								data-toggle="tab" href="#nav-myfriends" role="tab"
								aria-controls="nav-myfriends">Feed from Following</a> <a
								class="nav-item nav-link" id="nav-mytempnotes-tab"
								data-toggle="tab" href="#nav-mytempnotes" role="tab"
								aria-controls="nav-mytempnotes">Image Drafts <span
								class="badge badge-dark align-top"><c:out
										value="${fn:length(mydrafts)}" /></span></a>
						</nav>
					</div>
					<div class="card-body">
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
												Uploaded to course <a href="course/${note.courseID}"><c:out
														value="${note.courseName}" /></a> for
												<c:out value="${note.noteDate}" />
											</h5>
											<div class="mb-2 collapse"
												id="myfeed-card-text-${note.noteID}">
												<p class="card-text">${note.noteContent}</p>
											</div>
											<button type="button"
												class="note-view-btn btn btn-outline-primary"
												data-toggle="collapse"
												data-target="#myfeed-card-text-${note.noteID}"
												aria-expanded="false"
												aria-controls="myfeed-card-text-${note.noteID}">
												<i class="material-icons align-top">fullscreen</i> View
											</button>
											<div class="modal fade" id="myfeed-edit-note-${note.noteID}"
												tabindex="-1" role="dialog"
												aria-labelledby="myfeed-edit-note-${note.noteID}"
												aria-hidden="true">
												<div class="modal-dialog modal-dialog-centered modal-lg"
													role="document">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="exampleModalLabel">Edit
																Note</h5>
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<form action="edit/note/${note.noteID}" method="POST">
															<div class="modal-body">
																<div class="form-group">
																	<input type="text" class="form-control form-control-lg"
																		id="edit-title-${note.noteID}" name="noteTitle"
																		value="${note.noteTitle}">
																</div>
																<div class="form-group">
																	<div class="row">
																		<div class="col-sm">
																			<select class="form-control"
																				id="edit-courseid-${note.noteID}" name="courseID">
																				<c:forEach var="course" items="${courselist}">
																					<c:choose>
																						<c:when test="${course.course_id==note.courseID}">
																							<option selected value="${course.course_id}">${course.course_id}&nbsp;-&nbsp;${course.course_name}</option>
																						</c:when>
																						<c:otherwise>
																							<option value="${course.course_id}">${course.course_id}&nbsp;-&nbsp;${course.course_name}</option>
																						</c:otherwise>
																					</c:choose>
																				</c:forEach>
																			</select>
																		</div>
																		<div class="col-sm">
																			<input type="date" class="form-control"
																				id="edit-date-${note.noteID}" name="noteDate"
																				value="${note.noteDate}">
																		</div>
																	</div>
																</div>
																<div class="form-group">
																	<textarea class="form-control" name="noteContent"
																		rows="10" cols="10">${note.noteContent}</textarea>
																</div>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-outline-secondary"
																	data-dismiss="modal">Close</button>
																<button type="submit"
																	class="note-submit-btn btn btn-outline-success">
																	<i class="material-icons align-top">publish</i> Save
																</button>
															</div>
														</form>
													</div>
												</div>
											</div>
											<button type="button"
												class="note-edit-btn btn btn-outline-warning"
												data-toggle="modal"
												data-target="#myfeed-edit-note-${note.noteID}">
												<i class="material-icons align-top">edit</i> Edit
											</button>
											<button type="button"
												class="note-delete-btn btn btn-outline-danger ">
												<i class="material-icons align-top">delete</i> Delete
											</button>
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
												Uploaded to course <a href="course/${note.courseID}"><c:out
														value="${note.courseName}" /></a> for
												<c:out value="${note.noteDate}" />
												by <a href="student/${note.studentID}"><c:out
														value="${note.firstName}" /> <c:out
														value="${note.lastName}" /></a>
											</h5>
											<div class="mb-2 collapse"
												id="mycourses-card-text-${note.noteID}">
												<p class="card-text">${note.noteContent}</p>
											</div>
											<button type="button"
												class="note-view-btn btn btn-outline-primary"
												data-toggle="collapse"
												data-target="#mycourses-card-text-${note.noteID}"
												aria-expanded="false"
												aria-controls="mycourses-card-text-${note.noteID}">
												<i class="material-icons align-top">fullscreen</i> View
											</button>
											<button type="button"
												class="note-like-btn btn btn-outline-success">
												<i class="material-icons align-top">thumb_up</i> Like
											</button>
											<c:if test="${note.studentID==me.student_id}">
												<button type="button"
													class="note-edit-btn btn btn-outline-warning ">
													<i class="material-icons align-top">edit</i> Edit
												</button>
											</c:if>
										</div>
									</div>
								</c:forEach>
							</div>
							<div class="tab-pane fade" id="nav-myfriends" role="tabpanel"
								aria-labelledby="nav-myfriends-tab">
								<c:forEach var="note" items="${notesfromstudents}">
									<div class="card my-2">
										<div class="card-body">
											<h4 class="card-title">
												<c:out value="${note.noteTitle}" />
											</h4>
											<h5 class="card-subtitle mb-2 text-muted">
												Uploaded to course <a href="course/${note.courseID}"><c:out
														value="${note.courseName}" /></a> for
												<c:out value="${note.noteDate}" />
												by <a href="student/${note.studentID}"><c:out
														value="${note.firstName}" /> <c:out
														value="${note.lastName}" /></a>
											</h5>
											<div class="mb-2 collapse"
												id="myfriends-card-text-${note.noteID}">
												<p class="card-text">${note.noteContent}</p>
											</div>
											<button type="button"
												class="note-view-btn btn btn-outline-primary"
												data-toggle="collapse"
												data-target="#myfriends-card-text-${note.noteID}"
												aria-expanded="false"
												aria-controls="myfriends-card-text-${note.noteID}">
												<i class="material-icons align-top">fullscreen</i> View
											</button>
											<button type="button"
												class="note-like-btn btn btn-outline-success">
												<i class="material-icons align-top">thumb_up</i> Like
											</button>
										</div>
									</div>
								</c:forEach>
							</div>
							<div class="tab-pane fade" id="nav-mytempnotes" role="tabpanel"
								aria-labelledby="nav-mytempnotes-tab">
								<c:forEach var="note" items="${mydrafts}">
									<div class="card my-2">
										<div class="card-body">
											<form action="submit/note/${note.noteID}" method="POST">
												<div class="card-title form-group h4">
													<input type="text" class="form-control form-control-lg"
														id="card-title-${note.noteID}" name="noteTitle"
														value="${note.noteTitle}">
												</div>
												<h5 class="card-subtitle mb-2 text-muted">
													Uploaded to course <a href="course/${note.courseID}"><c:out
															value="${note.courseName}" /></a> for <input type="date"
														class="form-control" id="card-date-${note.noteID}"
														name="noteDate" value="${note.noteDate}">
												</h5>
												<div class="form-group card-text">
													<textarea class="form-control" name="noteContent" rows="10"
														cols="10">${note.noteContent}</textarea>
												</div>
												<button type="submit"
													class="note-submit-btn btn btn-outline-success">
													<i class="material-icons align-top">cloud_upload</i> Submit
												</button>
												<button type="button"
													class="note-delete-btn btn btn-outline-danger ">
													<i class="material-icons align-top">delete</i> Delete
												</button>
											</form>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
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
	<script src="${myfeedjs}"></script>
	<script src="${alertjs}"></script>
</body>
</html>