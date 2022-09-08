USE CUSTOMER_DB;
DROP PROCEDURE IF EXISTS getInfo;
DELIMITER $$
CREATE PROCEDURE getInfo()
BEGIN 
	SELECT CUST_NAME, GRADE FROM customer WHERE (OPENING_AMT+RECEIVE_AMT)>10000;
END$$


call getInfo();
