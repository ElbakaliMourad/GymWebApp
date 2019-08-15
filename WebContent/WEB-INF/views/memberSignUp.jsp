<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Member Registration</title>
<%@ include file="css-styles.jsp"%>
</head>
<body style="padding-right: 15em; padding-left: 15em;">
	<div>
		<%@ include file="nav.jsp"%>
	</div>
	<!-- Sign up form -->
	<section class="sign-up">
		<div class="container">
			<div class="signup-content">
				<div class="signup-form">
					<h2 class="form-title">Sign up</h2>
					<form action="addMember" method="POST" class="register-form"
						id="register-form">

						<div class="form-group">
							<label for="id"><i class="fas fa-id-card"></i></label> <input
								type="number" name="id" id="id" placeholder="Your Membership Id"
								required />
						</div>
						<div class="form-group">
							<label for="fName"><i class="fas fa-user"></i></label> 
								<input type="text" name="fName" id="name" placeholder="Your First Name" required />
						</div>
						<div class="form-group">
							<label for="lName"><i class="fas fa-user"></i></label> <input
								type="text" name="lName" id="name" placeholder="Your Last Name"
								required />
						</div>
						<div class="form-group">
							<label for="email"><i class="fas fa-at"></i></label> <input
								type="email" name="email" id="email" placeholder="Your Email"
								required />
						</div>
						<div class="form-group">
							<label for="pass"><i class="fas fa-lock"></i></label> <input
								type="password" name="pass" id="pass" placeholder="Password"
								required />
						</div>

						<div class="form-group">
							<label for="re-pass"><i class="fas fa-lock"></i></label>
							<input type="password" name="confirm_password"
								id="confirm_password" placeholder="Repeat your password"
								required />
						</div>

						<div class="form-group form-button">
							<input type="submit" name="signup" id="signup"
								class="form-submit" value="Register" /> <input type="reset"
								name="reset" id="signup" class="form-submit" value="Reset">
						</div>
					</form>
				</div>
				<div class="signup-image">
					<figure>
						<img src="resources/images/signup-image.jpg" alt="sign in image">
					</figure>
					<a href="${pageContext.request.contextPath}/logIn" style="text-decoration: none; border-bottom: 1px solid blue;">I am already member</a>
				</div>
			</div>
		</div>
	</section>
</body>
<%@ include file="footer-jsp-style.jsp"%>
</html>