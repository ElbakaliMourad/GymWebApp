<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Class</title>
<%@ include file="css-styles.jsp"%>
</head>
<body style="padding-right: 15em; padding-left: 15em;">
	<div>
		<%@ include file="nav2.jsp"%>
	</div>

	<!-- Edit Profile form -->
	<section class="signup">
		<div class="container">
			<div class="signup-content">
				<div class="signup-form">
					<h2 class="form-title">Edit Class</h2>
					<form action="${pageContext.request.contextPath}/saveClass"
						method="post">
						<div class="form-group">
							<label for="id"><i
								class="zmdi zmdi-account zmdi-confirmation-number"></i></label> <input
								type="text" name="id" id="id" value="${course.id}" disabled />
						</div>
						<div class="form-group">
							<label for="id"><i
								class="zmdi zmdi-account zmdi-confirmation-number"></i></label> <input
								type="hidden" name="id" id="id" placeholder="class Id" value="${course.id}" />
						</div>
						<div class="form-group">
							<label for="name"><i
								class="zmdi zmdi-account material-icons-name"></i></label> <input
								type="text" name="name" id="name"
								placeholder="Update Class Name" value="${course.name}" required />
						</div>
						
						<div class="form-group form-button">
							<input type="submit" name="update" id="signup"
								class="form-submit" value="Save" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
</body>
<%@ include file="footer-jsp-style.jsp"%>
</html>