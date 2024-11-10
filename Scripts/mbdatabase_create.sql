DROP DATABASE IF EXISTS MB_DATABASE;
CREATE DATABASE MB_DATABASE;

CREATE TABLE MB_DATABASE . registeredUsers (
    customer_id int(5) NOT NULL AUTO_INCREMENT,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    email_address varchar(50) NOT NULL,
    password_hash varchar(255) NOT NULL,
    phone_number varchar(15)  NOT NULL,
    PRIMARY KEY (customer_id)
);

CREATE TABLE MB_DATABASE . rooms (
    room_id int(5) NOT NULL AUTO_INCREMENT,
    room_size varchar(99) NOT NULL,
    room_price DECIMAL(6, 2),
    PRIMARY KEY (room_id)
);

CREATE TABLE  MB_DATABASE . bookings (
    booking_id int(5) NOT NULL AUTO_INCREMENT,
    customer_id int(5) NOT NULL,
    number_of_guests integer,
    order_date timestamp,
    check_in timestamp,
    check_out timestamp,
    PRIMARY KEY (booking_id),
    FOREIGN KEY (customer_id) REFERENCES registeredUsers (customer_id)
);

CREATE TABLE MB_DATABASE . bookedRooms (
    booking_id int(5) NOT NULL,
    room_id int(5) NOT NULL,
    PRIMARY KEY (booking_id),
    FOREIGN KEY (booking_id) REFERENCES bookings (booking_id)
);

CREATE TABLE MB_DATABASE.contactUs (
    inquiry_id INT(5) NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email_address VARCHAR(50) NOT NULL,
    subject VARCHAR(100) NOT NULL,
    message TEXT NOT NULL,
    inquiry_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (inquiry_id)
);
