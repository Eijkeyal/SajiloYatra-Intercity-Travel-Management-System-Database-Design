Create table Query

1. Route 
CREATE TABLE Route (
    Route_ID NUMBER(10) PRIMARY KEY,
    Route_Name VARCHAR2(30) NOT NULL,
    Origin_City VARCHAR2(30) NOT NULL,
    Destination_City VARCHAR2(30) NOT NULL,
    Duration NUMBER(3) NOT NULL
);

2. Trip
CREATE TABLE Trip (
    Trip_ID NUMBER(10) PRIMARY KEY,
    Departure_Date DATE NOT NULL,
    Departure_Time VARCHAR2(8) NOT NULL, 
    Arrival_Time VARCHAR2(8) NOT NULL,  
    Trip_Status VARCHAR2(15) NOT NULL,
    Route_ID NUMBER(10) NOT NULL,
    FOREIGN KEY (Route_ID) REFERENCES Route(Route_ID)
);

3. Bus
CREATE TABLE Bus (
    Bus_ID NUMBER(10) PRIMARY KEY,
    Bus_Number VARCHAR2(10) NOT NULL,
    Bus_Capacity NUMBER(3) NOT NULL,
    Bus_Status VARCHAR2(15) NOT NULL
);

4. Staff
CREATE TABLE Staff (
    Staff_ID NUMBER(10) PRIMARY KEY,
    Staff_Name VARCHAR2(50) NOT NULL,
    Staff_Role VARCHAR2(20) NOT NULL
);

5. Passenger
CREATE TABLE Passenger (
    Passenger_ID NUMBER(10) PRIMARY KEY,
    Full_Name VARCHAR2(50) NOT NULL,
    Passenger_City VARCHAR2(30) NOT NULL,
    Phone_Number VARCHAR2(15),
    Email VARCHAR2(40)
);

6. Trip_Bus (references Bus and Trip, composite PK)
CREATE TABLE Trip_Bus (
    Trip_ID NUMBER(10) NOT NULL,
    Bus_ID NUMBER(10) NOT NULL,
    PRIMARY KEY (Trip_ID, Bus_ID),
    FOREIGN KEY (Trip_ID) REFERENCES Trip(Trip_ID),
    FOREIGN KEY (Bus_ID) REFERENCES Bus(Bus_ID)
);

7. Trip_Bus_Staff (references Trip_Bus and Staff, composite PK)
CREATE TABLE Trip_Bus_Staff (
    Trip_ID NUMBER(10) NOT NULL,
    Bus_ID NUMBER(10) NOT NULL,
    Staff_ID NUMBER(10) NOT NULL,
    PRIMARY KEY (Trip_ID, Bus_ID, Staff_ID),
    FOREIGN KEY (Trip_ID, Bus_ID) REFERENCES Trip_Bus(Trip_ID, Bus_ID),
    FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID)
);

8. Ticket (references Trip, Bus, Passenger)
CREATE TABLE Ticket (
    Ticket_ID NUMBER(10) PRIMARY KEY,
    Trip_ID NUMBER(10) NOT NULL,
    Bus_ID NUMBER(10) NOT NULL,
    Booking_Date DATE NOT NULL,
    Booking_Status VARCHAR2(10) NOT NULL,
    Booking_Class VARCHAR2(10) NOT NULL,
    Seat_Number NUMBER(3) NOT NULL,
    Fare_Amount NUMBER(6) NOT NULL,
    Passenger_ID NUMBER(10) NOT NULL,
    FOREIGN KEY (Trip_ID) REFERENCES Trip(Trip_ID),
    FOREIGN KEY (Bus_ID) REFERENCES Bus(Bus_ID),
    FOREIGN KEY (Passenger_ID) REFERENCES Passenger(Passenger_ID)
);

9. Payment (references Ticket)
CREATE TABLE Payment (
    Payment_ID NUMBER(10) PRIMARY KEY,
    Ticket_ID NUMBER(10) NOT NULL,
    Payment_Method VARCHAR2(20) NOT NULL,
    Payment_Amount NUMBER(10) NOT NULL,
    FOREIGN KEY (Ticket_ID) REFERENCES Ticket(Ticket_ID)
);
