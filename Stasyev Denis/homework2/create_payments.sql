CREATE DATABASE IF NOT EXISTS `technotrack_default`;
USE `technotrack_default`;

CREATE TABLE `payments` (
  `payment_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `payment_sum` DOUBLE NULL,
  `payment_dttm` TIMESTAMP NULL,
  PRIMARY KEY (`payment_id`),
  CONSTRAINT `fk_payments_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `technotrack_default`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
