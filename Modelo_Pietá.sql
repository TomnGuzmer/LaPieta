-- MySQL Script generated by MySQL Workbench
-- Tue Sep 17 14:55:48 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LaPietá
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `LaPietá` ;

-- -----------------------------------------------------
-- Schema LaPietá
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LaPietá` DEFAULT CHARACTER SET utf8 ;
USE `LaPietá` ;

-- -----------------------------------------------------
-- Table `LaPietá`.`Categorias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LaPietá`.`Categorias` ;

CREATE TABLE IF NOT EXISTS `LaPietá`.`Categorias` (
  `idCategoria` INT NOT NULL AUTO_INCREMENT,
  `NombreCat` VARCHAR(45) NOT NULL,
  `DescripcionCat` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`idCategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LaPietá`.`Ciudad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LaPietá`.`Ciudad` ;

CREATE TABLE IF NOT EXISTS `LaPietá`.`Ciudad` (
  `idCiudad` INT NOT NULL AUTO_INCREMENT,
  `NombreC` VARCHAR(45) NOT NULL,
  `Departamento_idDepartamento` INT NOT NULL,
  PRIMARY KEY (`idCiudad`),
  INDEX `fk_Ciudad_Departamento_idx` (`Departamento_idDepartamento` ASC) VISIBLE,
  CONSTRAINT `fk_Ciudad_Departamento`
    FOREIGN KEY (`Departamento_idDepartamento`)
    REFERENCES `LaPietá`.`Departamentos` (`idDepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LaPietá`.`Clientes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LaPietá`.`Clientes` ;

CREATE TABLE IF NOT EXISTS `LaPietá`.`Clientes` (
  `idClientes` INT NOT NULL AUTO_INCREMENT,
  `NombresC` VARCHAR(50) NOT NULL,
  `Apellido1C` VARCHAR(30) NOT NULL,
  `Apellido2C` VARCHAR(30) NOT NULL,
  `TelefonoC` INT NOT NULL,
  `EmailC` VARCHAR(50) NOT NULL,
  `DireccionC` VARCHAR(45) NOT NULL,
  `PasswordC` VARCHAR(45) NOT NULL,
  `ImagenC` VARCHAR(45) NOT NULL,
  `Ciudad_idCiudad` INT NOT NULL,
  PRIMARY KEY (`idClientes`),
  INDEX `fk_Clientes_Ciudad1_idx` (`Ciudad_idCiudad` ASC) VISIBLE,
  CONSTRAINT `fk_Clientes_Ciudad1`
    FOREIGN KEY (`Ciudad_idCiudad`)
    REFERENCES `LaPietá`.`Ciudad` (`idCiudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LaPietá`.`Departamentos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LaPietá`.`Departamentos` ;

CREATE TABLE IF NOT EXISTS `LaPietá`.`Departamentos` (
  `idDepartamento` INT NOT NULL AUTO_INCREMENT,
  `NombreD` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDepartamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LaPietá`.`Descuentos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LaPietá`.`Descuentos` ;

CREATE TABLE IF NOT EXISTS `LaPietá`.`Descuentos` (
  `idDescuentos` INT NOT NULL AUTO_INCREMENT,
  `DescripcionD` VARCHAR(500) NOT NULL,
  `PorcentajeD` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDescuentos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LaPietá`.`Disenos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LaPietá`.`Disenos` ;

CREATE TABLE IF NOT EXISTS `LaPietá`.`Disenos` (
  `idDiseños` INT NOT NULL AUTO_INCREMENT,
  `TamanoD` DECIMAL(6,2) NOT NULL,
  `Formato` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idDiseños`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LaPietá`.`Empleados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LaPietá`.`Empleados` ;

CREATE TABLE IF NOT EXISTS `LaPietá`.`Empleados` (
  `idEmpleados` INT NOT NULL AUTO_INCREMENT,
  `NombresE` VARCHAR(45) NOT NULL,
  `Apellido1E` VARCHAR(45) NOT NULL,
  `Apellido2E` VARCHAR(45) NOT NULL,
  `TelefonoE` INT NOT NULL,
  `EmailE` VARCHAR(45) NOT NULL,
  `PasswordE` VARCHAR(45) NOT NULL,
  `DireccionE` VARCHAR(45) NOT NULL,
  `ImagenE` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEmpleados`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LaPietá`.`Facturas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LaPietá`.`Facturas` ;

CREATE TABLE IF NOT EXISTS `LaPietá`.`Facturas` (
  `idFacturas` INT NOT NULL AUTO_INCREMENT,
  `NumeroF` INT NOT NULL,
  `TipoPagoF` VARCHAR(45) NOT NULL,
  `FechaExpedicionF` DATETIME NOT NULL,
  `TotalF` DECIMAL(12,2) NOT NULL,
  `TotalLetrasF` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`idFacturas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LaPietá`.`Productos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LaPietá`.`Productos` ;

CREATE TABLE IF NOT EXISTS `LaPietá`.`Productos` (
  `idProductos` INT NOT NULL AUTO_INCREMENT,
  `NombreP` VARCHAR(45) NOT NULL,
  `Codigo` VARCHAR(45) NOT NULL,
  `DescripcionP` TEXT(500) NOT NULL,
  `ImagenP` VARCHAR(90) NOT NULL,
  `PrecioP` DECIMAL(6,2) NOT NULL,
  `Proovedor_idProovedor` INT NOT NULL,
  `Categoria_idCategoria` INT NOT NULL,
  `Descuentos_idDescuentos` INT NOT NULL,
  PRIMARY KEY (`idProductos`),
  INDEX `fk_Productos_Proovedor1_idx` (`Proovedor_idProovedor` ASC) VISIBLE,
  INDEX `fk_Productos_Categoria1_idx` (`Categoria_idCategoria` ASC) VISIBLE,
  INDEX `fk_Productos_Descuentos1_idx` (`Descuentos_idDescuentos` ASC) VISIBLE,
  CONSTRAINT `fk_Productos_Proovedor1`
    FOREIGN KEY (`Proovedor_idProovedor`)
    REFERENCES `LaPietá`.`Proovedores` (`idProovedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Productos_Categoria1`
    FOREIGN KEY (`Categoria_idCategoria`)
    REFERENCES `LaPietá`.`Categorias` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Productos_Descuentos1`
    FOREIGN KEY (`Descuentos_idDescuentos`)
    REFERENCES `LaPietá`.`Descuentos` (`idDescuentos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LaPietá`.`Proovedores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LaPietá`.`Proovedores` ;

CREATE TABLE IF NOT EXISTS `LaPietá`.`Proovedores` (
  `idProovedor` INT NOT NULL AUTO_INCREMENT,
  `NombreP` VARCHAR(45) NOT NULL,
  `Apellido1P` VARCHAR(45) NOT NULL,
  `Apellido2P` VARCHAR(45) NOT NULL,
  `TelefonoP` INT NOT NULL,
  `EmailP` VARCHAR(45) NOT NULL,
  `DireccionP` VARCHAR(45) NOT NULL,
  `WebP` VARCHAR(45) NOT NULL,
  `ImagenP` VARCHAR(45) NOT NULL,
  `Ciudad_idCiudad` INT NOT NULL,
  PRIMARY KEY (`idProovedor`),
  INDEX `fk_Proovedor_Ciudad1_idx` (`Ciudad_idCiudad` ASC) VISIBLE,
  CONSTRAINT `fk_Proovedor_Ciudad1`
    FOREIGN KEY (`Ciudad_idCiudad`)
    REFERENCES `LaPietá`.`Ciudad` (`idCiudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LaPietá`.`Realiza`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LaPietá`.`Realiza` ;

CREATE TABLE IF NOT EXISTS `LaPietá`.`Realiza` (
  `Productos_idProductos` INT NOT NULL,
  `Empleados_idEmpleados` INT NOT NULL,
  PRIMARY KEY (`Productos_idProductos`, `Empleados_idEmpleados`),
  INDEX `fk_Productos_has_Empleados_Empleados1_idx` (`Empleados_idEmpleados` ASC) VISIBLE,
  INDEX `fk_Productos_has_Empleados_Productos1_idx` (`Productos_idProductos` ASC) VISIBLE,
  CONSTRAINT `fk_Productos_has_Empleados_Productos1`
    FOREIGN KEY (`Productos_idProductos`)
    REFERENCES `LaPietá`.`Productos` (`idProductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Productos_has_Empleados_Empleados1`
    FOREIGN KEY (`Empleados_idEmpleados`)
    REFERENCES `LaPietá`.`Empleados` (`idEmpleados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LaPietá`.`Solicita`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LaPietá`.`Solicita` ;

CREATE TABLE IF NOT EXISTS `LaPietá`.`Solicita` (
  `Clientes_idClientes` INT NOT NULL,
  `Productos_idProductos` INT NOT NULL,
  `Facturas_idFacturas` INT NOT NULL,
  PRIMARY KEY (`Productos_idProductos`, `Facturas_idFacturas`),
  INDEX `fk_Productos_has_Facturas_Facturas1_idx` (`Facturas_idFacturas` ASC) VISIBLE,
  INDEX `fk_Productos_has_Facturas_Productos1_idx` (`Productos_idProductos` ASC) VISIBLE,
  INDEX `fk_Productos_has_Facturas_Clientes1_idx` (`Clientes_idClientes` ASC) VISIBLE,
  CONSTRAINT `fk_Productos_has_Facturas_Productos1`
    FOREIGN KEY (`Productos_idProductos`)
    REFERENCES `LaPietá`.`Productos` (`idProductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Productos_has_Facturas_Facturas1`
    FOREIGN KEY (`Facturas_idFacturas`)
    REFERENCES `LaPietá`.`Facturas` (`idFacturas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Productos_has_Facturas_Clientes1`
    FOREIGN KEY (`Clientes_idClientes`)
    REFERENCES `LaPietá`.`Clientes` (`idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LaPietá`.`Tiene`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LaPietá`.`Tiene` ;

CREATE TABLE IF NOT EXISTS `LaPietá`.`Tiene` (
  `Disenos_idDiseños` INT NOT NULL,
  `Productos_idProductos` INT NOT NULL,
  PRIMARY KEY (`Disenos_idDiseños`, `Productos_idProductos`),
  INDEX `fk_Disenos_has_Productos_Productos1_idx` (`Productos_idProductos` ASC) VISIBLE,
  INDEX `fk_Disenos_has_Productos_Disenos1_idx` (`Disenos_idDiseños` ASC) VISIBLE,
  CONSTRAINT `fk_Disenos_has_Productos_Disenos1`
    FOREIGN KEY (`Disenos_idDiseños`)
    REFERENCES `LaPietá`.`Disenos` (`idDiseños`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Disenos_has_Productos_Productos1`
    FOREIGN KEY (`Productos_idProductos`)
    REFERENCES `LaPietá`.`Productos` (`idProductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
