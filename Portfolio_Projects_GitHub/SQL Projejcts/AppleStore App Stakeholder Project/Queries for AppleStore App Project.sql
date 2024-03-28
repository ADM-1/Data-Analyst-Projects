-- Table Creation and Exploratory Analysis

CREATE TABLE appleStore_description_combined AS

SELECT * FROM appleStore_description1

UNION ALL

SELECT * FROM appleStore_description2

UNION ALL

SELECT * FROM appleStore_description3

UNION ALL

SELECT * FROM appleStore_description4

-- EXPLORATORY DATA ANALYSIS PROCESS

-- Check the number of unique apps in both tables Applestore

SELECT COUNT(DISTINCT id) AS UniqueAppIDs
FROM AppleStore

SELECT COUNT(DISTINCT id) AS UniqueAppIDs
FROM appleStore_description_combined

-- The result for both was 7197, the check was successful

-- Check for any missing values in key fields

SELECT COUNT(*) AS MissingValues
FROM AppleStore
WHERE track_name IS NULL OR user_rating IS NULL OR prime_genre IS NULL

SELECT COUNT(*) AS MissingValues
FROM appleStore_description_combined
WHERE app_desc IS NULL

-- There are 0 Missing values, meaining that the dataset is reliable and clean 

-- Now we need to look up the numbers of Apps per Genre on the Apple Store

SELECT prime_genre, COUNT(*) AS NumApps
FROM AppleStore
GROUP BY prime_genre
ORDER BY NumApps DESC

-- Now that we know roughly the number we need to view the App's ratings

SELECT MIN(user_rating) AS MinRating,
       		MAX(user_rating) AS MaxRating,
       			AVG(user_rating) AS AvgRating
FROM AppleStore

--As we can observe, the MIN is 0, the MAX is 5 and the AVG is 3.52 

--Data Analysis 

-- 1. Determine the better rated Apps between Paid and Free 

SELECT CASE 
			WHEN price > 0 THEN 'PAID'
            ELSE 'FREE'
       END AS App_Type,
       avg(user_rating) AS Avg_Rating
FROM AppleStore
GROUP BY App_Type

--The Paid Apps have a better rating (3.72) compared to Free Apps (3.37)

--2. Determine if the number of supported languages affects the rating

SELECT CASE
			WHEN lang_num <= 5 THEN '5 or Less Languages'
            WHEN lang_num BETWEEN 5 and 20 THEN 'Between 5 and 20 Languages'
            ELSE 'Above 20 Languages'
       END AS language_bucket,
       AVG(user_rating) as Avg_Rating
FROM AppleStore
GROUP BY language_bucket
ORDER BY Avg_Rating DESC

--The more supported languages, the higher the rating

--3. Determine which genres have a lower/higher ratings

SELECT prime_genre,
	   AVG(user_rating) AS Avg_Rating
FROM AppleStore
GROUP BY prime_genre
ORDER BY Avg_Rating aSC
LIMIT 10 

/*

Catalogs, Finance and Book App Ratings are the lowest.
Entertainment, Food and Drink, Social Networking and Sports are ranked highest.

*/

--4. Determine how the app description lenght influences the ratings

SELECT CASE
			WHEN length(b.app_desc) < 500 THEN 'SHORT'
            WHEN length(b.app_desc) BETWEEN 500 AND 1000 THEN 'MEDIUM'
            ELSE 'LONG'
       END AS description_lenght_bucket,
       AVG(A.user_rating) AS average_rating
       
FROM 
	AppleStore AS A
JOIN 
    appleStore_description_combined AS B
ON
	A.id = B.id 
GROUP BY description_lenght_bucket
ORDER BY average_rating DESC


--The data suggests that the longer the description the higher the ratings
