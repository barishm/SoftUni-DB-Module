-- e1
USE `gringotts`;
SELECT COUNT(*) AS `count` FROM `wizzard_deposits`;

-- e2
SELECT MAX(`magic_wand_size`) AS 'longest_magic_wand'
FROM `wizzard_deposits`;

-- e3
SELECT `deposit_group`, MAX(`magic_wand_size`) AS 'longest_magic_wand'
FROM `wizzard_deposits`
GROUP BY `deposit_group`
ORDER BY `longest_magic_wand`, `deposit_group`;

-- e3
SELECT `deposit_group`, MAX(`magic_wand_size`) AS 'longest_magic_wand'
FROM `wizzard_deposits`
GROUP BY `deposit_group`
ORDER BY `longest_magic_wand`, `deposit_group`;

-- e4
SELECT `deposit_group`
FROM `wizzard_deposits`
GROUP BY `deposit_group`
ORDER BY AVG(`magic_wand_size`)
LIMIT 1;

-- e5
SELECT `deposit_group`, SUM(`deposit_amount`) AS 'total_sum'
FROM `wizzard_deposits`
GROUP BY `deposit_group`
ORDER BY `total_sum`;

-- e6
SELECT `deposit_group`,SUM(`deposit_amount`) AS 'total_sum'
FROM `wizzard_deposits`
WHERE `magic_wand_creator` = 'Ollivander family'
GROUP BY `deposit_group`
ORDER BY `deposit_group`;

-- e7
SELECT `deposit_group`, SUM(`deposit_amount`) AS 'total_sum'
FROM `wizzard_deposits`
WHERE `magic_wand_creator` = 'Ollivander family'
GROUP BY `deposit_group`
HAVING `total_sum` < 150000
ORDER BY `total_sum`DESC;

-- e8
SELECT `deposit_group`,`magic_wand_creator`,
MIN(`deposit_charge`) AS 'min_deposit_charge'
FROM `wizzard_deposits`
GROUP BY `magic_wand_creator`,`deposit_group`
ORDER BY `magic_wand_creator`,`deposit_group`;

-- e9
SELECT (CASE
        WHEN `age` BETWEEN 0 AND 10 THEN '[0-10]'
        WHEN `age` BETWEEN 11 AND 20 THEN '[11-20]'
        WHEN `age` BETWEEN 21 AND 30 THEN '[21-30]'
        WHEN `age` BETWEEN 31 AND 40 THEN '[31-40]'
        WHEN `age` BETWEEN 41 AND 50 THEN '[41-50]'
        WHEN `age` BETWEEN 51 AND 60 THEN '[51-60]'
        WHEN `age` >= 61 THEN '[61+]'
    END) AS `age_group`, COUNT(age) AS `wizard_count` FROM `wizzard_deposits`
    GROUP BY `age_group`
    ORDER BY `age_group`;
    
-- e10
SELECT LEFT(`first_name`, 1) AS 'first_letter'
FROM `wizzard_deposits`
WHERE `deposit_group` = 'Troll Chest'
GROUP BY `first_letter`
ORDER BY `first_letter`;

-- e11
SELECT `deposit_group`,`is_deposit_expired`,AVG(`deposit_interest`)
AS 'average_interest' FROM `wizzard_deposits`
WHERE `deposit_start_date` > '1985-01-01'
GROUP BY `deposit_group`, `is_deposit_expired`
ORDER BY `deposit_group` DESC,`is_deposit_expired`;

-- e12
USE `soft_uni`;
SELECT `department_id` ,MIN(`salary`) AS 'minimum_salary'
FROM `employees`
WHERE `department_id` = 2 OR `department_id` = 5 OR `department_id` = 7
AND `hire_date` > '2000-01-01'
GROUP BY `department_id`
ORDER BY `department_id`;

-- e13
CREATE TABLE `salary_more_than` AS
SELECT *
FROM `employees`
WHERE `salary` > 30000;
 
DELETE 
FROM `salary_more_than`
WHERE `manager_id` = 42;
 
UPDATE `salary_more_than`
SET `salary` = `salary` + 5000
WHERE `department_id` = 1;
 
SELECT `department_id`, avg(`salary`) AS `avg_salary`
FROM `salary_more_than`
GROUP BY `department_id`
ORDER BY `department_id`;

-- e14
SELECT `department_id`, max(`salary`) AS `max_salary`
FROM `employees`
GROUP BY `department_id`
HAVING `max_salary` NOT BETWEEN 30000 AND 70000
ORDER BY `department_id`;

-- e15
SELECT COUNT(`employee_id`) AS 'count'
FROM `employees`
WHERE `manager_id` IS NULL;

-- e16
SELECT DISTINCT `department_id`,
        (
        SELECT  DISTINCT `salary`
        FROM    `employees` e
        WHERE   e.`department_id` = `employees`.`department_id`
        ORDER BY `salary` DESC
        LIMIT 1 OFFSET 2
        ) AS `third_highest_salary`
FROM    `employees`
HAVING `third_highest_salary` IS NOT NULL
ORDER BY `department_id`;

-- e17
SELECT `first_name`, `last_name`, `department_id`
FROM `employees` f
WHERE `salary` > (
    SELECT avg(`salary`)
    FROM `employees` e
    WHERE e.department_id = f.department_id
    )
ORDER BY `department_id`, `employee_id`
LIMIT 10;

-- e18
SELECT `department_id`, SUM(`salary`) AS `total_salary`
FROM `employees`
GROUP BY `department_id`
ORDER BY `department_id`;
