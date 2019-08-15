<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

 <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Member Profile</title>
<%@ include file="css-styles.jsp"%>
</head>
<body style="padding-right: 15em; padding-left: 15em;">
	<div>
		<%@ include file="nav2.jsp"%>
	</div>
	<br>

	<h4>Welcome ${fName} ${lName}</h4>

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
				<h4 class="card-title">My Classes</h4>
				<hr>
				${courseMessage}
				<c:forEach var="course" items="${courseList}">
					Class Name: ${course}
					<div class="btn btn-primary">
						<input type="button"
							onclick="location.href='${pageContext.request.contextPath}/deselectClass/${course.id}';"
							id="signup" class="btn btn-primary btn-sm" value="Remove" />
					</div>
					<hr>
				</c:forEach>
			</div>
			<div class="btn btn-primary">
				<input type="button"
					onclick="location.href='${pageContext.request.contextPath}/classesAvailable';"
					id="signup" class="btn btn-primary" value="Available Classes" />
			</div>
		</div>

		<div class="card">
			<div class="card-body">
				<h4 class="card-title">Personal Trainers</h4>
				<hr>
				<p class="card-text">You have no personal coach appointments.</p>
			</div>
			<div class="btn btn-primary">
				<input type="button"
					onclick="location.href='${pageContext.request.contextPath}/showAllTrainers/${id}';"
					id="signup" class="btn btn-primary" value="Available Trainers" />
			</div>
		</div>
		
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">Visits History</h4>
				<hr>
				<p class="card-text">You have not visited the gym yet!
				</p>
			</div>
			<div class="btn btn-primary">
				<input type="button"
					onclick="location.href='${pageContext.request.contextPath}/showVisitsHistory/${id}';"
					id="signup" class="btn btn-primary" value="Show Visits History" />
			</div>
		</div>
	</div>
</body>
<%@ include file="footer-jsp-style.jsp"%>
</html>