package com.MoffatBayLodge;

import com.MoffatBayLodge.beans.Bookings;
import com.MoffatBayLodge.beans.Customer;
import com.MoffatBayLodge.model.BookingsOps;
import com.MoffatBayLodge.model.CustomerOps;
import com.MoffatBayLodge.model.DBManager;

import java.sql.Timestamp;
import java.time.Instant;
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {

        DBManager db = new DBManager();
        BookingsOps bops = new BookingsOps();
        CustomerOps cops = new CustomerOps();

/*
        bops.showBookings(BookingsOps.getBookingByCustomerID(1), 1);
        bops.updateBooking(
                1,
                3,
                Timestamp.from(Instant.now()),
                Timestamp.from(Instant.now()),
                        3
        );

        System.out.println("Adjusted return.");
        bops.showBookings(BookingsOps.getBookingByCustomerID(1), 1);
*/

        //cops.addRegisteredUser("Test", "Account", "test@gmail.com", "12345678                                             ", "1111111111");

    }
}