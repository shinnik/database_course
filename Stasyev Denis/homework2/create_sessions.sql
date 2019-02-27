CREATE DATABASE IF NOT EXISTS `technotrack_default`;
USE `technotrack_default`;

CREATE TABLE `sessions` (
  `session_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `begin_dttm` TIMESTAMP NULL,
  `end_dttm` TIMESTAMP NULL,
  PRIMARY KEY (`session_id`),
  CONSTRAINT `fk_sessions_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `technotrack_default`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
