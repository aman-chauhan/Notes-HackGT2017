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
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">
<title>${me.first_name}'sFriends</title>
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

	<div class="container" style="margin-top: 80px;" id="clistcontainer">
		<h1 class="display-4 mb-3">Students I Follow/Who Follow Me</h1>
		<nav class="nav nav-tabs nav-fill" id="myTab" role="tablist"> <a
			class="nav-item nav-link active" id="nav-ifollow-tab"
			data-toggle="tab" href="#nav-ifollow" role="tab"
			aria-controls="nav-ifollow" aria-expanded="true">Who I Follow</a> <a
			class="nav-item nav-link" id="nav-followme-tab" data-toggle="tab"
			href="#nav-followme" role="tab" aria-controls="nav-followme">Who
			Follow Me</a> </nav>
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
						<button type="button" class="btn btn-outline-info ">Follow Back</button>
					</div>
				</div>
				<div class="card my-2">
					<div class="card-body">
						<h4 class="card-title">Student Name</h4>
						<h6 class="card-subtitle mb-2 text-muted">Student Email</h6>
						<button type="button" class="btn btn-outline-primary ">View</button>
						<button type="button" class="btn btn-outline-info ">Follow Back</button>
					</div>
				</div>
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
</body>
</html>