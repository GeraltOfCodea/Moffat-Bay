package com.MoffatBayLodge.beans;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.MoffatBayLodge.model.DBManager;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Authentication {

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
        public boolean checkPassword(HttpServletRequest request, HttpServletResponse response) {
            DBManager dbManager = new DBManager();
            Connection conn = dbManager.getConnection();
            String query = "SELECT password_hash FROM registered_users WHERE email_address=?";

            String hashedPassword = null;
            if (conn != null) {
                try {
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(query);
                    if (rs.next()) {
                        hashedPassword = rs.getString(1);
                    }
                } catch (SQLException e) {
                    System.out.println("Could not access database accounts.");
                    e.printStackTrace();
                } finally {
                    dbManager.closeConnection(conn);
                }
            }
            return BCrypt.checkpw(request.getParameter("password"), hashedPassword);
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

        public static boolean stringFormatCheck (String emailAddress){

            String regex = "^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$]";

            if (emailAddress.matches(regex)) {
                return true;
            } else {
                return false;
            }
        }

        public static boolean stringPasswordCheck (String password){

            String regex = "^(?=.[a-z])(?=.[A-Z])(?=.*\\d)[^\\s]{8,}$";;

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


      