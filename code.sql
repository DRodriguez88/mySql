-- MySQL Script generated by MySQL Workbench
-- Tue Mar 27 19:08:13 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`city` (
  `city_id` INT NOT NULL,
  `city_name` VARCHAR(45) NULL,
  PRIMARY KEY (`city_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`address` (
  `address_id` INT NOT NULL,
  `address` VARCHAR(80) NOT NULL,
  `city_city_id` INT NOT NULL,
  PRIMARY KEY (`address_id`, `city_city_id`),
  INDEX `fk_address_city1_idx` (`city_city_id` ASC),
  CONSTRAINT `fk_address_city1`
    FOREIGN KEY (`city_city_id`)
    REFERENCES `mydb`.`city` (`city_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`employees` (
  `employee_id` INT NOT NULL,
  `employee_name` VARCHAR(60) NOT NULL,
  `address_address_id` INT NOT NULL,
  PRIMARY KEY (`employee_id`, `address_address_id`),
  INDEX `fk_employees_address1_idx` (`address_address_id` ASC),
  CONSTRAINT `fk_employees_address1`
    FOREIGN KEY (`address_address_id`)
    REFERENCES `mydb`.`address` (`address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`role` (
  `role_name` VARCHAR(50) NOT NULL,
  `employees_employee_id` INT NOT NULL,
  PRIMARY KEY (`employees_employee_id`),
  CONSTRAINT `fk_role_employees1`
    FOREIGN KEY (`employees_employee_id`)
    REFERENCES `mydb`.`employees` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`diagnosis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`diagnosis` (
  `diagnosis_id` INT NOT NULL,
  `diagnoses_name` VARCHAR(100) NULL,
  `role_employees_employee_id` INT NOT NULL,
  PRIMARY KEY (`diagnosis_id`, `role_employees_employee_id`),
  INDEX `fk_diagnoses_role1_idx` (`role_employees_employee_id` ASC),
  CONSTRAINT `fk_diagnoses_role1`
    FOREIGN KEY (`role_employees_employee_id`)
    REFERENCES `mydb`.`role` (`employees_employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`patients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`patients` (
  `patient_id` INT NOT NULL,
  `patient_name` VARCHAR(50) NOT NULL,
  `address_address_id` INT NOT NULL,
  `phone_number` VARCHAR(12) NULL,
  `height` VARCHAR(5) NULL,
  `weight` INT NULL,
  `blood_type` VARCHAR(16) NULL,
  `allergies` VARCHAR(200) NULL,
  `patientscol` VARCHAR(45) NULL,
  `diagnosis_diagnosis_id` INT NOT NULL,
  `diagnosis_role_employees_employee_id` INT NOT NULL,
  PRIMARY KEY (`patient_id`, `address_address_id`, `diagnosis_diagnosis_id`, `diagnosis_role_employees_employee_id`),
  INDEX `fk_patients_address1_idx` (`address_address_id` ASC),
  INDEX `fk_patients_diagnosis1_idx` (`diagnosis_diagnosis_id` ASC, `diagnosis_role_employees_employee_id` ASC),
  CONSTRAINT `fk_patients_address1`
    FOREIGN KEY (`address_address_id`)
    REFERENCES `mydb`.`address` (`address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_patients_diagnosis1`
    FOREIGN KEY (`diagnosis_diagnosis_id` , `diagnosis_role_employees_employee_id`)
    REFERENCES `mydb`.`diagnosis` (`diagnosis_id` , `role_employees_employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`room_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`room_type` (
  `type` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`type`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`floor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`floor` (
  `floor_id` INT NOT NULL,
  PRIMARY KEY (`floor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`room` (
  `room_id` INT NOT NULL,
  `room_type_type` VARCHAR(50) NOT NULL,
  `floor_floor_id` INT NOT NULL,
  `employees_employee_id` INT NOT NULL,
  `employees_address_address_id` INT NOT NULL,
  PRIMARY KEY (`room_id`, `room_type_type`, `floor_floor_id`, `employees_employee_id`, `employees_address_address_id`),
  INDEX `fk_room_room_type1_idx` (`room_type_type` ASC),
  INDEX `fk_room_floor1_idx` (`floor_floor_id` ASC),
  INDEX `fk_room_employees1_idx` (`employees_employee_id` ASC, `employees_address_address_id` ASC),
  CONSTRAINT `fk_room_room_type1`
    FOREIGN KEY (`room_type_type`)
    REFERENCES `mydb`.`room_type` (`type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_room_floor1`
    FOREIGN KEY (`floor_floor_id`)
    REFERENCES `mydb`.`floor` (`floor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_room_employees1`
    FOREIGN KEY (`employees_employee_id` , `employees_address_address_id`)
    REFERENCES `mydb`.`employees` (`employee_id` , `address_address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`disease`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`disease` (
  `disease_id` INT NOT NULL,
  `disease_name` VARCHAR(45) NULL,
  `patients_patient_id` INT NOT NULL,
  `diagnoses_diagnosis_id` INT NOT NULL,
  `diagnoses_role_employees_employee_id` INT NOT NULL,
  PRIMARY KEY (`disease_id`, `patients_patient_id`, `diagnoses_diagnosis_id`, `diagnoses_role_employees_employee_id`),
  INDEX `fk_disease_patients_idx` (`patients_patient_id` ASC),
  INDEX `fk_disease_diagnoses1_idx` (`diagnoses_diagnosis_id` ASC, `diagnoses_role_employees_employee_id` ASC),
  CONSTRAINT `fk_disease_patients`
    FOREIGN KEY (`patients_patient_id`)
    REFERENCES `mydb`.`patients` (`patient_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_disease_diagnoses1`
    FOREIGN KEY (`diagnoses_diagnosis_id` , `diagnoses_role_employees_employee_id`)
    REFERENCES `mydb`.`diagnosis` (`diagnosis_id` , `role_employees_employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`patients_has_employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`patients_has_employees` (
  `patients_patient_id` INT NOT NULL,
  `patients_address_address_id` INT NOT NULL,
  `employees_employee_id` INT NOT NULL,
  `employees_address_address_id` INT NOT NULL,
  PRIMARY KEY (`patients_patient_id`, `patients_address_address_id`, `employees_employee_id`, `employees_address_address_id`),
  INDEX `fk_patients_has_employees_employees1_idx` (`employees_employee_id` ASC, `employees_address_address_id` ASC),
  INDEX `fk_patients_has_employees_patients1_idx` (`patients_patient_id` ASC, `patients_address_address_id` ASC),
  CONSTRAINT `fk_patients_has_employees_patients1`
    FOREIGN KEY (`patients_patient_id` , `patients_address_address_id`)
    REFERENCES `mydb`.`patients` (`patient_id` , `address_address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_patients_has_employees_employees1`
    FOREIGN KEY (`employees_employee_id` , `employees_address_address_id`)
    REFERENCES `mydb`.`employees` (`employee_id` , `address_address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
