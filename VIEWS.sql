/*
Create a view where we can see the the top chemicals needed for potato farming
*/

CREATE VIEW v_topchem AS SELECT COUNT("NAME") AS FREQUENCY, ("NAME") as CHEMICAL_NAME from CHEMICAL
GROUP BY "NAME"
ORDER BY FREQUENCY DESC;


/* Select from that view with frequency constraint to know which chemicals to stock up on */

SELECT * FROM v_topchem where FREQUENCY BETWEEN 8 AND 12;

/* Wilcox and Sons wants to run a farmer rewards program who grows the most varieties
   we create  a view to acheive this so that they can get the list of automatically
*/ 

CREATE VIEW v_farmerreward AS SELECT FARMER.FIRST_NAME,FARMER.LAST_NAME, COUNT(FIELD.VARIETY) AS NUMBER_OF_VARIETIES
FROM  FIELD,FARMER WHERE FARMER.FARMER_ID = FIELD.FARMER_ID
GROUP BY FIRST_NAME, LAST_NAME
ORDER BY NUMBER_OF_VARIETIES DESC;


/*
Get our out top 5 farmers to reward them!
*/

SELECT * FROM v_farmerreward WHERE ROWNUM <= 5;