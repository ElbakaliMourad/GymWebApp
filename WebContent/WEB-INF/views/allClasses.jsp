<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Classes</title>
<%@ include file="css-styles.jsp"%>
</head>
<body style="padding-right: 15em; padding-left: 15em;">
	<div>
		<%@ include file="nav-Admin.jsp"%>
	</div>
	<br>

	<div class="card-group">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">Available classes</h4>
				<div>
					<p>${courseMessage}</p>
					<hr>
				</div>
				<c:forEach var="course" items="${courseList}">
					Id:         ${course.id} <br>
					Class Name: ${course.name} <br>

				<button type="button" class="btn btn-primary btn-sm" 
				onclick="location.href='${pageContext.request.contextPath}/updateClasses/${course.id}';" value="Update"
				>Update</button>
				<button type="button" class="btn btn-secondary btn-sm" 
				onclick="location.href='${pageContext.request.contextPath}/removeClass/${course.id}';" value="Delete"
				>Delete</button>
				<button type="button" class="btn btn-primary btn-sm" 
				onclick="location.href='${pageContext.request.contextPath}/showClassActivity/${course.id}';" value="Activity"
				>Show Class Activity</button>
					<hr>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
<%@ include file="footer-jsp-style.jsp"%>
</html>