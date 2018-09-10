#1
CREATE USER data_analyst@localhost IDENTIFIED BY 'password';

#2
GRANT SELECT,DELETE,UPDATE ON *.* TO 'data_analyst'@'localhost';

#3
CREATE TABLE IF NOT EXISTS test (
    test_id INT AUTO_INCREMENT,
    algo VARCHAR(255) NOT NULL,
    PRIMARY KEY (test_id));
ERROR 1142 (42000): CREATE command denied to user 'data_analyst'@'localhost' for table 'test'

#4
UPDATE film SET title= "AKIRA_MODIFIED" WHERE title = "Akira";
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

#5
REVOKE UPDATE ON *.*  FROM data_analyst@localhost;

#6e
ERROR 1142 (42000): UPDATE command denied to user 'data_analyst'@'localhost' for table 'film'
