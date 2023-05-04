-- e1
CREATE TABLE `mountains`(
`id` INT PRIMARY KEY AUTO_INCREMENT ,
`name` VARCHAR(20) NOT NULL
);
CREATE TABLE peaks (
   id INT PRIMARY KEY AUTO_INCREMENT,
   name VARCHAR(45),
   mountain_id INT,
CONSTRAINT fk_p_m
FOREIGN KEY (mountain_id)
REFERENCES mountains(id)
);


-- e2
SELECT v.driver_id,v.vehicle_type,
CONCAT(c.first_name, ' ',c.last_name) AS 'driver_name'
FROM vehicles AS v
JOIN
campers AS c ON v.driver_id = c.id;

-- e3
SELECT r.starting_point AS 'route_starting_point',
r.end_point AS 'route_ending_point',
r.leader_id,
CONCAT(c.first_name, ' ', c.last_name) as 'leader_name'
 FROM `routes` AS r
JOIN `campers` AS c
ON r.leader_id = c.id;

-- e4
CREATE TABLE mountains (
   id INT PRIMARY KEY AUTO_INCREMENT,
   name VARCHAR(45));
   
CREATE TABLE peaks (
   id INT PRIMARY KEY AUTO_INCREMENT,
   name VARCHAR(45),
   mountain_id INT,
CONSTRAINT fk_p_m
FOREIGN KEY (mountain_id)
REFERENCES mountains(id)
ON DELETE CASCADE);
