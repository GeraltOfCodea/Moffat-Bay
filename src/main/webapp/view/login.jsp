<%--
  Created by IntelliJ IDEA.
  User: ryannorrbom
  Date: 11/16/24
  Time: 3:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String errorMessage = (String) request.getAttribute("errorMessage");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>
<%@ include file="/view/components/header.jsp" %>

<div class="container">
    <h1 class="text-center">Login</h1>
    <% if (errorMessage != null) { %>
    <p class="error-message"><%= errorMessage %></p>
    <% } %>
    <form action="${pageContext.request.contextPath}/view/components/authenticate.jsp" method="post" class="login-form">
        <div class="form-group">
            <label for="email">Email Address:</label>
            <input type="email" name="email" id="email" required class="form-control">
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" name="password" id="password" required class="form-control">
        </div>
        <div class="form-actions">
            <button type="submit" class="btn">Login</button>
        </div>
        <div class="form-footer">
            <p>Don't have an account? <a href="${pageContext.request.contextPath}/view/registrationpg.jsp">Register here</a></p>
        </div>
    </form>
</div>

<%@ include file="/view/components/footer.jsp" %>
</body>
</html>
