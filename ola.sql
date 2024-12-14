create database ola;
use ola;

# 1. Retrieve all successful bookings:
create view Successfull_Bookings as
SELECT * from bookings
where Booking_Status = 'Success';

select * from Successfull_Bookings;

#  2. Find the average ride distance for each vehicle type:
create view Ride_Distance_for_each_vehicle as
select vehicle_Type, avg(Ride_distance)
as avg_distance from bookings
group by Vehicle_Type;

select * from Ride_Distance_for_each_vehicle;

# 3. Get the total number of cancelled rides by customers:
create view Ride_Canceled_By_Customer as
select count(*) from bookings
where Booking_Status= "Canceled by Customer";

select * from Ride_Canceled_By_Customer;

# 4. List the top 5 customers who booked the highest number of rides:
create view top_5_book_ride as 
SELECT Customer_ID, COUNT(Booking_ID) AS Total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY Total_rides DESC LIMIT 5;

select * from top_5_book_ride;

# 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view Cancel_by_DriveI as
select count(*) from bookings
where Canceled_Rides_by_Driver = "Personal & Car related issue";

select * from Cancel_by_DriveI;

# 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT MAX(Driver_Ratings) AS max_rating,
MIN(Driver_Ratings) AS min_ratings
FROM bookings
WHERE Vehicle_Type = "Prime Sedan";

# 7. Retrieve all rides where payment was made using UPI:
select * from bookings
where Payment_Method = "UPI";
 
# 7.1. Retrieve all rides count where payment was made using UPI:
select count(*) from bookings
where Payment_Method = "UPI";

# 8. Find the average customer rating per vehicle type:
select Vehicle_Type, avg(Customer_Rating) from bookings
group by Vehicle_Type;

# 9. Calculate the total booking value of rides completed successfully:
select sum(Booking_Value) from bookings where Booking_Status="Success";
# Wrong
select count(*) from bookings 
where Booking_Status = "Success";

# 10. List all incomplete rides along with the reason:
select Booking_ID, Incomplete_Rides, Incomplete_Rides_Reason from bookings
where Incomplete_Rides = "Yes";