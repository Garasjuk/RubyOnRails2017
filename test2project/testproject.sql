SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
CREATE SCHEMA IF NOT EXISTS `testproject` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;
USE `testproject` ;

-- -----------------------------------------------------
-- Table `testproject`.`ar_internal_metadata`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `testproject`.`ar_internal_metadata` ;

CREATE  TABLE IF NOT EXISTS `testproject`.`ar_internal_metadata` (
  `key` VARCHAR(255) NOT NULL ,
  `value` VARCHAR(255) NULL DEFAULT NULL ,
  `created_at` DATETIME NOT NULL ,
  `updated_at` DATETIME NOT NULL ,
  PRIMARY KEY (`key`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `testproject`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `testproject`.`users` ;

CREATE  TABLE IF NOT EXISTS `testproject`.`users` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `first_name` VARCHAR(255) NULL DEFAULT NULL ,
  `last_name` VARCHAR(255) NULL DEFAULT NULL ,
  `email` VARCHAR(255) NULL DEFAULT NULL ,
  `password` VARCHAR(255) NULL DEFAULT NULL ,
  `admin` TINYINT(1) NULL DEFAULT NULL ,
  `created_at` DATETIME NOT NULL ,
  `updated_at` DATETIME NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `testproject`.`tasks`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `testproject`.`tasks` ;

CREATE  TABLE IF NOT EXISTS `testproject`.`tasks` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(255) NULL DEFAULT NULL ,
  `description` TEXT NULL DEFAULT NULL ,
  `status` VARCHAR(255) NULL DEFAULT NULL ,
  `created_at` DATETIME NOT NULL ,
  `updated_at` DATETIME NOT NULL ,
  `project_id` BIGINT(20) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 38
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `testproject`.`comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `testproject`.`comments` ;

CREATE  TABLE IF NOT EXISTS `testproject`.`comments` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `body` VARCHAR(255) NULL DEFAULT NULL ,
  `task_id` BIGINT(20) NULL DEFAULT NULL ,
  `user_id` BIGINT(20) NULL DEFAULT NULL ,
  `created_at` DATETIME NOT NULL ,
  `updated_at` DATETIME NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `index_comments_on_task_id` (`task_id` ASC) ,
  INDEX `index_comments_on_user_id` (`user_id` ASC) ,
  CONSTRAINT `fk_rails_03de2dc08c`
    FOREIGN KEY (`user_id` )
    REFERENCES `testproject`.`users` (`id` ),
  CONSTRAINT `fk_rails_6bd05453df`
    FOREIGN KEY (`task_id` )
    REFERENCES `testproject`.`tasks` (`id` ))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `testproject`.`projects`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `testproject`.`projects` ;

CREATE  TABLE IF NOT EXISTS `testproject`.`projects` (
  `idprojects` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NULL DEFAULT NULL ,
  `summary` VARCHAR(45) NULL DEFAULT NULL ,
  `start_date` DATE NULL DEFAULT NULL ,
  `end_date` DATE NULL DEFAULT NULL ,
  PRIMARY KEY (`idprojects`) )
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `testproject`.`schema_migrations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `testproject`.`schema_migrations` ;

CREATE  TABLE IF NOT EXISTS `testproject`.`schema_migrations` (
  `version` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`version`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
