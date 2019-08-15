<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Member Classes</title>
<%@ include file="css-styles.jsp"%>
</head>
<body style="padding-right: 15em; padding-left: 15em;">
	<div>
		<%@ include file="nav2.jsp"%>
	</div>
	<br>

	<div class="card-group">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">Available classes</h4>
				<div>
					<p>${messageResult}</p>
					<hr>
				</div>
				<c:forEach var="course" items="${courseList}">
					<pre>Id:         ${course.id}</pre>
					<pre>Class Name: ${course.name}</pre>
					<button type="button" class="btn btn-primary btn-sm"
						onclick="location.href='${pageContext.request.contextPath}/addClass/${course.id}';"
						value="Update">Add to my Classes List</button>

					<%-- <input type="button" class="btn btn-primary btn-sm" onclick="location.href='${pageContext.request.contextPath}/addClass/${course.id}';" value="Add" />	--%>
					<hr>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
<%@ include file="footer-jsp-style.jsp"%>
</html>