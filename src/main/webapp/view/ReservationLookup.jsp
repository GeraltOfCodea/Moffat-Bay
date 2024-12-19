<%--
  Created by IntelliJ IDEA.
  User: Ryan, Eric, & Celine
  Team: Blue Team
  For: CSD460
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.MoffatBayLodge.model.BookingsOps" %>
<%@ page import="com.MoffatBayLodge.beans.Bookings" %>
<%@ page import="java.util.ArrayList" %>
<%
    // Check if user is logged in
    Integer customerId = (Integer) session.getAttribute("customerId");
    String action = request.getParameter("action");
    ArrayList<Bookings> bookingsList = null;
    BookingsOps bookingsOps = new BookingsOps();

    if (customerId != null && action == null) {
        // User is logged in, retrieve all their bookings
        bookingsList = bookingsOps.getBookingsByCustomerId(customerId);
    } else if ("search".equals(action)) {
        String searchType = request.getParameter("searchType");
        String searchValue = request.getParameter("searchValue");

        if ("email".equals(searchType)) {
            bookingsList = bookingsOps.getBookingsByEmail(searchValue);
        } else if ("bookingId".equals(searchType)) {
            Bookings booking = bookingsOps.getBookingByBookingId(searchValue);
            bookingsList = new ArrayList<>();
            if (booking != null) {
                bookingsList.add(booking);
            }
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Reservation Lookup</title>
    <link href="https://fonts.googleapis.com/css?family=Ubuntu&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cairo+Play&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>
<!-- Header -->
<%@ include file="/view/components/header.jsp" %>

<div class="container">
    <h2>Reservation Lookup</h2>

    <% if (customerId == null) { %>
    <!-- Search Form -->
    <!-- Search Form -->
    <form method="get" action="ReservationLookup.jsp" class="reservation-lookup-form">
        <input type="hidden" name="action" value="search">
        <div class="form-group">
            <label for="searchType">Search By:</label>
            <select name="searchType" id="searchType">
                <option value="email">Email Address</option>
                <option value="bookingId">Booking ID</option>
            </select>
        </div>
        <div class="form-group">
            <label for="searchValue">Enter Value:</label>
            <input type="text" name="searchValue" id="searchValue" required>
        </div>
        <div class="form-actions">
            <button type="submit" class="btn">Search</button>
        </div>
    </form>
    <% } %>

    <% if (bookingsList != null && !bookingsList.isEmpty()) { %>
    <!-- Display Bookings -->
    <table class="reservations-table">
        <thead>
        <tr>
            <th>Booking ID</th>
            <% if (customerId == null) { %>
            <th>Customer Name</th>
            <th>Email</th>
            <% } %>
            <th>Room Type</th>
            <th>Number of Guests</th>
            <th>Order Date</th>
            <th>Check-In Date</th>
            <th>Check-Out Date</th>
        </tr>
        </thead>
        <tbody>
        <% for (Bookings booking : bookingsList) { %>
        <tr>
            <td data-label="Booking ID"><%= booking.getBookingId() %></td>
            <% if (customerId == null) { %>
            <td data-label="Customer Name"><%= booking.getCustomerName() %></td>
            <td data-label="Email"><%= booking.getEmailAddress() %></td>
            <% } %>
            <td data-label="Room Type"><%= booking.getRoomSize() %></td>
            <td data-label="Number of Guests"><%= booking.getNumberOfGuests() %></td>
            <td data-label="Order Date"><%= booking.getOrderDate() %></td>
            <td data-label="Check-In Date"><%= booking.getCheckInDate() %></td>
            <td data-label="Check-Out Date"><%= booking.getCheckOutDate() %></td>
        </tr>
        <% } %>
        </tbody>
    </table>
    <% } else if (action != null) { %>
    <p>No reservations found.</p>
    <% } %>
</div>

<!-- Footer -->
<%@ include file="/view/components/footer.jsp" %>
</body>
</html>
