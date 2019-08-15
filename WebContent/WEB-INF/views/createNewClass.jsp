<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create New Class</title>
<%@ include file="css-styles.jsp"%>
</head>
<body style="padding-right: 15em; padding-left: 15em;">
	<div>
		<%@ include file="nav-Admin.jsp"%>
	</div>
	
		<!-- Create Class Form -->
	<section class="signup">
		<div class="container">
			<div class="signup-content">
				<div class="signup-form">
					<h2 class="form-title">Create Class</h2>
					<form action="${pageContext.request.contextPath}/addClass"
						method="post">
						<div class="form-group">
							<label for="id"><i class="zmdi zmdi-account zmdi-confirmation-number"></i></label> 
								<input type="number" name="id" id="id" placeholder="Enter Class id number" required />
						</div>

						<div class="form-group">
							<label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label> 
							<input type="text" name="name" id="name" placeholder="Enter Class Name" required />
						</div>
						
						<div class="form-group form-button">
							<input type="submit" name="Save" id="signup"
								class="form-submit" value="Save" />
		   					<input type="reset" id="signup"	class="form-submit" value="Reset">
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
</body>
<%@ include file="footer-jsp-style.jsp"%>

</html>