-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema futibaclub
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema futibaclub
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `futibaclub` DEFAULT CHARACTER SET utf8 ;
USE `futibaclub` ;

-- -----------------------------------------------------
-- Table `futibaclub`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `futibaclub`.`usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `nomeusuario` VARCHAR(245) NULL,
  `emailusuario` VARCHAR(245) NULL,
  `senhausuario` VARCHAR(245) NULL,
  `role` VARCHAR(45) NULL,
  PRIMARY KEY (`idusuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `futibaclub`.`grupo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `futibaclub`.`grupo` (
  `idgrupo` INT NOT NULL AUTO_INCREMENT,
  `nomegrupo` VARCHAR(245) NULL,
  PRIMARY KEY (`idgrupo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `futibaclub`.`grupo-usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `futibaclub`.`grupo-usuario` (
  `idgrupousuario` INT NOT NULL,
  `role` VARCHAR(45) NULL,
  `usuario_id` INT NOT NULL,
  `grupo_id` INT NOT NULL,
  PRIMARY KEY (`idgrupousuario`),
  INDEX `fk_grupo-usuario_usuario_idx` (`usuario_id` ASC),
  INDEX `fk_grupo-usuario_grupo1_idx` (`grupo_id` ASC),
  CONSTRAINT `fk_grupo-usuario_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `futibaclub`.`usuario` (`idusuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_grupo-usuario_grupo1`
    FOREIGN KEY (`grupo_id`)
    REFERENCES `futibaclub`.`grupo` (`idgrupo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `futibaclub`.`game`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `futibaclub`.`game` (
  `idgame` INT NOT NULL AUTO_INCREMENT,
  `timeA` VARCHAR(245) NULL,
  `timeB` VARCHAR(245) NULL,
  `resultadoA` INT NULL,
  `resultadoB` INT NULL,
  PRIMARY KEY (`idgame`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `futibaclub`.`palpite`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `futibaclub`.`palpite` (
  `idpalpite` INT NOT NULL AUTO_INCREMENT,
  `resultadoA` INT NULL,
  `resultadoB` INT NULL,
  `usuario_id` INT NOT NULL,
  `grupo_id` INT NOT NULL,
  `game_id` INT NOT NULL,
  PRIMARY KEY (`idpalpite`),
  INDEX `fk_palpite_usuario1_idx` (`usuario_id` ASC),
  INDEX `fk_palpite_grupo1_idx` (`grupo_id` ASC),
  INDEX `fk_palpite_game1_idx` (`game_id` ASC),
  CONSTRAINT `fk_palpite_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `futibaclub`.`usuario` (`idusuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_palpite_grupo1`
    FOREIGN KEY (`grupo_id`)
    REFERENCES `futibaclub`.`grupo` (`idgrupo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_palpite_game1`
    FOREIGN KEY (`game_id`)
    REFERENCES `futibaclub`.`game` (`idgame`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `futibaclub`.`comentario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `futibaclub`.`comentario` (
  `idcomentario` INT NOT NULL AUTO_INCREMENT,
  `comentario` TEXT NULL,
  `palpite_id` INT NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`idcomentario`),
  INDEX `fk_comentario_palpite1_idx` (`palpite_id` ASC),
  INDEX `fk_comentario_usuario1_idx` (`usuario_id` ASC),
  CONSTRAINT `fk_comentario_palpite1`
    FOREIGN KEY (`palpite_id`)
    REFERENCES `futibaclub`.`palpite` (`idpalpite`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comentario_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `futibaclub`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '			';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
