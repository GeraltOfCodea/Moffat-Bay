<!DOCTYPE html>
<html lang="en">
<head>
	<!-- Existing meta tags and links -->
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
	<!-- Include Bootstrap CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<!-- Existing stylesheets -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Reservationpg.css">
</head>
<body>
<!-- Navigation -->
<%@ include file="/view/components/header.jsp" %>

<!-- Booking Form Creation -->
<div id="booking" class="section">
	<div class="section-center">
		<div class="container">
			<div class="row">
				<!-- Booking CTA -->
				<div class="col-md-7">
					<div class="booking-cta">
						<h1>Make your reservation</h1>
						<p></p>
					</div>
				</div>
				<!-- Booking Form -->
				<div class="col-md-5">
					<div class="booking-form">
						<form>
							<form>
								<div class="form-group">
									<span class="form-label">Full Name</span>
									<input class="form-control" type="text" placeholder="Enter your Full Name">
								</div>
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<span class="form-label">Check In</span>
											<input class="form-control" type="date" required="">
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<span class="form-label">Check out</span>
											<input class="form-control" type="date" required="">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<span class="form-label">Rooms</span>
											<select class="form-control">
												<option>Twin</option>
												<option>Queen</option>
												<option>King</option>
											</select>
											<span class="select-arrow"></span>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<span class="form-label">Adults</span>
											<select class="form-control" min = "1" required>
												<option>1</option>
												<option>2</option>
												<option>3</option>
											</select>
											<span class="select-arrow"></span>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<span class="form-label">Children</span>
											<select class="form-control">
												<option>0</option>
												<option>1</option>
												<option>2</option>
											</select>
											<span class="select-arrow"></span>
										</div>
									</div>
								</div>
								<div class="form-btn">
									<button class="submit-btn">Check availability</button>
								</div>
							</form>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Include Bootstrap JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>