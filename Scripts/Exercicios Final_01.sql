-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`endereco` (
  `idendereco` INT NOT NULL AUTO_INCREMENT,
  `logradouro` VARCHAR(45) NULL,
  `cidade` VARCHAR(45) NULL,
  `pais` VARCHAR(45) NULL,
  `cep` VARCHAR(10) NULL,
  PRIMARY KEY (`idendereco`),
  UNIQUE INDEX `logradouro_UNIQUE` (`logradouro` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL DEFAULT 'NOME',
  `dt_nasc` DATE NULL,
  `endereco_idendereco` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cliente_endereco1_idx` (`endereco_idendereco` ASC) VISIBLE,
  INDEX `index_nome` (`nome` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_endereco1`
    FOREIGN KEY (`endereco_idendereco`)
    REFERENCES `mydb`.`endereco` (`idendereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`modelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`modelo` (
  `cod_modelo` INT NOT NULL AUTO_INCREMENT,
  `modelo` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `ano_fab` CHAR(4) NOT NULL,
  PRIMARY KEY (`cod_modelo`),
  UNIQUE INDEX `modelo_UNIQUE` (`modelo` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`veiculo` (
  `placa` VARCHAR(8) NOT NULL,
  `cor` VARCHAR(20) NOT NULL DEFAULT 'DEFAULT',
  `cliente_id` INT NOT NULL,
  `modelo_cod_modelo` INT NOT NULL,
  PRIMARY KEY (`placa`),
  INDEX `fk_veiculo_cliente_idx` (`cliente_id` ASC) VISIBLE,
  INDEX `fk_veiculo_modelo1_idx` (`modelo_cod_modelo` ASC) VISIBLE,
  INDEX `index_placa` (`placa` ASC) VISIBLE,
  CONSTRAINT `fk_veiculo_cliente`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `mydb`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_veiculo_modelo1`
    FOREIGN KEY (`modelo_cod_modelo`)
    REFERENCES `mydb`.`modelo` (`cod_modelo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`patio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`patio` (
  `num` INT NOT NULL AUTO_INCREMENT,
  `capacidade` INT NOT NULL,
  `endereco_idendereco` INT NOT NULL,
  PRIMARY KEY (`num`),
  INDEX `fk_patio_endereco1_idx` (`endereco_idendereco` ASC) VISIBLE,
  CONSTRAINT `fk_patio_endereco1`
    FOREIGN KEY (`endereco_idendereco`)
    REFERENCES `mydb`.`endereco` (`idendereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`estaciona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`estaciona` (
  `cod` INT NOT NULL AUTO_INCREMENT,
  `data_entrada` DATE NOT NULL,
  `data_saida` DATE NULL DEFAULT 31/12/2022,
  `hora_entrada` TIME NOT NULL,
  `hora_saida` TIME NULL DEFAULT 00:00,
  `veiculo_placa` VARCHAR(8) NOT NULL,
  `patio_num` INT NOT NULL,
  PRIMARY KEY (`cod`),
  INDEX `fk_estaciona_veiculo1_idx` (`veiculo_placa` ASC) VISIBLE,
  INDEX `fk_estaciona_patio1_idx` (`patio_num` ASC) VISIBLE,
  CONSTRAINT `fk_estaciona_veiculo1`
    FOREIGN KEY (`veiculo_placa`)
    REFERENCES `mydb`.`veiculo` (`placa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_estaciona_patio1`
    FOREIGN KEY (`patio_num`)
    REFERENCES `mydb`.`patio` (`num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
