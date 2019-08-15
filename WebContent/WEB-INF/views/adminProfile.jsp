<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Profile</title>
<%@ include file="css-styles.jsp"%>
</head>
<body style="padding-right: 15em; padding-left: 15em;">
	<div>
		<%@ include file="nav-Admin.jsp"%>
	</div>
	<br>

	<h4>Welcome ${role}</h4>

	<div class="card-group">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">My Profile</h4>
				<hr>
				<pre>Id:         ${id}</pre>
				<hr>
				<pre>First Name: ${fName}</pre>
				<hr>
				<pre>Last Name:  ${lName}</pre>
				<hr>
				<pre>Email:      ${email}</pre>
				<hr>
				<pre>Password:   ***********</pre>
				<hr>
				<pre>Role:       ${role}</pre>
			</div>
			<div class="btn btn-primary">
				<input type="button"
					onclick="location.href='${pageContext.request.contextPath}/updateProfile/${id}';"
					id="signup" class="btn btn-primary" value="Update Profile" />
			</div>
		</div>

		<div class="card">
			<div class="card-body">
				<h4 class="card-title">Classes</h4>
				<hr>
				<p class="card-text">Click on Available Classes to edit and update Classes list</p>
				
			</div>
			<div class="btn btn-primary">
				<input type="button"
					onclick="location.href='${pageContext.request.contextPath}/createClass';"
					id="signup" class="btn btn-primary" value="Add New Classes" />
			</div>

		</div>

		<div class="card">
			<div class="card-body">
				<h4 class="card-title">Trainers</h4>
				<hr>
				<p class="card-text">Click on Available Trainers to edit and
					update Trainers list.</p>
			</div>
			<div class="btn btn-primary">
				<input type="button"
					onclick="location.href='${pageContext.request.contextPath}/addNewTrainers/${id}';"
					id="signup" class="btn btn-primary" value="Add New Trainers" />
			</div>
		</div>
	</div>
</body>
<%@ include file="footer-jsp-style.jsp"%>
</html>