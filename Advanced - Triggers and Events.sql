USE parks_and_recreation;

SELECT * FROM employee_salary;
SELECT * FROM employee_demographics;

DROP TRIGGER IF EXISTS employee_insert2;

DELIMITER $$

CREATE TRIGGER employee_insert2
AFTER INSERT ON employee_salary
FOR EACH ROW
BEGIN
    INSERT INTO employee_demographics (employee_id, first_name, last_name)
    SELECT NEW.employee_id, NEW.first_name, NEW.last_name
    WHERE NOT EXISTS (
        SELECT 1
        FROM employee_demographics
        WHERE employee_id = NEW.employee_id
    );
END$$

DELIMITER ;

INSERT INTO employee_salary
(employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES
(14, 'Jean-Ralphio', 'Saperstein', 'Entertainment 720 CEO', 1000000, NULL);

SET SQL_SAFE_UPDATES = 0;


DELETE
FROM employee_salary
WHERE employee_id = 13;

SELECT *
FROM parks_and_recreation.employee_demographics;

SHOW EVENTS;

DROP EVENT IF EXISTS delete_retirees;

DELIMITER $$

CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
    DELETE
    FROM parks_and_recreation.employee_demographics
    WHERE age >= 60;
END$$

DELIMITER ;

SELECT *
FROM parks_and_recreation.employee_demographics;
