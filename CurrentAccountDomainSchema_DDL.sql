-- MySQL Script generated by MySQL Workbench
-- Sat Mar 26 20:46:20 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema CurrentAccountDomainSchema
-- -----------------------------------------------------
-- Esquema fisico para las entidades relacionadas con el dominio BIAN CurrentAccount
DROP SCHEMA IF EXISTS `CurrentAccountDomainSchema` ;

-- -----------------------------------------------------
-- Schema CurrentAccountDomainSchema
--
-- Esquema fisico para las entidades relacionadas con el dominio BIAN CurrentAccount
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CurrentAccountDomainSchema` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
-- -----------------------------------------------------
-- Schema PositionKeepingDomainSchema
-- -----------------------------------------------------
-- Esquema MySQL para las entidades relacionadas con el dominio Position Keeping BIAN
DROP SCHEMA IF EXISTS `PositionKeepingDomainSchema` ;

-- -----------------------------------------------------
-- Schema PositionKeepingDomainSchema
--
-- Esquema MySQL para las entidades relacionadas con el dominio Position Keeping BIAN
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PositionKeepingDomainSchema` ;
-- -----------------------------------------------------
-- Schema CustomerProfileDomainSchema
-- -----------------------------------------------------
-- Esquema con las entidades relacionadas con el dominio BIAN Customer Profile
DROP SCHEMA IF EXISTS `CustomerProfileDomainSchema` ;

-- -----------------------------------------------------
-- Schema CustomerProfileDomainSchema
--
-- Esquema con las entidades relacionadas con el dominio BIAN Customer Profile
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CustomerProfileDomainSchema` ;
USE `CurrentAccountDomainSchema` ;

-- -----------------------------------------------------
-- Table `CurrentAccountDomainSchema`.`CurrentAccount`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CurrentAccountDomainSchema`.`CurrentAccount` ;

CREATE TABLE IF NOT EXISTS `CurrentAccountDomainSchema`.`CurrentAccount` (
  `AccountId` BIGINT(1000) NOT NULL,
  `PartyId` VARCHAR(45) NULL,
  `Status` VARCHAR(45) NULL,
  `StatusUpdateDateTime` TIMESTAMP(2) NULL,
  `AccountType` VARCHAR(45) NOT NULL,
  `NickName` VARCHAR(70) NULL,
  `OpeningDate` TIMESTAMP(2) NULL,
  `AccountSubType` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`AccountId`),
  UNIQUE INDEX `AccountId_UNIQUE` (`AccountId` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CurrentAccountDomainSchema`.`AccountInfo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CurrentAccountDomainSchema`.`AccountInfo` ;

CREATE TABLE IF NOT EXISTS `CurrentAccountDomainSchema`.`AccountInfo` (
  `AccountInfoId` INT NOT NULL AUTO_INCREMENT,
  `AccountId` BIGINT(1000) NOT NULL,
  `SchemeName` VARCHAR(70) NOT NULL,
  `Identification` VARCHAR(256) NOT NULL,
  `Name` VARCHAR(70) NULL,
  PRIMARY KEY (`AccountInfoId`),
  UNIQUE INDEX `AccountInfoId_UNIQUE` (`AccountInfoId` ASC) VISIBLE,
  INDEX `AccountId_AccountInfo_idx` (`AccountId` ASC) VISIBLE,
  CONSTRAINT `AccountId_AccountInfo`
    FOREIGN KEY (`AccountId`)
    REFERENCES `CurrentAccountDomainSchema`.`CurrentAccount` (`AccountId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

USE `PositionKeepingDomainSchema` ;

-- -----------------------------------------------------
-- Table `PositionKeepingDomainSchema`.`Currency`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PositionKeepingDomainSchema`.`Currency` ;

CREATE TABLE IF NOT EXISTS `PositionKeepingDomainSchema`.`Currency` (
  `CurrencyId` INT NOT NULL AUTO_INCREMENT,
  `Code` VARCHAR(3) NOT NULL,
  `Description` VARCHAR(70) NULL,
  PRIMARY KEY (`CurrencyId`),
  UNIQUE INDEX `Code_UNIQUE` (`Code` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PositionKeepingDomainSchema`.`Amount`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PositionKeepingDomainSchema`.`Amount` ;

CREATE TABLE IF NOT EXISTS `PositionKeepingDomainSchema`.`Amount` (
  `AmountId` BIGINT(1000) NOT NULL AUTO_INCREMENT,
  `CurrencyId` INT NOT NULL,
  `Amount` DOUBLE NOT NULL DEFAULT 0.0,
  PRIMARY KEY (`AmountId`),
  INDEX `Amount_Currency_FK_idx` (`CurrencyId` ASC) VISIBLE,
  CONSTRAINT `Amount_Currency_FK`
    FOREIGN KEY (`CurrencyId`)
    REFERENCES `PositionKeepingDomainSchema`.`Currency` (`CurrencyId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PositionKeepingDomainSchema`.`CreditLine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PositionKeepingDomainSchema`.`CreditLine` ;

CREATE TABLE IF NOT EXISTS `PositionKeepingDomainSchema`.`CreditLine` (
  `CreditLineId` BIGINT(1000) NOT NULL AUTO_INCREMENT,
  `CurrencyId` INT NOT NULL,
  `Amount` DOUBLE NOT NULL,
  `Type` VARCHAR(45) NOT NULL,
  `Included` TINYINT NOT NULL,
  PRIMARY KEY (`CreditLineId`),
  INDEX `CreditLine_Currency_FK_idx` (`CurrencyId` ASC) VISIBLE,
  CONSTRAINT `CreditLine_Currency_FK`
    FOREIGN KEY (`CurrencyId`)
    REFERENCES `PositionKeepingDomainSchema`.`Currency` (`CurrencyId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PositionKeepingDomainSchema`.`PositionKeeping`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PositionKeepingDomainSchema`.`PositionKeeping` ;

CREATE TABLE IF NOT EXISTS `PositionKeepingDomainSchema`.`PositionKeeping` (
  `AccountId` BIGINT(1000) NOT NULL,
  `DateTime` TIMESTAMP(2) NULL,
  `CreditDebitIndicator` VARCHAR(45) NULL,
  `Type` VARCHAR(45) NULL,
  `AmountId` BIGINT(1000) NULL,
  `CreditLineId` BIGINT(1000) NULL,
  PRIMARY KEY (`AccountId`),
  UNIQUE INDEX `CreditLineId_UNIQUE` (`CreditLineId` ASC) VISIBLE,
  UNIQUE INDEX `AmountId_UNIQUE` (`AmountId` ASC) VISIBLE,
  CONSTRAINT `Amount_FK`
    FOREIGN KEY (`AmountId`)
    REFERENCES `PositionKeepingDomainSchema`.`Amount` (`AmountId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `CreditLine_FK`
    FOREIGN KEY (`CreditLineId`)
    REFERENCES `PositionKeepingDomainSchema`.`CreditLine` (`CreditLineId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

USE `CustomerProfileDomainSchema` ;

-- -----------------------------------------------------
-- Table `CustomerProfileDomainSchema`.`Country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CustomerProfileDomainSchema`.`Country` ;

CREATE TABLE IF NOT EXISTS `CustomerProfileDomainSchema`.`Country` (
  `CountryId` INT NOT NULL AUTO_INCREMENT,
  `ShortName` VARCHAR(35) NOT NULL,
  `Description` VARCHAR(256) NULL,
  `Code` VARCHAR(3) NOT NULL,
  PRIMARY KEY (`CountryId`),
  UNIQUE INDEX `Code_UNIQUE` (`Code` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CustomerProfileDomainSchema`.`CustomerProfile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CustomerProfileDomainSchema`.`CustomerProfile` ;

CREATE TABLE IF NOT EXISTS `CustomerProfileDomainSchema`.`CustomerProfile` (
  `PartyId` BIGINT(1000) NOT NULL AUTO_INCREMENT,
  `PartyNumber` VARCHAR(45) NULL,
  `PartyType` VARCHAR(4) NULL,
  `Name` VARCHAR(70) NULL,
  `FullLegalName` VARCHAR(256) NULL,
  `LegalStructure` VARCHAR(256) NULL,
  `BeneficialOwnership` TINYINT NULL,
  `AccountRole` VARCHAR(45) NULL,
  `EmailAddress` VARCHAR(256) NULL,
  `Phone` VARCHAR(12) NULL,
  PRIMARY KEY (`PartyId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CustomerProfileDomainSchema`.`Address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CustomerProfileDomainSchema`.`Address` ;

CREATE TABLE IF NOT EXISTS `CustomerProfileDomainSchema`.`Address` (
  `PartyId` BIGINT(1000) NOT NULL,
  `AddressType` VARCHAR(4) NULL,
  `AddressLine` VARCHAR(70) NULL,
  `StreetName` VARCHAR(70) NULL,
  `BuildingNumber` VARCHAR(16) NULL,
  `PostCode` VARCHAR(16) NULL,
  `TownName` VARCHAR(45) NULL,
  `CountrySubDivision` VARCHAR(45) NULL,
  `CountryId` INT NOT NULL,
  INDEX `Country_Address_FK_idx` (`CountryId` ASC) VISIBLE,
  CONSTRAINT `Country_Address_FK`
    FOREIGN KEY (`CountryId`)
    REFERENCES `CustomerProfileDomainSchema`.`Country` (`CountryId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;