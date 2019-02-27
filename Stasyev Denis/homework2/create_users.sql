CREATE DATABASE IF NOT EXISTS `technotrack_default`;
USE `technotrack_default`;

CREATE TABLE `users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(45) NOT NULL UNIQUE,
  `reg_dttm` TIMESTAMP NULL,
  PRIMARY KEY (`user_id`)
);
