-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema mproject_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mproject_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mproject_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mproject_db` ;

-- -----------------------------------------------------
-- Table `mproject_db`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mproject_db`.`customer` (
  `cid` VARCHAR(10) NOT NULL,
  `cname` VARCHAR(5) NOT NULL,
  `csex` VARCHAR(2) NOT NULL,
  `cbirth` DATE NOT NULL,
  `cemail` VARCHAR(100) NULL DEFAULT NULL,
  `cnick` VARCHAR(10) NOT NULL,
  `cpassword` VARCHAR(100) NOT NULL,
  `cpoint` INT NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mproject_db`.`hospital`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mproject_db`.`hospital` (
  `hno` INT NOT NULL AUTO_INCREMENT,
  `hname` VARCHAR(50) NOT NULL,
  `hadrr` VARCHAR(1000) NOT NULL,
  `hdoctor` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`hno`))
ENGINE = InnoDB
AUTO_INCREMENT = 43
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mproject_db`.`hosptialfile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mproject_db`.`hosptialfile` (
  `hf_no` INT NOT NULL AUTO_INCREMENT,
  `hf_hno` INT NULL DEFAULT NULL,
  `hf_oriname` VARCHAR(100) NULL DEFAULT NULL,
  `hf_sysname` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`hf_no`),
  INDEX `hf_hno` (`hf_hno` ASC) VISIBLE,
  CONSTRAINT `hosptialfile_ibfk_1`
    FOREIGN KEY (`hf_hno`)
    REFERENCES `mproject_db`.`hospital` (`hno`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mproject_db`.`hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mproject_db`.`hotel` (
  `hnum` INT NOT NULL AUTO_INCREMENT,
  `hname` VARCHAR(20) NOT NULL,
  `haddr` VARCHAR(30) NOT NULL,
  `htel` VARCHAR(20) NULL DEFAULT NULL,
  `hemail` VARCHAR(50) NULL DEFAULT NULL,
  `hlogo` VARCHAR(30) NULL DEFAULT NULL,
  `hstar` VARCHAR(10) NULL DEFAULT NULL,
  `hent` TEXT NULL DEFAULT NULL,
  `hamenity` TEXT NULL DEFAULT NULL,
  `hpolicy` TEXT NULL DEFAULT NULL,
  `hcit` TIME NOT NULL,
  `hcot` TIME NOT NULL,
  `hlati` FLOAT NOT NULL,
  `hlong` FLOAT NOT NULL,
  `category` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`hnum`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mproject_db`.`hotelfile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mproject_db`.`hotelfile` (
  `hfnum` INT NOT NULL AUTO_INCREMENT,
  `hnum` INT NOT NULL,
  `horiname` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`hfnum`),
  INDEX `hnum` (`hnum` ASC) VISIBLE,
  CONSTRAINT `hotelfile_ibfk_1`
    FOREIGN KEY (`hnum`)
    REFERENCES `mproject_db`.`hotel` (`hnum`))
ENGINE = InnoDB
AUTO_INCREMENT = 61
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mproject_db`.`review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mproject_db`.`review` (
  `rno` INT NOT NULL AUTO_INCREMENT,
  `rtitle` VARCHAR(20) NOT NULL,
  `rcontents` TEXT NOT NULL,
  `cid` VARCHAR(10) NOT NULL,
  `rdate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `rviews` INT NOT NULL DEFAULT '0',
  PRIMARY KEY (`rno`),
  INDEX `cid` (`cid` ASC) VISIBLE,
  CONSTRAINT `review_ibfk_1`
    FOREIGN KEY (`cid`)
    REFERENCES `mproject_db`.`customer` (`cid`))
ENGINE = InnoDB
AUTO_INCREMENT = 29
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mproject_db`.`rcomment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mproject_db`.`rcomment` (
  `rc_no` INT NOT NULL AUTO_INCREMENT,
  `rc_rno` INT NOT NULL,
  `rc_contents` VARCHAR(200) NOT NULL,
  `rc_cid` VARCHAR(10) NOT NULL,
  `rc_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rc_no`),
  INDEX `rc_rno` (`rc_rno` ASC) VISIBLE,
  INDEX `rc_cid` (`rc_cid` ASC) VISIBLE,
  CONSTRAINT `rcomment_ibfk_1`
    FOREIGN KEY (`rc_rno`)
    REFERENCES `mproject_db`.`review` (`rno`),
  CONSTRAINT `rcomment_ibfk_2`
    FOREIGN KEY (`rc_cid`)
    REFERENCES `mproject_db`.`customer` (`cid`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mproject_db`.`reviewfile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mproject_db`.`reviewfile` (
  `rf_no` INT NOT NULL AUTO_INCREMENT,
  `rf_rno` INT NOT NULL,
  `rf_oriname` VARCHAR(50) NOT NULL,
  `rf_sysname` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`rf_no`),
  INDEX `rf_rno` (`rf_rno` ASC) VISIBLE,
  CONSTRAINT `reviewfile_ibfk_1`
    FOREIGN KEY (`rf_rno`)
    REFERENCES `mproject_db`.`review` (`rno`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mproject_db`.`room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mproject_db`.`room` (
  `roomnum` INT NOT NULL AUTO_INCREMENT,
  `hnum` INT NOT NULL,
  `rname` VARCHAR(50) NOT NULL,
  `hmax` INT NULL DEFAULT NULL,
  `hprice` INT NOT NULL,
  `rinfo` TEXT NULL DEFAULT NULL,
  `roriname` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`roomnum`),
  INDEX `hnum` (`hnum` ASC) VISIBLE,
  CONSTRAINT `room_ibfk_1`
    FOREIGN KEY (`hnum`)
    REFERENCES `mproject_db`.`hotel` (`hnum`))
ENGINE = InnoDB
AUTO_INCREMENT = 141
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `mproject_db` ;

-- -----------------------------------------------------
-- Placeholder table for view `mproject_db`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mproject_db`.`comments` (`rc_no` INT, `rc_rno` INT, `rc_contents` INT, `rc_date` INT, `rc_cid` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mproject_db`.`rlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mproject_db`.`rlist` (`rno` INT, `rtitle` INT, `rcontents` INT, `cid` INT, `cname` INT, `rdate` INT, `rviews` INT);

-- -----------------------------------------------------
-- View `mproject_db`.`comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mproject_db`.`comments`;
USE `mproject_db`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`dev02`@`%` SQL SECURITY DEFINER VIEW `mproject_db`.`comments` AS select `mproject_db`.`rcomment`.`rc_no` AS `rc_no`,`mproject_db`.`rcomment`.`rc_rno` AS `rc_rno`,`mproject_db`.`rcomment`.`rc_contents` AS `rc_contents`,`mproject_db`.`rcomment`.`rc_date` AS `rc_date`,`mproject_db`.`rcomment`.`rc_cid` AS `rc_cid` from `mproject_db`.`rcomment`;

-- -----------------------------------------------------
-- View `mproject_db`.`rlist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mproject_db`.`rlist`;
USE `mproject_db`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`dev02`@`%` SQL SECURITY DEFINER VIEW `mproject_db`.`rlist` AS select `r`.`rno` AS `rno`,`r`.`rtitle` AS `rtitle`,`r`.`rcontents` AS `rcontents`,`r`.`cid` AS `cid`,`c`.`cname` AS `cname`,`r`.`rdate` AS `rdate`,`r`.`rviews` AS `rviews` from (`mproject_db`.`customer` `c` join `mproject_db`.`review` `r` on((`c`.`cid` = `r`.`cid`)));

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
