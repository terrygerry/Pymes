create database semana02;
use semana02;
DROP TABLE IF EXISTS `tb_empleado`;
CREATE TABLE `tb_empleado` (
  `cod_emp` int(11) NOT NULL AUTO_INCREMENT,
  `nom_emp` varchar(30) DEFAULT NULL,
  `ape_emp` varchar(30) DEFAULT NULL,
  `sex_emp` varchar(15) DEFAULT NULL,
  `dni_emp` int(11) DEFAULT NULL,
  `car_emp` varchar(17) DEFAULT NULL,
  `fec_nac_emp` date DEFAULT NULL,
  `fec_reg_emp` date DEFAULT NULL,
  `cod_sucursal_emp` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_emp`)
) ENGINE=InnoDB AUTO_INCREMENT=21;

--
-- Dumping data for table `tb_empleado`
--

LOCK TABLES `tb_empleado` WRITE;
/*!40000 ALTER TABLE `tb_empleado` DISABLE KEYS */;
INSERT INTO `tb_empleado` VALUES (1,'Antonio','Salas Rivera','Mascilino',40770855,'Administrador','1980-08-16','2016-06-07',2);
UNLOCK TABLES;

DROP TABLE IF EXISTS `tb_sucursal`;
CREATE TABLE `tb_sucursal` (
  `cod_sucursal` int(11) NOT NULL AUTO_INCREMENT,
  `nom_sucursal` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cod_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=4;


LOCK TABLES `tb_sucursal` WRITE;
/*!40000 ALTER TABLE `tb_sucursal` DISABLE KEYS */;
INSERT INTO `tb_sucursal` VALUES (1,'Comas'),(2,'Independencia'),(3,'Los Olivos');
/*!40000 ALTER TABLE `tb_sucursal` ENABLE KEYS */;
UNLOCK TABLES;

