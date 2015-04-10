-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mathmaps
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mathmaps
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mathmaps` DEFAULT CHARACTER SET utf8 ;
USE `mathmaps` ;

-- -----------------------------------------------------
-- Table `mathmaps`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mathmaps`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(20) NOT NULL,
  `email` VARCHAR(25) NULL,
  `password` VARCHAR(16) NOT NULL,
  `name` VARCHAR(35) NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `login_UNIQUE` (`login` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mathmaps`.`link`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mathmaps`.`link` (
  `link_id` INT NOT NULL AUTO_INCREMENT,
  `note_id` INT NOT NULL,
  PRIMARY KEY (`link_id`),
  INDEX `fk_link_note_idx` (`note_id` ASC),
  CONSTRAINT `fk_link_note`
    FOREIGN KEY (`note_id`)
    REFERENCES `mathmaps`.`note` (`note_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mathmaps`.`note`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mathmaps`.`note` (
  `note_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `text` VARCHAR(10000) NOT NULL,
  `rank` INT NULL,
  `link_id` INT NULL,
  `user_id` INT NULL,
  PRIMARY KEY (`note_id`),
  INDEX `fk_note_link_idx` (`link_id` ASC),
  INDEX `fk_note_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_note_link`
    FOREIGN KEY (`link_id`)
    REFERENCES `mathmaps`.`link` (`link_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_note_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `mathmaps`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
