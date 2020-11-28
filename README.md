# ETL_Chicago_Crime
ETL Project comparing Chicago crime to weather.

INSTRUCTIONS:  To see this project, just run the different Jupyter notebooks and build out the tables using the SQL scripts.  You can also run each of the SQL queries in PostgreSQL.  

Project Outline:

1.)  PROJECT SUMMARY - We pulled data from two different csv data files that we found on Kaggle.  One of them documented all of the crime statistics for the city of Chicago
between 2012 and 2017.  The other one documented all of the weather statistics for 30 major cities in the United States and Canada from a October of 2012 to November of 2017.  
Since we didn't have a full year of weather statistics for 2012 or 2017, we limited the range that we analyzed.  Our overall goal was to compare crime statistics and weather in 
the city of Chicago between the of 2013 and 2016.


2.)  DATA SOURCE LINKS - The data source for Chicago Crime is titled "Crimes in Chicago" and the link is as follows:

"https://www.kaggle.com/currie32/crimes-in-chicago?select=Chicago_Crimes_2012_to_2017.csv"   

The data source for major city weather is titled "Historical Hourly Weather Data 2012-2017" and the link is as follows:

"https://www.kaggle.com/selfishgene/historical-hourly-weather-data" 


3.)  CHICAGO CRIME LOADING & TRANSFORMATION - For the Chicago crime data, we opened a jupyter notebook and loaded all of the data in using pandas.  Once we had the data loaded
we dropped the columns that we weren't going to need and we also ran a filter to get only the data between the years of 2013 and 2016.  Once we had only the data that we were 
going to use we renamed the columns so that it would be more usable and we converted the data/time column to the "datetime64" type.  We then created a new database in postgres and
we called it "etl_project".  Once we had a new database, we took the dataframe and we created a connection string to postgres and we created a table named "chicago_crime."  At this point
all of the data was ready to run SQL queries.


4.)  HOURLY WEATHER LOADING & TRANSFORMATION - For the weather data, we also opened up a jupyter notebook and loaded all of the data using pandas.  The main difference here was that we
had 6 different csv files that we needed to load in and transform.  For each of those 6 csv files, we created a dataframe and renamed the column headers to match the unique measurement of each 
of the 6 files.  Then we ran a filter on those dataframes to limit the data to just the dates between 2013 and 2016.  Once all 6 unique weather measurements were transformed so that they matched
each other we were able to begin the merging process.  With this we started by doing an "outer" merge with two of the files and then we continued to add each additional file until we had the 
complete dataframe that we needed.  Similar to the Chicago crime data, we then created a connection string to the data base titled "etl_project."  Once we had that connection, we loaded the new
table named "weather" and our data was ready to run SQL queries.


5.)  TABLE SETUP IN POSTGRES USING SQL - We knew that we were going to want to run queries where we joined the two tables on date and time.  So, one of the things we needed to do was alter each
table and give it a column that had just the date...and also a column that had just the time.  We also realized when we did the left join for the two tables that we were missing all of the weather data for
December 31st, of 2016.  When Tawny dug into this further, she found that it was because the timestamps were making that data fall under January 1st of 2017.  So in order to fix these null values we went back
and altered the filter in our jupyter notebook and we reloaded the data into our database. 


6.)  VIEW CREATION IN POSTGRES - The next thing we did was run a query that we eventually turned into a "view."  In order to do this, we pulled in each of the columns that we knew we were going 
to need, and we also ran a few transformations to clean up the table.  These transformations included changing the temperature measurement from kelsius to Fahrenheit, and also changing some of the column header
names so they didn't have spaces.  We joined the two tables together with a "left join" and we truncated the time so that it only matched the hour measurement from each table.


7.)  FILTER & ANALYSIS - Once we created the view, we were able to run some interesting filters and analysis.  We ran these in a few separate sql files.  Some of the most interesting comparisons
was to see the difference in the number of crimes committed in the hotter summer months versus the colder winter months.  We also grouped the data by month, and then compared that to some of the averages
for the different weather categories...for example, comparing the number of crimes in a specific month to the average humidity, wind speed, temperature, etc...

8.)  CONCLUSION - In conclusion the project went well and we were able to extract, transform, and load our data to find some pretty interesting correlations between weather and the number of crimes in 
Chicago.  Thank you for taking the time to review our project!    
                 
