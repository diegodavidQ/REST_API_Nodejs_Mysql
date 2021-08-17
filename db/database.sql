CREATE DATABASE IF NOT EXISTS company;

USE company;

CREATE TABLE employees (
    id INT(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(45) DEFAULT NULL,
    salary INT(11) DEFAULT NULL,
    PRIMARY KEY(id)
);

DESCRIBE employees;

INSERT INTO employees values
    (1, 'Will', 10000),
    (2, 'Jhon', 40000),
    (3, 'Alice', 50000);

SELECT * FROM employees;

