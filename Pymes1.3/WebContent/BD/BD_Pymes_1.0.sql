-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema proyectointegrador
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `proyectointegrador` ;

-- -----------------------------------------------------
-- Schema proyectointegrador
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `proyectointegrador` DEFAULT CHARACTER SET utf8 ;
USE `proyectointegrador` ;

-- -----------------------------------------------------
-- Table `proyectointegrador`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectointegrador`.`proveedor` (
  `idproveedor` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idproveedor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectointegrador`.`tipo_activo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectointegrador`.`tipo_activo` (
  `idTipo_Activo` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idTipo_Activo`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectointegrador`.`activo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectointegrador`.`activo` (
  `idactivo` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `centroCosto` INT(11) NULL DEFAULT NULL,
  `grupo` INT(11) NULL DEFAULT NULL,
  `ubicacion` INT(11) NULL DEFAULT NULL,
  `responsable` INT(11) NULL DEFAULT NULL,
  `idproveedor` INT(11) NULL DEFAULT NULL,
  `marca` VARCHAR(50) NULL DEFAULT NULL,
  `modelo` VARCHAR(50) NULL DEFAULT NULL,
  `serie` VARCHAR(45) NULL DEFAULT NULL,
  `placa` VARCHAR(45) NULL DEFAULT NULL,
  `codigoBarra` VARCHAR(45) NULL DEFAULT NULL,
  `fechaCompra` VARCHAR(45) NULL DEFAULT NULL,
  `valorComprar` INT(11) NULL DEFAULT NULL,
  `garantia` VARCHAR(45) NULL DEFAULT NULL,
  `venceGarantia` VARCHAR(45) NULL DEFAULT NULL,
  `vidaUtil` VARCHAR(45) NULL DEFAULT NULL,
  `polizanro` VARCHAR(45) NULL DEFAULT NULL,
  `fecha` VARCHAR(45) NULL DEFAULT NULL,
  `vencePoliza` VARCHAR(45) NULL DEFAULT NULL,
  `aseguradora` VARCHAR(45) NULL DEFAULT NULL,
  `agente` VARCHAR(45) NULL DEFAULT NULL,
  `valorAsegurado` INT(11) NULL DEFAULT NULL,
  `primaAnual` INT(11) NULL DEFAULT NULL,
  `primaMensual` INT(11) NULL DEFAULT NULL,
  `deducible` INT(11) NULL DEFAULT NULL,
  `telefonoAgente` VARCHAR(45) NULL DEFAULT NULL,
  `deptSolic` VARCHAR(45) NULL DEFAULT NULL,
  `nombSolic` VARCHAR(45) NULL DEFAULT NULL,
  `destino` VARCHAR(45) NULL DEFAULT NULL,
  `fechaSalida` VARCHAR(50) NULL DEFAULT NULL,
  `condiciones` VARCHAR(45) NULL DEFAULT NULL,
  `observacion` VARCHAR(45) NULL DEFAULT NULL,
  `idTipo_Activo` INT(11) NOT NULL,
  PRIMARY KEY (`idactivo`),
  INDEX `fk_idproveedor_idx` (`idproveedor` ASC),
  INDEX `fk_activo_Tipo_Activo1_idx` (`idTipo_Activo` ASC),
  CONSTRAINT `fk_idproveedor`
    FOREIGN KEY (`idproveedor`)
    REFERENCES `proyectointegrador`.`proveedor` (`idproveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tipo_Activo`
    FOREIGN KEY (`idTipo_Activo`)
    REFERENCES `proyectointegrador`.`tipo_activo` (`idTipo_Activo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectointegrador`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectointegrador`.`usuario` (
  `idusuario` INT(11) NOT NULL,
  `nombres` VARCHAR(45) NULL DEFAULT NULL,
  `apellidos` VARCHAR(45) NULL DEFAULT NULL,
  `login` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  `correo` VARCHAR(45) NULL DEFAULT NULL,
  `dni` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idusuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectointegrador`.`inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectointegrador`.`inventario` (
  `idinventario` INT(11) NOT NULL,
  `descripcion` VARCHAR(45) NULL DEFAULT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `idusuario` INT(11) NOT NULL,
  `idactivo` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idinventario`),
  INDEX `fk_inventario_usuario_idx` (`idusuario` ASC),
  INDEX `fk_idactivo_idx` (`idactivo` ASC),
  CONSTRAINT `fk_idactivo`
    FOREIGN KEY (`idactivo`)
    REFERENCES `proyectointegrador`.`activo` (`idactivo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventario_usuario`
    FOREIGN KEY (`idusuario`)
    REFERENCES `proyectointegrador`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectointegrador`.`activo_has_inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectointegrador`.`activo_has_inventario` (
  `idactivo` INT(11) NOT NULL,
  `idinventario` INT(11) NOT NULL,
  PRIMARY KEY (`idactivo`, `idinventario`),
  INDEX `fk_activo_has_inventario_inventario1_idx` (`idinventario` ASC),
  INDEX `fk_activo_has_inventario_activo1_idx` (`idactivo` ASC),
  CONSTRAINT `fk_activo_has_inventario_activo1`
    FOREIGN KEY (`idactivo`)
    REFERENCES `proyectointegrador`.`activo` (`idactivo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_activo_has_inventario_inventario1`
    FOREIGN KEY (`idinventario`)
    REFERENCES `proyectointegrador`.`inventario` (`idinventario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectointegrador`.`activoheviculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectointegrador`.`activoheviculo` (
  `idActivoHeviculo` INT(11) NOT NULL,
  `serie` VARCHAR(45) NULL DEFAULT NULL,
  `activo_idactivo` INT(11) NOT NULL,
  PRIMARY KEY (`idActivoHeviculo`),
  INDEX `fk_ActivoHeviculo_activo1_idx` (`activo_idactivo` ASC),
  CONSTRAINT `fk_ActivoHeviculo_activo1`
    FOREIGN KEY (`activo_idactivo`)
    REFERENCES `proyectointegrador`.`activo` (`idactivo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectointegrador`.`correcion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectointegrador`.`correcion` (
  `idcorrecion` INT(11) NOT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `idusuario` INT(11) NOT NULL,
  `idactivo` INT(11) NOT NULL,
  PRIMARY KEY (`idcorrecion`),
  INDEX `fk_correcion_usuario1_idx` (`idusuario` ASC),
  INDEX `fk_correcion_activo1_idx` (`idactivo` ASC),
  CONSTRAINT `fk_correcion_activo1`
    FOREIGN KEY (`idactivo`)
    REFERENCES `proyectointegrador`.`activo` (`idactivo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_correcion_usuario1`
    FOREIGN KEY (`idusuario`)
    REFERENCES `proyectointegrador`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectointegrador`.`enlace`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectointegrador`.`enlace` (
  `idenlace` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NULL DEFAULT NULL,
  `ruta` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idenlace`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectointegrador`.`entrada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectointegrador`.`entrada` (
  `identrada` INT(11) NOT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `usuario_idusuario` INT(11) NOT NULL,
  PRIMARY KEY (`identrada`),
  INDEX `fk_entrada_usuario1_idx` (`usuario_idusuario` ASC),
  CONSTRAINT `fk_entrada_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `proyectointegrador`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectointegrador`.`entrada_has_activo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectointegrador`.`entrada_has_activo` (
  `entrada_identrada` INT(11) NOT NULL,
  `activo_idactivo` INT(11) NOT NULL,
  `nombSolic` VARCHAR(45) NULL DEFAULT NULL,
  `deptSolic` VARCHAR(45) NULL DEFAULT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `cantidad` INT(11) NULL DEFAULT NULL,
  `descripcion` VARCHAR(45) NULL DEFAULT NULL,
  `codigo` VARCHAR(45) NULL DEFAULT NULL,
  `serie` VARCHAR(45) NULL DEFAULT NULL,
  `motivoEntrada` VARCHAR(45) NULL DEFAULT NULL,
  `nroFicha` VARCHAR(10) NULL DEFAULT NULL,
  `observacion` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`entrada_identrada`, `activo_idactivo`),
  INDEX `fk_entrada_has_activo_activo1_idx` (`activo_idactivo` ASC),
  INDEX `fk_entrada_has_activo_entrada1_idx` (`entrada_identrada` ASC),
  CONSTRAINT `fk_entrada_has_activo_activo1`
    FOREIGN KEY (`activo_idactivo`)
    REFERENCES `proyectointegrador`.`activo` (`idactivo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_entrada_has_activo_entrada1`
    FOREIGN KEY (`entrada_identrada`)
    REFERENCES `proyectointegrador`.`entrada` (`identrada`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectointegrador`.`historial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectointegrador`.`historial` (
  `idhistorial` INT(11) NOT NULL,
  `numero` VARCHAR(45) NULL DEFAULT NULL,
  `estado` VARCHAR(45) NULL DEFAULT NULL,
  `correcion_idcorrecion` INT(11) NOT NULL,
  PRIMARY KEY (`idhistorial`),
  INDEX `fk_historial_correcion1_idx` (`correcion_idcorrecion` ASC),
  CONSTRAINT `fk_historial_correcion1`
    FOREIGN KEY (`correcion_idcorrecion`)
    REFERENCES `proyectointegrador`.`correcion` (`idcorrecion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectointegrador`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectointegrador`.`rol` (
  `idrol` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idrol`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectointegrador`.`rol_enlace`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectointegrador`.`rol_enlace` (
  `idrol` INT(11) NOT NULL,
  `idenlace` INT(11) NOT NULL,
  PRIMARY KEY (`idrol`, `idenlace`),
  INDEX `fk_rol_has_enlace_enlace1_idx` (`idenlace` ASC),
  INDEX `fk_rol_has_enlace_rol1_idx` (`idrol` ASC),
  CONSTRAINT `fk_rol_has_enlace_enlace1`
    FOREIGN KEY (`idenlace`)
    REFERENCES `proyectointegrador`.`enlace` (`idenlace`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rol_has_enlace_rol1`
    FOREIGN KEY (`idrol`)
    REFERENCES `proyectointegrador`.`rol` (`idrol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectointegrador`.`salida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectointegrador`.`salida` (
  `idsalida` INT(11) NOT NULL,
  `fechaSalida` DATE NULL DEFAULT NULL,
  `usuario_idusuario` INT(11) NOT NULL,
  PRIMARY KEY (`idsalida`),
  INDEX `fk_salida_usuario1_idx` (`usuario_idusuario` ASC),
  CONSTRAINT `fk_salida_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `proyectointegrador`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectointegrador`.`salida_has_activo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectointegrador`.`salida_has_activo` (
  `salida_idsalida` INT(11) NOT NULL,
  `activo_idactivo` INT(11) NOT NULL,
  `nombSolic` VARCHAR(45) NULL DEFAULT NULL,
  `deptSolic` VARCHAR(45) NULL DEFAULT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `cantidad` INT(11) NULL DEFAULT NULL,
  `descripcion` VARCHAR(45) NULL DEFAULT NULL,
  `codigo` VARCHAR(45) NULL DEFAULT NULL,
  `serie` VARCHAR(45) NULL DEFAULT NULL,
  `motivoSalida` VARCHAR(45) NULL DEFAULT NULL,
  `nroficha` VARCHAR(10) NULL DEFAULT NULL,
  `observacion` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`salida_idsalida`, `activo_idactivo`),
  INDEX `fk_salida_has_activo_activo1_idx` (`activo_idactivo` ASC),
  INDEX `fk_salida_has_activo_salida1_idx` (`salida_idsalida` ASC),
  CONSTRAINT `fk_salida_has_activo_activo1`
    FOREIGN KEY (`activo_idactivo`)
    REFERENCES `proyectointegrador`.`activo` (`idactivo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_salida_has_activo_salida1`
    FOREIGN KEY (`salida_idsalida`)
    REFERENCES `proyectointegrador`.`salida` (`idsalida`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectointegrador`.`usuario_rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectointegrador`.`usuario_rol` (
  `idusuario` INT(11) NOT NULL,
  `idrol` INT(11) NOT NULL,
  PRIMARY KEY (`idusuario`, `idrol`),
  INDEX `fk_usuario_has_rol_rol1_idx` (`idrol` ASC),
  INDEX `fk_usuario_has_rol_usuario1_idx` (`idusuario` ASC),
  CONSTRAINT `fk_usuario_has_rol_rol1`
    FOREIGN KEY (`idrol`)
    REFERENCES `proyectointegrador`.`rol` (`idrol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_rol_usuario1`
    FOREIGN KEY (`idusuario`)
    REFERENCES `proyectointegrador`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
