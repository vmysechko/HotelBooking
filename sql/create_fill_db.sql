-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema hotel_booking_db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `hotel_booking_db` ;

-- -----------------------------------------------------
-- Schema hotel_booking_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hotel_booking_db` DEFAULT CHARACTER SET utf8 ;
USE `hotel_booking_db` ;

-- -----------------------------------------------------
-- Table `hotel_booking_db`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_booking_db`.`Users` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(32) NOT NULL,
  `password` VARCHAR(64) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `phone` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `login_UNIQUE` (`login` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel_booking_db`.`Roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_booking_db`.`Roles` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel_booking_db`.`Users_Roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_booking_db`.`Users_Roles` (
  `users_id` BIGINT NOT NULL,
  `roles_id` BIGINT NOT NULL,
  PRIMARY KEY (`users_id`, `roles_id`),
  INDEX `fk_Users_has_Roles_Roles1_idx` (`roles_id` ASC),
  INDEX `fk_Users_has_Roles_Users_idx` (`users_id` ASC),
  CONSTRAINT `fk_Users_has_Roles_Users`
    FOREIGN KEY (`users_id`)
    REFERENCES `hotel_booking_db`.`Users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Users_has_Roles_Roles1`
    FOREIGN KEY (`roles_id`)
    REFERENCES `hotel_booking_db`.`Roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel_booking_db`.`Appartments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_booking_db`.`Appartments` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `num_places` INT NOT NULL,
  `type` VARCHAR(32) NOT NULL,
  `price` DECIMAL(10,0) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel_booking_db`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_booking_db`.`Orders` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `num_places` INT NOT NULL,
  `type` VARCHAR(32) NOT NULL,
  `check_in` TIME NOT NULL,
  `check_out` TIME NOT NULL,
  `status` VARCHAR(32) NOT NULL DEFAULT 'NEW',
  `total_price` DECIMAL(10,0) NOT NULL,
  `user_id` BIGINT NOT NULL,
  `appartment_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`, `user_id`, `appartment_id`),
  INDEX `fk_Orders_Users1_idx` (`user_id` ASC),
  INDEX `fk_Orders_Appartments1_idx` (`appartment_id` ASC),
  CONSTRAINT `fk_Orders_Users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `hotel_booking_db`.`Users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Appartments1`
    FOREIGN KEY (`appartment_id`)
    REFERENCES `hotel_booking_db`.`Appartments` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel_booking_db`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_booking_db`.`Invoices` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`, `order_id`),
  INDEX `fk_Invoices_Orders1_idx` (`order_id` ASC),
  CONSTRAINT `fk_Invoices_Orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `hotel_booking_db`.`Orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `hotel_booking_db`.`Users`
-- -----------------------------------------------------
START TRANSACTION;
USE `hotel_booking_db`;
INSERT INTO `hotel_booking_db`.`Users` (`id`, `login`, `password`, `email`, `phone`) VALUES (1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@email.com', '1111111');

COMMIT;


-- -----------------------------------------------------
-- Data for table `hotel_booking_db`.`Roles`
-- -----------------------------------------------------
START TRANSACTION;
USE `hotel_booking_db`;
INSERT INTO `hotel_booking_db`.`Roles` (`id`, `name`) VALUES (1, 'USER');
INSERT INTO `hotel_booking_db`.`Roles` (`id`, `name`) VALUES (2, 'ADMIN');

COMMIT;


-- -----------------------------------------------------
-- Data for table `hotel_booking_db`.`Users_Roles`
-- -----------------------------------------------------
START TRANSACTION;
USE `hotel_booking_db`;
INSERT INTO `hotel_booking_db`.`Users_Roles` (`users_id`, `roles_id`) VALUES (1, 1);
INSERT INTO `hotel_booking_db`.`Users_Roles` (`users_id`, `roles_id`) VALUES (1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `hotel_booking_db`.`Appartments`
-- -----------------------------------------------------
START TRANSACTION;
USE `hotel_booking_db`;
INSERT INTO `hotel_booking_db`.`Appartments` (`id`, `num_places`, `type`, `price`) VALUES (1, 1, 'STANDARD', 100);
INSERT INTO `hotel_booking_db`.`Appartments` (`id`, `num_places`, `type`, `price`) VALUES (2, 2, 'SEMI_LUX', 150);
INSERT INTO `hotel_booking_db`.`Appartments` (`id`, `num_places`, `type`, `price`) VALUES (3, 3, 'LUX', 300);
INSERT INTO `hotel_booking_db`.`Appartments` (`id`, `num_places`, `type`, `price`) VALUES (4, 4, 'PRESIDENT', 500);

COMMIT;

