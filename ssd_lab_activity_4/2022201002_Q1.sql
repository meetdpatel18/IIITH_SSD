DROP PROCEDURE IF EXISTS addTwoNums;
DELIMITER $$
CREATE PROCEDURE addTwoNums(IN num1 INT, IN num2 INT, OUT res INT)
BEGIN   
SET res=num1+num2;
END$$

call addTwoNums(5,10,@res);
SELECT @res AS SUM;
