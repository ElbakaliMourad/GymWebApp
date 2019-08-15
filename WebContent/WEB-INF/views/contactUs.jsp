<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact Us</title>
<%@ include file="css-styles.jsp"%>
</head>
<body style="padding-right: 15em; padding-left: 15em;">
	<div>
		<%@ include file="nav.jsp"%>
	</div>

	<!-- Sign up form -->
	<section class="sign-in">
		<div class="container">
			<div class="signup-content">
				<div class="signup-form">
					<h2 class="form-title">Contact Us</h2>
					<form action="addMember" method="POST" class="register-form"
						id="register-form">

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
						
                      <div class="md-form">
                            <textarea type="text" id="message" name="message" rows="2" class="form-control md-textarea" placeholder="Your message"></textarea>
                            <label for="message"></label>
                        </div>

						<div class="form-group form-button">
							<input type="submit" name="signup" id="signup"
								class="form-submit" value="Send" /> <input type="reset"
								name="reset" id="signup" class="form-submit" value="Reset">
						</div>
					</form>
				</div>
        <div class="col-md-3 text-center" style="padding: 45px 0">
            <ul class="list-unstyled mb-0">
                <li><i class="fas fa-map-marker-alt fa-2x"></i>
                    <p>255 Main Street,<br> Cambridge, MA 02112, USA</p>
                </li>

                <li><i class="fas fa-phone mt-4 fa-2x"></i>
                    <p>(617) 792 5267</p>
                </li>

                <li><i class="fas fa-envelope mt-4 fa-2x"></i>
                    <p>elbakali.m@hotmail.com</p>
                </li>
            </ul>
        </div>
			</div>
		</div>
	</section>
</body>
<%@ include file="footer-jsp-style.jsp"%>
</html>