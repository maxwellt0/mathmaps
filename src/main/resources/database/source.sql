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
  `user_id` INT UNSIGNED NULL AUTO_INCREMENT,
  `login` VARCHAR(20) NOT NULL,
  `email` VARCHAR(25) NOT NULL,
  `password` VARCHAR(16) NOT NULL,
  `name` VARCHAR(35) NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mathmaps`.`link`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mathmaps`.`link` (
  `link_id` INT UNSIGNED NOT NULL,
  `note_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`link_id`, `note_id`),
  INDEX `FK_LINK_NOTE_idx` (`note_id` ASC),
  CONSTRAINT `FK_LINK_NOTE`
    FOREIGN KEY (`note_id`)
    REFERENCES `mathmaps`.`note` (`note_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mathmaps`.`note`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mathmaps`.`note` (
  `note_id` INT UNSIGNED NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `text` VARCHAR(10000) NOT NULL,
  `rank` INT UNSIGNED NULL,
  `link_id` INT UNSIGNED NULL,
  PRIMARY KEY (`note_id`),
  INDEX `FK_NOTE_LINK_idx` (`link_id` ASC),
  CONSTRAINT `FK_NOTE_LINK`
    FOREIGN KEY (`link_id`)
    REFERENCES `mathmaps`.`link` (`link_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mathmaps`.`user_note`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mathmaps`.`user_note` (
  `user_id` INT UNSIGNED NOT NULL,
  `note_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`, `note_id`),
  INDEX `FK_NOTE_ID_idx` (`note_id` ASC),
  CONSTRAINT `FK_USER_ID`
    FOREIGN KEY (`user_id`)
    REFERENCES `mathmaps`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_NOTE_ID`
    FOREIGN KEY (`note_id`)
    REFERENCES `mathmaps`.`note` (`note_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
