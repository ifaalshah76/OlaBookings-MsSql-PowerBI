USE OlaBookingsDB;
GO

/*

=========================================================
    OLA DATA ANALYST PROJECT — BUSINESS QUESTIONS
=========================================================
*/

-- 1. Retrieve all successful bookings
SELECT *
FROM Bookings
WHERE Booking_Status = 'Success';
GO


-- 2. Find the average ride distance for each vehicle type
SELECT
    Vehicle_Type,
    AVG(Ride_Distance) AS AvgRideDistance
FROM Bookings
GROUP BY Vehicle_Type;
GO


-- 3. Get the total number of rides cancelled by customers
SELECT
    COUNT(Booking_ID) AS TotalRidesCancelledByCustomer
FROM Bookings
WHERE Booking_Status = 'Canceled by Customer';
GO


-- 4. List the top 5 customers who booked the highest number of rides
SELECT TOP 5
    Customer_ID,
    COUNT(*) AS BookingsCount
FROM Bookings
GROUP BY Customer_ID
ORDER BY BookingsCount DESC;
GO


-- Create a nonclustered index on Customer_ID
CREATE NONCLUSTERED INDEX IDX_Bookings_CustomerID
ON Bookings (Customer_ID);
GO


-- Alternative approach using ROW_NUMBER()
WITH RankedCustomers AS
(
    SELECT
        Customer_ID,
        COUNT(Booking_ID) AS BookingsCount,
        ROW_NUMBER() OVER (
            ORDER BY COUNT(Booking_ID) DESC, Customer_ID
        ) AS rn
    FROM Bookings
    GROUP BY Customer_ID
)
SELECT
    Customer_ID,
    BookingsCount
FROM RankedCustomers
WHERE rn <= 5
ORDER BY BookingsCount DESC, Customer_ID;
GO


-- 5. Count rides cancelled by drivers due to personal
--    and car-related issues
SELECT
    COUNT(*) AS TotalRidesCancelledByDriver
FROM Bookings
WHERE Booking_Status = 'Canceled by Driver'
  AND Canceled_Rides_by_Driver = 'Personal & Car related issue';
GO


-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings
SELECT
    Vehicle_Type,
    MAX(Driver_Ratings) AS MaxDriverRating,
    MIN(Driver_Ratings) AS MinDriverRating
FROM Bookings
WHERE Vehicle_Type = 'Prime Sedan'
GROUP BY Vehicle_Type;
GO


-- Create a nonclustered index on Payment_Method
CREATE NONCLUSTERED INDEX IDX_Bookings_PaymentMethod
ON Bookings (Payment_Method);
GO


-- 7. Retrieve all successful rides paid for using UPI
SELECT *
FROM Bookings
WHERE Payment_Method = 'UPI';
GO


-- 8. Find the average customer rating for each vehicle type
SELECT
    Vehicle_Type,
    AVG(Customer_Rating) AS AvgCustomerRating
FROM Bookings
GROUP BY Vehicle_Type;
GO


-- 9. Calculate the total booking value of successfully completed rides
SELECT
    SUM(Booking_Value) AS TotalSuccessfulBookingValue
FROM Bookings
WHERE Booking_Status = 'Success';
GO


-- 10. List all incomplete rides along with their details and status
SELECT Booking_ID, Incomplete_Rides_Reason
FROM Bookings
WHERE Incomplete_Rides = 'Yes';
GO

SELECT * FROM Bookings