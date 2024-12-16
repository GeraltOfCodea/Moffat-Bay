<%--
  Created by IntelliJ IDEA.
  User: Ryan, Eric, & Celine
  Team: Blue Team
  For: CSD460
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>About Us</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>
<%@ include file="/view/components/header.jsp" %>

<div class="container">
    <h1 class="text-center">About Us</h1>

    <div class="about-us-cards">
        <!-- First Card -->
        <div class="about-card">
            <img src="${pageContext.request.contextPath}/images/fromsea.jpeg" alt="Hotel Image Left" class="about-card-image">
            <h2>Our History</h2>
            <p>Opening in 2025, our hotel will serve guests with excellence. We are a renowned establishment known for luxury and comfort as you unwind in the San Juan Islands.</p>
        </div>

        <!-- Second Card -->
        <div class="about-card">
            <img src="${pageContext.request.contextPath}/images/cabin.jpeg" alt="Hotel Image Middle" class="about-card-image">
            <h2>Our Mission</h2>
            <p>We strive to provide the best hospitality experience with a touch of luxury and comfort. Our mission is to make every guest feel at home while offering top-notch services and amenities.</p>
        </div>

        <!-- Third Card -->
        <div class="about-card">
            <img src="${pageContext.request.contextPath}/images/fromroom.jpeg" alt="Hotel Image Right" class="about-card-image">
            <h2>Our Values</h2>
            <p>Integrity, excellence, and customer satisfaction are at the core of everything we do. We believe in creating lasting memories for our guests through exceptional service and a commitment to quality.</p>
        </div>
    </div>

    <!-- Retrieve Messages and set form values -->
    <%
        String confirmationMessage = (String) request.getAttribute("confirmationMessage");
        String errorMessage = (String) request.getAttribute("errorMessage");

        // Retrieve and sanitize form field values
        String nameValue = request.getParameter("name");
        if (nameValue == null) { nameValue = ""; }

        String emailValue = request.getParameter("email_address");
        if (emailValue == null) { emailValue = ""; }

        String subjectValue = request.getParameter("subject");
        if (subjectValue == null) { subjectValue = ""; }

        String messageValue = request.getParameter("message");
        if (messageValue == null) { messageValue = ""; }
    %>

    <!-- Display Confirmation or Error Message -->
    <% if (confirmationMessage != null) { %>
    <p class="confirmation-message"><%= confirmationMessage %></p>
    <% } else if (errorMessage != null) { %>
    <p class="error-message"><%= errorMessage %></p>
    <% } %>


    <!-- Contact Us Form -->
    <h2 class="text-center">Contact Us</h2>
    <form action="${pageContext.request.contextPath}/ContactUsServlet" method="post" class="contact-form">
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" name="name" id="name" required class="form-control" value="<%= (confirmationMessage == null) ? nameValue : "" %>" placeholder="First and Last Name">
        </div>
        <div class="form-group">
            <label for="email_address">Email Address:</label>
            <input type="email" name="email_address" id="email_address" required class="form-control" value="<%= (confirmationMessage == null) ? emailValue : "" %>" placeholder="username@domain.com">
        </div>
        <div class="form-group">
            <label for="subject">Subject:</label>
            <input type="text" name="subject" id="subject" required class="form-control" value="<%= (confirmationMessage == null) ? subjectValue : "" %>" placeholder="Title">
        </div>
        <div class="form-group">
            <label for="message">Message:</label>
            <textarea name="message" id="message" required class="form-control" placeholder="Describe your reason for contacting us."><%= (confirmationMessage == null) ? messageValue : "" %></textarea>
        </div>
        <div class="form-actions">
            <button type="submit" class="btn">Send Message</button>
        </div>
    </form>
</div>

<%@ include file="/view/components/footer.jsp" %>
</body>
</html>