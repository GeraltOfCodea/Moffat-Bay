/*
 * Moffat Bay Capstone Project
 * Developed by:
 * - Celine Del Mundo
 * - Ryan Norrbom
 * - Eric Williams-Phillips
 */
package com.MoffatBayLodge.beans;

import com.MoffatBayLodge.model.DBManager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.RequestDispatcher;

@WebServlet("/ContactUsServlet")
public class ContactUsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String name = request.getParameter("name");
        String emailAddress = request.getParameter("email_address");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        // Validate form parameters
        if (name == null || emailAddress == null || subject == null || message == null ||
                name.isEmpty() || emailAddress.isEmpty() || subject.isEmpty() || message.isEmpty()) {
            request.setAttribute("errorMessage", "All fields are required.");
            request.getRequestDispatcher("/view/aboutus.jsp").forward(request, response);
            return; // Important to prevent further processing
        }

        // Use DBManager to connect to the database
        DBManager dbManager = new DBManager();
        Connection conn = null;
        PreparedStatement pstmt = null;
        int rowsInserted = 0; // Declare outside the try block

        try {
            conn = dbManager.getConnection();

            if (conn != null) {
                String sql = "INSERT INTO contact_us (name, email_address, subject, message) VALUES (?, ?, ?, ?)";
                pstmt = conn.prepareStatement(sql);

                pstmt.setString(1, name);
                pstmt.setString(2, emailAddress);
                pstmt.setString(3, subject);
                pstmt.setString(4, message);

                rowsInserted = pstmt.executeUpdate();

                // No need to handle response here; we'll do it after the try-catch-finally block
            } else {
                // Connection failed
                request.setAttribute("errorMessage", "Database connection failed.");
                request.getRequestDispatcher("/view/aboutus.jsp").forward(request, response);
                return; // Exit to prevent further processing
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("/view/aboutus.jsp").forward(request, response);
            return; // Exit the method to prevent further processing
        } finally {
            // Close resources
            if (pstmt != null) {
                try { pstmt.close(); } catch (SQLException e) { /* Ignore */ }
            }
            if (conn != null) {
                dbManager.closeConnection(conn);
            }
        }


        if (rowsInserted > 0) {
            // Successful insertion, set confirmation message
            request.setAttribute("confirmationMessage", "Thank you! Your message has been received.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/view/aboutus.jsp");
            dispatcher.forward(request, response);
        } else {
            // Insertion failed
            request.setAttribute("errorMessage", "There was an error processing your request. Please try again.");
            request.getRequestDispatcher("/view/aboutus.jsp").forward(request, response);
        }
    }
}