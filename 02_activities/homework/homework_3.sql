-- AGGREGATE
/* 1. Write a query that determines how many times each vendor has rented a booth 
at the farmer’s market by counting the vendor booth assignments per vendor_id. */
SELECT vba.vendor_id, vendor_name, COUNT(vba.vendor_id)
FROM vendor_booth_assignments vba
JOIN vendor v
  ON vba.vendor_id = v.vendor_id
GROUP BY vba.vendor_id


/* 2. The Farmer’s Market Customer Appreciation Committee wants to give a bumper 
sticker to everyone who has ever spent more than $2000 at the market. Write a query that generates a list 
of customers for them to give stickers to, sorted by last name, then first name. 

HINT: This query requires you to join two tables, use an aggregate function, and use the HAVING keyword. */
SELECT c.customer_last_name, c.customer_first_name
,SUM(quantity*cost_to_customer_per_qty) AS cost

FROM customer_purchases AS cp
JOIN customer AS c
  ON cp.customer_id = c.customer_id
GROUP BY cp.customer_id
HAVING cost > 2000
ORDER BY c.customer_last_name ASC, c.customer_first_name ASC


--Temp Table
/* 1. Insert the original vendor table into a temp.new_vendor and then add a 10th vendor: 
Thomass Superfood Store, a Fresh Focused store, owned by Thomas Rosenthal

HINT: This is two total queries -- first create the table from the original, then insert the new 10th vendor. 
When inserting the new vendor, you need to appropriately align the columns to be inserted 
(there are five columns to be inserted, I've given you the details, but not the syntax) 

-> To insert the new row use VALUES, specifying the value you want for each column:
VALUES(col1,col2,col3,col4,col5) 
*/
DROP TABLE IF EXISTS temp.new_vendor;
CREATE TEMP TABLE temp.new_vendor AS
SELECT *
FROM vendor;
INSERT INTO temp.new_vendor VALUES(10,'Thomass Superfood Store','Fresh Focused','Thomas','Rosenthal')


-- Date
/*1. Get the customer_id, month, and year (in separate columns) of every purchase in the customer_purchases table.

HINT: you might need to search for strfrtime modifers sqlite on the web to know what the modifers for month 
and year are! */
SELECT customer_id
,strftime('%m',market_date) AS month
,strftime('%Y',market_date) AS year
FROM customer_purchases

/* 2. Using the previous query as a base, determine how much money each customer spent in April 2022. 
Remember that money spent is quantity*cost_to_customer_per_qty. 

HINTS: you will need to AGGREGATE, GROUP BY, and filter...
but remember, STRFTIME returns a STRING for your WHERE statement!! */
SELECT c.customer_first_name, c.customer_last_name
,SUM(quantity*cost_to_customer_per_qty) AS cost
FROM customer_purchases AS cp
JOIN customer AS c
	ON c.customer_id = cp.customer_id
WHERE strftime('%m',market_date)='04' AND strftime('%Y',market_date) = '2022'
GROUP BY cp.customer_id
ORDER BY c.customer_last_name ASC, c.customer_first_name ASC

