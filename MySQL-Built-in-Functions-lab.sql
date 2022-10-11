-- e1
SELECT `title`
FROM `books`
WHERE SUBSTRING(`title` FROM 1 FOR 3) = 'the';

-- e2
SELECT REPLACE(`title`,'The','***')
FROM `books`
WHERE SUBSTRING(`title` FROM 1 FOR 3) = 'the'
ORDER BY `id` ASC;

-- e3
SELECT ROUND(SUM(`cost`),2)
FROM `books`;

-- e4
SELECT  concat(first_name, ' ', last_name) AS 'Full Name', 
TIMESTAMPDIFF(DAY, born, died) AS 'Days Lived' 
FROM authors;

-- e5
SELECT `title` FROM `books`
WHERE `title` LIKE 'Harry Potter%';