package com.MoffatBayLodge.model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.MoffatBayLodge.beans.Authentication;
import com.MoffatBayLodge.beans.User;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.ProtectionDomain;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import jakarta.servlet.ServletException;

public class DBManager {

    private String dbURL ="";
    private String dbUser ="";
    private String dbPass ="";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Ensure the driver class is loaded
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    //On DBManager object creation, connect to the database using properties file
    public DBManager() {
        try(InputStream is = getClass().getClassLoader().getResourceAsStream("config.properties")){
            Properties prop = new Properties();
            prop.load(is);

            //Storing pulled properties into local variables
            dbURL = prop.getProperty("dburl");
            dbUser = prop.getProperty("username");
            dbPass = prop.getProperty("password");
        } catch (IOException e){
            e.printStackTrace();
        }
    }

    //Method to open a connection to the database with variables as parameters
    public Connection getConnection(){
        Connection conn = null;
        try{
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
        } catch (SQLException e) {
            System.out.println("Unable to connect to database: " + e.getMessage()); // Added More verbose logging
            e.printStackTrace();
        }
        return conn;
    }

    //Quick close method
    public void closeConnection(Connection conn){
        try{
            conn.close();
        } catch (SQLException e) {
            System.out.println("Unable to connect to database: " + e.getMessage()); // Added More verbose logging
            e.printStackTrace();
        }
    }

    /*
    *
    * Method to call when a user registers for an account
    * checkRegistration will call the "addRegisteredUser" method from the Customer controller
    *  This method verifies that the entered data fits the registration requirements
     */
    public void checkRegistration(HttpServletRequest request, HttpServletResponse response){
        CustomerOps.addRegisteredUser(request, response);
    }

    /*
    *
    * Method to call when a user attempts to login
    * This method utilizes the checkPassword method from the Authentication.class
    * If checkPassword returns true, ping successful login and redirect to {________}
     */
    public void checkLogin(HttpServletRequest request, HttpServletResponse response){
        Authentication auth = new Authentication();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        try {
            if (auth.checkPassword(email, password)){
                System.out.println("Successfully logged in.");

                // Get user's details and set them in the session
                User user = auth.getUserByEmail(email);
                if (user != null) {
                    request.getSession().setAttribute("userName", user.getUserName());
                    request.getSession().setAttribute("customerId", user.getCustomerId());
                }

                response.sendRedirect(request.getContextPath() + "/view/Index.jsp");
            } else {
                // Authentication failed
                request.setAttribute("errorMessage", "Invalid email or password.");
                request.getRequestDispatcher("/view/login.jsp").forward(request, response);
            }
        } catch (IOException | ServletException e){
            System.out.println("Unable to log in: " + e.getMessage());
            e.printStackTrace();
        }

    }

}
