-- Moffat Bay Capstone Project
--  Developed by:
--  -Celine Del Mundo
--  -Ryan Norrbom
--  -Eric Williams-Phillips

-- Fresh database creation
DROP DATABASE IF EXISTS MB_DATABASE;
CREATE DATABASE MB_DATABASE;

-- Table to store user information after registration
CREATE TABLE MB_DATABASE.registered_users (
    customer_id INT(3) NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email_address VARCHAR(50) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15)  NOT NULL,
    PRIMARY KEY (customer_id, email_address)
);

-- Table to store room types
CREATE TABLE MB_DATABASE.rooms (
    room_size VARCHAR(25) NOT NULL,
    room_price DECIMAL(6, 2),
    PRIMARY KEY (room_size)
);

-- Table to store confirmed user bookings
CREATE TABLE  MB_DATABASE.bookings (
    booking_id INT(5) NOT NULL,
    email_address VARCHAR(50),
    number_of_guests INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    check_in TIMESTAMP,
    check_out TIMESTAMP,
    PRIMARY KEY (booking_id)
);

-- Table to store rooms that are booked to track availability
CREATE TABLE MB_DATABASE. booked_rooms (
    booking_id INT(5) NOT NULL,
    room_size VARCHAR(25) NOT NULL,
    PRIMARY KEY (booking_id),
    FOREIGN KEY (booking_id) REFERENCES bookings (booking_id)  ON DELETE CASCADE,
    FOREIGN KEY (room_size) REFERENCES rooms (room_size)
);

-- Table to store requests/messages from guests and users
CREATE TABLE MB_DATABASE.contact_us (
    inquiry_id INT(3) NOT NULL AUTO_INCREMENT, -- Changed from 5 to 3
    name VARCHAR(50) NOT NULL,
    email_address VARCHAR(50) NOT NULL,
    subject VARCHAR(100) NOT NULL,
    message TEXT NOT NULL,
    inquiry_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (inquiry_id)
);
