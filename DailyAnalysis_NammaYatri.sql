
select * from NammaYatri..assembly

select * from NammaYatri..duration

Select * from NammaYatri..payment 

Select * from NammaYatri..trip_details

select * from NammaYatri..trip_details_filterDatabase

Select * from NammaYatri..trips   

-- Total Trips
Select count(*) trips_completed from NammaYatri..trips

Select count(*) from NammaYatri..trip_details
where end_ride = 1

-- Total Searches for trip
Select count(*) from NammaYatri..trip_details


Select count(distinct tripid) from NammaYatri..trip_details
-- 
Select tripid, count(tripid) as trip from NammaYatri..trip_details
group by tripid
having count(tripid) > 1

-- find Total Number of Drivers
Select count(distinct driverid) total driversfrom NammaYatri..trips

-- Total earnings

select sum(fare) total_sum from NammaYatri..trips

-- Total number of completed trips
select count(tripid) from NammaYatri..trips

-- Total Number of Searches Took Place
Select count(searches) from NammaYatri..trip_details

-- Total No.of Searches got Estimated

Select sum(searches_got_estimate) as estimated from NammaYatri..trip_details

-- Total Number of quotes/drivers Searched
select sum(searches_for_quotes) as searched_driver from NammaYatri..trip_details

-- Total searches got quotes or drivers 
select sum(searches_got_quotes) SGD from NammaYatri..trip_details

-- Number of trips not cancelled by customer
select sum(customer_not_cancelled) CND from NammaYatri..trip_details

-- Number of trips Not cancelled by driver
select sum(driver_not_cancelled) as ncD from NammaYatri..trip_details

-- Total Numner of trips cancelled by driver
select count(driver_not_cancelled) as ncD from NammaYatri..trip_details
where driver_not_cancelled = 0

-- Or

Select count(*) -  sum(driver_not_cancelled) as ncD from NammaYatri..trip_details

-- Total OTP Entered
Select sum(otp_entered) as Totp_entered from  NammaYatri..trip_details

-- Total Number of End ride
select sum(end_ride) as Total_eride from NammaYatri..trip_details 

-- Average distance per Trip
select round(avg(distance), 2) as average_dist from NammaYatri..trips

-- Average fare per trip

select round(avg(fare), 2) as avgcost from NammaYatri..trips

-- Total distance travelled
select sum(distance) distkm from NammaYatri..trips

-- which is the most used payment method 
select Top 1 faremethod, count(faremethod) numfarem  from NammaYatri..trips
group by faremethod
order by numfarem Desc

select a.method from NammaYatri..payment a inner join 
(select Top 1 faremethod, count(faremethod) numfarem  from NammaYatri..trips
group by faremethod
order by numfarem Desc) b  on a.id = b.faremethod

-- The Highest payment was made through which instrument 
select a.method from NammaYatri..payment a inner join   -- single highest paid payment method
(select Top 1*  from NammaYatri..trips
order by fare desc) b on a.id = b.faremethod


select faremethod, sum(fare) highest_paid from NammaYatri..trips   -- highest paid payment in a day
group by faremethod
order by highest_paid desc

select c.method from  NammaYatri..payment c inner join 
(select Top 1 faremethod, sum(fare) highest_paid from NammaYatri..trips   -- highest paid payment in a day
group by faremethod
order by highest_paid desc) b on c.id = b.faremethod

-- Which two location had the most trips
select * from
(select * , dense_rank() over(order by numbert desc) rnk
from 
(select loc_from, loc_to, count(distinct tripid) numbert from NammaYatri..trips
group by loc_from, loc_to
 ) a ) b
 where b.rnk = 1


 -- Top 5 Earning Drivers
 select * from
 (select *, dense_rank() over( order by earning desc) rnk from
 (select driverid, sum(fare) earning from NammaYatri..trips
 group by driverid) a) d
 where rnk < 6


select * from NammaYatri..assembly


select faremethod, sum(fare) total_sum from NammaYatri..trips
group by faremethod
order by faremethod

select  sum(fare) total_faresum,driverid  from NammaYatri..trips
group by driverid
order by driverid

select  sum(distance) total_Km,driverid  from NammaYatri..trips
group by driverid
order by driverid




























