/* Project SQL Database Creation Script 

Members: Amber, Mark, Alisa, Vijay, Srinivas
Group 7

*/


/* Create a new user such as "prj". Please run create user with the "sys as sysdba" user */
CREATE USER USER prj IDENTIFIED BY prj;
GRANT CONNECT, RESOURCE TO prj;

/* Create Tables */ 

CREATE TABLE prj.FARMER
(  
   FARMER_ID VARCHAR2(100) NOT NULL,
   FIRST_NAME VARCHAR2(50),
   LAST_NAME VARCHAR2(50),
   STREET VARCHAR2(50),
   CITY VARCHAR2(50),
   STATE_CODE VARCHAR2(50),
   ZIP INT,
   CONSTRAINT FARMER_PK PRIMARY KEY (FARMER_ID)
 );
 
  
CREATE TABLE prj.CUSTOMER
(  
   CUSTOMER_ID VARCHAR2(100) NOT NULL,
   FIRST_NAME  VARCHAR2(50),
   LAST_NAME   VARCHAR2(50),
   CONSTRAINT CUSTOMER_PK PRIMARY KEY (CUSTOMER_ID)
 );
 
  
CREATE TABLE prj.CUSTOMER_ADDRESS
(  
   CUSTOMER_ID VARCHAR2(100) NOT NULL,
   STREET  VARCHAR2(50) NOT NULL,
   CITY   VARCHAR2(50) NOT NULL,
   STATE_CODE   VARCHAR2(50) NOT NULL,
   ZIP_CODE  INTEGER NOT NULL,
   CONSTRAINT CUSTOMER_FK FOREIGN KEY (CUSTOMER_ID)
				 REFERENCES CUSTOMER (CUSTOMER_ID)
 );
 
 
CREATE TABLE prj.CHEMICAL
(  
   MANUFACTURER_PRODUCT_CODE VARCHAR2(100) NOT NULL,
   MANUFACTURER VARCHAR2(50),
   NAME VARCHAR2(50),
   DATE_APPLIED VARCHAR2(50),
   CONSTRAINT CHEMICAL_PK PRIMARY KEY (MANUFACTURER_PRODUCT_CODE)
 );
 
 
CREATE TABLE prj.FIELD
(  
   FIELD_ID VARCHAR2(100) NOT NULL,
   COUNTY VARCHAR2(50),
   STATE_CODE VARCHAR2(50),
   VARIETY VARCHAR2(50),
   HARVEST_DATE VARCHAR2(50),
   YEAR_GROWN VARCHAR2(50),
   ROTTEN_AT_PURCHASE INT,
   FARMER_ID VARCHAR2(100), 
   CONSTRAINT FIELD_PK PRIMARY KEY (FIELD_ID),
   CONSTRAINT FIELD_FK FOREIGN KEY (FARMER_ID)
					   REFERENCES FARMER (FARMER_ID)
 );

CREATE TABLE prj.USES
(  
   FIELD_ID VARCHAR2(100) NOT NULL,
   MANUFACTURER_PRODUCT_CODE VARCHAR2(100) NOT NULL,
   CONSTRAINT USES_FK1 FOREIGN KEY (FIELD_ID)
					   REFERENCES FIELD (FIELD_ID),
   CONSTRAINT USES_FK2 FOREIGN KEY (MANUFACTURER_PRODUCT_CODE)
					   REFERENCES CHEMICAL (MANUFACTURER_PRODUCT_CODE)
 );
 
 
CREATE TABLE prj.ORDER_DETAILS
(  
   PURCHASE_ID VARCHAR2(100) NOT NULL,
   BATCH_ID VARCHAR2(50) NOT NULL,
   SHIPPING_ID VARCHAR2(50) NOT NULL,
   BILL_OF_LADING VARCHAR2(50) NOT NULL,
   DAYS_IN_WAREHOUSE VARCHAR2(50),
   STREET VARCHAR2(50),
   CITY VARCHAR2(50),
   STATE_CODE VARCHAR2(50),
   SHIPPING_DATE VARCHAR2(50),
   FIELD_ID VARCHAR2(100),
   CUSTOMER_ID VARCHAR2(100),
   CONSTRAINT ORDER_DETAILS_FK1 FOREIGN KEY (FIELD_ID)
					   REFERENCES FIELD (FIELD_ID),
   CONSTRAINT ORDER_DETAILS_FK2 FOREIGN KEY (CUSTOMER_ID)
					   REFERENCES CUSTOMER (CUSTOMER_ID),				   
					   
 );