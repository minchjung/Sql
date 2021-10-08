-- A median is defined as a number separating the higher half of a data set 
-- from the lower half. Query the median of LAT_N from STATION 
-- and round your answer to  decimal places.
-- https://www.hackerrank.com/challenges/weather-observation-station-20/problem

SET @tot = (select count(*) from station);
SET @op = IF(@tot%2=0, -1,0);
SET @off = floor(@tot/2) + @op;

PREPARE STMT FROM '
SELECT ROUND(lat_n, 4)
FROM STATION
ORDER BY LAT_N
LIMIT 1 OFFSET ?';
EXECUTE STMT USING @off;