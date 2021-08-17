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



CREATE PROCEDURE employeeAddOrEdit ( 
    IN _id INT,
    IN _name VARCHAR(45),
    IN _salary INT
)
BEGIN
    IF _id = 0 THEN
        INSERT INTO employees (name, salary)
        VALUES (_name, _salary);
    SET _id = LAST_INSERT_ID();
    ELSE
        UPDATE employees
        SET
            name = _name,
            salary = _salary
            WHERE id = _id;
    END IF;

    SELECT _id AS id;
END
