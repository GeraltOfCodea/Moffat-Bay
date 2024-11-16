package com.MoffatBayLodge.model;

import com.MoffatBayLodge.beans.Bookings;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;

public class BookingsOps {

    String customerName;

    public void newBooking(int customerID, int numberOfGuests, Timestamp checkInDate, Timestamp checkOutDate, int roomID){
        DBManager db = new DBManager();
        Connection conn = db.getConnection();
        Timestamp currentTime = new Timestamp(System.currentTimeMillis());
        String insertQuery = "INSERT INTO bookings (customer_id, number_of_guests, order_date, check_in, check_out) VALUES (?, ?, ?, ?, ?)";
        String insertQuery2 = "INSERT INTO booked_rooms (booking_id, room_id) VALUES (?, ?)";
        if(conn != null){
            try {
                PreparedStatement pstmt = conn.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
                pstmt.setInt(1, customerID);
                pstmt.setInt(2, numberOfGuests);
                pstmt.setTimestamp(3, currentTime);
                pstmt.setTimestamp(4, checkInDate);
                pstmt.setTimestamp(5, checkOutDate);
                pstmt.executeUpdate();
                // Retrieve the generated booking ID
                ResultSet generatedKeys = pstmt.getGeneratedKeys();
                int bookingID = -1;
                if (generatedKeys.next()) {
                    bookingID = generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Creating booking failed, no ID obtained.");
                }



                PreparedStatement pstmt2 = conn.prepareStatement(insertQuery2);
                pstmt2.setInt(1, bookingID);
                pstmt2.setInt(2, roomID);
                pstmt2.executeUpdate();
                System.out.println("Successfully booked!");


            } catch (SQLException e) {
                System.out.println("Unable to book reservation.");
                e.printStackTrace();
            } finally {
                db.closeConnection(conn);
            }
        }
    }

    public static ArrayList<Bookings> getBookingByCustomerID(int customerID){
        String query = "SELECT * FROM bookings WHERE customer_id = " + customerID;

        DBManager db = new DBManager();
        Connection conn = db.getConnection();
        Bookings booking = null;
        ArrayList<Bookings> allBookings = new ArrayList<Bookings>();
        if(conn != null){
            try {
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query);
                while(rs.next()){
                    booking = new Bookings();
                    booking.setBookingId(rs.getInt(1));
                    booking.setCustomerId(rs.getInt(2));
                    booking.setNumberOfGuests(rs.getInt(3));
                    booking.setOrderDate(rs.getDate(4));
                    booking.setCheckInDate(rs.getDate(5));
                    booking.setCheckOutDate(rs.getDate(6));

                    allBookings.add(booking);
                }
            } catch (SQLException e){
                System.out.println("Unable to get bookings from database.");
                e.printStackTrace();
            } finally {
                db.closeConnection(conn);
            }

        }
        return allBookings;
    }




    public void showBookings(ArrayList<Bookings> bookings, int customerID){

        System.out.println("Displaying all of the current reservations for : " + CustomerOps.getNameByID(customerID));
        for(Bookings booking : getBookingByCustomerID(customerID)){

            System.out.println(
                    "Booking ID: " + booking.getBookingId() +
                    "\nNumber of Guests: " + booking.getNumberOfGuests() +
                    "\nOrder Date: " + booking.getOrderDate() +
                    "\nCheck In Date: " + booking.getCheckInDate() +
                    "\nCheck Out Date: " + booking.getCheckOutDate());
            System.out.println("==================================");
        }
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

    public void updateBooking(int bookingID, int numberOfGuests, Timestamp checkInDate, Timestamp checkOutDate, int roomID){
        DBManager db = new DBManager();
        Connection conn = db.getConnection();
        String updateQuery = "UPDATE bookings SET number_of_guests = ?," +
                "check_in = ?,"
                + "check_out = ?"
                + "WHERE booking_id = ?";
        String updateQuery2 = "UPDATE booked_rooms SET room_id = ? WHERE booking_id = ?";


        if (conn != null){
            try {
                PreparedStatement pstmt = conn.prepareStatement(updateQuery);
                pstmt.setInt(1, numberOfGuests);
                pstmt.setTimestamp(2, checkInDate);
                pstmt.setTimestamp(3, checkOutDate);
                pstmt.setInt(4, bookingID);
                pstmt.executeUpdate();

                PreparedStatement pstmt2 = conn.prepareStatement(updateQuery2);
                pstmt2.setInt(1, roomID);
                pstmt2.setInt(2, bookingID);
                pstmt2.executeUpdate();

                System.out.println("Reservation successfully updated.");
            } catch (SQLException e){
                System.out.println("Unable to update booking.");
                e.printStackTrace();
            } finally {
                db.closeConnection(conn);
            }
        }


