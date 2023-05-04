CREATE DATABASE `gamebar`;

USE `gamebar`;
-- exercise 1
CREATE TABLE `employees`(
`id` INT NOT NULL PRIMARY KEY,
`first_name` VARCHAR(50) NOT NULL,
`last_name` VARCHAR(50) NOT NULL
);

CREATE TABLE `categories`(
`id` INT NOT NULL PRIMARY KEY,
`name` VARCHAR(50) NOT NULL
);

CREATE TABLE `products`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL,
`category_id` INT NOT NULL
);
-- exercise 2
INSERT INTO `gamebar`.`employees` (`id`, `first_name`, `last_name`)
 VALUES ('1', 'test1', 'test11');
INSERT INTO `gamebar`.`employees` (`id`, `first_name`, `last_name`)
 VALUES ('2', 'test2', 'test22');
INSERT INTO `gamebar`.`employees` (`id`, `first_name`, `last_name`)
 VALUES ('3', 'test3', 'test33');
 
 -- exercise 3
ALTER TABLE `gamebar`.`employees` 
ADD COLUMN `middle_name` VARCHAR(50) NOT NULL AFTER `last_name`;

-- exercise 4
ALTER TABLE `gamebar`.`products` 
ADD INDEX `my_fk_idx` (`category_id` ASC) VISIBLE;
;
ALTER TABLE `gamebar`.`products` 
ADD CONSTRAINT `my_fk`
  FOREIGN KEY (`category_id`)
  REFERENCES `gamebar`.`categories` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  -- exercise 5
  ALTER TABLE `gamebar`.`employees` 
CHANGE COLUMN `middle_name` `middle_name` VARCHAR(100) NOT NULL ;
