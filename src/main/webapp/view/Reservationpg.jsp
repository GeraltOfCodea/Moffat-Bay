<%--
  Created by IntelliJ IDEA.
  User: Ryan, Eric, & Celine
  Team: Blue Team
  For: CSD460
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.MoffatBayLodge.model.DBManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
	// Initialize DBManager and retrieve room types and prices
	DBManager dbManager = new DBManager();
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	List<Map<String, String>> roomTypes = new ArrayList<>();

	try {
		conn = dbManager.getConnection();
		String sql = "SELECT room_size, room_price FROM rooms"; // Adjust column names if necessary
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		while (rs.next()) {
			String roomType = rs.getString("room_size");
			String roomPrice = rs.getString("room_price");
			Map<String, String> room = new HashMap<>();
			room.put("type", roomType);
			room.put("price", roomPrice);
			roomTypes.add(room);
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (rs != null) try { rs.close(); } catch (SQLException e) { /* Handle Exception */ }
		if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { /* Handle Exception */ }
		if (conn != null) dbManager.closeConnection(conn);
	}
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<!-- Existing meta tags and links -->
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
	<!-- Include Bootstrap CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<!-- Existing stylesheets -->
	<link href="https://fonts.googleapis.com/css?family=Ubuntu&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Cairo+Play&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Reservationpg.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
	<title>Reservation Page</title>
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
							<!-- Full Name -->
							<div class="form-group">
								<span class="form-label">Full Name</span>
								<input class="form-control" id="fullName" type="text" name="fullName" placeholder="Enter your Full Name">
							</div>
							<!-- Email -->
							<div class="form-group">
								<span class="form-label">Email</span>
								<input class="form-control" id="email" type="text" name="emailAddress" placeholder="Enter your email (e.g., user@domain.com)">
							</div>
							<div class="row">
								<!-- Check-in Date -->
								<div class="col-sm-6">
									<div class="form-group">
										<span class="form-label">Check In</span>
										<input class="form-control" id="checkinDate" name="checkInDate" type="date" required>
									</div>
								</div>
								<!-- Check-out Date -->
								<div class="col-sm-6">
									<div class="form-group">
										<span class="form-label">Check out</span>
										<input class="form-control" id="checkoutDate" name="checkOutDate" type="date" required>
									</div>
								</div>
							</div>
							<!-- Room Type and Price -->
							<div class="row">
								<!-- Room Type -->
								<div class="col-sm-6">
									<div class="form-group">
										<span class="form-label">Rooms</span>
										<select class="form-control" id="roomTypes" name="roomType">
											<option value="">Select</option>
											<% for (Map<String, String> room : roomTypes) { %>
											<option value="<%= room.get("type") %>" data-price="<%= room.get("price") %>">
												<%= room.get("type") %>
											</option>
											<% } %>
										</select>
										<span class="select-arrow"></span>
									</div>
								</div>
								<!-- Price per Night -->
								<div class="col-sm-6">
									<div class="form-group">
										<span class="form-label">Price per Night</span>
										<input class="form-control" id="roomPrice" type="text" readonly>
									</div>
								</div>
							</div>
							<div class="row">
								<!-- Adults -->
								<div class="col-sm-6">
									<div class="form-group">
										<span class="form-label">Adults</span>
										<select class="form-control" id="adults" name="adultAmt" required>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
										</select>
										<span class="select-arrow"></span>
									</div>
								</div>
								<!-- Children -->
								<div class="col-sm-6">
									<div class="form-group">
										<span class="form-label">Children</span>
										<select class="form-control" id="children" name="childAmt">
											<option value="0">0</option>
											<option value="1">1</option>
											<option value="2">2</option>
										</select>
										<span class="select-arrow"></span>
									</div>
								</div>
							</div>
							<div class="form-btn">
								<button type="button" class="submit-btn" id="submit-btn">Check availability</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Include jQuery and Bootstrap JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script>
	// Update room price when room type is selected
	document.getElementById("roomTypes").addEventListener("change", function() {
		var selectedOption = this.options[this.selectedIndex];
		var price = selectedOption.getAttribute("data-price");
		document.getElementById("roomPrice").value = price ? "$" + price : "";
	});

	// Attach event listener to the submit button
	document.getElementById("submit-btn").addEventListener("click", function(event) {
		// Prevent the form from submitting and reloading the page
		event.preventDefault();

		// Collect form data
		const fullName = document.getElementById("fullName").value.trim();
		const emailAddress = document.getElementById("email").value.trim();
		const checkinDate = document.getElementById("checkinDate").value;
		const checkoutDate = document.getElementById("checkoutDate").value;
		const roomType = document.getElementById("roomTypes").value;
		const roomPrice = document.getElementById("roomPrice").value;
		const adults = document.getElementById("adults").value;
		const children = document.getElementById("children").value;

		// Basic Validation
		if (!fullName || !emailAddress || !checkinDate || !checkoutDate || !roomType || !adults || !children) {
			alert("Please complete all fields.");
			return;
		}

		// Email Validation
		const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
		if (!emailPattern.test(emailAddress)) {
			alert("Please enter a valid email address.");
			return;
		}

		// Date Validation
		const today = new Date();
		today.setHours(0, 0, 0, 0);
		const checkin = new Date(checkinDate);
		checkin.setHours(0, 0, 0, 0);
		const checkout = new Date(checkoutDate);
		checkout.setHours(0, 0, 0, 0);

		if (checkin < today || checkin === today) {
			alert("Check-in must be in the future.");
			return;
		}

		if (checkout <= checkin) {
			alert("Check-out date must be after check-in date.");
			return;
		}

		// Store form data in localStorage
		localStorage.setItem('fullName', fullName);
		localStorage.setItem('emailAddress', emailAddress);
		localStorage.setItem('checkinDate', checkinDate);
		localStorage.setItem('checkoutDate', checkoutDate);
		localStorage.setItem('roomType', roomType);
		localStorage.setItem('roomPrice', roomPrice);
		localStorage.setItem('adults', adults);
		localStorage.setItem('children', children);

		// Redirect to Summary page
		window.location.href = 'Summarypg.jsp';
	});
</script>

</body>
</html>