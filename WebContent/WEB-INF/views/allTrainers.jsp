<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Trainers</title>
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
				<h4 class="card-title">All Trainers</h4>
				<div>
					<hr>
				</div>
				<c:forEach var="trainer" items="${trainerList}">
					Id:         ${trainer.id} <br>
					Trainer Name: ${trainer.name} <br>

				<button type="button" class="btn btn-primary btn-sm" 
				onclick="location.href='${pageContext.request.contextPath}/updateTrainer/${trainer.id}';" value="Update"
				>Update</button>
				<button type="button" class="btn btn-secondary btn-sm" 
				onclick="location.href='${pageContext.request.contextPath}/removeTrainer/${trainer.id}';" value="Delete"
				>Delete</button>
				<button type="button" class="btn btn-primary btn-sm" 
				onclick="location.href='${pageContext.request.contextPath}/showTrainerActivity/${trainer.id}';" value="Activity"
				>Show Trainer Activity</button>

					<hr>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
<%@ include file="footer-jsp-style.jsp"%>
</html>