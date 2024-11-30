package com.MoffatBayLodge.model;

import com.MoffatBayLodge.beans.Bookings;

import java.sql.*;
import java.util.ArrayList;
import java.util.Random;

public class BookingsOps {

    String customerName;

    /*
    *
    * Using a random string of characters for a reservation ID to provide to users
    * for the purpose of searching a specific reservation
    *
     */
    public static String bookingIDGen(){
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder sb = new StringBuilder();
        Random rand = new Random();
        for (int i = 0; i <= 5; i++) {
            int index = rand.nextInt(chars.length());
            sb.append(chars.charAt(index));
        }
        return sb.toString();
    }

    /*
    *
    * Changed the booking requirements to need an email instead of customerID, this way users can search via email
    * or booking ID rather than using a customerID that they won't be able to see
    * Also added a roomSize instead of roomID, each room is unique already so we can go by size rather than ID, just one
    * less value to track
    *
     */
    public String newBooking(int customerId, int numberOfGuests, Timestamp checkInDate, Timestamp checkOutDate, String roomSize) {
        String bookingID = bookingIDGen();
        DBManager db = new DBManager();
        Connection conn = db.getConnection();
        Timestamp currentTime = new Timestamp(System.currentTimeMillis());

        try {
            // Insert into bookings table
            String insertQuery = "INSERT INTO bookings (booking_id, customer_id, number_of_guests, order_date, check_in, check_out) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(insertQuery);
            pstmt.setString(1, bookingID);
            pstmt.setInt(2, customerId);
            pstmt.setInt(3, numberOfGuests);
            pstmt.setTimestamp(4, currentTime);
            pstmt.setTimestamp(5, checkInDate);
            pstmt.setTimestamp(6, checkOutDate);
            pstmt.executeUpdate();
            pstmt.close();

            // Get room_id based on roomSize
            String selectRoomSQL = "SELECT room_id FROM rooms WHERE room_size = ?";
            pstmt = conn.prepareStatement(selectRoomSQL);
            pstmt.setString(1, roomSize);
            ResultSet rs = pstmt.executeQuery();
            int roomId = 0;
            if (rs.next()) {
                roomId = rs.getInt("room_id");
            } else {
                // Handle case where room size is not found
                System.out.println("Room size not found.");
                return null;
            }
            pstmt.close();

            // Insert into booked_rooms table
            String insertBookedRoomSQL = "INSERT INTO booked_rooms (booking_id, room_id) VALUES (?, ?)";
            pstmt = conn.prepareStatement(insertBookedRoomSQL);
            pstmt.setString(1, bookingID);
            pstmt.setInt(2, roomId);
            pstmt.executeUpdate();
            pstmt.close();

            System.out.println("Successfully booked!");
            return bookingID;

        } catch (SQLException e) {
            System.out.println("Unable to book reservation.");
            e.printStackTrace();
        } finally {
            db.closeConnection(conn);
        }
        return null;
    }

    public ArrayList<Bookings> getBookingsByCustomerId(int customerId) {
        ArrayList<Bookings> bookingsList = new ArrayList<>();
        DBManager db = new DBManager();
        Connection conn = db.getConnection();

        String query = "SELECT b.booking_id, b.number_of_guests, b.order_date, b.check_in, b.check_out, r.room_size " +
                "FROM bookings b " +
                "JOIN booked_rooms br ON b.booking_id = br.booking_id " +
                "JOIN rooms r ON br.room_id = r.room_id " +
                "WHERE b.customer_id = ?";

        try {
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, customerId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Bookings booking = new Bookings();
                booking.setBookingId(rs.getString("booking_id"));
                booking.setNumberOfGuests(rs.getInt("number_of_guests"));
                booking.setOrderDate(rs.getTimestamp("order_date"));
                booking.setCheckInDate(rs.getTimestamp("check_in"));
                booking.setCheckOutDate(rs.getTimestamp("check_out"));
                booking.setRoomSize(rs.getString("room_size"));

                bookingsList.add(booking);
            }
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.closeConnection(conn);
        }
        return bookingsList;
    }


    public Bookings getBookingByBookingId(String bookingId) {
        Bookings booking = null;
        DBManager db = new DBManager();
        Connection conn = db.getConnection();

        String query = "SELECT b.booking_id, b.number_of_guests, b.order_date, b.check_in, b.check_out, r.room_size, ru.first_name, ru.last_name, ru.email_address " +
                "FROM bookings b " +
                "JOIN booked_rooms br ON b.booking_id = br.booking_id " +
                "JOIN rooms r ON br.room_id = r.room_id " +
                "JOIN registered_users ru ON b.customer_id = ru.customer_id " +
                "WHERE b.booking_id = ?";

        try {
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, bookingId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                booking = new Bookings();
                booking.setBookingId(rs.getString("booking_id"));
                booking.setNumberOfGuests(rs.getInt("number_of_guests"));
                booking.setOrderDate(rs.getTimestamp("order_date"));
                booking.setCheckInDate(rs.getTimestamp("check_in"));
                booking.setCheckOutDate(rs.getTimestamp("check_out"));
                booking.setRoomSize(rs.getString("room_size"));
                booking.setCustomerName(rs.getString("first_name") + " " + rs.getString("last_name"));
                booking.setEmailAddress(rs.getString("email_address"));
            }
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.closeConnection(conn);
        }
        return booking;
    }

    public ArrayList<Bookings> getBookingsByEmail(String email) {
        ArrayList<Bookings> bookingsList = new ArrayList<>();
        DBManager db = new DBManager();
        Connection conn = db.getConnection();

        String query = "SELECT b.booking_id, b.number_of_guests, b.order_date, b.check_in, b.check_out, r.room_size " +
                "FROM bookings b " +
                "JOIN booked_rooms br ON b.booking_id = br.booking_id " +
                "JOIN rooms r ON br.room_id = r.room_id " +
                "JOIN registered_users ru ON b.customer_id = ru.customer_id " +
                "WHERE ru.email_address = ?";

        try {
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Bookings booking = new Bookings();
                booking.setBookingId(rs.getString("booking_id"));
                booking.setNumberOfGuests(rs.getInt("number_of_guests"));
                booking.setOrderDate(rs.getTimestamp("order_date"));
                booking.setCheckInDate(rs.getTimestamp("check_in"));
                booking.setCheckOutDate(rs.getTimestamp("check_out"));
                booking.setRoomSize(rs.getString("room_size"));

                bookingsList.add(booking);
            }
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.closeConnection(conn);
        }
        return bookingsList;
    }

    /*
    *
    * Use this to handle for Guest Users as the Customer ID
    *
    *  */
    public int createNewCustomer(String fullName, String email, boolean isGuest) {
        DBManager db = new DBManager();
        Connection conn = db.getConnection();
        int customerId = -1;
        String[] nameParts = fullName.trim().split("\\s+", 2);
        String firstName = nameParts[0];
        String lastName = nameParts.length > 1 ? nameParts[1] : "";

        String insertQuery = "INSERT INTO registered_users (first_name, last_name, email_address, user_type) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, firstName);
            pstmt.setString(2, lastName);
            pstmt.setString(3, email);
            pstmt.setString(4, isGuest ? "guest" : "registered");
            pstmt.executeUpdate();

            ResultSet rs = pstmt.getGeneratedKeys();
            if (rs.next()) {
                customerId = rs.getInt(1);
            }
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.closeConnection(conn);
        }
        return customerId;
    }
    /*
    Checks if user exists in the records.
     */
    public int getCustomerIdByEmail(String email) {
        DBManager db = new DBManager();
        Connection conn = db.getConnection();
        int customerId = -1;
        String query = "SELECT customer_id FROM registered_users WHERE email_address=?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                customerId = rs.getInt("customer_id");
            }
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.closeConnection(conn);
        }
        return customerId;
    }
    /*
    * Retrieves the usertype by email address, if previously registered via differing method
    * */
    public String getUserTypeByEmail(String email) {
        DBManager db = new DBManager();
        Connection conn = db.getConnection();
        String userType = null;
        String query = "SELECT user_type FROM registered_users WHERE email_address=?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                userType = rs.getString("user_type");
            }
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.closeConnection(conn);
        }
        return userType;
    }



    /*
     *
     * Error with query: UNABLE TO DELETE BOOKINGS BECAUSE IT IS A PARENT
     */
    public void cancelBooking(int bookingID){
        DBManager db = new DBManager();
        Connection conn = db.getConnection();
        String updateQuery = "DELETE FROM bookings WHERE booking_id = ?";
        if(conn != null){
            try{
                PreparedStatement pstmt = conn.prepareStatement(updateQuery);
                pstmt.setInt(1, bookingID);
                pstmt.executeUpdate();
                System.out.println("Booking cancelled.");
            } catch (SQLException e){
                System.out.println("Unable to cancel booking.");
                e.printStackTrace();
            } finally {
                db.closeConnection(conn);
            }
        }
    }

}
