select * from chicago_crime
limit 100;

update chicago_crime
set date_time = "Date";

select date("Date") from chicago_crime

create table chicago_crime_updated 
as select date("Date") as dt, * from chicago_crime

select * from chicago_crime_updated
limit 100;

this is a test