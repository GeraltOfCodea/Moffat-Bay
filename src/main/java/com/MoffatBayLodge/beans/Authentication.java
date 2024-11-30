package com.MoffatBayLodge.beans;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.MoffatBayLodge.model.DBManager;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;

public class Authentication {

        public boolean isLoggedIn = false;

        //Method that takes a string and uses BCrypt to encrypt it
         public static String hashPassword(String password){
            return BCrypt.hashpw(password, BCrypt.gensalt());
         }

         /*
         *
         * Method that verifies a password that has been entered is correct
         * It first checks the password_hash field that is in the same row as the email address entered by user
         * and stores it in a variable called hashedPassword
         * hashedPassword gets checked against password that the user entered using the BCrypt chechpw method
         * If the password
          */
         public boolean checkPassword(String email, String password) {
             DBManager dbManager = new DBManager();
             Connection conn = dbManager.getConnection();
             String query = "SELECT password_hash FROM registered_users WHERE email_address=?";
             String hashedPassword = null;
             if (conn != null) {
                 try {
                     PreparedStatement pstmt = conn.prepareStatement(query);
                     pstmt.setString(1, email);
                     ResultSet rs = pstmt.executeQuery();
                     if (rs.next()) {
                         hashedPassword = rs.getString("password_hash");
                     }
                 } catch (SQLException e) {
                     System.out.println("Could not access database accounts.");
                     e.printStackTrace();
                 } finally {
                     dbManager.closeConnection(conn);
                 }
             }
             return hashedPassword != null && BCrypt.checkpw(password, hashedPassword);
         }


        //This method is called to place the username into the header when the customer completes authentication.
        public User getUserByEmail(String emailAddress) {
            DBManager dbManager = new DBManager();
            Connection conn = dbManager.getConnection();
            String query = "SELECT first_name, customer_id FROM registered_users WHERE email_address=?";
            User user = null;
            if (conn != null) {
                try {
                    PreparedStatement pstmt = conn.prepareStatement(query);
                    pstmt.setString(1, emailAddress);
                    ResultSet rs = pstmt.executeQuery();
                    if (rs.next()) {
                        String userName = rs.getString("first_name");
                        int customerId = rs.getInt("customer_id");
                        user = new User(userName, customerId);
                    }
                    pstmt.close();
                } catch (SQLException e) {
                    System.out.println("Could not access database accounts.");
                    e.printStackTrace();
                } finally {
                    dbManager.closeConnection(conn);
                }
            }
            return user;
        }

        // Method to check if an email is available on registration
        public boolean isEmailAvailable(String emailAddress) {
            DBManager dbManager = new DBManager();
            Connection conn = dbManager.getConnection();
            String query = "SELECT email_address FROM registered_users WHERE email_address=?";
            boolean isAvailable = true;
            if (conn != null) {
                try {
                    PreparedStatement pstmt = conn.prepareStatement(query);
                    pstmt.setString(1, emailAddress);
                    ResultSet rs = pstmt.executeQuery();
                    if (rs.next()) {
                        isAvailable = false;
                    }
                } catch (SQLException e) {
                    System.out.println("Could not access database accounts.");
                    e.printStackTrace();
                } finally {
                    dbManager.closeConnection(conn);
                }
            }
            return isAvailable;
        }

        /*
        *
        * Method to be called during registration
        * This method sets requirements on the desired password
        * If the desired password meets the requirements, ths method returns true
        * Otherwise this method returns false and the user will be required to enter password again
        * Redirect back to registration?
        *
         */

        // Method to register a new user
        public boolean registerUser(String firstName, String lastName, String email, String phoneNumber, String hashedPassword) {
            DBManager dbManager = new DBManager();
            Connection conn = dbManager.getConnection();
            String query = "INSERT INTO registered_users (first_name, last_name, email_address, phone_number, password_hash) VALUES (?, ?, ?, ?, ?)";
            boolean isRegistered = false;
            if (conn != null) {
                try {
                    PreparedStatement pstmt = conn.prepareStatement(query);
                    pstmt.setString(1, firstName);
                    pstmt.setString(2, lastName);
                    pstmt.setString(3, email);
                    pstmt.setString(4, phoneNumber);
                    pstmt.setString(5, hashedPassword);
                    int rowsAffected = pstmt.executeUpdate();
                    if (rowsAffected > 0) {
                        isRegistered = true;
                    }
                } catch (SQLException e) {
                    System.out.println("Could not register user.");
                    e.printStackTrace();
                } finally {
                    dbManager.closeConnection(conn);
                }
            }
            return isRegistered;
        }

    // Phone number validation method
    public static boolean phoneNumberFormatCheck(String phoneNumber) {
        // Simple regex for phone numbers (e.g., 123-456-7890 or (123) 456-7890)
        String regex = "^(\\+\\d{1,2}\\s)?\\(?\\d{3}\\)?[\\s.-]?\\d{3}[\\s.-]?\\d{4}$";
        return phoneNumber.matches(regex);
    }

        // Email Validation check
        public static boolean stringFormatCheck (String emailAddress){

            String regex = "^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$";

            if (emailAddress.matches(regex)) {
                return true;
            } else {
                return false;
            }
        }

        // Password Validation Check
        public static boolean stringPasswordCheck (String password){

            String regex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,}$";

            if (password.matches(regex)){
                return true;
            } else {
                return false;
            }
        }
        public static boolean requirementCheck(String emailAddress, String password){

             if (password.length() < 8 & stringFormatCheck(emailAddress)){
                 System.out.println("Password must be at least 8 characters.");
                 return false;

             } else {
                 return true;
             }


        }


}
