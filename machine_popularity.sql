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

