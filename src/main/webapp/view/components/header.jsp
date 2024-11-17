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
                  <li><a href="#">Attractions</a></li>
                  <li><a href="#">Reservations</a></li>
                  <li><a href="#">About Us</a></li>
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