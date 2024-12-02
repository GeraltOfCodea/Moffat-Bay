/*
 * Moffat Bay Capstone Project
 * Developed by:
 * - Celine Del Mundo
 * - Ryan Norrbom
 * - Eric Williams-Phillips
 */
package com.MoffatBayLodge.model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.MoffatBayLodge.beans.Authentication;
import com.MoffatBayLodge.beans.Customer;

import java.io.IOException;
import java.sql.*;

/*
 * Manages queries regarding site users
 *
 */
public class CustomerOps {

    /*
     * Add a user to the DB using fields from registration form
     * Catches SQLException if error occurs
     */
    public static void addRegisteredUser(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = new Authentication();
        DBManager dbManager = new DBManager();
        Connection conn = dbManager.getConnection();
        Customer customer = null;
        String query = "INSERT INTO registered_users (first_name, last_name, email_address, password_hash, phone_number) VALUES (?, ?, ?, ?, ?)";
        if (conn != null) {
            if (Authentication.requirementCheck(request.getParameter("email-address"), request.getParameter("password"))) {
            try {
                PreparedStatement pstmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
                pstmt.setString(1, request.getParameter("first-name"));
                pstmt.setString(2, request.getParameter("last-name"));
                pstmt.setString(3, request.getParameter("email-address"));
                /*
                 * Store hash of entered value rather than raw value
                 * Created in Authentication class
                 */
                pstmt.setString(4, Authentication.hashPassword(request.getParameter("password")));
                pstmt.setString(5, request.getParameter("phone-number"));
                pstmt.executeUpdate();
                //If registration was successful, redirect user to {______}
                System.out.println("User has been successfully registered.");
                response.sendRedirect(request.getContextPath() + "---------");

            } catch (SQLException | IOException e) {
                System.out.println("Unable to add new user." + e.getMessage());
                e.printStackTrace();
            } finally {
                dbManager.closeConnection(conn);
            }
        } else {
                System.out.println("Password must be at least 8 characters.");
            }
        }
    }

    /*
     *
     * Get a customer by id (may need to get by email address instead)
     * @return a {@link Customer} object to store query data in
     * Catches SQLException if error occurs
     */
    public static Customer getCustomerByID(DBManager dbManager, int id) {
        String query = "SELECT * FROM registered_users WHERE customer_id = " + id;
        Connection conn = dbManager.getConnection();

        Customer customer = null;
        if (conn != null) {
            try {
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query);
                if (rs.next()) {
                    customer = new Customer();
                    customer.setCustomerID(rs.getString(1));
                    customer.setFirstName(rs.getString(2));
                    customer.setLastName(rs.getString(3));
                    customer.setEmail(rs.getString(4));
                    customer.setPassword(rs.getString(5));
                    customer.setPhone(rs.getString(6));
                }

            } catch (SQLException e) {
                System.out.println("Could not get customer by ID");
                e.printStackTrace();
            } finally {
                dbManager.closeConnection(conn);
            }
        }
        return customer;
    }

    //Just a way to retrieve a customer's name for the purpose of reprinting
    public static String getNameByID(int customerID){
        String name = "";
        DBManager db = new DBManager();
        Connection conn = db.getConnection();
        String nameQuery = "SELECT first_name, last_name FROM registered_users WHERE customer_id = " + customerID;

        try{
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(nameQuery);

            if(rs.next()){
                name = rs.getString(1);
            }

        } catch (SQLException e){
            System.out.println("Unable to pull name by requested ID");
            e.printStackTrace();
        } finally {
            db.closeConnection(conn);
        }

        return name;
    }
}
