<%--
  Created by IntelliJ IDEA.
  User: Ryan, Eric, & Celine
  Team: Blue Team
  For: CSD460
  Date: 11/16/24
  Time: 3:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.MoffatBayLodge.beans.Authentication" %>
<%@ page import="com.MoffatBayLodge.beans.User" %>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    Authentication auth = new Authentication();

    if (auth.checkPassword(email, password)) {
        // Get user's details and set them in the session
        User user = auth.getUserByEmail(email);
        if (user != null) {
            session.setAttribute("userName", user.getUserName());
            session.setAttribute("customerId", user.getCustomerId());
        }

        // Redirect to welcome page or dashboard
        response.sendRedirect(request.getContextPath() + "/view/Index.jsp");
    } else {
        // Authentication failed
        request.setAttribute("errorMessage", "Invalid email or password.");
        request.getRequestDispatcher("/view/login.jsp").forward(request, response);
    }
%>
