--Create view
CREATE VIEW V_CrimeWeather

AS SELECT c."Date"
, c."Block"
, c."Primary Type" as Primary_Type
, c."Description" as Crime_Desc
, c."Location Description" as Location_Description
, c."Arrest"
, c."Domestic"
, c."Beat"
, c."District"
, c."Ward"
, c."Community Area" as Community_Area
, c."FBI Code" as FBI_code
, w."Humidity"
, w."Pressure"
, w."Temperature"
, ((("Temperature" - 273.15) * 9/5) + 32) as temp_F
, w."Description" as Weather_Desc
, w."Wind_direction"
, w."Wind_speed"
FROM public.chicago_crime_updated c
LEFT JOIN public.weather w ON c.dt = w.dt
						AND date_trunc('hour', c.dt_time) = w.dt_time
						
--Check to make sure it worked						
SELECT * FROM public.v_crimeweather	

SELECT date_part('month', "Date") as Month,
CASE WHEN Temperature BETWEEN 0 AND 49 THEN 'Cat1' ELSE
		CASE WHEN Temperature BETWEEN 50 AND 99 THEN 'Cat2' END
		END
FROM public.v_crimeweather	
WHERE "Temperature" >= 0

SELECT "Temperature", ((("Temperature" - 273.15) * 9/5) + 32) as temp_F
FROM public.v_crimeweather	