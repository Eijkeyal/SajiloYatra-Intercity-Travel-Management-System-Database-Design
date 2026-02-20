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
