-- Select date_trunc('hour', date_day)
-- from public.chicago_crime_updated

-- Check to Make sure all of the data lines up
select *
from public.chicago_crime_updated c
left join public.weather w on c.dt = w.date
						and date_trunc('hour', c.date_day) = w.time
						
where w.index is null

select * from public.weather order by "Date" DESC

--Create View

CREATE VIEW V_CrimeWeather
AS select c."Date"
, c."Block"
, c."Primary Type" as Primary_Type
, c."Description" as crime_description
, c."Location Description" as Location_Description
, c."Arrest"
, c."Domestic"
, c."Beat"
, c."District"
, c."Ward"
, c."Community Area" as Community_Area
, c."FBI Code"
, w."Humidity"
, w."Pressure"
, w."Temperature"
, w."Description" as Weather_description
, w."Wind_direction"
, w."Wind_speed"
FROM public.chicago_crime_updated c
LEFT JOIN public.weather w on c.dt = w.date
						and date_trunc('hour', c.date_day) = w.time
						
select * from public.v_crimeweather
limit 100;
--Check to make sure it worked

--Check number of crimes per month
select date_part('month', "Date") as Month, count(*)
from public.v_crimeweather
group by date_part('month', "Date")

--Check crime occurances on days above 90 farenheit
select date_part('month', "Date") as Month, count(*)
from public.v_crimeweather
where "Temperature" >= 305
group by date_part('month', "Date")

--Check crime occurances on days below 32 farenheit
select date_part('month', "Date") as Month, count(*)
from public.v_crimeweather
where "Temperature" <= 273
group by date_part('month', "Date")

--convert k to f for Temperature
select ((("Temperature" - 273.15) * 9/5) + 32) as F 
from public.v_crimeweather
