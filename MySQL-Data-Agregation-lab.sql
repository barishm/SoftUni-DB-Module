-- e1
SELECT `department_id` , count(`id`) AS 'Number of employees'
FROM `employees`
GROUP BY `department_id`
ORDER BY `department_id` ASC;

-- e2
SELECT `department_id` , ROUND(AVG(`salary`),2) AS 'Average Salary'
FROM `employees`
GROUP BY `department_id`
ORDER BY `department_id` ASC;

-- e3
SELECT `department_id`, ROUND(MIN(`salary`),2) AS 'Min Salary'
FROM `employees`
WHERE `salary` > 800
GROUP BY `department_id`
LIMIT 1;

-- e4
SELECT COUNT(`category_id`) FROM `products`
WHERE `price` > 8 AND `category_id` = 2;

-- e5
SELECT `category_id`, 
ROUND(AVG(`price`),2) AS 'Average Price',
ROUND(MIN(`price`),2)AS 'Cheapest Product',
ROUND(MAX(`price`),2)AS 'Most Expensive Product'
FROM `products`
GROUP BY `category_id`;
