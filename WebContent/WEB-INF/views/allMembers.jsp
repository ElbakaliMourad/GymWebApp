<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Members</title>
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
				<h4 class="card-title">All Members</h4>
				<div>
					<p>${messageResult}</p>
					<hr>
				</div>
				<c:forEach var="member" items="${memberList}">
					Id:         ${member.id} <br>
					First Name: ${member.fName} <br>
					Last Name: ${member.lName} <br>

					<button type="button" class="btn btn-primary btn-sm"
						onclick="location.href='${pageContext.request.contextPath}/updateMember/${trainer.id}';"
						value="Update">Update</button>
					<button type="button" class="btn btn-secondary btn-sm"
						onclick="location.href='${pageContext.request.contextPath}/removeMember/${trainer.id}';"
						value="Delete">Delete</button>
					<button type="button" class="btn btn-primary btn-sm"
						onclick="location.href='${pageContext.request.contextPath}/showMemberActivity/${trainer.id}';"
						value="Activity">Show Member Activity</button>
					<hr>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
<%@ include file="footer-jsp-style.jsp"%>
</html>