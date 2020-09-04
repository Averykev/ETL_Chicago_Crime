SELECT c.index, c.date, c.time, w.index, c.date, c.time
FROM public.chicago_crime_updated c
LEFT JOIN public.weather w ON c.Date = w.date
						AND date_trunc('hour', c.time) = w.time
limit 500;

-- SELECT date_trunc('hour', time)
-- FROM public.chicago_crime_updated

-- SELECT date_trunc('hour', c.time), *
-- FROM public.chicago_crime_updated c
-- LEFT JOIN public.weather w ON c.Date = w.date
-- 						AND date_trunc('hour', c.time) = w.time
-- WHERE w.index is null

SELECT * FROM public.weather ORDER BY "Date" DESC