-- Step 1: Create Database for Project

CREATE DATABASE HotelBookingSystem;

-- Step 2: Select Database

USE HotelBookingSystem;

-- Step 3: Create Table 

			--  Customer Table --

CREATE TABLE Customers(
	Customer_id INT AUTO_INCREMENT PRIMARY KEY, -- unique identifier
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	phone VARCHAR(15),
	email VARCHAR(100),
	address VARCHAR(255)
);

			-- Hotels Table --

CREATE TABLE Hotels(
hotel_id INT AUTO_INCREMENT PRIMARY KEY, -- unique identifier
hotel_name VARCHAR(100) NOT NULL,
location VARCHAR(100),
star_rating INT CHECK(star_rating BETWEEN 1 AND 5) -- Hotel rating between 1 to 5
);

			-- Rooms Table --

CREATE TABLE Rooms(
room_id INT AUTO_INCREMENT PRIMARY KEY, 
hotel_id INT,
room_type VARCHAR(50), -- type room( single, double, suite)
price_per_night DECIMAL(10,2), -- room price per night
availability_status BOOLEAN DEFAULT TRUE, 
FOREIGN KEY(hotel_id) REFERENCES Hotels(hotel_id) -- establishing relationship between hotel and rooms table
);

			-- Dates Table --

CREATE TABLE Dates(
date_id INT AUTO_INCREMENT PRIMARY KEY,
booking_date DATE NOT NULL,
check_in_dt DATE NOT NULL,
check_out_dt DATE NOT NULL
);

			-- Payments Table --

CREATE TABLE Payments(
payment_id INT AUTO_INCREMENT PRIMARY KEY,
payment_method VARCHAR(50), -- eg. credit card, cash
payment_date DATE NOT NULL,
amount DECIMAL(10,2) NOT NULL
);

			-- Bookings(Fact table) --

CREATE TABLE Bookings(
booking_id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT, -- foreign key from Customers
room_id INT, -- foreign key from Rooms
date_id INT, -- foreign key from Dates
payment_id INT, -- foreign key from Payments
FOREIGN KEY(customer_id) REFERENCES Customers(customer_id),
FOREIGN KEY(room_id) REFERENCES Rooms(room_id),
FOREIGN KEY(date_id) REFERENCES Dates(date_id),
FOREIGN KEY(payment_id) REFERENCES Payments(payment_id)
);