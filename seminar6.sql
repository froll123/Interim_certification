# 2. Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10

DELIMITER $$

CREATE PROCEDURE num (IN count INT, OUT result VARCHAR(20))
BEGIN 
DECLARE x INT DEFAULT 2;

SET result = '';
WHILE x < count DO
SET result = CONCAT(result, CAST(x AS CHAR), ' ');
SET x = x + 2;
END WHILE;

END $$

DELIMITER $$
CALL num(1, 10);


# 1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. 
# Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DELIMITER $$
CREATE FUNCTION seconds(seconds INT) RETURNS VARCHAR(255)
BEGIN
  DECLARE days INT;
  DECLARE hours INT;
  DECLARE minutes INT;
  DECLARE formatted VARCHAR(255);
  
  SET days = FLOOR(seconds / (24 * 3600));
  SET seconds = seconds % (24 * 3600);
  SET hours = FLOOR(seconds / 3600);
  SET seconds = seconds % 3600;
  SET minutes = FLOOR(seconds / 60);
  SET seconds = seconds % 60;

  SET formatted = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');

  RETURN formatted;
END $$

DELIMITER $$
SELECT format_seconds(123456);