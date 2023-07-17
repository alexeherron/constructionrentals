--SELECT TOP(5)* FROM dbo.dates;

--ALTER TABLE dates
--ADD aer_inv int;

UPDATE dates
SET aer_inv = (
SELECT COUNT(*) 
FROM aerator_dt AS a
FULL JOIN dates AS d
ON a.start = d.Date
WHERE d.Date > a.start AND d.Date < a.Rental_end);

SELECT TOP(5) * 
FROM dates
WHERE aer_inv > 1;

--SELECT TOP(5)* FROM dates;

--UPDATE dates SET aer_inv = 0;
--SELECT TOP(5)* FROM dbo.dates;
--SELECT TOP(10) * FROM dbo.all_rentals;

--INSERT INTO dates(aer_inv)
--SELECT SUM(0 + COUNT(Order_created))
--FROM all_rentals
--FULL JOIN dates
--ON dates.Date = all_rentals.Order_created
--WHERE dates.Date < Rental_end AND dates.Date > Rental_start;

--SELECT TOP(5)* FROM dbo.aerator_dt;
--SELECT 
--    CASE 
--       WHEN (d.Date BETWEEN rental_start AND rental_end)
--       THEN [aer_inv] + 1
--    END
--FROM 
--    dates AS d
--JOIN aerator_dt AS a
--ON d.Date = a.start;
