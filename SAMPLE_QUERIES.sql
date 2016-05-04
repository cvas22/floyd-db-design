/*
Query  1

What are the most frequently used chemicals 
in fertilizers?
*/ 


SELECT COUNT("NAME") AS FREQUENCY, ("NAME") as CHEMICAL_NAME from CHEMICAL
GROUP BY "NAME"
ORDER BY FREQUENCY DESC;

/*
Query  2

Which city are our top customers from?
*/ 

SELECT DISTINCT CITY, COUNT (CITY) AS FREQUENCY FROM CUSTOMER_ADDRESS
GROUP BY CITY
ORDER BY FREQUENCY DESC;

/*
Query  3

Which type of potatoes get rotton the most?

*/ 

SELECT DISTINCT VARIETY, ROUND(AVG(ROTTEN_AT_PURCHASE)) AS "AVERAGE_ROTTEN_PERCENT" FROM FIELD
GROUP BY VARIETY
ORDER BY "AVERAGE_ROTTEN_PERCENT" DESC;