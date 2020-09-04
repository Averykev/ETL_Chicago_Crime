--insepect weather files
Select * from public.weather

--Alter table to include new coloumns for date and time
ALTER TABLE weather
ADD dt Date; 

ALTER TABLE weather
ADD dt_time Time; 

--udpate new coloumn for date and time
update public.weather 
   set dt = "Date"
   
update public.weather 
   set dt_time = "Date"

--Inspect crime file
select * from chicago_crime
limit 100;

--create new table with date and time columns
create table chicago_crime_updated 
as select *, date("Date") as dt, time("Date") as dt_time from public.chicago_crime

--Inspect udpated crime file
select * from chicago_crime_updated
limit 100;
-- join both datasets  
