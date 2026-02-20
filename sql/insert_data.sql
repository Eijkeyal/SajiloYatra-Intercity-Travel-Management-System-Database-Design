Insert data Query
1. Route
INSERT INTO Route VALUES (1, 'Kathmandu-Pokhara', 'Kathmandu', 'Pokhara', 6);
INSERT INTO Route VALUES (2, 'Kathmandu-Biratnagar', 'Kathmandu', 'Biratnagar', 8);
INSERT INTO Route VALUES (3, 'Kathmandu-Lukla', 'Kathmandu', 'Lukla', 1);
INSERT INTO Route VALUES (4, 'Pokhara-Chitwan', 'Pokhara', 'Chitwan', 5);
INSERT INTO Route VALUES (5, 'Biratnagar-Dharan', 'Biratnagar', 'Dharan', 2);
INSERT INTO Route VALUES (6, 'Kathmandu-Butwal', 'Kathmandu', 'Butwal', 7);
INSERT INTO Route VALUES (7, 'Pokhara-Lukla', 'Pokhara', 'Lukla', 2);
2. Trip
INSERT INTO Trip VALUES (1, DATE '2026-01-20', '06:00:00', '12:00:00', 'Scheduled', 1);
INSERT INTO Trip VALUES (2, DATE '2026-01-21', '07:00:00', '15:00:00', 'Scheduled', 2);
INSERT INTO Trip VALUES (3, DATE '2026-01-22', '08:00:00', '09:00:00', 'Scheduled', 3);
INSERT INTO Trip VALUES (4, DATE '2026-01-23', '06:30:00', '11:30:00', 'Cancelled', 4);
INSERT INTO Trip VALUES (5, DATE '2026-01-24', '09:00:00', '11:00:00', 'Scheduled', 5);
INSERT INTO Trip VALUES (6, DATE '2026-01-25', '05:30:00', '12:30:00', 'Scheduled', 6);
INSERT INTO Trip VALUES (7, DATE '2026-01-26', '10:00:00', '12:00:00', 'Scheduled', 7);
3. Bus
INSERT INTO Bus VALUES (1, 'BA-1001', 40, 'Available');
INSERT INTO Bus VALUES (2, 'BA-1002', 45, 'Available');
INSERT INTO Bus VALUES (3, 'BA-1003', 35, 'In Maintenance');
INSERT INTO Bus VALUES (4, 'BA-1004', 50, 'Available');
INSERT INTO Bus VALUES (5, 'BA-1005', 30, 'Available');
INSERT INTO Bus VALUES (6, 'BA-1006', 42, 'Available');
INSERT INTO Bus VALUES (7, 'BA-1007', 40, 'In Maintenance');
4. Staff
INSERT INTO Staff VALUES (1, 'Ram Sharma', 'Driver');
INSERT INTO Staff VALUES (2, 'Sita Khadka', 'Conductor');
INSERT INTO Staff VALUES (3, 'Hari Thapa', 'Driver');
INSERT INTO Staff VALUES (4, 'Gita Shrestha', 'Conductor');
INSERT INTO Staff VALUES (5, 'Mohan Rai', 'Driver');
INSERT INTO Staff VALUES (6, 'Sharmila KC', 'Conductor');
INSERT INTO Staff VALUES (7, 'Ramesh Adhikari', 'Driver');
5. Passenger
INSERT INTO Passenger VALUES (1, 'Anisha Pakhrin', 'Kathmandu', '980000001', 'anisha@mail.com');
INSERT INTO Passenger VALUES (2, 'Sujan Thapa', 'Pokhara', '980000002', 'sujan@mail.com');
INSERT INTO Passenger VALUES (3, 'Maya Gurung', 'Biratnagar', '980000003', 'maya@mail.com');
INSERT INTO Passenger VALUES (4, 'Rohan Shrestha', 'Chitwan', '980000004', 'rohan@mail.com');
INSERT INTO Passenger VALUES (5, 'Priya KC', 'Lukla', '980000005', 'priya@mail.com');
INSERT INTO Passenger VALUES (6, 'Anil Rai', 'Butwal', '980000006', 'anil@mail.com');
INSERT INTO Passenger VALUES (7, 'Suman Sharma', 'Dharan', '980000007', 'suman@mail.com');
6. Trip_Bus 
INSERT INTO Trip_Bus VALUES (1, 1);
INSERT INTO Trip_Bus VALUES (2, 2);
INSERT INTO Trip_Bus VALUES (3, 3);
INSERT INTO Trip_Bus VALUES (4, 4);
INSERT INTO Trip_Bus VALUES (5, 5);
INSERT INTO Trip_Bus VALUES (6, 6);
INSERT INTO Trip_Bus VALUES (7, 7);
7. Trip_Bus_Staff (references Trip_Bus and Staff)
INSERT INTO Trip_Bus_Staff VALUES (1, 1, 1);
INSERT INTO Trip_Bus_Staff VALUES (2, 2, 2);
INSERT INTO Trip_Bus_Staff VALUES (3, 3, 3);
INSERT INTO Trip_Bus_Staff VALUES (4, 4, 4);
INSERT INTO Trip_Bus_Staff VALUES (5, 5, 5);
INSERT INTO Trip_Bus_Staff VALUES (6, 6, 6);
INSERT INTO Trip_Bus_Staff VALUES (7, 7, 7);
8. Ticket (references Trip, Bus, Passenger)
INSERT INTO Ticket VALUES (1, 1, 1, DATE '2026-01-15', 'Confirmed', 'Economy', 1, 1500, 1);
INSERT INTO Ticket VALUES (2, 2, 2, DATE '2026-01-16', 'Confirmed', 'Economy', 2, 1800, 2);
INSERT INTO Ticket VALUES (3, 3, 3, DATE '2026-01-17', 'Confirmed', 'Business', 3, 2500, 3);
INSERT INTO Ticket VALUES (4, 4, 4, DATE '2026-01-18', 'Cancelled', 'Economy', 4, 1200, 4);
INSERT INTO Ticket VALUES (5, 5, 5, DATE '2026-01-19', 'Confirmed', 'Economy', 5, 1600, 5);
INSERT INTO Ticket VALUES (6, 6, 6, DATE '2026-01-20', 'Confirmed', 'Business', 6, 3000, 6);
INSERT INTO Ticket VALUES (7, 7, 7, DATE '2026-01-21', 'Confirmed', 'Economy', 7, 1400, 7);
9. Payment (references Ticket)
INSERT INTO Payment VALUES (1, 1, 'Cash', 1500);
INSERT INTO Payment VALUES (2, 2, 'Card', 1800);
INSERT INTO Payment VALUES (3, 3, 'Online', 2500);
INSERT INTO Payment VALUES (4, 4, 'Cash', 1200);
INSERT INTO Payment VALUES (5, 5, 'Card', 1600);
INSERT INTO Payment VALUES (6, 6, 'Online', 3000);
INSERT INTO Payment VALUES (7, 7, 'Cash', 1400);




