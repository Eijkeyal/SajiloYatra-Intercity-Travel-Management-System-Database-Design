Information Queries 

1. List all routes along with the total number of trips scheduled on each route.
SELECT r.Route_ID,
       r.Route_Name,
       COUNT(t.Trip_ID) AS Total_Trips
FROM Route r
LEFT JOIN Trip t ON r.Route_ID = t.Route_ID
GROUP BY r.Route_ID, r.Route_Name
ORDER BY r.Route_ID;

2. List all trips departing from “Pokhara” with their departure time and assigned route name.

SELECT t.Trip_ID,
       t.Departure_Date,
       t.Departure_Time,
       r.Route_Name
FROM Trip t
JOIN Route r ON t.Route_ID = r.Route_ID
WHERE r.Origin_City = 'Pokhara'
ORDER BY t.Departure_Date;

3. List the names of passengers whose names start with 'A', along with the total number of trips they have booked.

SELECT p.Full_Name,
       COUNT(t.Ticket_ID) AS Total_Booked_Trips
FROM Passenger p
JOIN Ticket t ON p.Passenger_ID = t.Passenger_ID
WHERE p.Full_Name LIKE 'A%'
GROUP BY p.Full_Name
ORDER BY p.Full_Name;

4. List all passengers who have booked more than 2 trips in December 2025.
SELECT p.Full_Name,
       COUNT(t.Ticket_ID) AS Trips_in_Dec2025
FROM Passenger p
JOIN Ticket t ON p.Passenger_ID = t.Passenger_ID
WHERE t.Booking_Date BETWEEN TO_DATE('01-DEC-2025', 'DD-MON-YYYY')
                         AND TO_DATE('31-DEC-2025', 'DD-MON-YYYY')
GROUP BY p.Full_Name
HAVING COUNT(t.Ticket_ID) > 2
ORDER BY Trips_in_Dec2025 DESC;

5. List all tickets issued in January 2025 with passenger names, trip IDs, and payment status (‘Paid’ or ‘Unpaid’)

Assuming “Paid” if there’s a record in Payment, otherwise “Unpaid”:

SELECT t.Ticket_ID,
       t.Trip_ID,
       p.Full_Name,
       CASE 
           WHEN pay.Payment_ID IS NOT NULL THEN 'Paid'
           ELSE 'Unpaid'
       END AS Payment_Status
FROM Ticket t
JOIN Passenger p ON t.Passenger_ID = p.Passenger_ID
LEFT JOIN Payment pay ON t.Ticket_ID = pay.Ticket_ID
WHERE t.Booking_Date BETWEEN TO_DATE('01-JAN-2025', 'DD-MON-YYYY')
                         AND TO_DATE('31-JAN-2025', 'DD-MON-YYYY')
ORDER BY t.Ticket_ID;


Transaction Query

1. Find the trip with the latest departure time
SELECT *
FROM Trip
WHERE Departure_Date = (SELECT MAX(Departure_Date) FROM Trip);

2. List the top three passengers who have booked the most trips
SELECT *
FROM (
    SELECT p.Full_Name,
           COUNT(t.Ticket_ID) AS Trips_Booked
    FROM Passenger p
    JOIN Ticket t ON p.Passenger_ID = t.Passenger_ID
    GROUP BY p.Full_Name
    ORDER BY Trips_Booked DESC
)
WHERE ROWNUM <= 3;

Shows top 3 passengers by number of tickets booked.

3. List all passengers who have made payments greater than the average payment amount, along with the total amount they have paid
SELECT p.Full_Name,
       SUM(pay.Payment_Amount) AS Total_Paid
FROM Passenger p
JOIN Ticket t ON p.Passenger_ID = t.Passenger_ID
JOIN Payment pay ON t.Ticket_ID = pay.Ticket_ID
GROUP BY p.Full_Name
HAVING SUM(pay.Payment_Amount) > (SELECT AVG(Payment_Amount) FROM Payment)
ORDER BY Total_Paid DESC;


Shows passengers whose total payments exceed the average.

4. Calculate total revenue generated per route along with the number of trips operated on each route
SELECT r.Route_Name,
       COUNT(DISTINCT t.Trip_ID) AS Total_Trips,
       SUM(pay.Payment_Amount) AS Total_Revenue
FROM Route r
JOIN Trip t ON r.Route_ID = t.Route_ID
JOIN Ticket ti ON t.Trip_ID = ti.Trip_ID
JOIN Payment pay ON ti.Ticket_ID = pay.Ticket_ID
GROUP BY r.Route_Name
ORDER BY Total_Revenue DESC;


Total revenue is sum of all payments per route, plus the number of trips.
5. List all trips where the number of booked tickets is less than 50% of the bus capacity
SELECT t.Trip_ID,
       r.Route_Name,
       b.Bus_Number,
       b.Bus_Capacity,
       COUNT(ti.Ticket_ID) AS Tickets_Booked
FROM Trip t
JOIN Route r ON t.Route_ID = r.Route_ID
JOIN Trip_Bus tb ON t.Trip_ID = tb.Trip_ID
JOIN Bus b ON tb.Bus_ID = b.Bus_ID
LEFT JOIN Ticket ti 
       ON t.Trip_ID = ti.Trip_ID 
      AND ti.Bus_ID = b.Bus_ID
GROUP BY t.Trip_ID, r.Route_Name, b.Bus_Number, b.Bus_Capacity
HAVING COUNT(ti.Ticket_ID) < (b.Bus_Capacity / 2)
ORDER BY t.Trip_ID;
