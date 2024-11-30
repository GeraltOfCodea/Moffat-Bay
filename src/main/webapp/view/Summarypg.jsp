<%--
  Created by IntelliJ IDEA.
  User: celine
  Date: 11/23/2024
  Time: 10:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.MoffatBayLodge.model.BookingsOps" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        // Retrieve parameters from the form
        String fullName = request.getParameter("fullName");
        String emailAddress = request.getParameter("emailAddress");
        String checkinDate = request.getParameter("checkinDate");
        String checkoutDate = request.getParameter("checkoutDate");
        String roomType = request.getParameter("roomType");
        String adults = request.getParameter("adults");
        String children = request.getParameter("children");

        // Parse dates
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date parsedCheckInDate = dateFormat.parse(checkinDate);
            Date parsedCheckOutDate = dateFormat.parse(checkoutDate);
            Timestamp checkInTimestamp = new Timestamp(parsedCheckInDate.getTime());
            Timestamp checkOutTimestamp = new Timestamp(parsedCheckOutDate.getTime());

            int numberOfGuests = Integer.parseInt(adults) + Integer.parseInt(children);

            // Create a new booking using BookingsOps
            BookingsOps bookingsOps = new BookingsOps();

            // Check if the user is logged in (assuming you store customerId in session)
            Integer customerId = (Integer) session.getAttribute("customerId");
            boolean isGuest = false;

            if (customerId == null) {
                // User is not logged in, check if a customer with this email exists
                customerId = bookingsOps.getCustomerIdByEmail(emailAddress);
                if (customerId == -1) {
                    // Customer does not exist, create a new guest customer
                    isGuest = true;
                    customerId = bookingsOps.createNewCustomer(fullName, emailAddress, isGuest);
                } else {
                    // Customer exists, check if they are a registered user
                    String userType = bookingsOps.getUserTypeByEmail(emailAddress);
                    if ("registered".equals(userType)) {
                        // Prompt the user to log in
                        String contextPath = request.getContextPath();
                        out.println("<script type='text/javascript'>");
                        out.println("alert('You already have an account. Please log in to make a reservation.');");
                        out.println("window.location.href = '" + contextPath + "/view/login.jsp';");
                        out.println("</script>");
                        return;

                    }
                    // Else, proceed with the existing guest customerId
                }
            }

            // Proceed to create the booking
            String bookingID = bookingsOps.newBooking(customerId, numberOfGuests, checkInTimestamp, checkOutTimestamp, roomType);


            if (bookingID != null) {
%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Summarypg.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
    <title>Booking Confirmation</title>
</head>
<body>
<!-- Header -->
<%@ include file="/view/components/header.jsp" %>

<div class="booking-confirmation-message">
    <h2>Thank you for your reservation!</h2>
    <p>Your booking ID is: <strong><%= bookingID %></strong></p>
    <p>We look forward to hosting you.</p>
</div>

<!-- clear localStorage -->
<script>
    localStorage.clear();
</script>
</body>
</html>
<%
                return; // Stop further processing
            } else {
                out.println("<p>An error occurred while processing your reservation. Please try again later.</p>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>An error occurred while processing your reservation. Please try again later.</p>");
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Summarypg.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
    <title>Booking Summary Page</title>
</head>
<body>
<!-- Header -->
<%@ include file="/view/components/header.jsp" %>

<!-- Booking Summary/Form -->
<form method="post" action="Summarypg.jsp">
    <div class="formDetails">
        <div class="summary">
            <!-- RESERVATION SUMMARY -->
            <p><strong>Full Name: </strong><span id="summary-fullName"></span></p>
            <p><strong>Email: </strong><span id="summary-emailAddress"></span></p>
            <p><strong>Check In Date: </strong><span id="summary-checkinDate"></span></p>
            <p><strong>Check Out Date: </strong><span id="summary-checkoutDate"></span></p>
            <p><strong>Room Type: </strong><span id="summary-roomType"></span></p>
            <p><strong>Adults: </strong><span id="summary-adults"></span></p>
            <p><strong>Children: </strong><span id="summary-children"></span></p>
            <p><strong>Total Price: </strong><span id="summary-totalPrice"></span></p>
        </div>

        <!-- USERS OPTIONS -->
        <div class="buttons">
            <button type="button" class="cancel" onclick="window.location.href='${pageContext.request.contextPath}/view/Reservationpg.jsp'">Cancel Reservation</button>
            <button type="submit" class="submit" id="confirm-reservation-btn">Confirm Reservation</button>
        </div>
    </div>

    <!-- Hidden inputs to pass data to the server -->
    <input type="hidden" name="fullName" id="hidden-fullName">
    <input type="hidden" name="emailAddress" id="hidden-emailAddress">
    <input type="hidden" name="checkinDate" id="hidden-checkinDate">
    <input type="hidden" name="checkoutDate" id="hidden-checkoutDate">
    <input type="hidden" name="roomType" id="hidden-roomType">
    <input type="hidden" name="adults" id="hidden-adults">
    <input type="hidden" name="children" id="hidden-children">
</form>

<script>
    // Retrieving data from localStorage
    const fullName = localStorage.getItem('fullName');
    const emailAddress = localStorage.getItem('emailAddress');
    const checkinDate = localStorage.getItem('checkinDate');
    const checkoutDate = localStorage.getItem('checkoutDate');
    const roomType = localStorage.getItem('roomType');
    const roomPrice = localStorage.getItem('roomPrice');
    const adults = localStorage.getItem('adults');
    const children = localStorage.getItem('children');

    // Parsing dates
    const checkin = new Date(checkinDate);
    const checkout = new Date(checkoutDate);

    // Calculate the number of nights
    const timeDiff = Math.abs(checkout.getTime() - checkin.getTime());
    const numberOfNights = Math.ceil(timeDiff / (1000 * 3600 * 24));

    // Parse the room price (remove '$' if present)
    const parsedRoomPrice = parseFloat(roomPrice.replace('$', ''));

    // Calculate total price
    const totalPrice = numberOfNights * parsedRoomPrice;

    // Setting the summary content
    document.getElementById('summary-fullName').textContent = fullName;
    document.getElementById('summary-emailAddress').textContent = emailAddress;
    document.getElementById('summary-checkinDate').textContent = checkinDate;
    document.getElementById('summary-checkoutDate').textContent = checkoutDate;
    document.getElementById('summary-roomType').textContent = roomType;
    document.getElementById('summary-adults').textContent = adults;
    document.getElementById('summary-children').textContent = children;
    document.getElementById('summary-totalPrice').textContent = '$' + totalPrice.toFixed(2);

    // Function to populate hidden inputs
    function populateHiddenInputs() {
        document.getElementById('hidden-fullName').value = fullName;
        document.getElementById('hidden-emailAddress').value = emailAddress;
        document.getElementById('hidden-checkinDate').value = checkinDate;
        document.getElementById('hidden-checkoutDate').value = checkoutDate;
        document.getElementById('hidden-roomType').value = roomType;
        document.getElementById('hidden-adults').value = adults;
        document.getElementById('hidden-children').value = children;
    }

    // Attach event listener to the confirm button
    document.getElementById('confirm-reservation-btn').addEventListener('click', function(event) {
        populateHiddenInputs();
    });
</script>

</body>
</html>
