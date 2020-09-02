Select * from public.weather

--Alter table to include new coloumns for date and time
ALTER TABLE weather
ADD Date Date; 

ALTER TABLE weather
ADD Time Time; 

--udpate new coloumn for date and time
update public.weather 
   set Date = "Datetime"
   
update public.weather 
   set Hour = date_part(hour, weather.Time)
