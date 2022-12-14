USE CUSTOMER_DB;
DROP PROCEDURE IF EXISTS curFetch;
DROP TABLE IF EXISTS temp;
DELIMITER $$
CREATE TABLE temp(CUST_NAME VARCHAR(40), CUST_CITY VARCHAR(35), CUST_COUNTRY VARCHAR(20), GRADE VARCHAR(100));
CREATE PROCEDURE curFetch()
BEGIN
  DECLARE done INTEGER DEFAULT 0;
  DECLARE nam VARCHAR(40);
  DECLARE city VARCHAR(35);
  DECLARE country VARCHAR(20);
  DECLARE c_g VARCHAR(100);
  

  DECLARE cur1 CURSOR FOR SELECT CUST_NAME, CUST_CITY, CUST_COUNTRY, GRADE from customer where AGENT_CODE like 'A00%';
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
  OPEN cur1;

  read_loop: LOOP
    FETCH cur1 INTO nam, city, country, c_g;
    IF done=1 THEN
		LEAVE read_loop;
    END IF;
    INSERT INTO temp values(nam, city, country, c_g);
  END LOOP read_loop;
  CLOSE cur1;
  SELECT * from temp;
END$$
DELIMITER ;

call curFetch();