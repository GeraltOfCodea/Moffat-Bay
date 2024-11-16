package com.MoffatBayLodge.beans;

import java.sql.Date;

public class Bookings {
    private int bookingId;
    private int customerId;
    private int numberOfGuests;
    private Date orderDate;
    private Date checkInDate;
    private Date checkOutDate;

    /*
    *
    * Class to define all registrations
    * This class tracks a registration's ID, the customer ID who placed the registration,
    * The amount of guests staying, the date that the order is being placed, check in and check out dates
    *
     */
    public Bookings(){

    }
    public Bookings(int bookingId, int customerId, int numberOfGuests, Date orderDate, Date checkInDate, Date checkOutDate){
        this.bookingId = bookingId;
        this.customerId = customerId;
        this.numberOfGuests = numberOfGuests;
        this.orderDate = orderDate;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
    }

    public int getBookingId() {
        return bookingId;
    }
    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }
    public int getCustomerId() {
        return customerId;
    }
    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }
    public int getNumberOfGuests() {
        return numberOfGuests;
    }
    public void setNumberOfGuests(int numberOfGuests) {
        this.numberOfGuests = numberOfGuests;
    }
    public Date getOrderDate() {
        return orderDate;
    }
    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }
    public Date getCheckInDate() {
        return checkInDate;
    }
    public void setCheckInDate(Date checkInDate) {
        this.checkInDate = checkInDate;
    }
    public Date getCheckOutDate() {
        return checkOutDate;
    }
    public void setCheckOutDate(Date checkOutDate) {
        this.checkOutDate = checkOutDate;
    }
