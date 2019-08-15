<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Member Login</title>
<%@ include file="css-styles.jsp"%>
</head>
<body style="padding-right: 15em; padding-left: 15em;">
	<div>
		<%@ include file="nav.jsp"%>
	</div>
	<!-- Sing in  Form -->
	<section class="sign-in">
		<div class="container">
			<div class="signin-content">
				<div class="signin-image">
					<figure>
						<img src="resources/images/signin-image.jpg" alt="sing up image">
					</figure>
					<a href="${pageContext.request.contextPath}/signUp" style="text-decoration: none; border-bottom: 1px solid blue;">Create an account</a>
				</div>
				<div class="signin-form">
					<p style="color: red;">${viewMessage}</p>
					<p style="color: red;">${registrationMessage}</p>					
					<h2 class="form-title">Sign in</h2>
					<form action="myform" method="POST" class="register-form"
						id="login-form">
						<div class="form-group">
							<label for="your_name"><i class="fas fa-id-card"></i></label> <input
								type="number" name="id" placeholder="Your id"
								id="your_name" required />
						</div>
						<div class="form-group">
							<label for="your_pass"><i class="fas fa-unlock-alt"></i></label> <input
								type="password" name="password" id="your_pass"
								placeholder="Password" required />
						</div>
						<div class="form-group">
							<input type="checkbox" name="remember-me" id="remember-me"
								class="agree-term" /> <label for="remember-me"
								class="label-agree-term"><span><span></span></span>Remember
								me</label>
						</div>
						<div class="form-group form-button">
							<input type="submit" name="signin" id="signin"
								class="form-submit" value="Log in" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
</body>
<%@ include file="footer-jsp-style.jsp"%>
</html>