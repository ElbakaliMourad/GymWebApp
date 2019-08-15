<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Gym Home</title>
<%@ include file="css-styles.jsp"%>
</head>
<body style="padding-right: 15em; padding-left: 15em;">
	<%@ include file="nav.jsp"%>
	<div style="padding-right: 2em; padding-left: 2em;">
	<!-- Tip: use bg-* and text-* utilities to style the card -->
	<div class="card text-white bg-primary mb-3 d-inline-block"
		style="max-width: 20rem;">
		<div class="card-header">Basic</div>
		<div class="card-body">
			<h4 class="card-title">$9.99</h4>
			<p class="card-text text-white">Some quick example text to build on the card
				title and make up the bulk of the card's content.</p>
		</div>
	</div>
	<div class="card text-white bg-dark mb-3 d-inline-block"
		style="max-width: 20rem;">
		<div class="card-header">Premium</div>
		<div class="card-body">
			<h4 class="card-title">19.99</h4>
			<p class="card-text text-white">Some quick example text to build on the card
				title and make up the bulk of the card's content.</p>
		</div>
	</div>
		<div class="card text-white bg-primary mb-3 d-inline-block"
		style="max-width: 20rem;">
		<div class="card-header">Pro</div>
		<div class="card-body">
			<h4 class="card-title">$29.99</h4>
			<p class="card-text text-white">Some quick example text to build on the card
				title and make up the bulk of the card's content.</p>
		</div>
	</div>
	</div>


	<div id="carouselExampleIndicators"
		class="carousel slide pointer-event" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<div class="carousel-item active">
				<img class="d-block w-100" src="resources/images/image-1.jpeg"
					data-src="holder.js/900x400?theme=social" alt="image-1.jpeg"
					data-holder-rendered="true" style="width: 900px; height: 600px;">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="resources/images/image-2.jpg"
					data-src="holder.js/900x400?theme=industrial" alt="900x400"
					data-holder-rendered="true" style="width: 900px; height: 600px;">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="resources/images/image-3.jpeg"
					data-src="holder.js/900x400?theme=industrial" alt="900x400"
					data-holder-rendered="true" style="width: 900px; height: 600px;">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="resources/images/image-4.jpeg"
					data-src="holder.js/900x400?theme=industrial" alt="900x400"
					data-holder-rendered="true" style="width: 900px; height: 600px;">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	<%@ include file="footer-jsp-style.jsp"%>
</body>
</html>