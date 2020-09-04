SELECT DATE_PART('month', "Date") "Month"
, count(*)
, Avg("Humidity") avg_humidity
, Avg("Pressure") avg_pressure
, avg(temp_f) avg_temp_f
, Avg("Wind_direction") avg_wind_direction
, Avg("Wind_speed") avg_wind_speed

FROM public.v_crimeweather

GROUP BY DATE_PART('month', "Date")
