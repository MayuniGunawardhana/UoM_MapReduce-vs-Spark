hive

DROP TABLE IF EXISTS delay_flights;

CREATE TABLE delay_flights (
ID INT,
Year INT,
Month INT,
DayofMonth INT,
DayOfWeek INT,
DepTime INT,
CRSDepTime INT,
ArrTime INT,
CRSArrTime INT,
UniqueCarrier STRING,
FlightNum INT,
TailNum STRING,
ActualElapsedTime INT,
CRSElapsedTime INT,
AirTime INT,
ArrDelay INT,
DepDelay INT,
Origin STRING,
Dest STRING,
Distance INT,
TaxiIn INT,
TaxiOut INT,
Cancelled INT,
CancellationCode STRING,
Diverted INT,
CarrierDelay INT,
WeatherDelay INT,
NASDelay INT,
SecurityDelay INT,
LateAircraftDelay INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LOCATION "s3://airline-delay-uom-project/HiveSession/";

SELECT Year, AVG((CarrierDelay / ArrDelay) * 100) AS delay_percentage FROM delay_flights WHERE Year BETWEEN 2003 AND 2010 GROUP BY Year ORDER BY Year;
SELECT Year, AVG((NASDelay / ArrDelay) * 100) AS delay_percentage FROM delay_flights WHERE Year BETWEEN 2003 AND 2010 GROUP BY Year ORDER BY Year;
SELECT Year, AVG((WeatherDelay / ArrDelay) * 100) AS delay_percentage FROM delay_flights WHERE Year BETWEEN 2003 AND 2010 GROUP BY Year ORDER BY Year;
SELECT Year, AVG((LateAircraftDelay / ArrDelay) * 100) AS delay_percentage FROM delay_flights WHERE Year BETWEEN 2003 AND 2010 GROUP BY Year ORDER BY Year;
SELECT Year, AVG((SecurityDelay / ArrDelay) * 100) AS delay_percentage FROM delay_flights WHERE Year BETWEEN 2003 AND 2010 GROUP BY Year ORDER BY Year;
