Select * from public.weather

--Alter table to include new coloumns for date and time
ALTER TABLE weather
ADD Date Date; 

ALTER TABLE weather
ADD Time Time; 

--udpate new coloumn for date and time
update public.weather 
   set Date = "Date"
   
update public.weather 
   set Time = "Date"


select * from chicago_crime
limit 100;

--Alter table to include new coloumns for date and time
ALTER TABLE chicago_crime
ADD date Date; 

ALTER TABLE chicago_crime
ADD time Time; 

--udpate new coloumn for date and time
update public.chicago_crime 
   set date = "Date"
   
update public.chicago_crime 
   set time = "Date"
   
-- join both datasets  
