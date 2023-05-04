-- e1
SELECT `id` AS 'No.',
 `first_name` AS "First Name",
 `last_name` AS "Last Name",
 `job_title` AS "Title"
FROM `employees`
ORDER BY `id`;

-- e2
SELECT
`id`,
CONCAT_WS(' ',`first_name`,`last_name`) AS `Full Name`,
`job_title` AS "Job Title",
`salary` AS "Salary"
FROM `employees`
WHERE `salary` > 1000
ORDER BY `id`;

-- e3
UPDATE `employees`
SET `salary` = `salary` + 100
WHERE `job_title` = 'Manager';

SELECT `salary` FROM `employees`;
-- e4
CREATE VIEW `top1_paid_employee` AS
	SELECT * 
    FROM `employees`
    ORDER BY `salary` DESC
    LIMIT 1;
    
SELECT * FROM `top1_paid_employee`;

-- e5
SELECT *
FROM `employees`
WHERE `salary` >= 1000 AND `department_id` = 4
ORDER BY `id` ASC;

-- e6
DELETE FROM `employees`
WHERE `department_id` = 1
OR `department_id` = 2;
SELECT * FROM `employees`;
