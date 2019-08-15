<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
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
					<h2 class="form-title">Edit Profile</h2>
					<form action="${pageContext.request.contextPath}/saveProfile"
						method="post">
						<div class="form-group">
							<label for="id"><i
								class="zmdi zmdi-account zmdi-confirmation-number"></i></label> <input
								type="text" name="id" id="id" placeholder="Your Membership Id"
								value=${member.id}
								disabled />
						</div>
						<div class="form-group">
							<label for="id"><i
								class="zmdi zmdi-account zmdi-confirmation-number"></i></label> <input
								type="hidden" name="id" id="id" placeholder="Your Membership Id" value=${member.id}
								 />
						</div>
						<div class="form-group">
							<label for="fName"><i
								class="zmdi zmdi-account material-icons-name"></i></label> <input
								type="text" name="fName" id="name"
								placeholder="Update First Name" value=${member.fName} />
						</div>
						<div class="form-group">
							<label for="lName"><i
								class="zmdi zmdi-account material-icons-name"></i></label> <input
								type="text" name="lName" id="name"
								placeholder="Update Last Name" value=${member.lName} />
						</div>
						<div class="form-group">
							<label for="email"><i class="zmdi zmdi-email"></i></label> <input
								type="email" name="email" id="email" placeholder="Update Email"
								value=${member.email} />
						</div>
						<div class="form-group">
							<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
								type="hidden" name="pass" id="pass"
								placeholder="Enter new Password" value=${member.pass} />
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