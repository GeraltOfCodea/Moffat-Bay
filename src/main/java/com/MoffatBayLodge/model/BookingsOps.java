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
    public void newBooking(String email, int numberOfGuests, Timestamp checkInDate, Timestamp checkOutDate, String roomSize){
        String bookingID = bookingIDGen();
        DBManager db = new DBManager();
        Connection conn = db.getConnection();
        Timestamp currentTime = new Timestamp(System.currentTimeMillis());
        String insertQuery = "INSERT INTO bookings (booking_id, email_address, number_of_guests, order_date, check_in, check_out) VALUES (?, ?, ?, ?, ?, ?)";
        String insertQuery2 = "INSERT INTO booked_rooms (booking_id, room_size) VALUES (?, ?)";
        if(conn != null){
            try {
                PreparedStatement pstmt = conn.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
                pstmt.setString(1, bookingID);
                pstmt.setString(2, email);
                pstmt.setInt(3, numberOfGuests);
                pstmt.setTimestamp(4, currentTime);
                pstmt.setTimestamp(5, checkInDate);
                pstmt.setTimestamp(6, checkOutDate);
                pstmt.executeUpdate();


                PreparedStatement pstmt2 = conn.prepareStatement(insertQuery2);
                pstmt2.setString(1, bookingID);
                pstmt2.setString(2, roomSize);
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

}
