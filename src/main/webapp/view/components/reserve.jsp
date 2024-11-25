<%--
  Created by IntelliJ IDEA.
  User: erics_zgg1vrz
  Date: 11/23/2024
  Time: 8:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.MoffatBayLodge.model.BookingsOps" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.sql.Timestamp" %>

<%
    String fullName = request.getParameter("fullName");
    String email = request.getParameter("emailAddress");
    Timestamp checkIn = Timestamp.valueOf(request.getParameter("checkInDate"));
    Timestamp checkOut = Timestamp.valueOf(request.getParameter("checkOutDate"));
    String roomType = request.getParameter("roomType");
    int adultAmt = Integer.parseInt(request.getParameter("adultAmt"));
    int childAmt = Integer.parseInt(request.getParameter("childAmt"));

    BookingsOps bookingsOps = new BookingsOps();
    try {
        bookingsOps.newBooking(email, adultAmt + childAmt, checkIn, checkOut, roomType);
        response.sendRedirect(request.getContextPath() + "/view/Summarypg.jsp");
    } catch (Exception e){
        request.getRequestDispatcher("/view/Reservationpg.jsp").forward(request, response);
        e.printStackTrace();
    }

%>
