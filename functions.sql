-- Set the delimiter to support multi-line routines
DELIMITER $$


-- FUNCTION: Calculate Bonus (Scalar Function)
CREATE FUNCTION CalculateBonus(
    salary DECIMAL(10,2),
    rate DECIMAL(4,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    -- Return the bonus amount based on rate
    RETURN salary * rate;
END $$


-- FUNCTION: Get Performance Grade (Returns grade based on score)
CREATE FUNCTION GetPerformanceGrade(score INT)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    DECLARE grade VARCHAR(10);
    IF score >= 90 THEN
        SET grade = 'Excellent';
    ELSEIF score >= 75 THEN
        SET grade = 'Good';
    ELSEIF score >= 50 THEN
        SET grade = 'Average';
    ELSE
        SET grade = 'Poor';
    END IF;
    RETURN grade;
END $$


-- PROCEDURE: Get Employees by Department
CREATE PROCEDURE GetEmployeesByDept(
    IN dept_name VARCHAR(50)
)
BEGIN
    -- Select all employees in the given department
    SELECT id, name, department, salary
    FROM employees
    WHERE department = dept_name;
END $$


-- PROCEDURE: Generate Numbers (Loop Example)
CREATE PROCEDURE GenerateNumbers(
    IN limit_num INT
)
BEGIN
    DECLARE counter INT DEFAULT 1;

    -- Temporary table to hold numbers
    DROP TEMPORARY TABLE IF EXISTS temp_numbers;
    CREATE TEMPORARY TABLE temp_numbers (
        num INT
    );

    -- Loop from 1 to limit_num
    WHILE counter <= limit_num DO
        INSERT INTO temp_numbers(num) VALUES(counter);
        SET counter = counter + 1;
    END WHILE;

    -- Output result
    SELECT * FROM temp_numbers;
END $$


-- Reset delimiter
DELIMITER ;