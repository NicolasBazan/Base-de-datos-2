#1
INSERT INTO employees (employeeNumber, lastName, firstName, extension, officeCode, jobTitle) VALUES (1069,"Bazan", "Nicolas", "x7243", "1", "P Sales");
ERROR 1364 (HY000): Field 'email' does not have a default value

Email cannot be null, must have a value

#2
UPDATE employees SET employeeNumber = employeeNumber - 20; 
This query decreases the employeeNumber by 20;


UPDATE employees SET employeeNumber = employeeNumber + 20
ERROR 1062 (23000): Duplicate entry '1036' for key 'PRIMARY'
This query gives us an error because when we try to increase employeeNumber of the second record we get the same number of the third one


#3
ALTER TABLE employees ADD age INT;
ALTER TABLE employees ADD CONSTRAINT age_range CHECK (age>=16 AND age<=70);

#4

#5
5- Create a new column called lastUpdate to table 
employee and use trigger(s) to keep the date-time 
updated on inserts and updates operations. Bonus: 
add a column lastUpdateUser and the respective trigger(s) 
to specify who was the last MySQL user that changed the row 
(assume multiple users, other than root, can connect to MySQL 
and change this table).

ALTER TABLE employees ADD lastUpdate datetime;

DELIMITER $$
CREATE TRIGGER updateEmployee
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
	UPDATE employees SET NEW.lastUpdate=NOW();
END$$
DELIMITER ;

ERROR 1442 (HY000): Can't update table 'employees' in stored function/trigger because it is already used by statement which invoked this stored function/trigger.
