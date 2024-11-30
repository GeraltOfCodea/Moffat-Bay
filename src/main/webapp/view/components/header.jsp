<%--
  Created by IntelliJ IDEA.
  User: Ryan, Eric, & Celine
  Team: Blue Team
  For: CSD460
  Date: 11/16/24
  Time: 3:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <header>
      <div class="container">
          <div class="logo">
              <a href="${pageContext.request.contextPath}/view/Index.jsp">
                <img src="${pageContext.request.contextPath}/images/logo.png" alt="Moffat Bay Lodge">
              </a>
          </div>
          <nav>
              <ul class="nav-links">
                  <li><a href="${pageContext.request.contextPath}/view/Index.jsp">Home</a></li>
                  <li><a href="${pageContext.request.contextPath}/view/attractions.jsp">Attractions</a></li>
                  <li><a href="${pageContext.request.contextPath}/view/Reservationpg.jsp">Reservations</a></li>
                  <li><a href="${pageContext.request.contextPath}/view/aboutus.jsp">About Us</a></li>
              </ul>
          </nav>
          <div class="auth-links">
              <%
                  String userName = (String) session.getAttribute("userName");
                  if (userName != null) {
              %>
              <span>WELCOME, <%= userName %></span>
              <a href="${pageContext.request.contextPath}/view/components/logout.jsp">Logout</a>
              <% } else { %>
              <a href="${pageContext.request.contextPath}/view/login.jsp">Login</a> / <a href="${pageContext.request.contextPath}/view/registrationpg.jsp">Register</a>
              <% } %>
          </div>
      </div>
  </header>