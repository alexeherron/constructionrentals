--Which machines are most popular (by quarter, and overall)?

--Let's see what we're working with.
SELECT TOP(10)* 
FROM all_rentals;

--So we've got 6 different types of machines here. 
SELECT DISTINCT prod_class
FROM all_rentals;

-- How many sub-varieties are there?
SELECT prod_class, COUNT(DISTINCT Product_ID) AS subvariety_count
FROM all_rentals
GROUP BY prod_class
ORDER BY subvariety_count DESC;
-- Looks like there are 79 subvarieties of pipe pressing machines (the most variety) and 17 subvarieties of aerators and minidumpers (tied for least variety).

-- Ok, generally speaking, which machine type has been rented the most, historically?
SELECT prod_class, COUNT(*) AS order_count
FROM all_rentals
GROUP BY prod_class
ORDER BY order_count DESC;
-- So pipe pressing machines have been ordered roughly ten times more often than aerators, historically.

-- Let's look at the distribution of rentals by machine per month.
SELECT MONTH(Order_created) AS month_ordered, prod_class, COUNT(prod_class) AS machine_count
FROM all_rentals
GROUP BY MONTH(Order_created), prod_class
ORDER BY MONTH(Order_created);

-- Now which machine is most popular each month?
SELECT MONTH(Order_created) AS month_ordered, prod_class, COUNT(prod_class) AS machine_count
FROM all_rentals
WHERE prod_class IN (
	SELECT TOP(1) prod_class 
	FROM all_rentals 
	GROUP BY prod_class
	ORDER BY COUNT(prod_class) DESC)
GROUP BY MONTH(Order_created), prod_class
ORDER BY MONTH(Order_created);
-- Pipe pressing machines are popular all year!

-- Now let's look at the least popular machine by month.
SELECT MONTH(Order_created) AS month_ordered, prod_class, COUNT(prod_class) AS machine_count
FROM all_rentals
WHERE prod_class IN (
	SELECT TOP(1) prod_class 
	FROM all_rentals 
	GROUP BY prod_class
	ORDER BY COUNT(prod_class) ASC)
GROUP BY MONTH(Order_created), prod_class
ORDER BY MONTH(Order_created);
-- People don't need too many aerators, I suppose.

-- Ok, now let's look at the most popular month for each machine type.
SELECT TOP(1) MONTH(Order_created) AS month_ordered, prod_class, COUNT(prod_class) AS machine_count
FROM all_rentals
WHERE prod_class LIKE 'aerator%'
GROUP BY MONTH(Order_created), prod_class
ORDER BY machine_count DESC;

SELECT TOP(1) MONTH(Order_created) AS month_ordered, prod_class, COUNT(prod_class) AS machine_count
FROM all_rentals
WHERE prod_class LIKE 'dehumidifier%'
GROUP BY MONTH(Order_created), prod_class
ORDER BY machine_count DESC;

SELECT TOP(1) MONTH(Order_created) AS month_ordered, prod_class, COUNT(prod_class) AS machine_count
FROM all_rentals
WHERE prod_class LIKE 'forklift%'
GROUP BY MONTH(Order_created), prod_class
ORDER BY machine_count DESC;

SELECT TOP(1) MONTH(Order_created) AS month_ordered, prod_class, COUNT(prod_class) AS machine_count
FROM all_rentals
WHERE prod_class LIKE 'mini%'
GROUP BY MONTH(Order_created), prod_class
ORDER BY machine_count DESC;

SELECT TOP(1) MONTH(Order_created) AS month_ordered, prod_class, COUNT(prod_class) AS machine_count
FROM all_rentals
WHERE prod_class LIKE 'pipe%'
GROUP BY MONTH(Order_created), prod_class
ORDER BY machine_count DESC;

SELECT TOP(1) MONTH(Order_created) AS month_ordered, prod_class, COUNT(prod_class) AS machine_count
FROM all_rentals
WHERE prod_class LIKE 'heater%'
GROUP BY MONTH(Order_created), prod_class
ORDER BY machine_count DESC;
-- Ok, looks like heaters and pipe-pressing machines are most popular in January, aerators in April, minidumpers in May, dehumidifiers in August, and forklifts in October.

-- Now let's see the least popular month for each of these.
SELECT TOP(1) MONTH(Order_created) AS month_ordered, prod_class, COUNT(prod_class) AS machine_count
FROM all_rentals
WHERE prod_class LIKE 'aerator%'
GROUP BY MONTH(Order_created), prod_class
ORDER BY machine_count ASC;

SELECT TOP(1) MONTH(Order_created) AS month_ordered, prod_class, COUNT(prod_class) AS machine_count
FROM all_rentals
WHERE prod_class LIKE 'dehumidifier%'
GROUP BY MONTH(Order_created), prod_class
ORDER BY machine_count ASC;

SELECT TOP(1) MONTH(Order_created) AS month_ordered, prod_class, COUNT(prod_class) AS machine_count
FROM all_rentals
WHERE prod_class LIKE 'forklift%'
GROUP BY MONTH(Order_created), prod_class
ORDER BY machine_count ASC;

SELECT TOP(1) MONTH(Order_created) AS month_ordered, prod_class, COUNT(prod_class) AS machine_count
FROM all_rentals
WHERE prod_class LIKE 'mini%'
GROUP BY MONTH(Order_created), prod_class
ORDER BY machine_count ASC;

SELECT TOP(1) MONTH(Order_created) AS month_ordered, prod_class, COUNT(prod_class) AS machine_count
FROM all_rentals
WHERE prod_class LIKE 'pipe%'
GROUP BY MONTH(Order_created), prod_class
ORDER BY machine_count ASC;

SELECT TOP(1) MONTH(Order_created) AS month_ordered, prod_class, COUNT(prod_class) AS machine_count
FROM all_rentals
WHERE prod_class LIKE 'heater%'
GROUP BY MONTH(Order_created), prod_class
ORDER BY machine_count ASC;

-- Looks like aerators and minidumpers are unpopular in December, forklifts and heaters are unpopular in July, dehumidifiers and unpopular in May, and pipe pressing machines are least popular in April.
-- Things are looking pretty seasonal!

-- OK, let's look at duration of rentals.
-- How many items have been rented for over a year?
SELECT COUNT(*)
FROM all_rentals
WHERE duration > 365;
-- 56
-- Out of how many rentals total?
SELECT COUNT(*) FROM all_rentals;
-- 33766 That's 0.17%

-- Let's look at how many rentals only lasted one day.
SELECT COUNT(*)
FROM all_rentals
WHERE ROUND(duration, 0) = 1;
-- 12660 out of 33766 is 37.49%
-- I wonder what the next biggest chunk might be.

--ALTER TABLE all_rentals
--ADD round_duration
--AS ROUND(duration, 0);

-- Here's duration by frequency.
SELECT round_duration, COUNT(round_duration) AS freq
FROM all_rentals
GROUP BY round_duration
ORDER BY freq DESC;

-- Here's duration from greatest to smallest.
SELECT round_duration
FROM all_rentals
GROUP BY round_duration
ORDER BY round_duration DESC;
-- The longest one is over 5 years!

-- Let's make another column for duration in years and look at that.
--ALTER TABLE all_rentals
--ADD year_duration
--AS ROUND(duration/365, 0);

SELECT year_duration, COUNT(year_duration) AS freq, COUNT(year_duration)*100.0 / SUM(COUNT(year_duration)) OVER() AS percentage_of_whole
FROM all_rentals
GROUP BY year_duration
ORDER BY freq DESC;
-- So rental duration is overwhelmingly less than a year long (99.32%).

-- I wonder how many of the over-a-year crowd are from the same customers..
SELECT year_duration, Customer_ID, COUNT(Customer_ID) AS cust_count
FROM all_rentals
WHERE year_duration > 1
GROUP BY year_duration, Customer_ID
ORDER BY year_duration DESC;
-- Ok, customer 1439778 rented 4 items out for 3 years. I wonder if it was for the same project. Let's look at the dates.
SELECT *
FROM all_rentals
WHERE year_duration = 3
AND Customer_ID = 1439778;
-- Four pipe pressing machines. I assume they were all for the same project.

-- Ok, let's start looking at how many of each machine is rented out on a given day.
-- We'll begin with aerators.
SELECT TOP(10)*
FROM aer_dates_counts;

SELECT TOP(30) d.Date, a.column2 AS aer_count
FROM dates AS d
RIGHT JOIN aer_dates_counts AS a
ON d.Date = a.column1
ORDER BY aer_count DESC;

SELECT a.column2 AS aer_count, COUNT(*) AS freq, COUNT(*)*100.0 / SUM(COUNT(*)) OVER() AS percentage_of_whole
FROM dates AS d
RIGHT JOIN aer_dates_counts AS a
ON d.Date = a.column1
GROUP BY a.column2
ORDER BY freq DESC;
-- So it looks like it's pretty rare to have more than 10 aerators rented out on any given day.

