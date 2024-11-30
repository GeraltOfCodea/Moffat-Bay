package com.MoffatBayLodge.beans;

import java.sql.Timestamp;

/*
 *
 * Class to define all registrations
 * This class tracks a registration's ID, the customer ID who placed the registration,
 * The amount of guests staying, the date that the order is being placed, check in and check out dates
 *
 */
public class Bookings {
    private String bookingId;         // Changed from int to String
    private int customerId;
    private String customerName;      // Added field
    private String emailAddress;      // Added field
    private int numberOfGuests;
    private Timestamp orderDate;      // Changed from Date to Timestamp
    private Timestamp checkInDate;    // Changed from Date to Timestamp
    private Timestamp checkOutDate;   // Changed from Date to Timestamp
    private String roomSize;          // Added field

    // Default constructor
    public Bookings() {
    }

    // Constructor with all fields
    public Bookings(String bookingId, int customerId, String customerName, String emailAddress, int numberOfGuests, Timestamp orderDate, Timestamp checkInDate, Timestamp checkOutDate, String roomSize) {
        this.bookingId = bookingId;
        this.customerId = customerId;
        this.customerName = customerName;
        this.emailAddress = emailAddress;
        this.numberOfGuests = numberOfGuests;
        this.orderDate = orderDate;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
        this.roomSize = roomSize;
    }

    // Getters and Setters
    public String getBookingId() {
        return bookingId;
    }
    public void setBookingId(String bookingId) {
        this.bookingId = bookingId;
    }
    public int getCustomerId() {
        return customerId;
    }
    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }
    public String getCustomerName() {
        return customerName;
    }
    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }
    public String getEmailAddress() {
        return emailAddress;
    }
    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }
    public int getNumberOfGuests() {
        return numberOfGuests;
    }
    public void setNumberOfGuests(int numberOfGuests) {
        this.numberOfGuests = numberOfGuests;
    }
    public Timestamp getOrderDate() {
        return orderDate;
    }
    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }
    public Timestamp getCheckInDate() {
        return checkInDate;
    }
    public void setCheckInDate(Timestamp checkInDate) {
        this.checkInDate = checkInDate;
    }
    public Timestamp getCheckOutDate() {
        return checkOutDate;
    }
    public void setCheckOutDate(Timestamp checkOutDate) {
        this.checkOutDate = checkOutDate;
    }
    public String getRoomSize() {
        return roomSize;
    }
    public void setRoomSize(String roomSize) {
        this.roomSize = roomSize;
    }
}