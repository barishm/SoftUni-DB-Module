
-- e1
SELECT * FROM `departments`
ORDER BY `department_id` ASC;

-- e2
SELECT `name` FROM `departments`
ORDER BY `department_id` ASC;

-- e3
SELECT `first_name`, `last_name`, `salary` FROM `employees`
ORDER BY `employee_id` ASC;

-- e4
SELECT `first_name`, `middle_name`, `last_name` FROM `employees`
ORDER BY `employee_id` ASC;

-- e5
SELECT CONCAT(`first_name`, '.',`last_name`,'@softuni.bg')
FROM `employees`
ORDER BY `employee_id` ASC;

-- e6
SELECT DISTINCT(`salary`) FROM `employees`;

-- e7 
SELECT `employee_id` AS 'id',
		`first_name` AS 'First Name',
        `last_name` AS 'Last Name',
        `middle_name` AS 'Middle Name',
        `job_title` AS 'Job Title',
        `department_id` AS 'Dept ID',
        `manager_id` AS 'Mngr ID',
        `hire_date` AS 'Hire Date',
        `salary`, `address_id` FROM `employees`
        WHERE `job_title` = "Sales Representative";
			
-- e8
SELECT `first_name`,`last_name`,`job_title` FROM `employees`
WHERE `salary`>= 20000 AND `salary` <= 30000;

-- e9 
SELECT CONCAT(`first_name`,' ',`middle_name`,' ',`last_name`) AS 'Full Name'
FROM `employees`
WHERE `salary` = 25000 OR `salary` = 14000 OR `salary` = 12500
OR `salary` = 23600;

-- e10
SELECT `first_name`,`last_name` FROM `employees`
WHERE `manager_id` IS NULL;

-- e11
SELECT `first_name`,`last_name`,`salary` FROM `employees`
WHERE `salary` > 50000
ORDER BY `salary` DESC;

-- e12
SELECT `first_name`, `last_name` FROM `employees`
ORDER BY `salary` DESC
LIMIT 5;

-- e13
SELECT `first_name`, `last_name` FROM `employees`
WHERE `department_id` != 4;

-- e14
SELECT * FROM `employees`
ORDER BY `salary` DESC, `first_name`,`last_name` DESC,`middle_name`,`employee_id`;

-- e15
CREATE VIEW `v_employees_salaries` AS
SELECT `first_name`,`last_name`,`salary` FROM `employees`;
SELECT * FROM `v_employees_salaries`;

-- e16
CREATE VIEW `v_employees_job_titles` AS
SELECT CONCAT_WS(' ',`first_name`,`middle_name`,`last_name`) AS
`full_name`,
`job_title` FROM `employees`;

SELECT * FROM `v_employees_job_titles`;

-- e17
SELECT DISTINCT `job_title` FROM `employees`
ORDER BY `job_title` ASC;

-- e18
SELECT * FROM `projects`
ORDER BY `start_date`,`name`,`project_id`
LIMIT 10;

-- e19
SELECT `first_name`, `last_name`, `hire_date` from `employees`
ORDER BY `hire_date` DESC
LIMIT 7;

-- e20
UPDATE `employees`
SET `salary` = `salary` * 1.12
WHERE `department_id` IN (1, 2, 4, 11);
SELECT `salary` FROM `employees`;

-- e21
USE `geography`;
SELECT `peak_name` FROM `peaks`
ORDER BY `peak_name`;

-- e22
SELECT `country_name`, `population` from `countries`
WHERE `continent_code` = "EU"
ORDER BY `population` DESC, `country_name`
LIMIT 30;

-- e23
SELECT `country_name`, `country_code`,  
IF (`currency_code` = "EUR", 'Euro', 'Not Euro') AS `currency`
FROM `countries`
ORDER BY `country_name`;

-- e24
USE `diablo`;
SELECT `name` FROM `characters`
ORDER BY `name`;
