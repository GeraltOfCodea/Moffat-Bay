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
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    Authentication auth = new Authentication();

    if (auth.checkPassword(email, password)) {
        // Get user's name and set it in the session
        String userName = auth.getUserName(email);
        session.setAttribute("userName", userName);
        // Redirect to welcome page or dashboard
        response.sendRedirect(request.getContextPath() + "/view/Index.jsp");
    } else {
        // Authentication failed
        request.setAttribute("errorMessage", "Invalid email or password.");
        request.getRequestDispatcher("/view/login.jsp").forward(request, response);
    }
%>
