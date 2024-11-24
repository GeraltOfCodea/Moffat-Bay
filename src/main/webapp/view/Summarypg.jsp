<%--
  Created by IntelliJ IDEA.
  User: celine
  Date: 11/23/2024
  Time: 10:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!--<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css"> -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Summarypg.css">
    <title>Booking Summary Page</title>

</head>
<body>
<div class = "summary">
<!-- RESERVATION SUMMARY -->
<p><strong>Full Name: </strong><span id = "summary-fullName"></span></p>
<p><strong>Check In Date: </strong><span id = "summary-checkinDate"></span></p>
<p><strong>Check Out Date: </strong><span id = "summary-checkoutDate"></span></p>
<p><strong>Room Type: </strong><span id = "summary-roomType"></span></p>
<p><strong>Adults: </strong><span id = "summary-adults"></span></p>
<p><strong>Children: </strong><span id = "summary-children"></span></p>
</div>

<!-- USERS OPTIONS -->
<div class = "buttons">
    <button class="cancel" onclick="window.location.href='${pageContext.request.contextPath}/view/Reservationpg.jsp'">Cancel Reservation</button>
    <button class = "submit">Confirm Reservation</button>
</div>

<script>
    //retrieving data from localStorage
    const fullName = localStorage.getItem('fullName');
    const checkinDate = localStorage.getItem('checkinDate');
    const checkoutDate = localStorage.getItem('checkoutDate');
    const roomType = localStorage.getItem('roomTypes');
    const adult = localStorage.getItem('adults');
    const children = localStorage.getItem('children');

    //setting the summary content

    document.getElementById('summary-fullName').textContent = fullName;
    document.getElementById('summary-checkinDate').textContent = checkinDate;
    document.getElementById('summary-checkoutDate').textContent = checkoutDate;
    document.getElementById('summary-roomType').textContent = roomType;
    document.getElementById('summary-adults').textContent = adult;
    document.getElementById('summary-children').textContent = children;

</script>

</body>
</html>
