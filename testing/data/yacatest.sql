-- MySQL dump 10.16  Distrib 10.2.9-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: yacatest
-- ------------------------------------------------------
-- Server version	10.2.9-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Administracion_Feriado`
--

DROP TABLE IF EXISTS `Administracion_Feriado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Administracion_Feriado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` smallint(6) NOT NULL,
  `Fecha` date NOT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Administracion_Feriado`
--

LOCK TABLES `Administracion_Feriado` WRITE;
/*!40000 ALTER TABLE `Administracion_Feriado` DISABLE KEYS */;
/*!40000 ALTER TABLE `Administracion_Feriado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Administracion_Seguimiento`
--

DROP TABLE IF EXISTS `Administracion_Seguimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Administracion_Seguimiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `EntidadClase` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EntidadId` int(11) NOT NULL,
  `Automatico` tinyint(1) NOT NULL,
  `TipoEvento` int(11) NOT NULL,
  `EnvioExterno` tinyint(1) NOT NULL,
  `Privada` int(11) NOT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `PersonaEnvia_id` int(11) DEFAULT NULL,
  `PersonaRecibe_id` int(11) DEFAULT NULL,
  `DepartamentoDestino_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_33DB0C7D7665D315` (`PersonaEnvia_id`),
  KEY `IDX_33DB0C7D1825CE09` (`PersonaRecibe_id`),
  KEY `IDX_33DB0C7D1931095` (`DepartamentoDestino_id`),
  CONSTRAINT `FK_33DB0C7D1825CE09` FOREIGN KEY (`PersonaRecibe_id`) REFERENCES `Base_Persona` (`id`),
  CONSTRAINT `FK_33DB0C7D1931095` FOREIGN KEY (`DepartamentoDestino_id`) REFERENCES `Organizacion_Departamento` (`id`),
  CONSTRAINT `FK_33DB0C7D7665D315` FOREIGN KEY (`PersonaEnvia_id`) REFERENCES `Base_Persona` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Administracion_Seguimiento`
--

LOCK TABLES `Administracion_Seguimiento` WRITE;
/*!40000 ALTER TABLE `Administracion_Seguimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Administracion_Seguimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Administracion_SeguimientoParam`
--

DROP TABLE IF EXISTS `Administracion_SeguimientoParam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Administracion_SeguimientoParam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `EntidadClase` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `DepartamentoInicial_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5B1877AAA9DFB264` (`DepartamentoInicial_id`),
  CONSTRAINT `FK_5B1877AAA9DFB264` FOREIGN KEY (`DepartamentoInicial_id`) REFERENCES `Organizacion_Departamento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Administracion_SeguimientoParam`
--

LOCK TABLES `Administracion_SeguimientoParam` WRITE;
/*!40000 ALTER TABLE `Administracion_SeguimientoParam` DISABLE KEYS */;
/*!40000 ALTER TABLE `Administracion_SeguimientoParam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Administracion_SeguimientoParam_Departamento`
--

DROP TABLE IF EXISTS `Administracion_SeguimientoParam_Departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Administracion_SeguimientoParam_Departamento` (
  `seguimientoparam_id` int(11) NOT NULL,
  `departamento_id` int(11) NOT NULL,
  PRIMARY KEY (`seguimientoparam_id`,`departamento_id`),
  KEY `IDX_2ED616348FAAA5FE` (`seguimientoparam_id`),
  KEY `IDX_2ED616345A91C08D` (`departamento_id`),
  CONSTRAINT `FK_2ED616345A91C08D` FOREIGN KEY (`departamento_id`) REFERENCES `Organizacion_Departamento` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_2ED616348FAAA5FE` FOREIGN KEY (`seguimientoparam_id`) REFERENCES `Administracion_SeguimientoParam` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Administracion_SeguimientoParam_Departamento`
--

LOCK TABLES `Administracion_SeguimientoParam_Departamento` WRITE;
/*!40000 ALTER TABLE `Administracion_SeguimientoParam_Departamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Administracion_SeguimientoParam_Departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Administracion_UnidadFiscalPrecio`
--

DROP TABLE IF EXISTS `Administracion_UnidadFiscalPrecio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Administracion_UnidadFiscalPrecio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Periodo` int(11) NOT NULL,
  `Precio` decimal(6,2) NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Administracion_UnidadFiscalPrecio_Periodo` (`Periodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Administracion_UnidadFiscalPrecio`
--

LOCK TABLES `Administracion_UnidadFiscalPrecio` WRITE;
/*!40000 ALTER TABLE `Administracion_UnidadFiscalPrecio` DISABLE KEYS */;
/*!40000 ALTER TABLE `Administracion_UnidadFiscalPrecio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Base_Adjunto`
--

DROP TABLE IF EXISTS `Base_Adjunto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Base_Adjunto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `EntidadTipo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EntidadId` int(11) NOT NULL,
  `Carpeta` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TipoMime` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Tamano` int(11) NOT NULL,
  `Token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Optimizado` tinyint(1) NOT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `Suprimido` tinyint(1) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Persona_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9B369730BAA58E69` (`Persona_id`),
  CONSTRAINT `FK_9B369730BAA58E69` FOREIGN KEY (`Persona_id`) REFERENCES `Base_Persona` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Base_Adjunto`
--

LOCK TABLES `Base_Adjunto` WRITE;
/*!40000 ALTER TABLE `Base_Adjunto` DISABLE KEYS */;
/*!40000 ALTER TABLE `Base_Adjunto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Base_Auditoria`
--

DROP TABLE IF EXISTS `Base_Auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Base_Auditoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime NOT NULL,
  `Estacion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Accion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ElementoTipo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ElementoId` int(11) DEFAULT NULL,
  `Cambios` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_53F2DF6B9465404E` (`Usuario_id`),
  KEY `Base_Auditoria_ElementoTipo` (`ElementoTipo`),
  CONSTRAINT `FK_53F2DF6B9465404E` FOREIGN KEY (`Usuario_id`) REFERENCES `Base_Persona` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8545 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Base_Auditoria`
--

LOCK TABLES `Base_Auditoria` WRITE;
/*!40000 ALTER TABLE `Base_Auditoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `Base_Auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Base_Banco`
--

DROP TABLE IF EXISTS `Base_Banco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Base_Banco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Base_Banco`
--

LOCK TABLES `Base_Banco` WRITE;
/*!40000 ALTER TABLE `Base_Banco` DISABLE KEYS */;
/*!40000 ALTER TABLE `Base_Banco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Base_Comentario`
--

DROP TABLE IF EXISTS `Base_Comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Base_Comentario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `EntidadTipo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EntidadId` int(11) NOT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Persona_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1FB30940BAA58E69` (`Persona_id`),
  CONSTRAINT `FK_1FB30940BAA58E69` FOREIGN KEY (`Persona_id`) REFERENCES `Base_Persona` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Base_Comentario`
--

LOCK TABLES `Base_Comentario` WRITE;
/*!40000 ALTER TABLE `Base_Comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `Base_Comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Base_Cupon`
--

DROP TABLE IF EXISTS `Base_Cupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Base_Cupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Numero` int(11) NOT NULL,
  `Confirmado` int(11) NOT NULL,
  `Token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `Suprimido` tinyint(1) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Base_Cupon`
--

LOCK TABLES `Base_Cupon` WRITE;
/*!40000 ALTER TABLE `Base_Cupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `Base_Cupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Base_CuponConfirmacion`
--

DROP TABLE IF EXISTS `Base_CuponConfirmacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Base_CuponConfirmacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Numero` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Confirmado` int(11) NOT NULL,
  `Token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `Suprimido` tinyint(1) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `EsWeb` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Base_CuponConfirmacion`
--

LOCK TABLES `Base_CuponConfirmacion` WRITE;
/*!40000 ALTER TABLE `Base_CuponConfirmacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Base_CuponConfirmacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Base_Impresion`
--

DROP TABLE IF EXISTS `Base_Impresion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Base_Impresion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `EntidadTipo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EntidadId` int(11) NOT NULL,
  `EntidadVersion` int(11) DEFAULT NULL,
  `TipoMime` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Contenido` longblob NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `Suprimido` tinyint(1) NOT NULL,
  `ImportSrc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ImportId` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ImportedAt` datetime DEFAULT NULL,
  `imagen` longblob DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Base_Impresion`
--

LOCK TABLES `Base_Impresion` WRITE;
/*!40000 ALTER TABLE `Base_Impresion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Base_Impresion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Base_Localidad`
--

DROP TABLE IF EXISTS `Base_Localidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Base_Localidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CodigoIfam` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `Url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Ubicacion` point DEFAULT NULL COMMENT '(DC2Type:point)',
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Pais_id` int(11) NOT NULL,
  `Provincia_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B3D18BE69B9EC5A` (`Pais_id`),
  KEY `IDX_B3D18BE65640FA57` (`Provincia_id`),
  CONSTRAINT `FK_B3D18BE65640FA57` FOREIGN KEY (`Provincia_id`) REFERENCES `Base_Provincia` (`id`),
  CONSTRAINT `FK_B3D18BE69B9EC5A` FOREIGN KEY (`Pais_id`) REFERENCES `Base_Pais` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Base_Localidad`
--

LOCK TABLES `Base_Localidad` WRITE;
/*!40000 ALTER TABLE `Base_Localidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `Base_Localidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Base_Pais`
--

DROP TABLE IF EXISTS `Base_Pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Base_Pais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `IsoAlfa2` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `Cctld` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `GentiliciosMasculinos` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `GentiliciosFemeninos` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MonedaIso` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `NombreOficial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NombreIngles` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NombreOficialIngles` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Base_Pais`
--

LOCK TABLES `Base_Pais` WRITE;
/*!40000 ALTER TABLE `Base_Pais` DISABLE KEYS */;
/*!40000 ALTER TABLE `Base_Pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Base_Persona`
--

DROP TABLE IF EXISTS `Base_Persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Base_Persona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Apellido` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NombreVisible` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Username` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PasswordEnc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `RazonSocial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DocumentoTipo` int(11) NOT NULL,
  `DocumentoNumero` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Cuilt` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TelefonoNumero` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TelefonoVerificacionNivel` int(11) NOT NULL,
  `Email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EmailVerificacionNivel` int(11) NOT NULL,
  `SituacionTributaria` int(11) DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `Genero` int(11) NOT NULL,
  `EstadoCivil` int(11) NOT NULL,
  `Tg06100Id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AgenteId` int(11) DEFAULT NULL,
  `Nib` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `Suprimido` tinyint(1) NOT NULL,
  `ImportSrc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ImportId` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ImportedAt` datetime DEFAULT NULL,
  `Imagen` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VerificacionNivel` int(11) NOT NULL,
  `TipoSociedad` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Pais_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B26FED9B1286421` (`Username`),
  UNIQUE KEY `ImportSrcId` (`ImportSrc`,`ImportId`),
  KEY `IDX_B26FED9B9B9EC5A` (`Pais_id`),
  KEY `Base_Persona_Documento` (`DocumentoTipo`,`DocumentoNumero`),
  KEY `Base_Persona_Cuilt` (`Cuilt`),
  KEY `Base_Persona_NombreVisible` (`NombreVisible`),
  KEY `Base_Persona_Tg06100Id` (`Tg06100Id`),
  CONSTRAINT `FK_B26FED9B9B9EC5A` FOREIGN KEY (`Pais_id`) REFERENCES `Base_Pais` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3293 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Base_Persona`
--

LOCK TABLES `Base_Persona` WRITE;
/*!40000 ALTER TABLE `Base_Persona` DISABLE KEYS */;
INSERT INTO `Base_Persona` VALUES (1,'Testing','Testing','Testing Persona','test','1232456','123456','lasdkjflajskdhwqksa54654654',NULL,1,'123456',NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Base_Persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Base_PersonaGrupo`
--

DROP TABLE IF EXISTS `Base_PersonaGrupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Base_PersonaGrupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Dominio` tinyint(1) NOT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `Suprimido` tinyint(1) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5A747B14F08B48D3` (`Parent_id`),
  CONSTRAINT `FK_5A747B14F08B48D3` FOREIGN KEY (`Parent_id`) REFERENCES `Base_PersonaGrupo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Base_PersonaGrupo`
--

LOCK TABLES `Base_PersonaGrupo` WRITE;
/*!40000 ALTER TABLE `Base_PersonaGrupo` DISABLE KEYS */;
INSERT INTO `Base_PersonaGrupo` VALUES (1,0,'Agentes',NULL,1,0,'2013-03-15 15:27:47','2013-03-15 15:27:54',NULL),(2,0,'Inspectores',NULL,1,0,'2013-03-15 15:47:51','2013-03-15 15:47:54',NULL),(3,0,'Contribuyentes',NULL,1,0,'2013-09-18 14:43:14','2013-09-18 14:43:14',NULL),(4,0,'Obras Particulares: Matriculados',NULL,1,0,'2014-12-01 15:53:31','2014-12-01 15:53:31',NULL),(5,0,'Centro de Rendimiento Deportivo',NULL,1,0,'2015-04-06 15:49:38','2015-04-06 15:49:38',NULL),(6,0,'Zoonosis',NULL,1,0,'2015-04-06 15:49:44','2015-04-06 15:49:44',NULL),(7,0,'Polideportivo Carlos Margalot',NULL,1,0,'2015-04-06 15:49:58','2015-04-06 15:49:58',NULL),(8,0,'Prevención de Adicciones',NULL,2,0,'2015-04-06 15:51:31','2015-04-06 15:51:40',NULL);
/*!40000 ALTER TABLE `Base_PersonaGrupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Base_PersonaRol`
--

DROP TABLE IF EXISTS `Base_PersonaRol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Base_PersonaRol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Suprimido` tinyint(1) NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=613 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Base_PersonaRol`
--

LOCK TABLES `Base_PersonaRol` WRITE;
/*!40000 ALTER TABLE `Base_PersonaRol` DISABLE KEYS */;
/*!40000 ALTER TABLE `Base_PersonaRol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Base_Persona_Domicilio`
--

DROP TABLE IF EXISTS `Base_Persona_Domicilio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Base_Persona_Domicilio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` int(11) NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `Suprimido` tinyint(1) NOT NULL,
  `DomicilioCalleNombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DomicilioNumero` int(11) DEFAULT NULL,
  `DomicilioPiso` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DomicilioPuerta` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DomicilioCodigoPostal` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VerificacionNivel` int(11) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Persona_id` int(11) DEFAULT NULL,
  `DomicilioCalle_id` int(11) DEFAULT NULL,
  `Partida_id` int(11) DEFAULT NULL,
  `ImportadoDesdeGestion` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_18EAF453BAA58E69` (`Persona_id`),
  KEY `IDX_18EAF45324A57A5` (`DomicilioCalle_id`),
  KEY `IDX_18EAF453BE071A57` (`Partida_id`),
  CONSTRAINT `FK_18EAF45324A57A5` FOREIGN KEY (`DomicilioCalle_id`) REFERENCES `Catastro_Calle` (`id`),
  CONSTRAINT `FK_18EAF453BAA58E69` FOREIGN KEY (`Persona_id`) REFERENCES `Base_Persona` (`id`),
  CONSTRAINT `FK_18EAF453BE071A57` FOREIGN KEY (`Partida_id`) REFERENCES `Catastro_Partida` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Base_Persona_Domicilio`
--

LOCK TABLES `Base_Persona_Domicilio` WRITE;
/*!40000 ALTER TABLE `Base_Persona_Domicilio` DISABLE KEYS */;
/*!40000 ALTER TABLE `Base_Persona_Domicilio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Base_Persona_PersonaGrupo`
--

DROP TABLE IF EXISTS `Base_Persona_PersonaGrupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Base_Persona_PersonaGrupo` (
  `personagrupo_id` int(11) NOT NULL,
  `Persona_id` int(11) NOT NULL,
  PRIMARY KEY (`Persona_id`,`personagrupo_id`),
  KEY `IDX_F152730DBAA58E69` (`Persona_id`),
  KEY `IDX_F152730DEE368E74` (`personagrupo_id`),
  CONSTRAINT `FK_F152730DBAA58E69` FOREIGN KEY (`Persona_id`) REFERENCES `Base_Persona` (`id`),
  CONSTRAINT `FK_F152730DEE368E74` FOREIGN KEY (`personagrupo_id`) REFERENCES `Base_PersonaGrupo` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Base_Persona_PersonaGrupo`
--

LOCK TABLES `Base_Persona_PersonaGrupo` WRITE;
/*!40000 ALTER TABLE `Base_Persona_PersonaGrupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Base_Persona_PersonaGrupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Base_Persona_PersonaRol`
--

DROP TABLE IF EXISTS `Base_Persona_PersonaRol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Base_Persona_PersonaRol` (
  `personarol_id` int(11) NOT NULL,
  `Persona_id` int(11) NOT NULL,
  PRIMARY KEY (`Persona_id`,`personarol_id`),
  KEY `IDX_A694AD88BAA58E69` (`Persona_id`),
  KEY `IDX_A694AD88604357D5` (`personarol_id`),
  CONSTRAINT `FK_A694AD88604357D5` FOREIGN KEY (`personarol_id`) REFERENCES `Base_PersonaRol` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A694AD88BAA58E69` FOREIGN KEY (`Persona_id`) REFERENCES `Base_Persona` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Base_Persona_PersonaRol`
--

LOCK TABLES `Base_Persona_PersonaRol` WRITE;
/*!40000 ALTER TABLE `Base_Persona_PersonaRol` DISABLE KEYS */;
/*!40000 ALTER TABLE `Base_Persona_PersonaRol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Base_ProfesionalMedico`
--

DROP TABLE IF EXISTS `Base_ProfesionalMedico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Base_ProfesionalMedico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Suprimido` tinyint(1) NOT NULL,
  `Persona_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9A803534BAA58E69` (`Persona_id`),
  CONSTRAINT `FK_9A803534BAA58E69` FOREIGN KEY (`Persona_id`) REFERENCES `Base_Persona` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Base_ProfesionalMedico`
--

LOCK TABLES `Base_ProfesionalMedico` WRITE;
/*!40000 ALTER TABLE `Base_ProfesionalMedico` DISABLE KEYS */;
/*!40000 ALTER TABLE `Base_ProfesionalMedico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Base_Provincia`
--

DROP TABLE IF EXISTS `Base_Provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Base_Provincia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CodigoIfam` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `CodigoIso` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `NombreOficial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GentiliciosMasculinos` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `GentiliciosFemeninos` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Pais_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2F2399E59B9EC5A` (`Pais_id`),
  CONSTRAINT `FK_2F2399E59B9EC5A` FOREIGN KEY (`Pais_id`) REFERENCES `Base_Pais` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Base_Provincia`
--

LOCK TABLES `Base_Provincia` WRITE;
/*!40000 ALTER TABLE `Base_Provincia` DISABLE KEYS */;
/*!40000 ALTER TABLE `Base_Provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bromatologia_CatBr`
--

DROP TABLE IF EXISTS `Bromatologia_CatBr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bromatologia_CatBr` (
  `id` int(11) NOT NULL,
  `FechaValidezHasta` date DEFAULT NULL,
  `Partida_id` int(11) NOT NULL,
  `ActividadPrincipal_id` int(11) DEFAULT NULL,
  `Local_id` int(11) DEFAULT NULL,
  `NumeroActa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BEE06214BE071A57` (`Partida_id`),
  KEY `IDX_BEE062143030A316` (`ActividadPrincipal_id`),
  KEY `IDX_BEE06214A42C4357` (`Local_id`),
  CONSTRAINT `FK_BEE062143030A316` FOREIGN KEY (`ActividadPrincipal_id`) REFERENCES `Comercio_Actividad` (`id`),
  CONSTRAINT `FK_BEE06214A42C4357` FOREIGN KEY (`Local_id`) REFERENCES `Comercio_Local` (`id`),
  CONSTRAINT `FK_BEE06214BE071A57` FOREIGN KEY (`Partida_id`) REFERENCES `Catastro_Partida` (`id`),
  CONSTRAINT `FK_BEE06214BF396750` FOREIGN KEY (`id`) REFERENCES `Tramites_Comprobante` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bromatologia_CatBr`
--

LOCK TABLES `Bromatologia_CatBr` WRITE;
/*!40000 ALTER TABLE `Bromatologia_CatBr` DISABLE KEYS */;
/*!40000 ALTER TABLE `Bromatologia_CatBr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bromatologia_TramiteCatBr`
--

DROP TABLE IF EXISTS `Bromatologia_TramiteCatBr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bromatologia_TramiteCatBr` (
  `id` int(11) NOT NULL,
  `ExpedienteNumero` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TurnoFecha` datetime DEFAULT NULL,
  `ProvisorioHasta` datetime DEFAULT NULL,
  `UltimoSeguimiento_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9F599EAB451EAD33` (`UltimoSeguimiento_id`),
  CONSTRAINT `FK_9F599EAB451EAD33` FOREIGN KEY (`UltimoSeguimiento_id`) REFERENCES `Administracion_Seguimiento` (`id`),
  CONSTRAINT `FK_9F599EABBF396750` FOREIGN KEY (`id`) REFERENCES `Tramites_Tramite` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bromatologia_TramiteCatBr`
--

LOCK TABLES `Bromatologia_TramiteCatBr` WRITE;
/*!40000 ALTER TABLE `Bromatologia_TramiteCatBr` DISABLE KEYS */;
/*!40000 ALTER TABLE `Bromatologia_TramiteCatBr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Calendario`
--

DROP TABLE IF EXISTS `Calendario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Calendario` (
  `Fecha` date NOT NULL,
  PRIMARY KEY (`Fecha`),
  UNIQUE KEY `Fecha` (`Fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Calendario`
--

LOCK TABLES `Calendario` WRITE;
/*!40000 ALTER TABLE `Calendario` DISABLE KEYS */;
/*!40000 ALTER TABLE `Calendario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Catastro_Barrio`
--

DROP TABLE IF EXISTS `Catastro_Barrio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Catastro_Barrio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NombreAlternativo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Ordenanza` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Notas` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Catastro_Barrio_Nombre` (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Catastro_Barrio`
--

LOCK TABLES `Catastro_Barrio` WRITE;
/*!40000 ALTER TABLE `Catastro_Barrio` DISABLE KEYS */;
/*!40000 ALTER TABLE `Catastro_Barrio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Catastro_Calle`
--

DROP TABLE IF EXISTS `Catastro_Calle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Catastro_Calle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `ImportId` varchar(50) DEFAULT NULL,
  `ImportedAt` datetime DEFAULT NULL,
  `ImportSrc` varchar(255) DEFAULT NULL,
  `NombreOriginal` varchar(255) DEFAULT NULL,
  `NombreAlternativo` varchar(255) DEFAULT NULL,
  `Tipo` int(11) DEFAULT NULL,
  `UbicacionFecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Catastro_Calle_Nombre` (`Nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=1306 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Catastro_Calle`
--

LOCK TABLES `Catastro_Calle` WRITE;
/*!40000 ALTER TABLE `Catastro_Calle` DISABLE KEYS */;
INSERT INTO `Catastro_Calle` VALUES (1,'Aeroposta Argentina','2013-09-13 15:55:57','2016-01-13 12:59:20',4,'1',NULL,'dbmunirg.TG06405','AEROPOSTA ARGENTINA!!!',NULL,0,'2016-01-13 12:59:20'),(2,'Juan Bautista Alberdi','2013-09-13 15:55:57','2016-01-25 10:39:32',4,'2',NULL,'dbmunirg.TG06405','JUAN BAUTISTA ALBERDI!!!',NULL,0,'2016-01-25 10:39:32'),(3,'Almafuerte','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'3',NULL,'dbmunirg.TG06405','ALMAFUERTE!!!',NULL,0,NULL),(4,'Pedro Altuna','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'4',NULL,'dbmunirg.TG06405','PEDRO ALTUNA!!!',NULL,0,NULL),(5,'Marcelo Torcuato de Alvear','2013-09-13 15:55:57','2016-05-06 13:26:39',5,'5',NULL,'dbmunirg.TG06405','PRESIDENTE MAXIMO MARCELO TORCUATO DE ALVEAR!!!','Presidente Máximo Marcelo Torcuato de Alvear',0,'2016-05-06 13:26:39'),(6,'Leandro N. Alem','2013-09-13 15:55:57','2016-02-19 10:32:45',5,'6',NULL,'dbmunirg.TG06405','DOCTOR LEANDRO N. ALEM!!!','Dr. Leandro N. Alem',0,'2016-02-19 10:32:45'),(7,'Florentino Ameghino','2013-09-13 15:55:57','2016-01-26 09:19:04',4,'7',NULL,'dbmunirg.TG06405','FLORENTINO AMEGHINO!!!',NULL,0,'2016-01-26 09:19:04'),(8,'Ángela Loig','2013-09-13 15:55:57','2016-02-01 15:51:57',4,'8',NULL,'dbmunirg.TG06405','ANGELA LOIG!!!',NULL,0,'2016-02-01 15:51:57'),(9,'Ángela Vallese','2013-09-13 15:55:57','2016-01-13 12:59:49',6,'9',NULL,'dbmunirg.TG06405','HERMANA ANGELA VALLESE!!!','Hermana Ángela Vallese',0,'2016-01-13 12:59:49'),(10,'Antártida Argentina','2013-09-13 15:55:57','2016-02-01 15:54:28',4,'10',NULL,'dbmunirg.TG06405','ANTARTIDA ARGENTINA!!!',NULL,0,'2016-02-01 15:54:28'),(11,'Concejal Enrique Arteche','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'11',NULL,'dbmunirg.TG06405','CONCEJAL ENRIQUE ARTECHE!!!',NULL,0,NULL),(12,'Arwenhol','2013-09-13 15:55:57','2016-03-10 10:24:46',4,'12',NULL,'dbmunirg.TG06405','ARWENHOL!!!',NULL,0,'2016-03-10 10:24:46'),(13,'Nicolás Avellaneda','2013-09-13 15:55:57','2016-01-08 16:25:50',5,'13',NULL,'dbmunirg.TG06405','NICOLAS AVELLANEDA!!!','Pasaje Nicolás Avellaneda',0,'2016-01-08 16:25:50'),(14,'General Azcuénaga','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'14',NULL,'dbmunirg.TG06405','GENERAL AZCUENAGA!!!',NULL,0,NULL),(15,'Azopardo','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'15',NULL,'dbmunirg.TG06405','AZOPARDO!!!',NULL,0,NULL),(16,'José Beauvoir','2013-09-13 15:55:57','2015-11-20 11:42:32',4,'16',NULL,'dbmunirg.TG06405','REVERENDO PADRE BEAUVOIR!!!','Reverendo Padre Beauvoir',0,NULL),(17,'Avenida Manuel Belgrano','2013-09-13 15:55:57','2016-01-14 09:25:34',4,'17',NULL,'dbmunirg.TG06405','GENERAL MANUEL BELGRANO!!!','General Manuel Belgrano',0,NULL),(18,'Julio Omar Benítez','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'18',NULL,'dbmunirg.TG06405','JULIO OMAR BENITEZ!!!',NULL,0,NULL),(19,'Francisco Bilbao','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'19',NULL,'dbmunirg.TG06405','FRANCISCO BILBAO!!!',NULL,0,NULL),(20,'Ruperto Bilbao','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'20',NULL,'dbmunirg.TG06405','RUPERTO BILBAO!!!',NULL,0,NULL),(21,'Santiago Bove','2013-09-13 15:55:57','2016-07-04 10:35:26',4,'21',NULL,'dbmunirg.TG06405','SANTIAGO BOVE!!!',NULL,0,'2016-07-04 10:35:26'),(22,'Buenos Aires','2013-09-13 15:55:57','2016-03-10 16:36:40',4,'22',NULL,'dbmunirg.TG06405','BUENOS AIRES!!!',NULL,0,'2016-03-10 16:36:40'),(23,'Thomas Bridges','2013-09-13 15:55:57','2016-01-14 09:29:41',4,'23',NULL,'dbmunirg.TG06405','TOMAS BRIDGES!!!',NULL,0,NULL),(24,'Almirante Guillermo Brown','2013-09-13 15:55:57','2016-02-26 09:56:39',7,'24',NULL,'dbmunirg.TG06405','ALMIRANTE GUILLERMO BROWN!!!','Almirante Brown',0,'2016-02-26 09:56:39'),(25,'Cabo de Hornos','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'25',NULL,'dbmunirg.TG06405','CABO DE HORNOS!!!',NULL,0,NULL),(26,'José Cabezas','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'26',NULL,'dbmunirg.TG06405','JOSE CABEZAS!!!',NULL,0,NULL),(27,'Camila O\'Gorman','2013-09-13 15:55:57','2016-02-10 10:12:19',4,'27',NULL,'dbmunirg.TG06405','CAMILA O\'GORMAN!!!',NULL,0,'2016-02-10 10:12:19'),(28,'Campanella','2013-09-13 15:55:57','2016-01-22 10:28:03',6,'28',NULL,'dbmunirg.TG06405','MINISTRO ROBERTO LUIS CAMPANELLA!!!','Ministro Roberto Luis Campanella',0,'2016-01-22 10:28:03'),(29,'Pasaje Canal Moat','2013-09-13 15:55:57','2016-01-29 10:29:03',5,'29',NULL,'dbmunirg.TG06405','CANAL MOAT!!!','Canal Moat',0,'2016-01-29 10:29:03'),(30,'Miguel Cane','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'30',NULL,'dbmunirg.TG06405','MIGUEL CANE!!!',NULL,0,NULL),(31,'Catamarca','2013-09-13 15:55:57','2016-03-10 09:33:17',4,'31',NULL,'dbmunirg.TG06405','CATAMARCA!!!',NULL,0,'2016-03-10 09:33:17'),(32,'Cristobal Colón','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'32',NULL,'dbmunirg.TG06405','CRISTOBAL COLON!!!',NULL,0,NULL),(33,'Juan Manuel Cabot','2013-09-13 15:55:57','2016-03-07 16:44:24',5,'33',NULL,'dbmunirg.TG06405','COMANDANTE CABOT!!!','Comandante Cabot',0,'2016-03-07 16:44:24'),(34,'Combate de Montevideo','2013-09-13 15:55:57','2016-02-23 12:54:26',4,'34',NULL,'dbmunirg.TG06405','COMBATE DE MONTEVIDEO!!!',NULL,0,'2016-02-23 12:54:26'),(35,'Conquista del Desierto','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'35',NULL,'dbmunirg.TG06405','CONQUISTA DEL DESIERTO!!!',NULL,0,NULL),(36,'Córdoba','2013-09-13 15:55:57','2014-03-31 16:44:51',4,'36',NULL,'dbmunirg.TG06405','CORDOBA!!!',NULL,0,NULL),(37,'Corrientes','2013-09-13 15:55:57','2016-03-10 09:34:48',4,'37',NULL,'dbmunirg.TG06405','CORRIENTES!!!',NULL,0,'2016-03-10 09:34:48'),(38,'Curupaity','2013-09-13 15:55:57','2016-03-10 09:55:15',4,'38',NULL,'dbmunirg.TG06405','CURUPAITY!!!',NULL,0,'2016-03-10 09:55:15'),(39,'Crucero General Belgrano','2013-09-13 15:55:57','2016-01-13 13:47:51',4,'39',NULL,'dbmunirg.TG06405','CRUCERO GENERAL BELGRANO!!!',NULL,0,'2016-01-13 13:47:51'),(40,'Batalla de Chacabuco','2013-09-13 15:55:57','2016-02-23 12:55:41',4,'40',NULL,'dbmunirg.TG06405','BATALLA DE CHACABUCO!!!',NULL,0,'2016-02-23 12:55:41'),(41,'Amparo de Chamorro','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'41',NULL,'dbmunirg.TG06405','AMPARO DE CHAMORRO!!!',NULL,0,NULL),(42,'Chawr','2013-09-13 15:55:57','2016-03-10 11:48:41',5,'42',NULL,'dbmunirg.TG06405','CHAWR (orilla del mar)!!!','Chawr (Orilla del Mar)',0,'2016-03-10 11:48:41'),(43,'Chile','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'43',NULL,'dbmunirg.TG06405','CHILE!!!',NULL,0,NULL),(44,'Chubut','2013-09-13 15:55:57','2016-03-10 16:36:50',4,'44',NULL,'dbmunirg.TG06405','CHUBUT!!!',NULL,0,'2016-03-10 16:36:50'),(45,'Carlos Darwin','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'45',NULL,'dbmunirg.TG06405','CARLOS DARWIN!!!',NULL,0,NULL),(46,'Alberto D\'Agostini','2013-09-13 15:55:57','2016-01-20 09:46:13',5,'46',NULL,'dbmunirg.TG06405','REVERENDO PADRE ALBERTO D\'AGOSTINI!!!','Reverendo Padre Alberto D\'Agostini',0,'2016-01-20 09:46:13'),(47,'Don Bosco','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'47',NULL,'dbmunirg.TG06405','DON BOSCO!!!',NULL,0,NULL),(48,'Esteban Echeverría','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'48',NULL,'dbmunirg.TG06405','ESTEBAN ECHEVERRIA!!!',NULL,0,NULL),(49,'Albert Einstein','2013-09-13 15:55:57','2016-02-26 10:03:27',4,'49',NULL,'dbmunirg.TG06405','ALBERT EINSTEIN!!!',NULL,0,'2016-02-26 10:03:27'),(50,'Sebastián Elcano','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'50',NULL,'dbmunirg.TG06405','SEBASTIAN ELCANO!!!',NULL,0,NULL),(51,'Thomas Alva Edison','2013-09-13 15:55:57','2016-01-15 10:20:11',5,'51',NULL,'dbmunirg.TG06405','TOMAS ALVA EDISON!!!',NULL,0,'2016-01-15 10:20:11'),(52,'Entre Ríos','2013-09-13 15:55:57','2016-03-10 16:40:43',5,'52',NULL,'dbmunirg.TG06405','ENTRE RIOS!!!',NULL,0,'2016-03-10 16:40:43'),(53,'Tomás Espora','2013-09-13 15:55:57','2016-01-14 09:29:36',4,'53',NULL,'dbmunirg.TG06405','TOMAS ESPORA!!!',NULL,0,NULL),(54,'Fray Mamerto Esquiú','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'54',NULL,'dbmunirg.TG06405','FRAY MAMERTO ESQUIU!!!',NULL,0,NULL),(55,'José Manuel Estrada','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'55',NULL,'dbmunirg.TG06405','JOSE MANUEL ESTRADA!!!',NULL,0,NULL),(56,'Estrecho San Carlos','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'56',NULL,'dbmunirg.TG06405','ESTRECHO SAN CARLOS!!!',NULL,0,NULL),(57,'Eva Perón','2013-09-13 15:55:57','2016-01-13 13:45:38',4,'57',NULL,'dbmunirg.TG06405','EVA PERON!!!',NULL,0,'2016-01-13 13:45:38'),(58,'Monsenor José Fagnano','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'58',NULL,'dbmunirg.TG06405','MONSENOR JOSE FAGNANO!!!',NULL,0,NULL),(59,'Federico Ibarra','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'59',NULL,'dbmunirg.TG06405','FEDERICO IBARRA!!!',NULL,0,NULL),(60,'Ministro Fernando García','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'60',NULL,'dbmunirg.TG06405','MINISTRO FERNANDO GARCIA!!!',NULL,0,NULL),(61,'José Finocchio','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'61',NULL,'dbmunirg.TG06405','JOSE FINOCCHIO!!!',NULL,0,NULL),(62,'Padre Forgacs','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'62',NULL,'dbmunirg.TG06405','PADRE FORGACS!!!',NULL,0,NULL),(63,'Rastreador Fournier','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'63',NULL,'dbmunirg.TG06405','RASTREADOR FOURNIER!!!',NULL,0,NULL),(64,'Fray Justo Santa María de Oro','2013-09-13 15:55:57','2016-03-10 09:25:24',4,'64',NULL,'dbmunirg.TG06405','FRAY JUSTO SANTA MARIA DE ORO!!!',NULL,0,'2016-03-10 09:25:24'),(65,'Pasaje Carlos Gardel','2013-09-13 15:55:57','2016-01-28 09:57:45',5,'65',NULL,'dbmunirg.TG06405','CARLOS GARDEL!!!','Carlos Gardel',0,'2016-01-28 09:57:45'),(66,'Gobernador Anadón','2013-09-13 15:55:57','2016-01-20 10:05:26',5,'66',NULL,'dbmunirg.TG06405','GOBERNADOR ANADON!!!',NULL,0,'2016-01-20 10:05:26'),(67,'Gobernador Paz','2013-09-13 15:55:57','2016-01-11 11:12:16',4,'67',NULL,'dbmunirg.TG06405','GOBERNADOR PAZ!!!','Gobernador Féliz Paz',0,NULL),(68,'Joaquín Goytisolo','2013-09-13 15:55:57','2016-01-13 13:54:31',5,'68',NULL,'dbmunirg.TG06405','JOAQUIN GOYTISOLO!!!','Padre Joaquín Goytisolo',0,'2016-01-13 13:54:31'),(69,'Remolcador Guaraní','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'69',NULL,'dbmunirg.TG06405','REMOLCADOR GUARANI!!!',NULL,0,NULL),(70,'General Güemes','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'70',NULL,'dbmunirg.TG06405','GENERAL GUEMES!!!',NULL,0,NULL),(71,'Gregoria Matorras','2013-09-13 15:55:57','2016-03-09 10:41:35',5,'71',NULL,'dbmunirg.TG06405','GREGORIA MATORRAS!!!',NULL,0,'2016-03-09 10:41:35'),(72,'Carlos Herrera','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'72',NULL,'dbmunirg.TG06405','CARLOS HERRERA!!!',NULL,0,NULL),(73,'Holanda','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'73',NULL,'dbmunirg.TG06405','HOLANDA!!!',NULL,0,NULL),(74,'Hoiken','2013-09-13 15:55:57','2016-03-10 11:34:43',4,'74',NULL,'dbmunirg.TG06405','HOIKEN!!!',NULL,0,'2016-03-10 11:34:43'),(75,'Howiken','2013-09-13 15:55:57','2016-03-10 12:09:21',4,'75',NULL,'dbmunirg.TG06405','HOWIKEN!!!',NULL,0,'2016-03-10 12:09:21'),(76,'Bernardo A. Houssay','2013-09-13 15:55:57','2016-05-05 13:57:29',4,'76',NULL,'dbmunirg.TG06405','BERNARDO A. HOUSSAY!!!',NULL,0,'2016-05-05 13:57:29'),(77,'Arturo Illia','2013-09-13 15:55:57','2016-01-13 12:59:03',5,'77',NULL,'dbmunirg.TG06405','PRESIDENTE ARTURO ILLIA!!!','Presidente Arturo Illia',0,'2016-01-13 12:59:03'),(78,'Pasaje Independencia','2013-09-13 15:55:57','2016-01-28 09:56:30',5,'78',NULL,'dbmunirg.TG06405','INDEPENDENCIA!!!','Independencia',0,'2016-01-28 09:56:30'),(79,'Ingeniero Varela','2013-09-13 15:55:57','2016-02-23 12:50:55',4,'79',NULL,'dbmunirg.TG06405','INGENIERO VARELA!!!',NULL,0,'2016-02-23 12:50:55'),(80,'Isla de Los Estados','2013-09-13 15:55:57','2016-01-14 11:49:05',5,'80',NULL,'dbmunirg.TG06405','ISLAS DE LOS ESTADOS!!!',NULL,0,'2016-01-14 11:47:03'),(81,'Isla Gable','2013-09-13 15:55:57','2016-01-29 10:30:46',4,'81',NULL,'dbmunirg.TG06405','ISLA GABLE!!!',NULL,0,'2016-01-29 10:30:46'),(82,'Isla San José','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'82',NULL,'dbmunirg.TG06405','ISLA SAN JOSE!!!',NULL,0,NULL),(83,'Isla San Pedro','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'83',NULL,'dbmunirg.TG06405','ISLA SAN PEDRO!!!',NULL,0,NULL),(84,'Islas Malvinas','2013-09-13 15:55:57','2016-01-08 16:24:15',4,'84',NULL,'dbmunirg.TG06405','ISLAS MALVINAS!!!',NULL,0,'2016-01-08 16:24:15'),(85,'Isla Soledad','2013-09-13 15:55:57','2014-03-31 16:44:51',7,'85',NULL,'dbmunirg.TG06405','ISLA SOLEDAD!!!',NULL,0,NULL),(86,'Isla Trinidad','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'86',NULL,'dbmunirg.TG06405','ISLA TRINIDAD!!!',NULL,0,NULL),(87,'Israel','2013-09-13 15:55:57','2016-01-27 09:42:46',4,'87',NULL,'dbmunirg.TG06405','ISRAEL!!!',NULL,0,'2016-01-27 09:42:46'),(88,'Italia','2013-09-13 15:55:57','2016-02-19 10:32:52',4,'88',NULL,'dbmunirg.TG06405','ITALIA!!!',NULL,0,'2016-02-19 10:32:52'),(89,'Arturo Jauretche','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'89',NULL,'dbmunirg.TG06405','ARTURO JAURETCHE!!!',NULL,0,NULL),(90,'José Hernández','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'90',NULL,'dbmunirg.TG06405','JOSE HERNANDEZ!!!',NULL,0,NULL),(91,'José Ingenieros','2013-09-13 15:55:57','2016-02-01 15:53:13',4,'91',NULL,'dbmunirg.TG06405','JOSE INGENIEROS!!!',NULL,0,'2016-02-01 15:53:13'),(92,'Juan Bautista Justo','2013-09-13 15:55:57','2016-02-23 12:58:21',4,'92',NULL,'dbmunirg.TG06405','JUAN BAUTISTA JUSTO!!!',NULL,0,'2016-02-23 12:58:21'),(93,'Juan Manuel de Rosas','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'93',NULL,'dbmunirg.TG06405','JUAN MANUEL DE ROSAS!!!',NULL,0,NULL),(94,'Manuel Juárez Celman','2013-09-13 15:55:57','2015-11-20 11:40:42',4,'94',NULL,'dbmunirg.TG06405','PRESIDENTE MANUEL JUAREZ CELMAN!!!','Presidente Manuel Juárez Celman',0,NULL),(95,'Jujuy','2013-09-13 15:55:58','2016-03-10 09:33:32',4,'95',NULL,'dbmunirg.TG06405','JUJUY!!!',NULL,0,'2016-03-10 09:33:32'),(96,'Julio Popper','2013-09-13 15:55:58','2014-03-31 16:44:51',3,'96',NULL,'dbmunirg.TG06405','JULIO POPPER!!!',NULL,0,NULL),(97,'John Goodall','2013-09-13 15:55:58','2014-03-31 16:44:51',3,'97',NULL,'dbmunirg.TG06405','JOHN GOODALL!!!',NULL,0,NULL),(98,'Kami','2013-09-13 15:55:58','2014-03-31 16:44:51',3,'98',NULL,'dbmunirg.TG06405','KAMI!!!',NULL,0,NULL),(99,'Sergio Karakachof','2013-09-13 15:55:58','2016-05-06 13:48:24',4,'99',NULL,'dbmunirg.TG06405','SERGIO KARAKACHOF!!!',NULL,0,'2016-05-06 13:48:24'),(100,'Karukinka','2013-09-13 15:55:58','2016-03-10 12:10:51',5,'100',NULL,'dbmunirg.TG06405','KARUKINKA (mi tierra - patria)!!!','Karukinka (Mi Tierra - Patria)',0,'2016-03-10 12:10:51'),(101,'Kau','2013-09-13 15:55:58','2016-03-10 12:16:41',5,'101',NULL,'dbmunirg.TG06405','KAU (hogar)!!!','Kau (Hogar)',0,'2016-03-10 12:16:41'),(102,'Kawi','2013-09-13 15:55:58','2016-02-04 12:36:56',4,'102',NULL,'dbmunirg.TG06405','KAWI!!!',NULL,0,'2016-02-04 12:36:56'),(103,'Kayén','2013-09-13 15:55:58','2016-01-25 10:13:44',5,'103',NULL,'dbmunirg.TG06405','KAYEN!!!',NULL,0,'2016-01-25 10:13:44'),(104,'Kekau','2013-09-13 15:55:58','2016-03-10 12:03:31',4,'104',NULL,'dbmunirg.TG06405','KEKAUH (llover)!!!','Kekauh (Llover)',0,NULL),(105,'Kekombosh','2013-09-13 15:55:58','2016-03-10 12:12:16',5,'105',NULL,'dbmunirg.TG06405','KEKOMBOSH (nevar)!!!','Kekombosh (Nevar)',0,'2016-03-10 12:12:16'),(106,'Keninek','2013-09-13 15:55:58','2016-03-10 12:06:54',5,'106',NULL,'dbmunirg.TG06405','KENINEK (viento del sur)!!!','Keninek (Viento del Sur)',0,'2016-03-10 12:06:54'),(107,'Kereskin','2013-09-13 15:55:58','2016-03-10 10:23:22',5,'107',NULL,'dbmunirg.TG06405','KERESKIN (bosque)!!!','Kereskin (Bosque)',0,'2016-03-10 10:23:22'),(108,'Klewel (Suerte)','2013-09-13 15:55:58','2014-03-31 16:44:51',3,'108',NULL,'dbmunirg.TG06405','KLEWEL (suerte)!!!',NULL,0,NULL),(109,'Koyuska','2013-09-13 15:55:58','2016-03-10 12:15:05',5,'109',NULL,'dbmunirg.TG06405','KOYUSKA (indigena fueguino ona)!!!','Koyuska (Indigena Fueguino Ona)',0,'2016-03-10 12:15:05'),(110,'Lago Chepelmut','2013-09-13 15:55:58','2014-03-31 16:44:51',3,'110',NULL,'dbmunirg.TG06405','LAGO CHEPELMUT!!!',NULL,0,NULL),(111,'Lapataia','2013-09-13 15:55:58','2014-03-31 16:44:51',3,'111',NULL,'dbmunirg.TG06405','LAPATAIA!!!',NULL,0,NULL),(112,'La Rioja','2013-09-13 15:55:58','2016-03-10 16:58:57',5,'112',NULL,'dbmunirg.TG06405','LA RIOJA!!!',NULL,0,'2016-03-10 16:58:57'),(113,'Las Lengas','2013-09-13 15:55:58','2016-03-10 10:29:53',4,'113',NULL,'dbmunirg.TG06405','LAS LENGAS!!!',NULL,0,'2016-03-10 10:29:53'),(114,'Augusto Lasserre','2013-09-13 15:55:58','2015-11-20 09:01:04',4,'114',NULL,'dbmunirg.TG06405','COMODORO AUGUSTO LASSERRE!!!','Comodoro Augusto Lasserre',0,NULL),(115,'La Verdad','2013-09-13 15:55:58','2014-03-31 16:44:51',3,'115',NULL,'dbmunirg.TG06405','LA VERDAD!!!',NULL,0,NULL),(116,'Libertad','2013-09-13 15:55:58','2014-03-31 16:44:51',3,'116',NULL,'dbmunirg.TG06405','LIBERTAD!!!',NULL,0,NULL),(117,'Lima','2013-09-13 15:55:58','2014-03-31 16:44:51',3,'117',NULL,'dbmunirg.TG06405','LIMA!!!',NULL,0,NULL),(118,'Santiago de Liniers','2013-09-13 15:55:58','2016-01-14 12:31:28',4,'118',NULL,'dbmunirg.TG06405','SANTIAGO DE LINIERS!!!',NULL,0,'2016-01-14 12:31:28'),(119,'Lisandro de La Torre','2013-09-13 15:55:58','2014-03-31 16:44:51',3,'119',NULL,'dbmunirg.TG06405','LISANDRO DE LA TORRE!!!',NULL,0,NULL),(120,'Julio Ernesto Löffler','2013-09-13 15:55:58','2016-02-10 11:11:01',5,'120',NULL,'dbmunirg.TG06405','LEGISLADOR JULIO ERNESTO L\'OFFLER!!!','Legislador Julio Ernesto Löffler',0,'2016-02-10 11:11:01'),(121,'Lola Kieps','2013-09-13 15:55:58','2014-03-31 16:44:51',3,'121',NULL,'dbmunirg.TG06405','LOLA KIEPS!!!',NULL,0,NULL),(122,'Los Calafates','2013-09-13 15:55:58','2014-03-31 16:44:51',3,'122',NULL,'dbmunirg.TG06405','LOS CALAFATES!!!',NULL,0,NULL),(123,'Los Canelos','2013-09-13 15:55:58','2016-03-10 10:46:21',4,'123',NULL,'dbmunirg.TG06405','LOS CANELOS!!!',NULL,0,'2016-03-10 10:46:21'),(124,'Los Ñires','2013-09-13 15:55:58','2016-03-10 10:31:16',4,'124',NULL,'dbmunirg.TG06405','LOS ÑIRES!!!',NULL,0,'2016-03-10 10:31:16'),(125,'Luis Py','2013-09-13 15:55:58','2016-01-26 10:39:40',5,'125',NULL,'dbmunirg.TG06405','COMODORO LUIS PY!!!','Comodoro Luis Py',0,'2016-01-26 10:39:40'),(126,'Hermana Luisa Rosso','2013-09-13 15:55:58','2014-03-31 16:44:51',3,'126',NULL,'dbmunirg.TG06405','HERMANA LUISA ROSSO!!!',NULL,0,NULL),(127,'Leopoldo Lugones','2013-09-13 15:55:58','2016-01-20 09:46:18',4,'127',NULL,'dbmunirg.TG06405','LEOPOLDO LUGONES!!!',NULL,0,'2016-01-20 09:46:18'),(128,'Luro Cambaceres','2013-09-13 15:55:58','2015-11-20 08:54:49',4,'128',NULL,'dbmunirg.TG06405','AVIADOR LURO CAMBACERES!!!','Aviador Luro Cambaceres',0,NULL),(129,'Juan Mackinlay','2013-09-13 15:55:58','2016-01-26 09:24:03',5,'129',NULL,'dbmunirg.TG06405','ALFEREZ MACKINLAY!!!','Alférez Mackinlay',0,'2016-01-26 09:24:03'),(130,'Main (Padre)','2013-09-13 15:55:57','2014-03-31 16:44:51',2,'130',NULL,'dbmunirg.TG06405','MAIN (padre)!!!',NULL,0,NULL),(131,'Maipú','2013-09-13 15:55:58','2014-03-31 16:44:51',3,'131',NULL,'dbmunirg.TG06405','MAIPU!!!',NULL,0,NULL),(132,'Mario Marconcini','2013-09-13 15:55:57','2014-03-31 16:44:51',2,'132',NULL,'dbmunirg.TG06405','MARIO MARCONCINI!!!',NULL,0,NULL),(133,'María Auxiliadora','2013-09-13 15:55:58','2014-03-31 16:44:51',3,'133',NULL,'dbmunirg.TG06405','MARIA AUXILIADORA!!!',NULL,0,NULL),(134,'Pasaje Matheu','2013-09-13 15:55:58','2016-03-10 10:08:39',5,'134',NULL,'dbmunirg.TG06405','DOMINGO MATHEU!!!','Pasaje Domingo Matheu',0,'2016-03-10 10:08:39'),(135,'José Menendez','2013-09-13 15:55:58','2016-01-13 13:52:21',4,'135',NULL,'dbmunirg.TG06405','JOSE MENENDEZ!!!',NULL,0,'2016-01-13 13:52:21'),(136,'Bartolome Mitre','2013-09-13 15:55:58','2014-03-31 16:44:51',3,'136',NULL,'dbmunirg.TG06405','BARTOLOME MITRE!!!',NULL,0,NULL),(137,'Manuel Montilla','2013-09-13 15:55:58','2015-11-20 09:02:27',4,'137',NULL,'dbmunirg.TG06405','DR. MANUEL MONTILLA!!!','Dr. Manuel Montilla',0,NULL),(138,'Juan Carlos Mora','2013-09-13 15:55:58','2014-03-31 16:44:51',3,'138',NULL,'dbmunirg.TG06405','JUAN CARLOS MORA!!!',NULL,0,NULL),(139,'Alicia Moreau de Justo','2013-09-13 15:55:58','2016-02-11 11:26:30',4,'139',NULL,'dbmunirg.TG06405','ALICIA MOREAU DE JUSTO!!!',NULL,0,'2016-02-11 11:26:30'),(140,'Enrique Mosconi','2013-09-13 15:55:58','2016-01-14 09:25:50',4,'140',NULL,'dbmunirg.TG06405','GENERAL ENRIQUE MOSCONI!!!','General Enrique Mosconi',0,NULL),(141,'Carlos Moyano','2013-09-13 15:55:58','2014-03-31 16:44:51',3,'141',NULL,'dbmunirg.TG06405','CARLOS MOYANO!!!',NULL,0,NULL),(142,'Padre Aurelio Muñoz','2013-09-13 15:55:58','2014-03-31 16:44:51',3,'142',NULL,'dbmunirg.TG06405','PADRE AURELIO MUÑOZ!!!',NULL,0,NULL),(143,'Ceferino Namuncurá','2013-09-13 15:55:58','2014-03-31 16:44:51',3,'143',NULL,'dbmunirg.TG06405','CEFERINO NAMUNCURA!!!',NULL,0,NULL),(144,'Neuquén','2013-09-13 15:55:58','2016-03-10 16:37:26',4,'144',NULL,'dbmunirg.TG06405','NEUQUEN!!!',NULL,0,'2016-03-10 16:37:26'),(145,'Jorge Newbery','2013-09-13 15:55:58','2014-03-31 16:44:51',3,'145',NULL,'dbmunirg.TG06405','JORGE NEWBERY!!!',NULL,0,NULL),(146,'Rafael Obligado','2013-09-13 15:55:58','2014-03-31 16:44:51',3,'146',NULL,'dbmunirg.TG06405','RAFAEL OBLIGADO!!!',NULL,0,NULL),(147,'General Bernardo O\'Higgins','2013-09-13 15:55:58','2014-03-31 16:44:51',3,'147',NULL,'dbmunirg.TG06405','GENERAL BERNARDO O¿HIGGINS!!!',NULL,0,NULL),(148,'Nora Ormiston','2013-09-13 15:55:57','2014-03-31 16:44:51',2,'148',NULL,'dbmunirg.TG06405','NORA ORMISTON!!!',NULL,0,NULL),(149,'Oroski','2013-09-13 15:55:58','2016-03-10 11:41:49',4,'149',NULL,'dbmunirg.TG06405','OROSKI!!!',NULL,0,'2016-03-10 11:41:49'),(150,'Roberto Ortiz','2013-09-13 15:55:58','2015-11-20 11:41:01',4,'150',NULL,'dbmunirg.TG06405','PRESIDENTE ROBERTO ORTIZ!!!','Presidente Roberto Ortiz',0,NULL),(151,'Carlos Alfredo Pacheco','2013-09-13 15:55:58','2015-11-20 09:02:10',4,'151',NULL,'dbmunirg.TG06405','DOCTOR CARLOS ALFREDO PACHECO!!!','Dr. Carlos Alfredo Pacheco',0,NULL),(152,'Panamá','2013-09-13 15:55:58','2014-03-31 16:44:51',3,'152',NULL,'dbmunirg.TG06405','PANAMA!!!',NULL,0,NULL),(153,'Paso de Los Andes','2013-09-13 15:55:58','2016-03-07 13:52:27',4,'153',NULL,'dbmunirg.TG06405','PASO DE LOS ANDES!!!',NULL,0,'2016-03-07 13:52:27'),(154,'Juan José Paso','2013-09-13 15:55:58','2014-03-31 16:44:51',3,'154',NULL,'dbmunirg.TG06405','JUAN JOSE PASO!!!',NULL,0,NULL),(155,'Patagonia','2013-09-13 15:55:58','2016-01-18 12:05:12',4,'155',NULL,'dbmunirg.TG06405','PATAGONIA!!!',NULL,0,'2016-01-18 12:05:12'),(156,'Carlos Pellegrini','2013-09-13 15:55:58','2016-01-26 10:19:26',4,'156',NULL,'dbmunirg.TG06405','CARLOS PELLEGRINI!!!',NULL,0,'2016-01-26 10:19:26'),(157,'Perito Moreno','2013-09-13 15:55:58','2016-01-11 10:02:30',4,'157',NULL,'dbmunirg.TG06405','PERITO MORENO!!!',NULL,0,'2016-01-11 10:02:30'),(158,'Juan Domingo Perón','2013-09-13 15:55:58','2016-02-04 12:20:29',5,'158',NULL,'dbmunirg.TG06405','TENIENTE GENERAL JUAN DOMINGO PERON!!!','Teniente General Juan Domingo Perón',0,'2016-02-04 12:20:29'),(159,'Perú','2013-09-13 15:55:58','2016-05-10 12:33:08',4,'159',NULL,'dbmunirg.TG06405','PERU!!!',NULL,0,'2016-05-10 12:33:08'),(160,'Luis Piedrabuena','2013-09-13 15:55:58','2015-11-20 08:58:07',4,'160',NULL,'dbmunirg.TG06405','COMANDANTE LUIS PIEDRABUENA!!!','Comandante Luis Piedrabuena',0,NULL),(161,'Pioneros Fueguinos','2013-09-13 15:55:58','2014-03-31 16:44:51',3,'161',NULL,'dbmunirg.TG06405','PIONEROS FUEGUINOS!!!',NULL,0,NULL),(162,'Rodolfo Pourrain','2013-09-13 15:55:58','2016-03-11 10:58:34',4,'162',NULL,'dbmunirg.TG06405','RODOLFO POURRAIN!!!',NULL,0,'2016-03-11 10:58:34'),(163,'Posadas','2013-09-13 15:55:58','2014-03-31 16:44:51',3,'163',NULL,'dbmunirg.TG06405','POSADAS!!!',NULL,0,NULL),(164,'Prefectura Naval Argentina','2013-09-13 15:55:58','2016-01-25 12:26:50',6,'164',NULL,'dbmunirg.TG06405','PREFECTURA NAVAL ARGENTINA!!!','Prefectura Naval',0,'2016-01-25 12:26:50'),(165,'Provincias Unidas','2013-09-13 15:55:58','2016-01-14 09:49:17',5,'165',NULL,'dbmunirg.TG06405','PROVINCIAS UNIDAS!!!',NULL,0,'2016-01-14 09:49:17'),(166,'Radcking','2013-09-13 15:55:58','2014-03-31 16:44:51',3,'166',NULL,'dbmunirg.TG06405','RADCKING!!!',NULL,0,NULL),(167,'Resistencia','2013-09-13 15:55:58','2014-03-31 16:44:51',3,'167',NULL,'dbmunirg.TG06405','RESISTENCIA!!!',NULL,0,NULL),(168,'Ricardo Rojas','2013-09-13 15:55:58','2016-01-29 10:26:59',4,'168',NULL,'dbmunirg.TG06405','RICARDO ROJAS!!!',NULL,0,'2016-01-29 10:26:59'),(169,'Bernardino Rivadavia','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'169',NULL,'dbmunirg.TG06405','BERNARDINO RIVADAVIA!!!',NULL,0,NULL),(170,'Pasaje Rodolfo Rivarola','2013-09-13 15:55:57','2016-01-28 09:55:18',6,'170',NULL,'dbmunirg.TG06405','DOCTOR RODOLFO RIVAROLA!!!','Dr. Rodolfo Rivarola',0,'2016-01-28 09:55:18'),(171,'Antonio Rivero','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'171',NULL,'dbmunirg.TG06405','ANTONIO RIVERO!!!',NULL,0,NULL),(172,'Pasaje Julio Roca','2013-09-13 15:55:57','2016-01-14 12:32:36',5,'172',NULL,'dbmunirg.TG06405','JULIO ARGENTINO ROCA!!!','Julio Argentino Roca',0,'2016-01-14 12:32:36'),(173,'Belisario Roldán','2013-09-13 15:55:57','2014-03-31 16:44:51',4,'173',NULL,'dbmunirg.TG06405','BELISARIO ROLDAN!!!',NULL,0,NULL),(174,'Leonardo Rosales','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'174',NULL,'dbmunirg.TG06405','LEONARDO ROSALES!!!',NULL,0,NULL),(175,'Ruta Complementaria C','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'175',NULL,'dbmunirg.TG06405','RUTA COMPLEMENTARIA C!!!',NULL,0,NULL),(176,'Ruta Nacional Nº 3','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'176',NULL,'dbmunirg.TG06405','RUTA NACIONAL Nº 3!!!',NULL,0,NULL),(177,'Carlos Saavedra Lamas','2013-09-13 15:55:57','2016-02-23 12:57:05',4,'177',NULL,'dbmunirg.TG06405','CARLOS SAAVEDRA LAMAS!!!',NULL,0,'2016-02-23 12:57:05'),(178,'Adolfo Saldías','2013-09-13 15:55:57','2016-01-13 13:58:26',4,'178',NULL,'dbmunirg.TG06405','ADOLFO SALDIAS!!!',NULL,0,'2016-01-13 13:58:26'),(179,'Salta','2013-09-13 15:55:57','2016-03-10 09:34:32',4,'179',NULL,'dbmunirg.TG06405','SALTA!!!',NULL,0,'2016-03-10 09:34:32'),(180,'Francisco Santomé','2013-09-13 15:55:57','2016-03-10 10:08:19',4,'180',NULL,'dbmunirg.TG06405','FRANCISCO SANTOME!!!',NULL,0,'2016-03-10 10:08:19'),(181,'San Lorenzo','2013-09-13 15:55:57','2016-03-10 09:59:29',4,'181',NULL,'dbmunirg.TG06405','SAN LORENZO!!!',NULL,0,'2016-03-10 09:59:29'),(182,'Avenida San Martín','2013-09-13 15:55:57','2016-01-22 09:55:51',6,'182',NULL,'dbmunirg.TG06405','GENERAL DON JOSE DE SAN MARTIN!!!','General Don José de San Martín',0,'2016-01-22 09:55:51'),(183,'Santa Cruz','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'183',NULL,'dbmunirg.TG06405','SANTA CRUZ!!!',NULL,0,NULL),(184,'Santa Fe','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'184',NULL,'dbmunirg.TG06405','SANTA FE!!!',NULL,0,NULL),(185,'Santa Rosa','2013-09-13 15:55:57','2016-01-14 12:30:51',6,'185',NULL,'dbmunirg.TG06405','SANTA ROSA!!!',NULL,0,'2016-01-14 12:30:51'),(186,'Sargento Cabral','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'186',NULL,'dbmunirg.TG06405','SARGENTO CABRAL!!!',NULL,0,NULL),(187,'Scalabrini Ortiz','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'187',NULL,'dbmunirg.TG06405','SCALABRINI ORTIZ!!!',NULL,0,NULL),(188,'Albert Schweitzer','2013-09-13 15:55:57','2016-01-08 16:25:31',4,'188',NULL,'dbmunirg.TG06405','ALBERT SCHWEITZER!!!',NULL,0,'2016-01-08 16:25:31'),(189,'Shelknam','2013-09-13 15:55:57','2016-03-10 12:05:54',5,'189',NULL,'dbmunirg.TG06405','SHELKNAM!!!','Selknam',0,'2016-03-10 12:05:54'),(190,'José María Sobral','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'190',NULL,'dbmunirg.TG06405','JOSE MARIA SOBRAL!!!',NULL,0,NULL),(191,'Ernesto Soneyra','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'191',NULL,'dbmunirg.TG06405','ERNESTO SONEYRA!!!',NULL,0,NULL),(192,'Ramón Sosa','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'192',NULL,'dbmunirg.TG06405','RAMON SOSA!!!',NULL,0,NULL),(193,'Suecia','2013-09-13 15:55:57','2016-01-27 10:38:51',4,'193',NULL,'dbmunirg.TG06405','SUECIA!!!',NULL,0,'2016-01-27 10:38:51'),(194,'Oscar Smith','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'194',NULL,'dbmunirg.TG06405','OSCAR SMITH!!!',NULL,0,NULL),(195,'Talcahuano','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'195',NULL,'dbmunirg.TG06405','TALCAHUANO!!!',NULL,0,NULL),(196,'Tandil','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'196',NULL,'dbmunirg.TG06405','TANDIL!!!',NULL,0,NULL),(197,'Juan Bautista Thorne','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'197',NULL,'dbmunirg.TG06405','JUAN BAUTISTA THORNE!!!',NULL,0,NULL),(198,'Cirilo Tomas','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'198',NULL,'dbmunirg.TG06405','CIRILO TOMAS!!!',NULL,0,NULL),(199,'Tolhuin','2013-09-13 15:55:57','2016-03-10 11:29:20',4,'199',NULL,'dbmunirg.TG06405','TOLHUIN!!!',NULL,0,'2016-03-10 11:29:20'),(200,'Ramón Trejo Noel','2013-09-13 15:55:57','2016-01-27 09:42:58',6,'200',NULL,'dbmunirg.TG06405','RAMON TREJO NOEL!!!','Gobernador Trejo Noel',0,'2016-01-27 09:42:58'),(201,'Uani','2013-09-13 15:55:57','2016-03-10 12:02:30',4,'201',NULL,'dbmunirg.TG06405','UANI!!!',NULL,0,'2016-03-10 12:02:30'),(202,'Justo José de Urquiza','2013-09-13 15:55:57','2015-11-20 11:40:34',4,'202',NULL,'dbmunirg.TG06405','PRESIDENTE JUSTO JOSE DE URQUIZA!!!','Presidente Justo José de Urquiza',0,NULL),(203,'Ushuaia','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'203',NULL,'dbmunirg.TG06405','USHUAIA!!!',NULL,0,NULL),(204,'Uspallata','2013-09-13 15:55:57','2016-03-07 13:52:33',4,'204',NULL,'dbmunirg.TG06405','USPALLATA!!!',NULL,0,'2016-03-07 13:52:33'),(205,'Eduardo Van Aken Telmas','2013-09-13 15:55:56','2014-03-31 16:44:51',2,'205',NULL,'dbmunirg.TG06405','EDUARDO VAN AKEN TELMAS!!!',NULL,0,NULL),(206,'Venezuela','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'206',NULL,'dbmunirg.TG06405','VENEZUELA!!!',NULL,0,NULL),(207,'Luis Vernet','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'207',NULL,'dbmunirg.TG06405','LUIS VERNET!!!',NULL,0,NULL),(208,'Vicente López','2013-09-13 15:55:57','2016-05-06 10:47:41',4,'208',NULL,'dbmunirg.TG06405','VICENTE LOPEZ!!!',NULL,0,'2016-05-06 10:47:41'),(209,'Agustín Vidal','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'209',NULL,'dbmunirg.TG06405','AGUSTIN VIDAL!!!',NULL,0,NULL),(210,'Viedma','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'210',NULL,'dbmunirg.TG06405','VIEDMA!!!',NULL,0,NULL),(211,'General Villegas','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'211',NULL,'dbmunirg.TG06405','GENERAL VILLEGAS!!!',NULL,0,NULL),(212,'Roberto Wilson','2013-09-13 15:55:57','2016-03-10 09:27:21',4,'212',NULL,'dbmunirg.TG06405','ROBERTO WILSON!!!',NULL,0,'2016-03-10 09:27:21'),(213,'Wonska','2013-09-13 15:55:57','2016-03-10 11:51:51',4,'213',NULL,'dbmunirg.TG06405','WOMSKA!!!',NULL,0,'2016-03-10 11:51:51'),(214,'Yaghan','2013-09-13 15:55:57','2016-03-10 11:41:29',5,'214',NULL,'dbmunirg.TG06405','YAHGAN!!!','Yagán',0,'2016-03-10 11:41:29'),(215,'Yapeyu','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'215',NULL,'dbmunirg.TG06405','YAPEYU!!!',NULL,0,NULL),(216,'Yehuin','2013-09-13 15:55:57','2016-03-10 12:01:27',5,'216',NULL,'dbmunirg.TG06405','YEHUIN!!!',NULL,0,'2016-03-10 12:01:27'),(217,'Yewarsi','2013-09-13 15:55:57','2016-03-10 12:13:22',4,'217',NULL,'dbmunirg.TG06405','YEWARSI!!!',NULL,0,'2016-03-10 12:13:22'),(218,'Yourka','2013-09-13 15:55:57','2016-03-10 12:08:25',4,'218',NULL,'dbmunirg.TG06405','YOURKA!!!',NULL,0,'2016-03-10 12:08:25'),(219,'Yugoslavia','2013-09-13 15:55:57','2016-01-13 13:45:26',4,'219',NULL,'dbmunirg.TG06405','YUGOESLAVIA!!!',NULL,0,'2016-01-13 13:45:26'),(220,'Hipólito Irigoyen','2013-09-13 15:55:57','2015-11-20 11:40:26',4,'220',NULL,'dbmunirg.TG06405','PRESIDENTE HIPOLITO IRIGOYEN!!!','Presidente Hipólito Irigoyen',0,NULL),(221,'19 de Abril','2013-09-13 15:55:56','2016-01-28 09:59:02',3,'221',NULL,'dbmunirg.TG06405','19 DE ABRIL!!!',NULL,0,'2016-01-28 09:59:02'),(222,'Pasaje 1º de Mayo','2013-09-13 15:55:57','2016-01-11 14:59:54',5,'222',NULL,'dbmunirg.TG06405','1 DE MAYO!!!','1º de Mayo',0,'2016-01-11 14:59:54'),(223,'22 de Mayo','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'223',NULL,'dbmunirg.TG06405','22 DE MAYO!!!',NULL,0,NULL),(224,'25 de Mayo','2013-09-13 15:55:57','2016-02-26 10:03:18',4,'224',NULL,'dbmunirg.TG06405','25 DE MAYO!!!',NULL,0,'2016-02-26 10:03:18'),(225,'20 de Junio','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'225',NULL,'dbmunirg.TG06405','20 DE JUNIO!!!',NULL,0,NULL),(226,'9 de Julio','2013-09-13 15:55:57','2016-01-25 10:49:42',4,'226',NULL,'dbmunirg.TG06405','9 DE JULIO!!!',NULL,0,'2016-01-25 10:49:42'),(227,'Pasaje 9 de Julio','2013-09-13 15:55:57','2016-01-25 10:49:44',4,'227',NULL,'dbmunirg.TG06405','PASAJE 9 DE JULIO!!!',NULL,0,'2016-01-25 10:49:44'),(228,'11 de Julio','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'228',NULL,'dbmunirg.TG06405','11 DE JULIO!!!',NULL,0,NULL),(229,'17 de Agosto','2013-09-13 15:55:56','2014-03-31 16:44:51',2,'229',NULL,'dbmunirg.TG06405','17 DE AGOSTO!!!',NULL,0,NULL),(230,'12 de Octubre','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'230',NULL,'dbmunirg.TG06405','12 DE OCTUBRE!!!',NULL,0,NULL),(231,'10 de Diciembre','2013-09-13 15:55:57','2016-01-13 12:55:13',5,'231',NULL,'dbmunirg.TG06405','10 DE DICIEMBRE!!!',NULL,0,'2016-01-13 12:55:13'),(232,'Juan Domingo Bernhardt','2013-09-13 15:55:57','2016-03-11 11:05:49',6,'232',NULL,'dbmunirg.TG06405','TENIENTE 1º JUAN DOMINGO  BERNHARDT!!!','Teniente 1º Juan Domingo Bernhardt',0,'2016-03-11 11:05:49'),(233,'Los Coihues','2013-09-13 15:55:57','2016-03-10 10:30:40',4,'233',NULL,'dbmunirg.TG06405','LOS COIHUES!!!',NULL,0,'2016-03-10 10:30:40'),(234,'Tucumán','2013-09-13 15:55:57','2016-03-10 09:34:37',3,'234',NULL,'dbmunirg.TG06405','TUCUMAN!!!',NULL,0,'2016-03-10 09:34:37'),(235,'Intevu VIII Casa','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'235',NULL,'dbmunirg.TG06405','INTEVU VIII CASA!!!',NULL,0,NULL),(236,'Intevu IX Casa','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'236',NULL,'dbmunirg.TG06405','INTEVU IX CASA!!!',NULL,0,NULL),(237,'Intevu X Casa','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'237',NULL,'dbmunirg.TG06405','INTEVU X CASA!!!',NULL,0,NULL),(238,'Intevu XI Casa','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'238',NULL,'dbmunirg.TG06405','INTEVU XI CASA!!!',NULL,0,NULL),(239,'Intevu XII A Casa','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'239',NULL,'dbmunirg.TG06405','INTEVU XII A CASA!!!',NULL,0,NULL),(240,'Intevu XII B Casa','2013-09-13 15:55:57','2014-03-31 16:44:51',2,'240',NULL,'dbmunirg.TG06405','INTEVU XII B CASA!!!',NULL,0,NULL),(241,'Costa Rica','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'241',NULL,'dbmunirg.TG06405','COSTA RICA!!!',NULL,0,NULL),(242,'Carlos Alberto Lisa','2013-09-13 15:55:57','2016-01-11 09:43:06',4,'242',NULL,'dbmunirg.TG06405','CARLOS ALBERTO LISA!!!',NULL,0,'2016-01-11 09:43:06'),(243,'Lisa de Trejo','2013-09-13 15:55:57','2016-03-10 09:56:02',5,'243',NULL,'dbmunirg.TG06405','OFELIA OLGA LISA DE TREJO!!!','Ofelia Olga Lisa de Trejo',0,'2016-03-10 09:56:02'),(244,'Ricardo Luis Sica','2013-09-13 15:55:57','2016-01-11 09:43:41',5,'244',NULL,'dbmunirg.TG06405','RICARDO LUIS SICA!!!',NULL,0,'2016-01-11 09:43:41'),(245,'Amadeo Sabattini','2013-09-13 15:55:57','2016-03-10 10:06:09',4,'245',NULL,'dbmunirg.TG06405','AMADEO SABATTINI!!!',NULL,0,'2016-03-10 10:06:09'),(246,'Guayaquil','2013-09-13 15:55:57','2016-01-12 09:18:41',4,'246',NULL,'dbmunirg.TG06405','GUAYAQUIL!!!',NULL,0,'2016-01-12 09:18:41'),(247,'Alejandro Fleming','2013-09-13 15:55:57','2016-02-17 10:27:25',4,'247',NULL,'dbmunirg.TG06405','DOCTOR ALEJANDRO FLEMING!!!','Dr. Alejandro Fleming',0,'2016-02-17 10:27:25'),(248,'Albert Bruce Sabin','2013-09-13 15:55:57','2016-03-07 13:46:31',3,'248',NULL,'dbmunirg.TG06405','ALBERT BRUCE SABIN!!!',NULL,0,'2016-03-07 13:46:31'),(249,'Juana Manuela Gorriti','2013-09-13 15:55:57','2016-03-10 11:47:45',10,'454',NULL,'dbmunirg.TG06405','JUANA MANUELA GORRITI!!!','Gorriti',0,'2016-03-10 11:47:45'),(250,'Simón Bolívar','2013-09-13 15:55:57','2016-03-07 13:34:01',4,'250',NULL,'dbmunirg.TG06405','SIMON BOLIVAR!!!',NULL,0,'2016-03-07 13:34:01'),(251,'Mariano Moreno','2013-09-13 15:55:57','2016-03-07 16:45:26',4,'251',NULL,'dbmunirg.TG06405','MARIANO MORENO!!!',NULL,0,'2016-03-07 16:45:26'),(252,'Vuelta de Obligado','2013-09-13 15:55:57','2016-03-09 10:40:21',4,'252',NULL,'dbmunirg.TG06405','VUELTA DE OBLIGADO!!!',NULL,0,'2016-03-09 10:40:21'),(253,'Juan Visic','2013-09-13 15:55:57','2016-03-11 12:07:49',4,'253',NULL,'dbmunirg.TG06405','JUAN VISIC!!!',NULL,0,'2016-03-11 12:07:49'),(254,'Gerónimo Vukasovic','2013-09-13 15:55:57','2016-03-11 12:21:32',6,'254',NULL,'dbmunirg.TG06405','JERONIMO VUKASOVIC!!!',NULL,0,'2016-03-11 12:21:32'),(255,'Vicente Stanic','2013-09-13 15:55:57','2016-03-11 12:33:20',4,'255',NULL,'dbmunirg.TG06405','VICENTE STANIC!!!',NULL,0,'2016-03-11 12:33:20'),(256,'Raúl Chifflet','2013-09-13 15:55:57','2016-03-15 12:57:16',5,'256',NULL,'dbmunirg.TG06405','DOCTOR RAUL CHIFFLET!!!','Dr. Raúl Chifflet',0,'2016-03-15 12:57:16'),(257,'Ramón Díaz Chara','2013-09-13 15:55:57','2014-03-31 16:44:51',4,'257',NULL,'dbmunirg.TG06405','RAMON DIAZ CHARA!!!',NULL,0,NULL),(258,'Elvi Garay','2013-09-13 15:55:57','2016-03-15 12:43:44',3,'258',NULL,'dbmunirg.TG06405','ELVI GARAY!!!',NULL,0,'2016-03-15 12:43:44'),(259,'Puerto Rico','2013-09-13 15:55:57','2016-05-06 10:41:42',4,'259',NULL,'dbmunirg.TG06405','PUERTO RICO!!!',NULL,0,'2016-05-06 10:41:42'),(260,'Guatemala','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'260',NULL,'dbmunirg.TG06405','GUATEMALA!!!',NULL,0,NULL),(261,'Posta de Yatasto','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'261',NULL,'dbmunirg.TG06405','POSTA DE YATASTO!!!',NULL,0,NULL),(262,'Hermana Berta Weber','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'262',NULL,'dbmunirg.TG06405','HERMANA BERTA WEBER!!!',NULL,0,NULL),(263,'Domingo Faustino Sarmiento','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'263',NULL,'dbmunirg.TG06405','DOMINGO FAUSTINO SARMIENTO!!!',NULL,0,NULL),(264,'Salvador María del Carmen','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'264',NULL,'dbmunirg.TG06405','SALVADOR MARIA DEL CARMEN!!!',NULL,0,NULL),(265,'17 de Octubre','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'265',NULL,'dbmunirg.TG06405','17 DE OCTUBRE!!!',NULL,0,NULL),(266,'26 de Julio','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'266',NULL,'dbmunirg.TG06405','26 DE JULIO!!!',NULL,0,NULL),(267,'Hugo del Carril','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'267',NULL,'dbmunirg.TG06405','HUGO DEL CARRIL!!!',NULL,0,NULL),(268,'Felipe Varela','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'268',NULL,'dbmunirg.TG06405','FELIPE VARELA!!!',NULL,0,NULL),(269,'José Viqueira','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'269',NULL,'dbmunirg.TG06405','JOSE VIQUEIRA!!!',NULL,0,NULL),(270,'Héctor José Campora','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'270',NULL,'dbmunirg.TG06405','HECTOR JOSE CAMPORA!!!',NULL,0,NULL),(271,'Mariquita Sánchez de Thompson','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'271',NULL,'dbmunirg.TG06405','MARIQUITA SANCHEZ DE THOMPSON!!!',NULL,0,NULL),(272,'Rafaela Ishton','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'272',NULL,'dbmunirg.TG06405','RAFAELA ISHTON!!!',NULL,0,NULL),(273,'El Puestero','2013-09-13 15:55:57','2014-03-31 16:44:50',3,'273',NULL,'dbmunirg.TG06405','EL PUESTERO!!!',NULL,0,NULL),(274,'El Ovejero','2013-09-13 15:55:57','2014-03-31 16:44:50',3,'274',NULL,'dbmunirg.TG06405','EL OVEJERO!!!',NULL,0,NULL),(275,'El Esquilador','2013-09-13 15:55:57','2014-03-31 16:44:50',3,'275',NULL,'dbmunirg.TG06405','EL ESQUILADOR!!!',NULL,0,NULL),(276,'Federico Echelaine','2013-09-13 15:55:57','2016-01-27 11:50:46',4,'276',NULL,'dbmunirg.TG06405','FEDERICO ECHELAINE!!!',NULL,0,'2016-01-27 11:50:46'),(277,'Roberto Koch','2013-09-13 15:55:56','2016-02-17 10:23:39',4,'277',NULL,'dbmunirg.TG06405','DOCTOR ROBERTO KOCH!!!','Dr. Roberto Koch',0,'2016-02-17 10:23:39'),(278,'Federico Leloir','2013-09-13 15:55:57','2016-03-07 13:44:42',4,'278',NULL,'dbmunirg.TG06405','FEDERICO LELOIR!!!',NULL,0,'2016-03-07 13:43:41'),(279,'Domingo Savio','2013-09-13 15:55:56','2014-03-31 16:44:50',2,'279',NULL,'dbmunirg.TG06405','DOMINGO SAVIO!!!',NULL,0,NULL),(280,'Roque Sáenz Peña','2013-09-13 15:55:57','2016-02-17 10:28:52',4,'280',NULL,'dbmunirg.TG06405','ROQUE SAENZ PENA!!!',NULL,0,'2016-02-17 10:28:52'),(281,'Facundo Quiroga','2013-09-13 15:55:57','2016-03-07 13:40:16',4,'281',NULL,'dbmunirg.TG06405','FACUNDO QUIROGA!!!',NULL,0,'2016-03-07 13:40:16'),(282,'María Curie','2013-09-13 15:55:57','2016-03-10 09:57:03',4,'282',NULL,'dbmunirg.TG06405','MARIA CURIE!!!',NULL,0,'2016-03-10 09:57:03'),(283,'José Romero','2013-09-13 15:55:57','2016-03-11 12:12:55',4,'283',NULL,'dbmunirg.TG06405','JOSE ROMERO!!!',NULL,0,'2016-03-11 12:12:55'),(284,'Milton Roberts','2013-09-13 15:55:57','2016-03-11 12:27:48',4,'284',NULL,'dbmunirg.TG06405','MILTON ROBERTS!!!',NULL,0,'2016-03-11 12:27:48'),(285,'Luis Garibaldi Honte','2013-09-13 15:55:57','2016-03-11 12:55:10',4,'285',NULL,'dbmunirg.TG06405','LUIS GARIBALDI HONTE!!!',NULL,0,'2016-03-11 12:55:10'),(286,'Javier Puget','2013-09-13 15:55:56','2016-03-15 12:52:13',4,'286',NULL,'dbmunirg.TG06405','JAVIER \"PACO\" PUGET!!!','Javier \"Paco\" Puget',0,'2016-03-15 12:52:13'),(287,'Juan Eladio Ibarra','2013-09-13 15:55:57','2016-03-14 13:49:53',4,'287',NULL,'dbmunirg.TG06405','JUAN ELADIO IBARRA!!!',NULL,0,'2016-03-14 13:49:53'),(288,'Ramón Lucio Cortez','2013-09-13 15:55:56','2016-03-15 12:44:56',3,'288',NULL,'dbmunirg.TG06405','RAMON LUCIO CORTEZ!!!',NULL,0,'2016-03-15 12:44:56'),(289,'Honduras','2013-09-13 15:55:56','2014-03-31 16:44:50',2,'289',NULL,'dbmunirg.TG06405','HONDURAS!!!',NULL,0,NULL),(290,'Louis Pasteur','2013-09-13 15:55:57','2014-03-31 16:44:50',3,'290',NULL,'dbmunirg.TG06405','LOUIS PASTEUR!!!',NULL,0,NULL),(291,'Jorge Luis Borges','2013-09-13 15:55:57','2014-03-31 16:44:50',3,'291',NULL,'dbmunirg.TG06405','JORGE LUIS BORGES!!!',NULL,0,NULL),(292,'Batalla de Pavon','2013-09-13 15:55:57','2014-03-31 16:44:50',3,'292',NULL,'dbmunirg.TG06405','BATALLA DE PAVON!!!',NULL,0,NULL),(293,'Juan Bautista de La Salle','2013-09-13 15:55:57','2014-03-31 16:44:50',3,'293',NULL,'dbmunirg.TG06405','JUAN BAUTISTADE LA SALLE!!!',NULL,0,NULL),(294,'Obispo Trejo','2013-09-13 15:55:57','2016-01-20 10:03:10',4,'294',NULL,'dbmunirg.TG06405','OBISPO TREJO!!!',NULL,0,'2016-01-20 10:03:10'),(295,'8 de Octubre','2013-09-13 15:55:57','2014-03-31 16:44:50',3,'295',NULL,'dbmunirg.TG06405','8 DE OCTUBRE!!!',NULL,0,NULL),(296,'1 de Julio','2013-09-13 15:55:57','2014-03-31 16:44:50',3,'296',NULL,'dbmunirg.TG06405','1 DE JULIO!!!',NULL,0,NULL),(297,'Ramón Carrillo','2013-09-13 15:55:57','2014-03-31 16:44:50',3,'297',NULL,'dbmunirg.TG06405','RAMON CARRILLO!!!',NULL,0,NULL),(298,'Enrique Sampay','2013-09-13 15:55:57','2014-03-31 16:44:50',3,'298',NULL,'dbmunirg.TG06405','ENRIQUE SAMPAY!!!',NULL,0,NULL),(299,'José Ignacio Rucci','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'299',NULL,'dbmunirg.TG06405','JOSE IGNACIO RUCCI!!!',NULL,0,NULL),(300,'Islas Georgias','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'300',NULL,'dbmunirg.TG06405','ISLAS GEORGIAS!!!',NULL,0,NULL),(301,'Puyen','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'301',NULL,'dbmunirg.TG06405','PUYEN!!!',NULL,0,NULL),(302,'Francisco Minkyol','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'302',NULL,'dbmunirg.TG06405','FRANCISCO MINKYOL!!!',NULL,0,NULL),(303,'El Botero','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'303',NULL,'dbmunirg.TG06405','EL BOTERO!!!',NULL,0,NULL),(304,'Juan Vicente Portolan','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'304',NULL,'dbmunirg.TG06405','JUAN VICENTE PORTOLAN!!!',NULL,0,NULL),(305,'El Alambrador','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'305',NULL,'dbmunirg.TG06405','EL ALAMBRADOR!!!',NULL,0,NULL),(306,'Gabriela Mistral','2013-09-13 15:55:57','2016-03-10 11:48:12',4,'306',NULL,'dbmunirg.TG06405','GABRIELA MISTRAL!!!',NULL,0,'2016-03-10 11:48:12'),(307,'Paula Albarracín','2013-09-13 15:55:57','2016-03-10 13:55:25',4,'307',NULL,'dbmunirg.TG06405','PAULA ALBARRACIN!!!',NULL,0,'2016-03-10 13:55:25'),(308,'Remedios de Escalada','2013-09-13 15:55:57','2016-03-10 13:30:24',4,'308',NULL,'dbmunirg.TG06405','REMEDIOS DE ESCALADA!!!',NULL,0,'2016-03-10 13:30:24'),(309,'Luisa Ruffino','2013-09-13 15:55:57','2016-03-10 13:26:32',5,'309',NULL,'dbmunirg.TG06405','HERMANA LUISA RUFFINO!!!','Hermana Luisa Ruffino',0,'2016-03-10 13:25:23'),(310,'Juana Azurduy','2013-09-13 15:55:56','2014-03-31 16:44:51',2,'310',NULL,'dbmunirg.TG06405','JUANA AZURDUY!!!',NULL,0,NULL),(311,'Hermana Rosa Massobrio','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'311',NULL,'dbmunirg.TG06405','HERMANA ROSA MASSOBRIO!!!',NULL,0,NULL),(312,'Rosa Gutierrez','2013-09-13 15:55:57','2016-01-27 10:17:54',5,'312',NULL,'dbmunirg.TG06405','HERMANA ROSA GUTIERREZ!!!',NULL,0,'2016-01-27 10:17:54'),(313,'Indira Gandhi','2013-09-13 15:55:57','2016-03-10 09:55:24',4,'313',NULL,'dbmunirg.TG06405','INDIRA GANDHI!!!',NULL,0,'2016-03-10 09:55:24'),(314,'Victoria Ocampo','2013-09-13 15:55:57','2016-03-10 12:30:44',4,'314',NULL,'dbmunirg.TG06405','VICTORIA OCAMPO!!!',NULL,0,'2016-03-10 12:30:44'),(315,'Alfonsina Storni','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'315',NULL,'dbmunirg.TG06405','ALFONSINA STORNI!!!',NULL,0,NULL),(316,'Flora Scott de Olmedo','2013-09-13 15:55:57','2016-03-10 12:59:14',4,'316',NULL,'dbmunirg.TG06405','FLORA SCOTT DE OLMEDO!!!',NULL,0,'2016-03-10 12:59:14'),(317,'William Alfredo Bishop','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'317',NULL,'dbmunirg.TG06405','WILLIAN ALFREDO BISHOP!!!',NULL,0,NULL),(318,'Sabino Andrade','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'318',NULL,'dbmunirg.TG06405','SABINO ANDRADE!!!',NULL,0,NULL),(319,'Julio Saturnino Castillo','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'319',NULL,'dbmunirg.TG06405','JULIO SATURNINO CASTILLO!!!',NULL,0,NULL),(320,'Uruguay','2013-09-13 15:55:57','2016-05-05 13:47:05',4,'320',NULL,'dbmunirg.TG06405','URUGUAY!!!',NULL,0,'2016-05-05 13:47:05'),(321,'Yahalve','2013-09-13 15:55:57','2016-03-10 11:44:26',6,'321',NULL,'dbmunirg.TG06405','YAHALVE!!!',NULL,0,'2016-03-10 11:44:26'),(322,'Ricardo Balbín','2013-09-13 15:55:57','2016-03-11 11:56:06',5,'322',NULL,'dbmunirg.TG06405','DOCTOR RICARDO BALBIN!!!','Dr. Ricardo Balbín',0,'2016-03-11 11:56:06'),(323,'Ricardo Prada Villa','2013-09-13 15:55:57','2016-03-10 10:10:36',6,'323',NULL,'dbmunirg.TG06405','LEGISLADOR RICARDO PRADA VILLA!!!','Legislador Ricardo Prada Villa',0,'2016-03-10 10:10:36'),(324,'Pasaje Ciudad Nueva','2013-09-13 15:55:57','2016-01-12 09:23:16',5,'324',NULL,'dbmunirg.TG06405','CIUDAD NUEVA!!!','Ciudad Nueva',0,'2016-01-12 09:23:16'),(325,'Venus Videla','2013-09-13 15:55:57','2016-01-12 10:01:50',4,'325',NULL,'dbmunirg.TG06405','VENUS VIDELA!!!',NULL,0,'2016-01-12 10:01:50'),(326,'El Maitén','2013-09-13 15:55:57','2016-03-10 10:47:04',4,'326',NULL,'dbmunirg.TG06405','EL MAITEN!!!',NULL,0,'2016-03-10 10:47:04'),(327,'26 de Abril','2013-09-13 15:55:57','2016-01-11 10:54:48',5,'327',NULL,'dbmunirg.TG06405','26 DE ABRIL!!!',NULL,0,'2016-01-11 10:54:48'),(328,'1 de Junio','2013-09-13 15:55:57','2016-01-11 09:42:54',7,'328',NULL,'dbmunirg.TG06405','1 DE JUNIO!!!',NULL,0,'2016-01-11 09:42:54'),(329,'Almirante Marcos Zar','2013-09-13 15:55:56','2014-03-31 16:44:51',2,'329',NULL,'dbmunirg.TG06405','ALMIRANTE MARCOS ZAR!!!',NULL,0,NULL),(330,'Transporte Santa Micaela','2013-09-13 15:55:57','2016-03-11 11:33:15',4,'330',NULL,'dbmunirg.TG06405','TRANSPORTE SANTA MICAELA!!!',NULL,0,'2016-03-11 11:33:15'),(331,'Base Antártica Esperanza','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'331',NULL,'dbmunirg.TG06405','BASE ANTARTICA ESPERANZA!!!',NULL,0,NULL),(332,'Base Antártica San Martín','2013-09-13 15:55:57','2016-03-11 13:12:23',4,'332',NULL,'dbmunirg.TG06405','BASE ANTARTICA SAN MARTIN!!!',NULL,0,'2016-03-11 13:12:23'),(333,'Pedro Edgardo Giacchino','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'333',NULL,'dbmunirg.TG06405','PEDRO EDGARDO GIACCHINO!!!',NULL,0,NULL),(334,'Julio Castillo','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'334',NULL,'dbmunirg.TG06405','JULIO CASTILLO!!!',NULL,0,NULL),(335,'Rodríguez Néstor','2013-09-13 15:55:56','2014-03-31 16:44:51',2,'335',NULL,'dbmunirg.TG06405','RODRIGUEZ NESTOR!!!',NULL,0,NULL),(336,'Juárez Víctor Hugo','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'336',NULL,'dbmunirg.TG06405','JUAREZ VICTOR HUGO!!!',NULL,0,NULL),(337,'Ramírez Ricardo','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'337',NULL,'dbmunirg.TG06405','RAMIREZ RICARDO!!!',NULL,0,NULL),(338,'Robledo Sergio','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'338',NULL,'dbmunirg.TG06405','ROBLEDO SERGIO!!!',NULL,0,NULL),(339,'Iniguez Omar','2013-09-13 15:55:56','2014-03-31 16:44:51',2,'339',NULL,'dbmunirg.TG06405','INIGUEZ OMAR!!!',NULL,0,NULL),(340,'Galarza José','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'340',NULL,'dbmunirg.TG06405','GALARZA JOSE!!!',NULL,0,NULL),(341,'Monzón Eleodoro','2013-09-13 15:55:57','2014-03-31 16:44:51',4,'341',NULL,'dbmunirg.TG06405','MONZON ELEODORO!!!',NULL,0,NULL),(342,'Rava Juan','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'342',NULL,'dbmunirg.TG06405','RAVA JUAN!!!',NULL,0,NULL),(343,'Davalos Juan','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'343',NULL,'dbmunirg.TG06405','DAVALOS JUAN!!!',NULL,0,NULL),(344,'Aguirre Félix','2013-09-13 15:55:56','2014-03-31 16:44:51',2,'344',NULL,'dbmunirg.TG06405','AGUIRRE FELIX!!!',NULL,0,NULL),(345,'González Juan','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'345',NULL,'dbmunirg.TG06405','GONZALEZ JUAN!!!',NULL,0,NULL),(346,'Caviglioli Hugo','2013-09-13 15:55:56','2014-03-31 16:44:51',2,'346',NULL,'dbmunirg.TG06405','CAVIGLIOLI HUGO!!!',NULL,0,NULL),(347,'Pereyra Diego','2013-09-13 15:55:56','2014-03-31 16:44:51',2,'347',NULL,'dbmunirg.TG06405','PEREYRA DIEGO!!!',NULL,0,NULL),(348,'Petrone Aldo','2013-09-13 15:55:56','2014-03-31 16:44:51',2,'348',NULL,'dbmunirg.TG06405','PETRONE ALDO!!!',NULL,0,NULL),(349,'Cerles Héctor','2013-09-13 15:55:56','2014-03-31 16:44:51',2,'349',NULL,'dbmunirg.TG06405','CERLES HECTOR!!!',NULL,0,NULL),(350,'2 de Abril','2013-09-13 15:55:56','2014-03-31 16:44:51',2,'350',NULL,'dbmunirg.TG06405','2 DE ABRIL!!!',NULL,0,NULL),(351,'19 de Noviembre','2013-09-13 15:55:56','2014-03-31 16:44:51',2,'351',NULL,'dbmunirg.TG06405','19 DE NOVIEMBRE!!!',NULL,0,NULL),(352,'Puerto Argentino','2013-09-13 15:55:56','2014-03-31 16:44:51',2,'352',NULL,'dbmunirg.TG06405','PUERTO ARGENTINO!!!',NULL,0,NULL),(353,'Península de Fraycinet','2013-09-13 15:55:56','2014-03-31 16:44:51',2,'353',NULL,'dbmunirg.TG06405','PENINSULA DE FRAYCINET!!!',NULL,0,NULL),(355,'Cabo 1º José Gómez','2013-09-13 15:55:57','2016-03-15 13:00:41',8,'355',NULL,'dbmunirg.TG06405','CABO 1RO. J.E. GOMEZ!!!','Cabo 1º J. E. Gómez',0,'2016-03-15 13:00:41'),(356,'San Cayetano','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'356',NULL,'dbmunirg.TG06405','SAN CAYETANO!!!',NULL,0,NULL),(357,'Nuestra Sra. de Itatí','2013-09-13 16:13:21','2014-03-31 16:44:51',3,'357',NULL,'dbmunirg.TG06405','NUESTRA SRA.DE ITATI!!!',NULL,0,NULL),(358,'Kapaach','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'358',NULL,'dbmunirg.TG06405','KAPAACH!!!',NULL,0,NULL),(359,'Kaupen','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'359',NULL,'dbmunirg.TG06405','KAUPEN!!!',NULL,0,NULL),(360,'Esteban Martínez Martos','2013-09-13 15:55:57','2016-05-10 09:53:01',4,'360',NULL,'dbmunirg.TG06405','ESTEBAN MARTINEZ MARTOS!!!',NULL,0,'2016-05-10 09:53:01'),(361,'Santiago Ojeda','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'361',NULL,'dbmunirg.TG06405','SANTIAGO OJEDA!!!',NULL,0,NULL),(362,'Sara Rosa Delich','2013-09-13 15:55:57','2016-03-10 12:23:12',4,'362',NULL,'dbmunirg.TG06405','SARA ROSA DELICH!!!',NULL,0,'2016-03-10 12:23:12'),(363,'Alfonso David Kovacic','2013-09-13 15:55:57','2016-05-10 10:01:25',5,'363',NULL,'dbmunirg.TG06405','ALFONSO DAVID KOVACIC!!!',NULL,0,'2016-05-10 10:01:25'),(364,'Esteban Rakela','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'364',NULL,'dbmunirg.TG06405','ESTEBAN RAKELA!!!',NULL,0,NULL),(365,'Nicolás Jorge Martinic Beros','2013-09-13 15:55:57','2016-05-10 11:42:04',4,'365',NULL,'dbmunirg.TG06405','NICOLAS JORGE MARTINIC BEROS!!!',NULL,0,'2016-05-10 11:42:04'),(366,'Virgen Milagrosa','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'366',NULL,'dbmunirg.TG06405','VIRGEN MILAGROSA!!!',NULL,0,NULL),(367,'Pedro Triviño','2013-09-13 15:55:57','2014-03-31 16:44:51',3,'367',NULL,'dbmunirg.TG06405','PEDRO TRIVIÑO!!!',NULL,0,NULL),(368,'René Favaloro','2013-09-13 15:55:57','2015-11-20 09:02:01',4,'368',NULL,'dbmunirg.TG06405','DOCTOR RENE FAVALORO!!!','Dr. René Favaloro',0,NULL),(369,'Roque Mario Trocello','2013-09-13 15:55:57','2016-05-06 11:24:37',4,'369',NULL,'dbmunirg.TG06405','ROQUE MARIO TROCELLO!!!',NULL,0,'2016-05-06 11:24:37'),(370,'Domingo Hugo Chicahuala','2013-09-13 15:55:57','2016-05-06 11:25:11',4,'370',NULL,'dbmunirg.TG06405','DOMINGO HUGO CHICAHUALA!!!',NULL,0,'2016-05-06 11:25:11'),(371,'Provincia de La Pampa','2013-09-13 15:55:56','2014-03-31 16:44:51',2,'371',NULL,'dbmunirg.TG06405','PROVINCIA DE LA PAMPA!!!',NULL,0,NULL),(372,'Pasaje Corbatta','2013-09-13 15:55:57','2016-03-10 09:58:36',5,'372',NULL,'dbmunirg.TG06405','OMAR ORESTE CORBATTA!!!','Omar Oreste Corbatta',0,'2016-03-10 09:58:36'),(373,'Lola Mora','2013-09-13 15:55:58','2016-05-06 13:46:13',4,'373',NULL,'dbmunirg.TG06405','LOLA MORA!!!',NULL,0,'2016-05-06 13:46:13'),(374,'Base Marambio','2013-09-13 15:55:58','2016-03-22 11:24:47',4,'374',NULL,'dbmunirg.TG06405','BASE MARAMBIO!!!',NULL,0,'2016-03-22 11:24:47'),(375,'Monseñor Enrique Angelelli','2013-09-13 15:55:58','2016-04-25 12:05:35',4,'375',NULL,'dbmunirg.TG06405','MONSEÑOR ENRIQUE ANGELELLI!!!',NULL,0,'2016-04-25 12:05:35'),(376,'Allen Francis Gardiner','2013-09-13 15:55:58','2016-04-25 12:03:26',4,'376',NULL,'dbmunirg.TG06405','ALLEN FRANCIS GARDINER!!!',NULL,0,'2016-04-25 12:03:26'),(377,'Rompehielos ARA Almirante Irízar','2013-09-13 15:55:57','2014-03-31 16:44:51',4,'377',NULL,'dbmunirg.TG06405','A.R.A.R. ROMPEHIELOS ALMIRANTE IRIZAR!!!',NULL,0,NULL),(378,'Héroes de Malvinas','2013-09-13 15:55:57','2016-03-18 11:01:27',3,'378',NULL,'dbmunirg.TG06405','HEROES DE MALVINAS!!!',NULL,0,'2016-03-18 11:01:27'),(379,'Islas Orcadas del Sur','2013-09-13 15:55:57','2016-03-18 10:57:28',3,'379',NULL,'dbmunirg.TG06405','ISLAS ORCADAS DEL SUR!!!',NULL,0,'2016-03-18 10:57:28'),(381,'Policía Fueguina','2013-09-13 15:55:58','2016-05-06 11:55:51',4,'381',NULL,'dbmunirg.TG06405','POLICIA FUEGUINA!!!',NULL,0,'2016-05-06 11:55:51'),(382,'Uribe Santos Segundo','2013-09-13 15:55:58','2016-05-10 10:03:06',4,'382',NULL,'dbmunirg.TG06405','URIBE SANTOS SEGUNDO!!!',NULL,0,'2016-05-10 10:03:06'),(383,'Luján','2013-09-13 15:55:58','2014-03-31 16:44:51',3,'383',NULL,'dbmunirg.TG06405','LUJAN!!!',NULL,0,NULL),(385,'Laura del Carmen Vicuña','2013-09-13 15:55:58','2016-03-09 11:43:27',4,'385',NULL,'dbmunirg.TG06405','LAURA DEL CARMEN VICUÑA!!!',NULL,0,'2016-03-09 11:43:27'),(386,'Hermana María Ruiz','2013-09-13 15:55:58','2016-03-09 11:42:14',6,'386',NULL,'dbmunirg.TG06405','HERMANA NOEMI MARIA RUIZ!!!','Hermana Noemí María Ruiz',0,'2016-03-09 11:42:14'),(387,'Hermana Antonieta Tapparello','2013-09-13 15:55:58','2016-03-09 11:34:16',4,'387',NULL,'dbmunirg.TG06405','HERMANA ANTONIETA TAPPARELLO!!!',NULL,0,'2016-03-09 11:34:16'),(388,'Hermana María Rodas','2013-09-13 15:55:58','2016-03-09 11:34:14',4,'388',NULL,'dbmunirg.TG06405','HERMANA MARIA RODAS!!!',NULL,0,'2016-03-09 11:34:14'),(389,'Santa María Dominga Mazzarello','2013-09-13 15:55:58','2016-03-09 11:45:42',4,'389',NULL,'dbmunirg.TG06405','SANTA MARIA DOMINGA MAZZARELLO!!!',NULL,0,'2016-03-09 11:45:42'),(390,'Ciudad de Rosario','2013-09-13 15:55:58','2016-03-10 10:25:06',4,'390',NULL,'dbmunirg.TG06405','CIUDAD DE ROSARIO!!!',NULL,0,'2016-03-10 10:25:06'),(391,'Camilo Antonio Giamarini','2013-09-13 15:55:58','2014-03-31 16:44:51',3,'391',NULL,'dbmunirg.TG06405','CAMILO ANTONIO GIAMARINI!!!',NULL,0,NULL),(392,'Julio Cortázar','2013-09-13 15:55:58','2014-03-31 16:44:51',3,'392',NULL,'dbmunirg.TG06405','JULIO CORTAZAR!!!',NULL,0,NULL),(393,'Juan Manuel Fangio','2013-09-13 15:55:58','2016-05-06 11:23:18',4,'393',NULL,'dbmunirg.TG06405','JUAN MANUEL FANGIO!!!',NULL,0,'2016-05-06 11:23:18'),(394,'Oscar Alfredo Gálvez','2013-09-13 15:55:58','2016-05-06 11:16:30',4,'394',NULL,'dbmunirg.TG06405','OSCAR ALFREDO GALVEZ!!!',NULL,0,'2016-05-06 11:16:30'),(395,'Albatros Real','2013-09-13 15:55:58','2014-03-31 16:44:51',3,'395',NULL,'dbmunirg.TG06405','ALBATROS REAL!!!',NULL,0,NULL),(396,'Playero Trinador','2013-09-13 15:55:57','2016-03-10 11:11:49',4,'396',NULL,'dbmunirg.TG06405','PLAYERO TRINADOR!!!',NULL,0,'2016-03-10 11:11:49'),(397,'Playero Rojizo','2013-09-13 15:55:58','2016-03-10 11:11:18',4,'397',NULL,'dbmunirg.TG06405','PLAYERO ROJIZO!!!',NULL,0,'2016-03-10 11:11:18'),(398,'Vuelvepiedras','2013-09-13 15:55:57','2016-03-10 11:11:13',4,'398',NULL,'dbmunirg.TG06405','VUELVEPIEDRAS!!!',NULL,0,'2016-03-10 11:11:13'),(399,'Faustino Minicci','2013-09-13 15:55:58','2016-05-10 13:05:36',5,'399',NULL,'dbmunirg.TG06405','HERMANO COADJUTOR FAUSTINO MINICCI!!!','Hermano Coadjutor Faustino Minicci',0,'2016-05-10 13:05:36'),(400,'Jorge Eterovic','2013-09-13 15:55:56','2016-05-10 12:43:51',4,'400',NULL,'dbmunirg.TG06405','HERMANO COADJUTOR JORGE ETEROVIC!!!','Hermano Coadjutor Jorge Eterovic',0,'2016-05-10 12:43:51'),(401,'Nuestra Señora de La Candelaria','2013-09-13 15:55:57','2016-05-10 12:43:58',4,'401',NULL,'dbmunirg.TG06405','NUESTRA SEÑORA DE LA CANDELARIA!!!',NULL,0,'2016-05-10 12:43:58'),(402,'Miguel Bonucelli','2013-09-13 15:55:57','2016-05-10 12:44:36',6,'402',NULL,'dbmunirg.TG06405','PADRE MIGUEL BONUCELLI!!!','Padre Miguel Bonucelli',0,'2016-05-10 12:44:36'),(403,'Playero Blanco','2013-09-13 15:55:57','2016-03-10 11:07:47',4,'403',NULL,'dbmunirg.TG06405','PLAYERO BLANCO!!!',NULL,0,'2016-03-10 11:07:47'),(404,'Chorlo Doble Collar','2013-09-13 15:55:57','2016-03-10 11:06:21',4,'404',NULL,'dbmunirg.TG06405','CHORLO DOBLE COLLAR!!!',NULL,0,'2016-03-10 11:06:21'),(405,'Chorlo Pecho Castaño','2013-09-13 15:55:57','2016-03-10 11:05:17',4,'405',NULL,'dbmunirg.TG06405','CHORLO PECHO CASTAÑO!!!',NULL,0,'2016-03-10 11:05:17'),(406,'Chorlo Ceniciento','2013-09-13 15:55:57','2016-03-10 11:03:45',4,'406',NULL,'dbmunirg.TG06405','CHORLO CENICIENTO!!!',NULL,0,'2016-03-10 11:03:45'),(407,'Chorlo Ártico','2013-09-13 15:55:57','2016-03-10 11:02:36',4,'407',NULL,'dbmunirg.TG06405','CHORLO ARTICO!!!',NULL,0,'2016-03-10 11:02:36'),(408,'Ostrero','2013-09-13 15:55:57','2016-03-10 11:01:54',4,'408',NULL,'dbmunirg.TG06405','OSTRERO!!!',NULL,0,'2016-03-10 11:01:54'),(409,'Halcón Peregrino','2013-09-13 15:55:56','2014-03-31 16:44:50',2,'409',NULL,'dbmunirg.TG06405','HALCON PEREGRINO!!!',NULL,0,NULL),(410,'Águila Mora','2013-09-13 15:55:56','2014-03-31 16:44:50',2,'410',NULL,'dbmunirg.TG06405','AGUILA MORA!!!',NULL,0,NULL),(411,'Halcón Colorado','2013-09-13 15:55:56','2014-03-31 16:44:50',2,'411',NULL,'dbmunirg.TG06405','HALCON COLORADO!!!',NULL,0,NULL),(412,'Playerito Rabadilla Blanca','2013-09-13 15:55:57','2016-03-10 11:09:15',4,'412',NULL,'dbmunirg.TG06405','PLAYERITO RABADILLA BLANCA!!!',NULL,0,'2016-03-10 11:09:15'),(413,'Golondrina Patagónica','2013-09-13 15:55:57','2016-03-10 11:01:14',4,'413',NULL,'dbmunirg.TG06405','GOLONDRINA PATAGONICA!!!',NULL,0,'2016-03-10 11:01:14'),(414,'Paloma Antártica','2013-09-13 15:55:57','2016-03-10 10:59:47',4,'414',NULL,'dbmunirg.TG06405','PALOMA ANTARTICA!!!',NULL,0,'2016-03-10 10:59:47'),(415,'Gaviotín Sudamericano','2013-09-13 15:55:57','2016-03-10 11:00:33',4,'415',NULL,'dbmunirg.TG06405','GAVIOTIN SUDAMERICANO!!!',NULL,0,'2016-03-10 11:00:33'),(416,'Cóndor','2013-09-13 15:55:56','2014-03-31 16:44:50',2,'416',NULL,'dbmunirg.TG06405','CONDOR!!!',NULL,0,NULL),(417,'Cauquén Común','2013-09-13 15:55:56','2014-03-31 16:44:50',2,'417',NULL,'dbmunirg.TG06405','CAUQUEN COMUN!!!',NULL,0,NULL),(418,'Kaiken','2013-09-13 15:55:57','2014-03-31 16:44:50',3,'418',NULL,'dbmunirg.TG06405','KAIKEN!!!',NULL,0,NULL),(419,'Becasa de Mar','2013-09-13 15:55:57','2016-03-10 11:12:50',4,'419',NULL,'dbmunirg.TG06405','BECASA DE MAR!!!',NULL,0,'2016-03-10 11:12:50'),(420,'Juan Félix Russo','2013-09-13 15:55:57','2014-03-31 16:44:50',3,'420',NULL,'dbmunirg.TG06405','JUAN FELIX RUSSO!!!',NULL,0,NULL),(421,'Héctor Arguello','2013-09-13 15:55:57','2016-03-09 10:41:18',5,'421',NULL,'dbmunirg.TG06405','HECTOR HUGO ARGUELLO!!!','Héctor Hugo Arguello',0,'2016-03-09 10:41:18'),(422,'Río Chico','2013-09-13 15:55:57','2016-03-09 10:40:46',4,'422',NULL,'dbmunirg.TG06405','RIO CHICO!!!',NULL,0,'2016-03-09 10:40:46'),(423,'Río Fuego','2013-09-13 15:55:57','2016-03-09 10:40:57',4,'423',NULL,'dbmunirg.TG06405','RIO FUEGO!!!',NULL,0,'2016-03-09 10:40:57'),(424,'Río Grande','2013-09-13 15:55:57','2016-03-09 10:40:50',4,'424',NULL,'dbmunirg.TG06405','RIO GRANDE!!!',NULL,0,'2016-03-09 10:40:50'),(425,'Río Candelaria','2013-09-13 15:55:57','2016-03-09 10:41:50',4,'425',NULL,'dbmunirg.TG06405','RIO CANDELARIA!!!',NULL,0,'2016-03-09 10:41:50'),(426,'Río Ewan','2013-09-13 15:55:57','2016-03-09 10:42:29',4,'426',NULL,'dbmunirg.TG06405','RIO EWAN!!!',NULL,0,'2016-03-09 10:42:29'),(427,'Arroyo de La Misión','2013-09-13 15:55:57','2016-03-09 10:42:17',4,'427',NULL,'dbmunirg.TG06405','ARROYO DE LA MISION!!!',NULL,0,'2016-03-09 10:42:17'),(428,'Cabo Domingo','2013-09-13 15:55:57','2016-03-10 09:17:14',4,'428',NULL,'dbmunirg.TG06405','CABO DOMINGO!!!',NULL,0,'2016-03-10 09:17:14'),(429,'Cabo Peña','2013-09-13 15:55:57','2016-03-10 09:15:55',4,'429',NULL,'dbmunirg.TG06405','CABO PEÑA!!!',NULL,0,'2016-03-10 09:15:55'),(430,'Cabo San Pablo','2013-09-13 15:55:57','2016-03-10 09:14:52',4,'430',NULL,'dbmunirg.TG06405','CABO SAN PABLO!!!',NULL,0,'2016-03-10 09:14:52'),(431,'Cabo Santa Inés','2013-09-13 15:55:57','2016-03-10 09:12:34',4,'431',NULL,'dbmunirg.TG06405','CABO SANTA INES!!!',NULL,0,'2016-03-10 09:12:34'),(432,'Cabo San Sebastián','2013-09-13 15:55:57','2016-03-10 09:10:28',4,'432',NULL,'dbmunirg.TG06405','CABO SAN SEBASTIAN!!!',NULL,0,'2016-03-10 09:10:28'),(433,'Cabo Espíritu Santo','2013-09-13 15:55:57','2016-03-10 09:10:26',4,'433',NULL,'dbmunirg.TG06405','CABO ESPIRITU SANTO!!!',NULL,0,'2016-03-10 09:10:26'),(434,'Caleta La Misión','2013-09-13 15:55:57','2016-03-10 09:10:36',4,'434',NULL,'dbmunirg.TG06405','CALETA LA MISION!!!',NULL,0,'2016-03-10 09:10:36'),(435,'Acuerdo de San Nicolás','2013-09-13 15:55:57','2014-03-31 16:44:50',3,'435',NULL,'dbmunirg.TG06405','ACUERDO DE SAN NICOLAS!!!',NULL,0,NULL),(436,'Laguna Don Bosco','2013-09-13 15:55:57','2016-03-09 11:19:23',4,'436',NULL,'dbmunirg.TG06405','LAGUNA DON BOSCO!!!',NULL,0,'2016-03-09 11:19:23'),(437,'Laguna de Los Flamencos','2013-09-13 15:55:57','2016-03-09 11:17:26',4,'437',NULL,'dbmunirg.TG06405','LAGUNA DE LOS FLAMENCOS!!!',NULL,0,'2016-03-09 11:17:26'),(438,'Punta María','2013-09-13 15:55:57','2016-03-09 11:11:03',4,'438',NULL,'dbmunirg.TG06405','PUNTA MARIA!!!',NULL,0,'2016-03-09 11:11:03'),(439,'Punta Páramo','2013-09-13 15:55:57','2016-03-09 11:09:56',4,'439',NULL,'dbmunirg.TG06405','PUNTA PARAMO!!!',NULL,0,'2016-03-09 11:09:56'),(440,'Punta Popper','2013-09-13 15:55:57','2016-03-09 11:09:46',4,'440',NULL,'dbmunirg.TG06405','PUNTA POPPER!!!',NULL,0,'2016-03-09 11:09:46'),(441,'Pasaje Barranca El Cano','2013-09-13 15:55:57','2014-03-31 16:44:50',3,'441',NULL,'dbmunirg.TG06405','PASAJE BARRANCA EL CANO!!!',NULL,0,NULL),(442,'El Aviador','2013-09-13 15:55:57','2014-03-31 16:44:50',3,'442',NULL,'dbmunirg.TG06405','EL AVIADOR!!!',NULL,0,NULL),(443,'San Jorge','2013-09-13 15:55:57','2014-03-31 16:44:50',3,'443',NULL,'dbmunirg.TG06405','SAN JORGE!!!',NULL,0,NULL),(444,'Santa Catalina','2013-09-13 15:55:56','2014-03-31 16:44:50',2,'444',NULL,'dbmunirg.TG06405','SANTA CATALINA!!!',NULL,0,NULL),(445,'Jorge Maslov','2013-09-13 15:55:56','2016-05-10 12:15:29',3,'445',NULL,'dbmunirg.TG06405','JORGE MASLOV!!!',NULL,0,'2016-05-10 12:15:29'),(446,'Marcos Zuvela','2013-09-13 15:55:56','2016-05-10 12:13:15',3,'446',NULL,'dbmunirg.TG06405','MARCOS ZUVELA!!!',NULL,0,'2016-05-10 12:13:15'),(447,'Juan Senkovic','2013-09-13 15:55:56','2014-03-31 16:44:50',2,'447',NULL,'dbmunirg.TG06405','JUAN SENKOVIC!!!',NULL,0,NULL),(448,'Mateo Plastic','2013-09-13 15:55:56','2014-03-31 16:44:50',2,'448',NULL,'dbmunirg.TG06405','MATEO PLASTIC!!!',NULL,0,NULL),(449,'Mateo Topic','2013-09-13 15:55:56','2014-03-31 16:44:50',2,'449',NULL,'dbmunirg.TG06405','MATEO TOPIC!!!',NULL,0,NULL),(450,'Franka Zuvic','2013-09-13 15:55:57','2014-03-31 16:44:50',3,'450',NULL,'dbmunirg.TG06405','FRANKA ZUVIC!!!',NULL,0,NULL),(451,'Teófilo Hirsig','2013-09-13 15:55:56','2014-03-31 16:44:50',2,'451',NULL,'dbmunirg.TG06405','TEOFILO HIRSIG!!!',NULL,0,NULL),(452,'Mateo Pupacic','2013-09-13 15:55:56','2014-03-31 16:44:50',2,'452',NULL,'dbmunirg.TG06405','MATEO PUPACIC!!!',NULL,0,NULL),(453,'Juana Sosa','2013-09-13 15:55:57','2014-03-31 16:44:50',3,'453',NULL,'dbmunirg.TG06405','JUANA SOSA!!!',NULL,0,NULL),(455,'María Magdalena','2013-09-13 15:55:56','2014-03-31 16:44:50',2,'455',NULL,'dbmunirg.TG06405','MARIA MAGDALENA!!!',NULL,0,NULL),(456,'Madre Teresa de Calcuta','2013-09-13 15:55:57','2016-03-09 11:46:46',4,'456',NULL,'dbmunirg.TG06405','MADRE TERESA DE CALCUTA!!!',NULL,0,'2016-03-09 11:46:46'),(457,'Las Rosas','2013-09-13 15:55:57','2014-03-31 16:44:50',3,'457',NULL,'dbmunirg.TG06405','LAS ROSAS!!!',NULL,0,NULL),(458,'Las Azucenas','2013-09-13 15:55:57','2014-03-31 16:44:50',3,'458',NULL,'dbmunirg.TG06405','LAS AZUCENAS!!!',NULL,0,NULL),(459,'Los Claveles','2013-09-13 15:55:57','2014-03-31 16:44:50',3,'459',NULL,'dbmunirg.TG06405','LOS CLAVELES!!!',NULL,0,NULL),(460,'Los Jazmines','2013-09-13 15:55:57','2014-03-31 16:44:50',3,'460',NULL,'dbmunirg.TG06405','LOS JAZMINES!!!',NULL,0,NULL),(461,'Los Sauces','2013-09-13 15:55:57','2014-03-31 16:44:50',3,'461',NULL,'dbmunirg.TG06405','LOS SAUCES!!!',NULL,0,NULL),(462,'Los Cerros','2013-09-13 15:55:57','2014-03-31 16:44:50',3,'462',NULL,'dbmunirg.TG06405','LOS CERROS!!!',NULL,0,NULL),(463,'Mirko Milosevic','2013-09-13 15:55:57','2014-03-31 16:44:50',3,'463',NULL,'dbmunirg.TG06405','MIRKO MILOSEVIC!!!',NULL,0,NULL),(464,'Ernesto Guevara','2013-09-13 15:55:57','2014-03-31 16:44:50',3,'464',NULL,'dbmunirg.TG06405','ERNESTO GUEVARA!!!',NULL,0,NULL),(466,'Pasaje Tomás Guido','2013-09-13 15:55:57','2016-03-07 13:47:22',5,'466',NULL,'dbmunirg.TG06405','PASAJE TOMAS GUIDO!!!',NULL,0,'2016-03-07 13:47:22'),(467,'Pasaje Ewan','2013-09-13 15:55:57','2014-03-31 16:44:50',3,'467',NULL,'dbmunirg.TG06405','PASAJE EWAN!!!',NULL,0,NULL),(468,'Los Inmigrantes','2013-09-13 15:55:57','2014-03-31 16:44:50',3,'468',NULL,'dbmunirg.TG06405','LOS INMIGRANTES!!!',NULL,0,NULL),(469,'Antiguos Pobladores','2013-09-13 15:55:57','2014-03-31 16:44:50',3,'469',NULL,'dbmunirg.TG06405','ANTIGUOS POBLADORES!!!',NULL,0,NULL),(470,'San Agustín','2013-09-13 15:55:57','2014-03-31 16:44:50',3,'470',NULL,'dbmunirg.TG06405','SAN AGUSTIN!!!',NULL,0,NULL),(471,'Nuestra Señora del Milagro','2013-09-13 15:55:56','2014-03-31 16:44:50',2,'471',NULL,'dbmunirg.TG06405','NUESTRA SEÑORA DEL MILAGRO!!!',NULL,0,NULL),(477,'María Magdalena Güemes','2013-09-13 15:55:56','2016-03-10 12:35:34',4,'477',NULL,'dbmunirg.TG06405','MARIA AGDALENA MACACHA GUEMEZ!!!','María Magdalena \"Macacha\" Güemes',0,'2016-03-10 12:35:34'),(480,'Anibal Allen','2013-09-13 15:55:56','2014-03-31 16:44:50',2,'480',NULL,'dbmunirg.TG06405','ANIBAL ALLEN!!!',NULL,0,NULL),(481,'San Ramón Nonato','2013-09-13 15:55:57','2014-03-31 16:44:50',3,'481',NULL,'dbmunirg.TG06405','SAN RAMON NONATO!!!',NULL,0,NULL),(482,'Estafeta Postal','2013-09-13 15:55:56','2014-03-31 16:44:50',2,'482',NULL,'dbmunirg.TG06405','ESTAFETA POSTAL!!!',NULL,0,NULL),(483,'Puente Colgante','2013-09-13 15:55:56','2014-03-31 16:44:50',2,'483',NULL,'dbmunirg.TG06405','PUENTE COLGANTE!!!',NULL,0,NULL),(484,'Martínez y Pinola','2013-09-13 15:55:56','2014-03-31 16:44:50',3,'484',NULL,'dbmunirg.TG06405','MARTINEZ Y PINOLA!!!',NULL,0,NULL),(500,'Capitan Banini','2016-06-22 03:34:50','2016-06-22 03:34:50',1,'500',NULL,'dbmunirg.TG06405','CAPITAN BANINI',NULL,NULL,NULL),(501,'Capitan Murua','2016-06-22 03:34:51','2016-06-22 03:34:51',1,'501',NULL,'dbmunirg.TG06405','CAPITAN MURUA',NULL,NULL,NULL),(502,'Capitan Hipólito Barrientos','2016-06-22 03:34:51','2016-06-22 03:34:51',1,'502',NULL,'dbmunirg.TG06405','CAPITAN HIPOLITO BARRIENTOS',NULL,NULL,NULL),(503,'Boulevard Los Flamencos','2016-06-22 03:34:51','2016-06-22 03:34:51',1,'503',NULL,'dbmunirg.TG06405','BOULEVARD LOS FLAMENCOS',NULL,NULL,NULL),(504,'Goleta María Auxiliadora','2016-06-22 03:34:51','2016-06-22 03:34:51',1,'504',NULL,'dbmunirg.TG06405','GOLETA MARIA AUXILIADORA',NULL,NULL,NULL),(505,'Jaime Fernández Speroni','2016-06-22 03:34:51','2016-06-22 03:34:51',1,'505',NULL,'dbmunirg.TG06405','JAIME FERNANDEZ SPERONI',NULL,NULL,NULL),(506,'Vapor Alejandro','2016-06-22 03:34:51','2016-06-22 03:34:51',1,'506',NULL,'dbmunirg.TG06405','VAPOR ALEJANDRO',NULL,NULL,NULL),(507,'Vapor Alfonso','2016-06-22 03:34:51','2016-06-22 03:34:51',1,'507',NULL,'dbmunirg.TG06405','VAPOR ALFONSO',NULL,NULL,NULL),(508,'Vapor Asturiano','2016-06-22 03:34:51','2016-06-22 03:34:51',1,'508',NULL,'dbmunirg.TG06405','VAPOR ASTURIANO',NULL,NULL,NULL),(550,'Base Corbeta Uruguay','2017-02-02 03:46:16','2017-02-02 03:46:16',1,'550',NULL,'dbmunirg.TG06405','BASE CORBETA URUGUAY',NULL,NULL,NULL),(551,'ARA Bahia Buen Suceso','2017-02-02 03:46:17','2017-02-02 03:46:17',1,'551',NULL,'dbmunirg.TG06405','ARA BAHIA BUEN SUCESO',NULL,NULL,NULL),(552,'Puerto Leith','2017-02-02 03:46:17','2017-02-02 03:46:17',1,'552',NULL,'dbmunirg.TG06405','PUERTO LEITH',NULL,NULL,NULL),(553,'Grytviken','2017-02-02 03:46:17','2017-02-02 03:46:17',1,'553',NULL,'dbmunirg.TG06405','GRYTVIKEN',NULL,NULL,NULL),(554,'25 de Abril','2017-02-02 03:46:17','2017-02-02 03:46:17',1,'554',NULL,'dbmunirg.TG06405','25 DE ABRIL',NULL,NULL,NULL),(555,'Seriot','2016-08-03 03:56:34','2016-08-03 03:56:34',1,'555',NULL,'dbmunirg.TG06405','SERIOT',NULL,NULL,NULL),(556,'Los Cipreses','2016-08-03 03:56:34','2016-08-03 03:56:34',1,'556',NULL,'dbmunirg.TG06405','LOS CIPRESES',NULL,NULL,NULL),(557,'3 de Abril','2017-02-02 03:46:17','2017-02-02 03:46:17',1,'557',NULL,'dbmunirg.TG06405','3 DE ABRIL',NULL,NULL,NULL),(558,'Batalla de Georgias','2017-02-02 03:46:17','2017-02-02 03:46:17',1,'558',NULL,'dbmunirg.TG06405','BATALLA DE GEORGIAS',NULL,NULL,NULL),(559,'Patricio Guanca','2017-02-02 03:46:17','2017-02-02 03:46:17',1,'559',NULL,'dbmunirg.TG06405','PATRICIO GUANCA',NULL,NULL,NULL),(560,'Oscar Artuso','2017-02-02 03:46:17','2017-02-02 03:46:17',1,'560',NULL,'dbmunirg.TG06405','OSCAR ARTUSO',NULL,NULL,NULL),(561,'Batallon I.M. 1','2017-02-02 03:46:17','2017-02-02 03:46:17',1,'561',NULL,'dbmunirg.TG06405','BATALLON I.M. 1',NULL,NULL,NULL),(562,'Brigada I.M. 1','2017-02-02 03:46:17','2017-02-02 03:46:17',1,'562',NULL,'dbmunirg.TG06405','BRIGADA I.M. 1',NULL,NULL,NULL),(563,'Corbeta Guerrico','2017-02-02 03:46:17','2017-02-02 03:46:17',1,'563',NULL,'dbmunirg.TG06405','CORBETA GUERRICO',NULL,NULL,NULL),(564,'Aviacion Naval','2017-02-02 03:46:17','2017-02-02 03:46:17',1,'564',NULL,'dbmunirg.TG06405','AVIACION NAVAL',NULL,NULL,NULL),(565,'Submarino Santa Fe','2017-02-02 03:46:17','2017-02-02 03:46:17',1,'565',NULL,'dbmunirg.TG06405','SUBMARINO SANTA FE',NULL,NULL,NULL),(566,'Juan Carlos Ampuero','2017-02-02 03:46:17','2017-02-02 03:46:17',1,'566',NULL,'dbmunirg.TG06405','JUAN CARLOS AMPUERO',NULL,NULL,NULL),(567,'ARA Bahia Paraiso','2017-02-02 03:46:17','2017-02-02 03:46:17',1,'567',NULL,'dbmunirg.TG06405','ARA BAHIA PARAISO',NULL,NULL,NULL),(568,'Jorge Néstor Águila','2017-02-02 03:46:17','2017-02-02 03:46:17',1,'568',NULL,'dbmunirg.TG06405','JORGE NESTOR AGUILA',NULL,NULL,NULL),(569,'Mario Almonacid','2017-02-02 03:46:17','2017-02-02 03:46:17',1,'569',NULL,'dbmunirg.TG06405','MARIO ALMONACID',NULL,NULL,NULL),(570,'Punta Coronel Zelaya','2017-02-02 03:46:17','2017-02-02 03:46:17',1,'570',NULL,'dbmunirg.TG06405','PUNTA CORONEL ZELAYA',NULL,NULL,NULL),(571,'ARA Santisima Trinidad','2017-02-03 03:16:08','2017-02-03 03:16:08',1,'571',NULL,'dbmunirg.TG06405','ARA SANTISIMA TRINIDAD',NULL,NULL,NULL),(745,'Medina Juan Francisco','2015-10-22 16:15:57','2015-10-22 16:15:57',1,'745',NULL,'dbmunirg.TG06405','MEDINA JUAN FRANCISCO',NULL,NULL,NULL),(984,'Ministerio de Educación','2013-09-13 15:55:57','2014-03-31 16:44:51',2,'984',NULL,'dbmunirg.TG06405','MINISTERIO DE EDUCACION!!!',NULL,0,NULL),(985,'Devuelto p/correo','2013-09-13 15:55:57','2015-11-20 08:58:22',3,'985',NULL,'dbmunirg.TG06405','DEVUELTO P/CORREO!!!',NULL,0,NULL),(986,'Apartado Postal','2013-09-13 15:55:57','2014-03-31 16:44:51',2,'986',NULL,'dbmunirg.TG06405','APARTADO POSTAL!!!',NULL,0,NULL),(987,'Pasaje Sin Nombre','2013-09-13 15:55:57','2016-03-09 12:42:52',3,'987',NULL,'dbmunirg.TG06405','PASAJE SIN NOMBRE Nº!!!',NULL,0,NULL),(988,'Barrio A. G. P., casa','2013-09-13 15:55:57','2015-11-20 08:55:41',4,'988',NULL,'dbmunirg.TG06405','BARRIO A.G.P. CASA!!!',NULL,0,NULL),(989,'Barrio Mosconi Casa','2013-09-13 15:55:57','2014-03-31 16:44:51',2,'989',NULL,'dbmunirg.TG06405','BARRIO MOSCONI CASA!!!',NULL,0,NULL),(990,'Barrio Reconquista Casa','2013-09-13 15:55:57','2014-03-31 16:44:51',2,'990',NULL,'dbmunirg.TG06405','BARRIO RECONQUISTA CASA!!!',NULL,0,NULL),(991,'Campamento YPF Casa','2013-09-13 15:55:58','2014-03-31 16:44:51',3,'991',NULL,'dbmunirg.TG06405','CAMPAMENTO YPF CASA!!!',NULL,0,NULL),(992,'Barrio CAP, casa','2013-09-13 15:55:57','2015-11-20 08:55:15',4,'992',NULL,'dbmunirg.TG06405','B. FRIGORIF.CAP CASA!!!','Barrio Frigorífico CAP, casa',0,NULL),(993,'Barrio Esperanza Casa','2013-09-13 15:55:57','2014-03-31 16:44:51',2,'993',NULL,'dbmunirg.TG06405','BARRIO ESPERANZA CASA!!!',NULL,0,NULL),(994,'Barrio Austral, casa','2013-09-13 15:55:57','2015-11-20 08:55:59',3,'994',NULL,'dbmunirg.TG06405','BARRIO AUSTRAL CASA!!!',NULL,0,NULL),(995,'Barrio Aeroposta, casa','2013-09-13 15:55:57','2015-11-20 08:55:50',3,'995',NULL,'dbmunirg.TG06405','B. AEROPOSTA CASA!!!',NULL,0,NULL),(996,'Barrio 2 de Abril, casa','2013-09-13 15:55:58','2015-11-20 08:55:32',4,'996',NULL,'dbmunirg.TG06405','BARRIO 2 DE ABRIL CASA!!!',NULL,0,NULL),(997,'Barrio Thorne Casa','2013-09-13 15:55:57','2014-03-31 16:44:51',2,'997',NULL,'dbmunirg.TG06405','BARRIO THORNE  CASA!!!',NULL,0,NULL),(998,'Casilla de Correo','2013-09-13 15:55:57','2014-03-31 16:44:51',2,'998',NULL,'dbmunirg.TG06405','CASILLA DE CORREO!!!',NULL,0,NULL),(999,'Calle Sin Nombre','2013-09-13 15:55:58','2014-03-31 16:44:51',3,'999',NULL,'dbmunirg.TG06405','CALLE SIN NOMBRE!!!',NULL,0,NULL),(1000,'Calle Sin Nombre 1000','2017-05-09 04:08:07','2017-05-09 04:08:07',1,'1000',NULL,'dbmunirg.TG06405','CALLE SIN NOMBRE 1000',NULL,NULL,NULL),(1001,'Calle Sin Nombre 1001','2017-05-09 04:08:08','2017-05-09 04:08:08',1,'1001',NULL,'dbmunirg.TG06405','CALLE SIN NOMBRE 1001',NULL,NULL,NULL),(1002,'Calle Sin Nombre 1002','2017-05-09 04:08:08','2017-05-09 04:08:08',1,'1002',NULL,'dbmunirg.TG06405','CALLE SIN NOMBRE 1002',NULL,NULL,NULL),(1003,'Calle Sin Nombre 1003','2017-05-09 04:08:08','2017-05-09 04:08:08',1,'1003',NULL,'dbmunirg.TG06405','CALLE SIN NOMBRE 1003',NULL,NULL,NULL),(1004,'Calle Sin Nombre 1004','2017-05-09 04:08:08','2017-05-09 04:08:08',1,'1004',NULL,'dbmunirg.TG06405','CALLE SIN NOMBRE 1004',NULL,NULL,NULL),(1005,'Calle Sin Nombre 1005','2017-05-09 04:08:08','2017-05-09 04:08:08',1,'1005',NULL,'dbmunirg.TG06405','CALLE SIN NOMBRE 1005',NULL,NULL,NULL),(1006,'Calle Sin Nombre 1006','2017-09-14 01:15:09','2017-09-14 01:15:09',1,'1006',NULL,'dbmunirg.TG06405','CALLE SIN NOMBRE 1006',NULL,NULL,NULL),(1007,'Calle Sin Nombre 1007','2017-09-14 01:15:09','2017-09-14 01:15:09',1,'1007',NULL,'dbmunirg.TG06405','CALLE SIN NOMBRE 1007',NULL,NULL,NULL),(1008,'Calle Sin Nombre 1008','2017-09-14 01:15:09','2017-09-14 01:15:09',1,'1008',NULL,'dbmunirg.TG06405','CALLE SIN NOMBRE 1008',NULL,NULL,NULL),(1009,'Calle Sin Nombre 1009','2017-09-14 01:15:09','2017-09-14 01:15:09',1,'1009',NULL,'dbmunirg.TG06405','CALLE SIN NOMBRE 1009',NULL,NULL,NULL),(1010,'Calle Sin Nombre 1010','2017-09-14 01:15:09','2017-09-14 01:15:09',1,'1010',NULL,'dbmunirg.TG06405','CALLE SIN NOMBRE 1010',NULL,NULL,NULL),(1011,'Calle Sin Nombre 1011','2017-09-14 01:15:09','2017-09-14 01:15:09',1,'1011',NULL,'dbmunirg.TG06405','CALLE SIN NOMBRE 1011',NULL,NULL,NULL),(1012,'Calle Sin Nombre 1012','2017-09-14 01:15:09','2017-09-14 01:15:09',1,'1012',NULL,'dbmunirg.TG06405','CALLE SIN NOMBRE 1012',NULL,NULL,NULL),(1013,'Calle Sin Nombre 1013','2017-09-14 01:15:09','2017-09-14 01:15:09',1,'1013',NULL,'dbmunirg.TG06405','CALLE SIN NOMBRE 1013',NULL,NULL,NULL),(1014,'Calle Sin Nombre 1014','2017-09-14 01:15:09','2017-09-14 01:15:09',1,'1014',NULL,'dbmunirg.TG06405','CALLE SIN NOMBRE 1014',NULL,NULL,NULL),(1015,'Calle Sin Nombre 1015','2017-09-14 01:15:09','2017-09-14 01:15:09',1,'1015',NULL,'dbmunirg.TG06405','CALLE SIN NOMBRE 1015',NULL,NULL,NULL),(1016,'Calle Sin Nombre 1016','2017-09-14 01:15:09','2017-09-14 01:15:09',1,'1016',NULL,'dbmunirg.TG06405','CALLE SIN NOMBRE 1016',NULL,NULL,NULL),(1017,'Calle Sin Nombre 1017','2017-09-14 01:15:09','2017-09-14 01:15:09',1,'1017',NULL,'dbmunirg.TG06405','CALLE SIN NOMBRE 1017',NULL,NULL,NULL),(1018,'Calle Sin Nombre 1018','2017-09-14 01:15:10','2017-09-14 01:15:10',1,'1018',NULL,'dbmunirg.TG06405','CALLE SIN NOMBRE 1018',NULL,NULL,NULL),(1019,'Calle Sin Nombre 1019','2017-09-14 01:15:10','2017-09-14 01:15:10',1,'1019',NULL,'dbmunirg.TG06405','CALLE SIN NOMBRE 1019',NULL,NULL,NULL),(1020,'Calle Sin Nombre 1020','2017-09-14 01:15:10','2017-09-14 01:15:10',1,'1020',NULL,'dbmunirg.TG06405','CALLE SIN NOMBRE 1020',NULL,NULL,NULL),(1021,'Calle Sin Nombre 1021','2017-09-14 01:15:10','2017-09-14 01:15:10',1,'1021',NULL,'dbmunirg.TG06405','CALLE SIN NOMBRE 1021',NULL,NULL,NULL),(1022,'Calle Sin Nombre 1022','2017-09-14 01:15:10','2017-09-14 01:15:10',1,'1022',NULL,'dbmunirg.TG06405','CALLE SIN NOMBRE 1022',NULL,NULL,NULL),(1023,'Calle Sin Nombre 1023','2017-09-14 01:15:10','2017-09-14 01:15:10',1,'1023',NULL,'dbmunirg.TG06405','CALLE SIN NOMBRE 1023',NULL,NULL,NULL),(1024,'Calle Sin Nombre 1024','2017-09-14 01:15:10','2017-09-14 01:15:10',1,'1024',NULL,'dbmunirg.TG06405','CALLE SIN NOMBRE 1024',NULL,NULL,NULL),(1025,'Calle Sin Nombre 1025','2017-09-14 01:15:10','2017-09-14 01:15:10',1,'1025',NULL,'dbmunirg.TG06405','CALLE SIN NOMBRE 1025',NULL,NULL,NULL),(1026,'Calle Sin Nombre 1026','2017-09-14 01:15:10','2017-09-14 01:15:10',1,'1026',NULL,'dbmunirg.TG06405','CALLE SIN NOMBRE 1026',NULL,NULL,NULL);
/*!40000 ALTER TABLE `Catastro_Calle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Catastro_Partida`
--

DROP TABLE IF EXISTS `Catastro_Partida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Catastro_Partida` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Seccion` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MacizoAlfa` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MacizoNum` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ParcelaAlfa` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ParcelaNum` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SubparcelaAlfa` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SubparcelaNum` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UnidadFuncional` int(11) NOT NULL,
  `Numero` int(11) NOT NULL,
  `Legajo` int(11) DEFAULT NULL,
  `SuperficieTotal` double NOT NULL,
  `Tg06100Id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DomicilioNumero` int(11) DEFAULT NULL,
  `DomicilioPiso` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DomicilioPuerta` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Suprimido` tinyint(1) NOT NULL,
  `ImportSrc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ImportId` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ImportedAt` datetime DEFAULT NULL,
  `Ubicacion` point DEFAULT NULL COMMENT '(DC2Type:point)',
  `UbicacionFecha` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Titular_id` int(11) DEFAULT NULL,
  `Zona_id` int(11) DEFAULT NULL,
  `DomicilioCalle_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2B319EF2B6ADFCB4` (`Titular_id`),
  KEY `IDX_2B319EF2DFF39160` (`Zona_id`),
  KEY `IDX_2B319EF224A57A5` (`DomicilioCalle_id`),
  KEY `Catastro_Partida_SeccionMacizoParcelaSubparcelaUf` (`Seccion`,`MacizoNum`,`MacizoAlfa`,`ParcelaNum`,`ParcelaAlfa`,`SubparcelaNum`,`SubparcelaAlfa`,`UnidadFuncional`),
  KEY `Catastro_Partida_Legajo` (`Legajo`),
  KEY `Catastro_Partida_Numero` (`Numero`),
  CONSTRAINT `FK_2B319EF224A57A5` FOREIGN KEY (`DomicilioCalle_id`) REFERENCES `Catastro_Calle` (`id`),
  CONSTRAINT `FK_2B319EF2B6ADFCB4` FOREIGN KEY (`Titular_id`) REFERENCES `Base_Persona` (`id`),
  CONSTRAINT `FK_2B319EF2DFF39160` FOREIGN KEY (`Zona_id`) REFERENCES `Catastro_Zona` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=429 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Catastro_Partida`
--

LOCK TABLES `Catastro_Partida` WRITE;
/*!40000 ALTER TABLE `Catastro_Partida` DISABLE KEYS */;
/*!40000 ALTER TABLE `Catastro_Partida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Catastro_PartidaPersona`
--

DROP TABLE IF EXISTS `Catastro_PartidaPersona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Catastro_PartidaPersona` (
  `Partida_id` int(11) NOT NULL,
  `Persona_id` int(11) NOT NULL,
  PRIMARY KEY (`Partida_id`,`Persona_id`),
  KEY `IDX_A1A76ACDBE071A57` (`Partida_id`),
  KEY `IDX_A1A76ACDBAA58E69` (`Persona_id`),
  CONSTRAINT `FK_A1A76ACDBAA58E69` FOREIGN KEY (`Persona_id`) REFERENCES `Base_Persona` (`id`),
  CONSTRAINT `FK_A1A76ACDBE071A57` FOREIGN KEY (`Partida_id`) REFERENCES `Catastro_Partida` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Catastro_PartidaPersona`
--

LOCK TABLES `Catastro_PartidaPersona` WRITE;
/*!40000 ALTER TABLE `Catastro_PartidaPersona` DISABLE KEYS */;
/*!40000 ALTER TABLE `Catastro_PartidaPersona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Catastro_UsoSuelo`
--

DROP TABLE IF EXISTS `Catastro_UsoSuelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Catastro_UsoSuelo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Categoria` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Seccion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Codigo` int(11) NOT NULL,
  `SuperficieMaxima` int(11) NOT NULL,
  `UsoZona1` int(11) NOT NULL,
  `UsoZona2` int(11) NOT NULL,
  `UsoZona3` int(11) NOT NULL,
  `UsoZona4` int(11) NOT NULL,
  `UsoZona5` int(11) NOT NULL,
  `UsoZona6` int(11) NOT NULL,
  `UsoZona7` int(11) NOT NULL,
  `UsoZona8` int(11) NOT NULL,
  `UsoZona9` int(11) NOT NULL,
  `UsoZona10` int(11) NOT NULL,
  `UsoZona11` int(11) NOT NULL,
  `UsoZona12` int(11) NOT NULL,
  `UsoZona13` int(11) NOT NULL,
  `UsoZona14` int(11) NOT NULL,
  `UsoZona15` int(11) NOT NULL,
  `UsoZona16` int(11) NOT NULL,
  `UsoZona17` int(11) NOT NULL,
  `UsoZona18` int(11) NOT NULL,
  `UsoZona19` int(11) NOT NULL,
  `UsoZona20` int(11) NOT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Catastro_UsoSuelo_Codigo` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Catastro_UsoSuelo`
--

LOCK TABLES `Catastro_UsoSuelo` WRITE;
/*!40000 ALTER TABLE `Catastro_UsoSuelo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Catastro_UsoSuelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Catastro_Zona`
--

DROP TABLE IF EXISTS `Catastro_Zona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Catastro_Zona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `ImportSrc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ImportId` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ImportedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Fos` decimal(14,2) DEFAULT NULL,
  `Fot` decimal(14,2) DEFAULT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Catastro_Zona_Nombre` (`Nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Catastro_Zona`
--

LOCK TABLES `Catastro_Zona` WRITE;
/*!40000 ALTER TABLE `Catastro_Zona` DISABLE KEYS */;
INSERT INTO `Catastro_Zona` VALUES (1,'ZM','Microcentro',4,NULL,NULL,NULL,'2013-09-24 15:53:26','2013-09-25 15:25:49',NULL,NULL,'Es el sector urbano de mayor concentración de actividades, intercambios sociales y densidad constructiva que presenta un carácter simbólico y polifuncional de máxima primacía.'),(2,'ZC','Centro',4,NULL,NULL,NULL,'2013-09-24 15:55:50','2013-12-13 15:01:45',NULL,NULL,'Es el sector urbano de mayor concentración de actividades, intercambios sociales y densidad constructiva que presenta un carácter simbólico y polifuncional de máxima primacía.'),(3,'ZCRT1','Corredor regional T1',2,NULL,NULL,NULL,'2013-09-24 15:56:13','2013-09-25 15:22:15',NULL,NULL,'Son sectores definidos por la vía de circulación interurbanas que presentan actualmente intensidades bajas de aprovechamiento del suelo en los que se espera consolidar el carácter comercial.'),(4,'ZCM','Corredor mixto',2,NULL,NULL,NULL,'2013-09-24 15:56:25','2013-09-25 15:25:02',NULL,NULL,'Son los sectores que lindan con las rutas y caminos que se destinan a actividades mixtas de servicio a la ruta con parámetros de ocupación medios.'),(5,'ZCP','Corredor principal',2,NULL,NULL,NULL,'2013-09-24 15:56:35','2013-09-25 15:21:20',NULL,NULL,'Son los sectores definidos por vías de circulación primarias que presentan actualmente una baja y media intensidad de aprovechamiento del suelo. En ellos se esperan alcanzar densidades residenciales altas y una mayor mixtura de actividades comerciales y de servicios.'),(6,'ZCS','Corredor secundario',2,NULL,NULL,NULL,'2013-09-24 15:56:52','2013-09-25 15:25:14',NULL,NULL,'Son los sectores definidos por vías de circulación secundarias que presentan actualmente una baja intensidad de aprovechamiento del suelo y en los que se esperan alcanzar densidades residenciales medias y una mayor mixtura de actividades comerciales y de servicios.'),(7,'ZCB','Corredor barrial',2,NULL,NULL,NULL,'2013-09-24 15:57:04','2013-09-25 15:20:29',NULL,NULL,'Son los sectores definidos por vías de circulación de escala barrial, en los que se esperan alcanzar una densidad residencial controlada y una mayor mixtura de actividades comerciales que atiendan a los barrios adyacentes.'),(8,'ZR1','Residencial 1',2,NULL,NULL,NULL,'2013-09-24 15:57:15','2013-09-25 15:22:32',NULL,NULL,'Son aquellos sectores destinados a una ocupación predominantemente residencial y en los que se esperan alcanzar densidades medias por lo que se admite el uso residencial multifamiliar complementado con actividades de servicio no molestas.'),(9,'ZR2','Residencial 2',2,NULL,NULL,NULL,'2013-09-24 15:57:23','2013-09-25 15:22:36',NULL,NULL,'Son aquellos sectores destinados a una ocupación predominantemente residencial y en los que se esperan mantener bajas densidades de ocupación. Los usos se complementan con seleccionadas actividades de comerciales y servicio inocuas.'),(10,'ZR3','Residencial 3',2,NULL,NULL,NULL,'2013-09-24 15:57:32','2013-09-25 15:26:09',NULL,NULL,'Son aquellos sectores destinados a una ocupación predominantemente residencial con bajos coeficientes de aprovechamiento de suelo y que en algunos casos se encuentran en proceso de consolidación.'),(11,'ZR4','Residencial 4',2,NULL,NULL,NULL,'2013-09-24 15:57:45','2013-09-25 15:22:45',NULL,NULL,'Son sectores constituidos por conjuntos habitacionales de tejido mixto en los que se requiere consolidar el perfil morfológico y mejorar las características urbano – ambientales.'),(12,'ZR5','Residencial 5',2,NULL,NULL,NULL,'2013-09-24 15:57:58','2013-09-25 15:26:58',NULL,NULL,'Son los sectores urbanos destinados a planes de vivienda del sector público, Municipalidad, IPV.'),(13,'ZR6','Residencial 6',2,NULL,NULL,NULL,'2013-09-24 15:58:07','2013-09-25 15:27:07',NULL,NULL,'Son sectores no consolidados destinados a la residencia unifamiliar exclusiva con características particulares de tejido abierto y muy bajas densidades de ocupación.'),(14,'ZRM','Residencial mixto',2,NULL,NULL,NULL,'2013-09-24 15:58:17','2013-09-25 15:20:14',NULL,NULL,'Son sectores consolidados en los que conviven la residencia unifamiliar y usos de servicios y productivos de bajo nivel de molestia.'),(15,'ZPE','Parque industrial',2,NULL,NULL,NULL,'2013-09-24 15:58:31','2013-09-25 15:25:58',NULL,NULL,'Es el sector destinado en forma exclusiva a los usos productivos molestos que requieren parcelas de mediana y gran superficie.'),(16,'ZREU','Residencial extraurbano',2,NULL,NULL,NULL,'2013-09-24 15:58:44','2013-09-25 15:28:02',NULL,NULL,'Son los sectores urbanos donde se localizan viviendas de uso permanente y transitorio y servicios en grandes predios y en contacto con la naturaleza.'),(17,'ZREU2','Residencial extraurbano 2',1,NULL,NULL,NULL,'2013-09-24 15:58:54','2013-09-24 15:58:54',NULL,NULL,'Son los sectores urbanos reservados para el futuro crecimiento de la ciudad.'),(18,'ZSEU','Servicios extraurbano',2,NULL,NULL,NULL,'2013-09-24 15:59:02','2013-09-25 15:27:26',NULL,NULL,'Son las zonas reservadas para futuras extensiones urbanas donde se localizan servicios y equipamientos en grandes predios compatibles con las características suburbanas.'),(19,'ZSEU-ZC','Servicios extraurbano zona costera',1,NULL,NULL,NULL,'2013-09-24 15:59:17','2013-09-24 15:59:17',NULL,NULL,'Son las zonas reservadas para futuras extensiones urbanas donde se localizan servicios y equipamientos en grandes predios compatibles con las características suburbanas.'),(20,'ZRU','Rural',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'ZEIA','Especial de interés ambiental',1,NULL,NULL,NULL,'2016-03-09 15:40:00','2016-03-09 15:40:00',NULL,NULL,'Son aquellos sectores o inmuebles con características culturales y/o naturales diferenciadas que estructuran paisajes y/o ámbitos de interés patrimonial. En función de ello están sujetas a criterios ubrbanísticos especiales que determinan una pcupación con nula o muy baja densidad teniendo en vista el interés público, la protección ambiental y la preservación del patrimonio histórico, cultural, arqueológico o paisajístico.'),(22,'ZEIS','Especial de interés social',1,NULL,NULL,NULL,'2016-03-09 15:40:00','2016-03-09 15:40:00',NULL,NULL,'Son aquellas ocupadas por o destinadas a loteos y/o vivienda social en los que existe el interés público en ordenar y mejorar la ocupación, en urbanizar y producir procesos de regularización dominial y que, por lo tanto, están sujetas a criterios especiales de parcelamiento, ocupación y uso del suelo.'),(23,'ZEIU','Especial de interés urbanístico',1,NULL,NULL,NULL,'2016-03-09 15:40:00','2016-03-09 15:40:00',NULL,NULL,'Son aquellas donde esan implantados equipamientos urbanos o que son objeto de planes y/o proyectos integrales y que por sus características no son pasibles de ser encuadradas en el régimen normativo de regulación general.'),(24,'ZSC','Zona sin código',1,NULL,NULL,NULL,'2017-05-04 10:15:00','2017-05-04 10:15:00',NULL,NULL,NULL);
/*!40000 ALTER TABLE `Catastro_Zona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comercio_ActaComercio`
--

DROP TABLE IF EXISTS `Comercio_ActaComercio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comercio_ActaComercio` (
  `id` int(11) NOT NULL,
  `Hora` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Comercio_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A983D296AA160B6E` (`Comercio_id`),
  CONSTRAINT `FK_A983D296AA160B6E` FOREIGN KEY (`Comercio_id`) REFERENCES `Comercio_Comercio` (`id`),
  CONSTRAINT `FK_A983D296BF396750` FOREIGN KEY (`id`) REFERENCES `Inspeccion_Acta` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comercio_ActaComercio`
--

LOCK TABLES `Comercio_ActaComercio` WRITE;
/*!40000 ALTER TABLE `Comercio_ActaComercio` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comercio_ActaComercio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comercio_ActaComercio_ActaEtiqueta`
--

DROP TABLE IF EXISTS `Comercio_ActaComercio_ActaEtiqueta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comercio_ActaComercio_ActaEtiqueta` (
  `actacomercio_id` int(11) NOT NULL,
  `actaetiqueta_id` int(11) NOT NULL,
  PRIMARY KEY (`actacomercio_id`,`actaetiqueta_id`),
  KEY `IDX_B98D8186521D343E` (`actacomercio_id`),
  KEY `IDX_B98D8186ABAA132C` (`actaetiqueta_id`),
  CONSTRAINT `FK_B98D8186521D343E` FOREIGN KEY (`actacomercio_id`) REFERENCES `Comercio_ActaComercio` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B98D8186ABAA132C` FOREIGN KEY (`actaetiqueta_id`) REFERENCES `Comercio_ActaEtiqueta` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comercio_ActaComercio_ActaEtiqueta`
--

LOCK TABLES `Comercio_ActaComercio_ActaEtiqueta` WRITE;
/*!40000 ALTER TABLE `Comercio_ActaComercio_ActaEtiqueta` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comercio_ActaComercio_ActaEtiqueta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comercio_ActaEtiqueta`
--

DROP TABLE IF EXISTS `Comercio_ActaEtiqueta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comercio_ActaEtiqueta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Resultado` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comercio_ActaEtiqueta`
--

LOCK TABLES `Comercio_ActaEtiqueta` WRITE;
/*!40000 ALTER TABLE `Comercio_ActaEtiqueta` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comercio_ActaEtiqueta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comercio_Actividad`
--

DROP TABLE IF EXISTS `Comercio_Actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comercio_Actividad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Clanae1997` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Clanae2010` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ClaeAfip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DgrTdf` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Clamae2014` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ClamaeMod` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CategoriaAntigua` int(11) NOT NULL,
  `CodigoCpu` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NivelRiesgo` int(11) NOT NULL,
  `Incluye` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `NoIncluye` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Instructivos` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Final` tinyint(1) NOT NULL,
  `Establecimiento` tinyint(1) NOT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `Suprimido` tinyint(1) NOT NULL,
  `MaterializedPath` longtext COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `ParentNode_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_AC3F31F38CEEC9FB` (`ParentNode_id`),
  CONSTRAINT `FK_AC3F31F38CEEC9FB` FOREIGN KEY (`ParentNode_id`) REFERENCES `Comercio_Actividad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comercio_Actividad`
--

LOCK TABLES `Comercio_Actividad` WRITE;
/*!40000 ALTER TABLE `Comercio_Actividad` DISABLE KEYS */;
INSERT INTO `Comercio_Actividad` VALUES (1,'','I','I','','I',NULL,0,'',2,'','',NULL,0,1,'Actividad primaria',5,0,'/I','2014-02-24 11:29:30','2016-03-16 09:56:44',NULL),(2,'','A','A','','A',NULL,0,'',2,'','',NULL,0,1,'Agricultura, ganadería, caza, silvicultura y pesca',5,0,'/A','2014-02-24 11:29:30','2016-03-16 09:56:44',NULL);
/*!40000 ALTER TABLE `Comercio_Actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comercio_ActividadEtiqueta`
--

DROP TABLE IF EXISTS `Comercio_ActividadEtiqueta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comercio_ActividadEtiqueta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Suprimido` tinyint(1) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comercio_ActividadEtiqueta`
--

LOCK TABLES `Comercio_ActividadEtiqueta` WRITE;
/*!40000 ALTER TABLE `Comercio_ActividadEtiqueta` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comercio_ActividadEtiqueta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comercio_Actividad_ActividadEtiqueta`
--

DROP TABLE IF EXISTS `Comercio_Actividad_ActividadEtiqueta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comercio_Actividad_ActividadEtiqueta` (
  `actividadetiqueta_id` int(11) NOT NULL,
  `Actividad_id` int(11) NOT NULL,
  PRIMARY KEY (`Actividad_id`,`actividadetiqueta_id`),
  KEY `IDX_2F5921D778252132` (`Actividad_id`),
  KEY `IDX_2F5921D736BE1276` (`actividadetiqueta_id`),
  CONSTRAINT `FK_2F5921D736BE1276` FOREIGN KEY (`actividadetiqueta_id`) REFERENCES `Comercio_ActividadEtiqueta` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_2F5921D778252132` FOREIGN KEY (`Actividad_id`) REFERENCES `Comercio_Actividad` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comercio_Actividad_ActividadEtiqueta`
--

LOCK TABLES `Comercio_Actividad_ActividadEtiqueta` WRITE;
/*!40000 ALTER TABLE `Comercio_Actividad_ActividadEtiqueta` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comercio_Actividad_ActividadEtiqueta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comercio_CategoriaPrecio`
--

DROP TABLE IF EXISTS `Comercio_CategoriaPrecio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comercio_CategoriaPrecio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CostoUF` decimal(10,0) DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comercio_CategoriaPrecio`
--

LOCK TABLES `Comercio_CategoriaPrecio` WRITE;
/*!40000 ALTER TABLE `Comercio_CategoriaPrecio` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comercio_CategoriaPrecio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comercio_CertificadoHabilitacionComercial`
--

DROP TABLE IF EXISTS `Comercio_CertificadoHabilitacionComercial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comercio_CertificadoHabilitacionComercial` (
  `id` int(11) NOT NULL,
  `FechaValidezHasta` date DEFAULT NULL,
  `Comercio_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7A8B9E5FAA160B6E` (`Comercio_id`),
  CONSTRAINT `FK_7A8B9E5FAA160B6E` FOREIGN KEY (`Comercio_id`) REFERENCES `Comercio_Comercio` (`id`),
  CONSTRAINT `FK_7A8B9E5FBF396750` FOREIGN KEY (`id`) REFERENCES `Tramites_Comprobante` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comercio_CertificadoHabilitacionComercial`
--

LOCK TABLES `Comercio_CertificadoHabilitacionComercial` WRITE;
/*!40000 ALTER TABLE `Comercio_CertificadoHabilitacionComercial` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comercio_CertificadoHabilitacionComercial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comercio_CertificadoUsoSuelo`
--

DROP TABLE IF EXISTS `Comercio_CertificadoUsoSuelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comercio_CertificadoUsoSuelo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FechaEmision` date NOT NULL,
  `ResolucionCondicionada` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `FechaValidezHasta` date DEFAULT NULL,
  `ActoAdministrativoNumero` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Actividad1_id` int(11) DEFAULT NULL,
  `Actividad2_id` int(11) DEFAULT NULL,
  `Actividad3_id` int(11) DEFAULT NULL,
  `Actividad4_id` int(11) DEFAULT NULL,
  `Actividad5_id` int(11) DEFAULT NULL,
  `Actividad6_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_48CB6C721EC35932` (`Actividad1_id`),
  KEY `IDX_48CB6C72C76F6DC` (`Actividad2_id`),
  KEY `IDX_48CB6C72B4CA91B9` (`Actividad3_id`),
  KEY `IDX_48CB6C72291DA900` (`Actividad4_id`),
  KEY `IDX_48CB6C7291A1CE65` (`Actividad5_id`),
  KEY `IDX_48CB6C728314618B` (`Actividad6_id`),
  CONSTRAINT `FK_48CB6C721EC35932` FOREIGN KEY (`Actividad1_id`) REFERENCES `Comercio_Actividad` (`id`),
  CONSTRAINT `FK_48CB6C72291DA900` FOREIGN KEY (`Actividad4_id`) REFERENCES `Comercio_Actividad` (`id`),
  CONSTRAINT `FK_48CB6C728314618B` FOREIGN KEY (`Actividad6_id`) REFERENCES `Comercio_Actividad` (`id`),
  CONSTRAINT `FK_48CB6C7291A1CE65` FOREIGN KEY (`Actividad5_id`) REFERENCES `Comercio_Actividad` (`id`),
  CONSTRAINT `FK_48CB6C72B4CA91B9` FOREIGN KEY (`Actividad3_id`) REFERENCES `Comercio_Actividad` (`id`),
  CONSTRAINT `FK_48CB6C72C76F6DC` FOREIGN KEY (`Actividad2_id`) REFERENCES `Comercio_Actividad` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comercio_CertificadoUsoSuelo`
--

LOCK TABLES `Comercio_CertificadoUsoSuelo` WRITE;
/*!40000 ALTER TABLE `Comercio_CertificadoUsoSuelo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comercio_CertificadoUsoSuelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comercio_Comercio`
--

DROP TABLE IF EXISTS `Comercio_Comercio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comercio_Comercio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DomicilioLegal` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PosicionArchivo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FechaHabilitacion` date DEFAULT NULL,
  `FechaValidez` date DEFAULT NULL,
  `ActoAdministrativoBajaNumero` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FechaBaja` date DEFAULT NULL,
  `FechaUltimaActa` date DEFAULT NULL,
  `Estado` int(11) NOT NULL,
  `CaracterOcupacion` int(11) DEFAULT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Suprimido` tinyint(1) NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `ExpedienteNumero` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ActoAdministrativoNumero` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RequiereAtencion` tinyint(1) NOT NULL,
  `RequiereAtencionObs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `CertificadoHabilitacion_id` int(11) DEFAULT NULL,
  `CreadoPor_id` int(11) DEFAULT NULL,
  `Titular_id` int(11) NOT NULL,
  `Apoderado_id` int(11) DEFAULT NULL,
  `Apoderado2_id` int(11) DEFAULT NULL,
  `Local_id` int(11) DEFAULT NULL,
  `ActividadPrincipal_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_38ED51F9A8E448DD` (`CertificadoHabilitacion_id`),
  KEY `IDX_38ED51F980351C9D` (`CreadoPor_id`),
  KEY `IDX_38ED51F9B6ADFCB4` (`Titular_id`),
  KEY `IDX_38ED51F9B9F1798E` (`Apoderado_id`),
  KEY `IDX_38ED51F9CE60DD23` (`Apoderado2_id`),
  KEY `IDX_38ED51F9A42C4357` (`Local_id`),
  KEY `IDX_38ED51F93030A316` (`ActividadPrincipal_id`),
  CONSTRAINT `FK_38ED51F93030A316` FOREIGN KEY (`ActividadPrincipal_id`) REFERENCES `Comercio_Actividad` (`id`),
  CONSTRAINT `FK_38ED51F980351C9D` FOREIGN KEY (`CreadoPor_id`) REFERENCES `Base_Persona` (`id`),
  CONSTRAINT `FK_38ED51F9A42C4357` FOREIGN KEY (`Local_id`) REFERENCES `Comercio_Local` (`id`),
  CONSTRAINT `FK_38ED51F9A8E448DD` FOREIGN KEY (`CertificadoHabilitacion_id`) REFERENCES `Comercio_CertificadoHabilitacionComercial` (`id`),
  CONSTRAINT `FK_38ED51F9B6ADFCB4` FOREIGN KEY (`Titular_id`) REFERENCES `Base_Persona` (`id`),
  CONSTRAINT `FK_38ED51F9B9F1798E` FOREIGN KEY (`Apoderado_id`) REFERENCES `Base_Persona` (`id`),
  CONSTRAINT `FK_38ED51F9CE60DD23` FOREIGN KEY (`Apoderado2_id`) REFERENCES `Base_Persona` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comercio_Comercio`
--

LOCK TABLES `Comercio_Comercio` WRITE;
/*!40000 ALTER TABLE `Comercio_Comercio` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comercio_Comercio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comercio_Comercio_Actividad`
--

DROP TABLE IF EXISTS `Comercio_Comercio_Actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comercio_Comercio_Actividad` (
  `Comercio_id` int(11) NOT NULL,
  `Actividad_id` int(11) NOT NULL,
  PRIMARY KEY (`Comercio_id`,`Actividad_id`),
  KEY `IDX_48B6B75BAA160B6E` (`Comercio_id`),
  KEY `IDX_48B6B75B78252132` (`Actividad_id`),
  CONSTRAINT `FK_48B6B75B78252132` FOREIGN KEY (`Actividad_id`) REFERENCES `Comercio_Actividad` (`id`),
  CONSTRAINT `FK_48B6B75BAA160B6E` FOREIGN KEY (`Comercio_id`) REFERENCES `Comercio_Comercio` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comercio_Comercio_Actividad`
--

LOCK TABLES `Comercio_Comercio_Actividad` WRITE;
/*!40000 ALTER TABLE `Comercio_Comercio_Actividad` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comercio_Comercio_Actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comercio_DepositoClase`
--

DROP TABLE IF EXISTS `Comercio_DepositoClase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comercio_DepositoClase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Categoria` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Tipo` int(11) NOT NULL,
  `ClaseHasta300` int(11) NOT NULL,
  `ClaseHasta1000` int(11) NOT NULL,
  `ClaseMasDe1000` int(11) NOT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comercio_DepositoClase`
--

LOCK TABLES `Comercio_DepositoClase` WRITE;
/*!40000 ALTER TABLE `Comercio_DepositoClase` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comercio_DepositoClase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comercio_Entrada`
--

DROP TABLE IF EXISTS `Comercio_Entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comercio_Entrada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Cantidad` int(11) NOT NULL,
  `PrecioUnitario` double NOT NULL,
  `espectaculo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6DB1327D17DA15F9` (`espectaculo_id`),
  CONSTRAINT `FK_6DB1327D17DA15F9` FOREIGN KEY (`espectaculo_id`) REFERENCES `Comercio_EspectaculoPublico` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comercio_Entrada`
--

LOCK TABLES `Comercio_Entrada` WRITE;
/*!40000 ALTER TABLE `Comercio_Entrada` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comercio_Entrada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comercio_EspectaculoPublico`
--

DROP TABLE IF EXISTS `Comercio_EspectaculoPublico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comercio_EspectaculoPublico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Finalidad` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Solicitante_id` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `HoraInicio` time NOT NULL,
  `HoraFin` time NOT NULL,
  `Aseguradora` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DomicilioNumero` int(11) DEFAULT NULL,
  `DomicilioPiso` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DomicilioPuerta` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GrupoSoporteLocal_id` int(11) DEFAULT NULL,
  `DomicilioCalle_id` int(11) DEFAULT NULL,
  `Responsable_id` int(11) NOT NULL,
  `Establecimiento` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Autorizado` tinyint(1) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_293BCA7021747C2` (`GrupoSoporteLocal_id`),
  KEY `IDX_293BCA70C10C725F` (`Solicitante_id`),
  KEY `IDX_293BCA7024A57A5` (`DomicilioCalle_id`),
  KEY `IDX_293BCA709EA1E5AA` (`Responsable_id`),
  CONSTRAINT `FK_293BCA7021747C2` FOREIGN KEY (`GrupoSoporteLocal_id`) REFERENCES `Comercio_GrupoSoporte` (`id`),
  CONSTRAINT `FK_293BCA7024A57A5` FOREIGN KEY (`DomicilioCalle_id`) REFERENCES `Catastro_Calle` (`id`),
  CONSTRAINT `FK_293BCA709EA1E5AA` FOREIGN KEY (`Responsable_id`) REFERENCES `Base_Persona` (`id`),
  CONSTRAINT `FK_293BCA70C10C725F` FOREIGN KEY (`Solicitante_id`) REFERENCES `Base_Persona` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comercio_EspectaculoPublico`
--

LOCK TABLES `Comercio_EspectaculoPublico` WRITE;
/*!40000 ALTER TABLE `Comercio_EspectaculoPublico` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comercio_EspectaculoPublico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comercio_GrupoSoporte`
--

DROP TABLE IF EXISTS `Comercio_GrupoSoporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comercio_GrupoSoporte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Representante` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Telefono` int(11) DEFAULT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DomicilioNumero` int(11) DEFAULT NULL,
  `DomicilioPiso` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DomicilioPuerta` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DomicilioCalle_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F94393B024A57A5` (`DomicilioCalle_id`),
  CONSTRAINT `FK_F94393B024A57A5` FOREIGN KEY (`DomicilioCalle_id`) REFERENCES `Catastro_Calle` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comercio_GrupoSoporte`
--

LOCK TABLES `Comercio_GrupoSoporte` WRITE;
/*!40000 ALTER TABLE `Comercio_GrupoSoporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comercio_GrupoSoporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comercio_LibretaSanitaria`
--

DROP TABLE IF EXISTS `Comercio_LibretaSanitaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comercio_LibretaSanitaria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FechaDeEmision` date NOT NULL,
  `Tipo` int(11) NOT NULL,
  `FechaExamenFisico` date NOT NULL,
  `LugarDelExamen` int(11) NOT NULL,
  `Funcion` int(11) NOT NULL,
  `Suprimido` tinyint(1) NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Comercio_id` int(11) DEFAULT NULL,
  `Titular_id` int(11) NOT NULL,
  `FechaDeVencimiento` date NOT NULL,
  `Profesional` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ComercioProvisorio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9244EADDAA160B6E` (`Comercio_id`),
  KEY `IDX_9244EADDB6ADFCB4` (`Titular_id`),
  CONSTRAINT `FK_9244EADDAA160B6E` FOREIGN KEY (`Comercio_id`) REFERENCES `Comercio_Comercio` (`id`),
  CONSTRAINT `FK_9244EADDB6ADFCB4` FOREIGN KEY (`Titular_id`) REFERENCES `Base_Persona` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=721 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comercio_LibretaSanitaria`
--

LOCK TABLES `Comercio_LibretaSanitaria` WRITE;
/*!40000 ALTER TABLE `Comercio_LibretaSanitaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comercio_LibretaSanitaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comercio_Local`
--

DROP TABLE IF EXISTS `Comercio_Local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comercio_Local` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SubDomicilio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Tipo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Superficie` double NOT NULL,
  `SuperficieDeposito` double DEFAULT NULL,
  `VeredaMunicipal` int(11) DEFAULT NULL,
  `Canaletas` int(11) DEFAULT NULL,
  `CestoBasura` int(11) DEFAULT NULL,
  `PuertaEmergencia` int(11) DEFAULT NULL,
  `AnchoSalida` int(11) DEFAULT NULL,
  `EnParqueIndustrial` tinyint(1) NOT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Suprimido` tinyint(1) NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `DomicilioNumero` int(11) DEFAULT NULL,
  `DomicilioPiso` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DomicilioPuerta` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `DepositoClase_id` int(11) DEFAULT NULL,
  `Partida_id` int(11) NOT NULL,
  `DomicilioCalle_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_67B7691A3B2982C` (`DepositoClase_id`),
  KEY `IDX_67B7691BE071A57` (`Partida_id`),
  KEY `IDX_67B769124A57A5` (`DomicilioCalle_id`),
  CONSTRAINT `FK_67B769124A57A5` FOREIGN KEY (`DomicilioCalle_id`) REFERENCES `Catastro_Calle` (`id`),
  CONSTRAINT `FK_67B7691A3B2982C` FOREIGN KEY (`DepositoClase_id`) REFERENCES `Comercio_DepositoClase` (`id`),
  CONSTRAINT `FK_67B7691BE071A57` FOREIGN KEY (`Partida_id`) REFERENCES `Catastro_Partida` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comercio_Local`
--

LOCK TABLES `Comercio_Local` WRITE;
/*!40000 ALTER TABLE `Comercio_Local` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comercio_Local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comercio_ProfesionalMedico`
--

DROP TABLE IF EXISTS `Comercio_ProfesionalMedico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comercio_ProfesionalMedico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Suprimido` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comercio_ProfesionalMedico`
--

LOCK TABLES `Comercio_ProfesionalMedico` WRITE;
/*!40000 ALTER TABLE `Comercio_ProfesionalMedico` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comercio_ProfesionalMedico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comercio_TramiteHabilitacion`
--

DROP TABLE IF EXISTS `Comercio_TramiteHabilitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comercio_TramiteHabilitacion` (
  `id` int(11) NOT NULL,
  `ActoAdministrativoNumero` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ExpedienteNumero` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UsoSuelo` int(11) DEFAULT NULL,
  `UltimoSeguimiento_id` int(11) DEFAULT NULL,
  `Comercio_id` int(11) NOT NULL,
  `Apoderado_id` int(11) DEFAULT NULL,
  `Apoderado2_id` int(11) DEFAULT NULL,
  `Local_id` int(11) DEFAULT NULL,
  `ActividadPrincipal_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_60F24FED451EAD33` (`UltimoSeguimiento_id`),
  KEY `IDX_60F24FEDAA160B6E` (`Comercio_id`),
  KEY `IDX_60F24FEDB9F1798E` (`Apoderado_id`),
  KEY `IDX_60F24FEDCE60DD23` (`Apoderado2_id`),
  KEY `IDX_60F24FEDA42C4357` (`Local_id`),
  KEY `IDX_60F24FED3030A316` (`ActividadPrincipal_id`),
  CONSTRAINT `FK_60F24FED3030A316` FOREIGN KEY (`ActividadPrincipal_id`) REFERENCES `Comercio_Actividad` (`id`),
  CONSTRAINT `FK_60F24FED451EAD33` FOREIGN KEY (`UltimoSeguimiento_id`) REFERENCES `Administracion_Seguimiento` (`id`),
  CONSTRAINT `FK_60F24FEDA42C4357` FOREIGN KEY (`Local_id`) REFERENCES `Comercio_Local` (`id`),
  CONSTRAINT `FK_60F24FEDAA160B6E` FOREIGN KEY (`Comercio_id`) REFERENCES `Comercio_Comercio` (`id`),
  CONSTRAINT `FK_60F24FEDB9F1798E` FOREIGN KEY (`Apoderado_id`) REFERENCES `Base_Persona` (`id`),
  CONSTRAINT `FK_60F24FEDBF396750` FOREIGN KEY (`id`) REFERENCES `Tramites_Tramite` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_60F24FEDCE60DD23` FOREIGN KEY (`Apoderado2_id`) REFERENCES `Base_Persona` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comercio_TramiteHabilitacion`
--

LOCK TABLES `Comercio_TramiteHabilitacion` WRITE;
/*!40000 ALTER TABLE `Comercio_TramiteHabilitacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comercio_TramiteHabilitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comercio_TramiteHabilitacion_Actividad`
--

DROP TABLE IF EXISTS `Comercio_TramiteHabilitacion_Actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comercio_TramiteHabilitacion_Actividad` (
  `Tramite_id` int(11) NOT NULL,
  `Actividad_id` int(11) NOT NULL,
  PRIMARY KEY (`Tramite_id`,`Actividad_id`),
  KEY `IDX_B7508B7DCD512B99` (`Tramite_id`),
  KEY `IDX_B7508B7D78252132` (`Actividad_id`),
  CONSTRAINT `FK_B7508B7D78252132` FOREIGN KEY (`Actividad_id`) REFERENCES `Comercio_Actividad` (`id`),
  CONSTRAINT `FK_B7508B7DCD512B99` FOREIGN KEY (`Tramite_id`) REFERENCES `Comercio_TramiteHabilitacion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comercio_TramiteHabilitacion_Actividad`
--

LOCK TABLES `Comercio_TramiteHabilitacion_Actividad` WRITE;
/*!40000 ALTER TABLE `Comercio_TramiteHabilitacion_Actividad` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comercio_TramiteHabilitacion_Actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Compras_Licitacion`
--

DROP TABLE IF EXISTS `Compras_Licitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Compras_Licitacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Numero` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Complejidad1` int(11) NOT NULL,
  `Complejidad2` int(11) NOT NULL,
  `Complejidad3` int(11) NOT NULL,
  `ComplejidadComputada` int(11) NOT NULL,
  `PresupuestoOficial` decimal(14,2) NOT NULL,
  `PliegoCoeficiente` decimal(14,2) NOT NULL,
  `PliegoValor` decimal(14,2) NOT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `ImportSrc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ImportId` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ImportedAt` datetime DEFAULT NULL,
  `ExpedienteNumero` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Departamento_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F2C1E1D3D254FE13` (`Departamento_id`),
  CONSTRAINT `FK_F2C1E1D3D254FE13` FOREIGN KEY (`Departamento_id`) REFERENCES `Organizacion_Departamento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Compras_Licitacion`
--

LOCK TABLES `Compras_Licitacion` WRITE;
/*!40000 ALTER TABLE `Compras_Licitacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Compras_Licitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ecologia_TramiteCatEc`
--

DROP TABLE IF EXISTS `Ecologia_TramiteCatEc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ecologia_TramiteCatEc` (
  `id` int(11) NOT NULL,
  `ExpedienteNumero` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TurnoFecha` datetime DEFAULT NULL,
  `UltimoSeguimiento_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2F56BF2451EAD33` (`UltimoSeguimiento_id`),
  CONSTRAINT `FK_2F56BF2451EAD33` FOREIGN KEY (`UltimoSeguimiento_id`) REFERENCES `Administracion_Seguimiento` (`id`),
  CONSTRAINT `FK_2F56BF2BF396750` FOREIGN KEY (`id`) REFERENCES `Tramites_Tramite` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ecologia_TramiteCatEc`
--

LOCK TABLES `Ecologia_TramiteCatEc` WRITE;
/*!40000 ALTER TABLE `Ecologia_TramiteCatEc` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ecologia_TramiteCatEc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Expedientes_Expediente`
--

DROP TABLE IF EXISTS `Expedientes_Expediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Expedientes_Expediente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Ubicacion_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8DB67B284FD68210` (`Ubicacion_id`),
  CONSTRAINT `FK_8DB67B284FD68210` FOREIGN KEY (`Ubicacion_id`) REFERENCES `Organizacion_Departamento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Expedientes_Expediente`
--

LOCK TABLES `Expedientes_Expediente` WRITE;
/*!40000 ALTER TABLE `Expedientes_Expediente` DISABLE KEYS */;
/*!40000 ALTER TABLE `Expedientes_Expediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inspeccion_Acta`
--

DROP TABLE IF EXISTS `Inspeccion_Acta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inspeccion_Acta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SubTipo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Numero` int(11) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Detalle` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `ActaTipo_id` int(11) NOT NULL,
  `FuncionarioPrincipal_id` int(11) NOT NULL,
  `ActaTipoClase` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_53ED0A3BC6972C2` (`ActaTipo_id`),
  KEY `IDX_53ED0A3B8AA93BD4` (`FuncionarioPrincipal_id`),
  CONSTRAINT `FK_53ED0A3B8AA93BD4` FOREIGN KEY (`FuncionarioPrincipal_id`) REFERENCES `Base_Persona` (`id`),
  CONSTRAINT `FK_53ED0A3BC6972C2` FOREIGN KEY (`ActaTipo_id`) REFERENCES `Inspeccion_ActaTipo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=414 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inspeccion_Acta`
--

LOCK TABLES `Inspeccion_Acta` WRITE;
/*!40000 ALTER TABLE `Inspeccion_Acta` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inspeccion_Acta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inspeccion_ActaTalonario`
--

DROP TABLE IF EXISTS `Inspeccion_ActaTalonario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inspeccion_ActaTalonario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NumeroDesde` int(11) NOT NULL,
  `NumeroHasta` int(11) NOT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Tipo_id` int(11) DEFAULT NULL,
  `EnPoderDe_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2E5489F5669A57F0` (`Tipo_id`),
  KEY `IDX_2E5489F51837F7DF` (`EnPoderDe_id`),
  CONSTRAINT `FK_2E5489F51837F7DF` FOREIGN KEY (`EnPoderDe_id`) REFERENCES `Base_Persona` (`id`),
  CONSTRAINT `FK_2E5489F5669A57F0` FOREIGN KEY (`Tipo_id`) REFERENCES `Inspeccion_ActaTipo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inspeccion_ActaTalonario`
--

LOCK TABLES `Inspeccion_ActaTalonario` WRITE;
/*!40000 ALTER TABLE `Inspeccion_ActaTalonario` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inspeccion_ActaTalonario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inspeccion_ActaTipo`
--

DROP TABLE IF EXISTS `Inspeccion_ActaTipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inspeccion_ActaTipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Clase` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Departamento_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E310C5E0D254FE13` (`Departamento_id`),
  CONSTRAINT `FK_E310C5E0D254FE13` FOREIGN KEY (`Departamento_id`) REFERENCES `Organizacion_Departamento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=415 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inspeccion_ActaTipo`
--

LOCK TABLES `Inspeccion_ActaTipo` WRITE;
/*!40000 ALTER TABLE `Inspeccion_ActaTipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inspeccion_ActaTipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inspeccion_Acta_OtrosFuncionarios`
--

DROP TABLE IF EXISTS `Inspeccion_Acta_OtrosFuncionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inspeccion_Acta_OtrosFuncionarios` (
  `acta_id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  PRIMARY KEY (`acta_id`,`persona_id`),
  KEY `IDX_DA3C572A28052F90` (`acta_id`),
  KEY `IDX_DA3C572AF5F88DB9` (`persona_id`),
  CONSTRAINT `FK_DA3C572A28052F90` FOREIGN KEY (`acta_id`) REFERENCES `Inspeccion_Acta` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_DA3C572AF5F88DB9` FOREIGN KEY (`persona_id`) REFERENCES `Base_Persona` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inspeccion_Acta_OtrosFuncionarios`
--

LOCK TABLES `Inspeccion_Acta_OtrosFuncionarios` WRITE;
/*!40000 ALTER TABLE `Inspeccion_Acta_OtrosFuncionarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inspeccion_Acta_OtrosFuncionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inspeccion_Relevamiento`
--

DROP TABLE IF EXISTS `Inspeccion_Relevamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inspeccion_Relevamiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FechaInicio` datetime NOT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `Suprimido` tinyint(1) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inspeccion_Relevamiento`
--

LOCK TABLES `Inspeccion_Relevamiento` WRITE;
/*!40000 ALTER TABLE `Inspeccion_Relevamiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inspeccion_Relevamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inspeccion_RelevamientoAsignacion`
--

DROP TABLE IF EXISTS `Inspeccion_RelevamientoAsignacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inspeccion_RelevamientoAsignacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Seccion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Macizo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DetallesCantidad` int(11) NOT NULL,
  `DetallesResultadosCantidad` int(11) NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `Suprimido` tinyint(1) NOT NULL,
  `Archivado` tinyint(1) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Relevamiento_id` int(11) DEFAULT NULL,
  `Encargado_id` int(11) NOT NULL,
  `Calle_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7C7E865B8A575530` (`Relevamiento_id`),
  KEY `IDX_7C7E865B554483A6` (`Encargado_id`),
  KEY `IDX_7C7E865B59FD1348` (`Calle_id`),
  CONSTRAINT `FK_7C7E865B554483A6` FOREIGN KEY (`Encargado_id`) REFERENCES `Base_Persona` (`id`),
  CONSTRAINT `FK_7C7E865B59FD1348` FOREIGN KEY (`Calle_id`) REFERENCES `Catastro_Calle` (`id`),
  CONSTRAINT `FK_7C7E865B8A575530` FOREIGN KEY (`Relevamiento_id`) REFERENCES `Inspeccion_Relevamiento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inspeccion_RelevamientoAsignacion`
--

LOCK TABLES `Inspeccion_RelevamientoAsignacion` WRITE;
/*!40000 ALTER TABLE `Inspeccion_RelevamientoAsignacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inspeccion_RelevamientoAsignacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inspeccion_RelevamientoAsignacionDetalle`
--

DROP TABLE IF EXISTS `Inspeccion_RelevamientoAsignacionDetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inspeccion_RelevamientoAsignacionDetalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PartidaSeccion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PartidaMacizo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PartidaParcela` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PartidaCalleNombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PartidaCalleNumero` int(11) DEFAULT NULL,
  `ResultadosCantidad` int(11) NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `Suprimido` tinyint(1) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Relevamiento_id` int(11) DEFAULT NULL,
  `Asignacion_id` int(11) DEFAULT NULL,
  `Encargado_id` int(11) DEFAULT NULL,
  `Partida_id` int(11) DEFAULT NULL,
  `PartidaCalle_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C1B44EAE8A575530` (`Relevamiento_id`),
  KEY `IDX_C1B44EAE60C7646B` (`Asignacion_id`),
  KEY `IDX_C1B44EAE554483A6` (`Encargado_id`),
  KEY `IDX_C1B44EAEBE071A57` (`Partida_id`),
  KEY `IDX_C1B44EAE312EAFBF` (`PartidaCalle_id`),
  CONSTRAINT `FK_C1B44EAE312EAFBF` FOREIGN KEY (`PartidaCalle_id`) REFERENCES `Catastro_Calle` (`id`),
  CONSTRAINT `FK_C1B44EAE554483A6` FOREIGN KEY (`Encargado_id`) REFERENCES `Base_Persona` (`id`),
  CONSTRAINT `FK_C1B44EAE60C7646B` FOREIGN KEY (`Asignacion_id`) REFERENCES `Inspeccion_RelevamientoAsignacion` (`id`),
  CONSTRAINT `FK_C1B44EAE8A575530` FOREIGN KEY (`Relevamiento_id`) REFERENCES `Inspeccion_Relevamiento` (`id`),
  CONSTRAINT `FK_C1B44EAEBE071A57` FOREIGN KEY (`Partida_id`) REFERENCES `Catastro_Partida` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inspeccion_RelevamientoAsignacionDetalle`
--

LOCK TABLES `Inspeccion_RelevamientoAsignacionDetalle` WRITE;
/*!40000 ALTER TABLE `Inspeccion_RelevamientoAsignacionDetalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inspeccion_RelevamientoAsignacionDetalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inspeccion_RelevamientoAsignacionResultado`
--

DROP TABLE IF EXISTS `Inspeccion_RelevamientoAsignacionResultado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inspeccion_RelevamientoAsignacionResultado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Ubicacion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `imagen` longblob DEFAULT NULL,
  `Suprimido` tinyint(1) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Resultado_id` int(11) DEFAULT NULL,
  `Asignacion_id` int(11) DEFAULT NULL,
  `Detalle_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2C3B6E85E760374E` (`Resultado_id`),
  KEY `IDX_2C3B6E8560C7646B` (`Asignacion_id`),
  KEY `IDX_2C3B6E85D1F89D02` (`Detalle_id`),
  CONSTRAINT `FK_2C3B6E8560C7646B` FOREIGN KEY (`Asignacion_id`) REFERENCES `Inspeccion_RelevamientoAsignacion` (`id`),
  CONSTRAINT `FK_2C3B6E85D1F89D02` FOREIGN KEY (`Detalle_id`) REFERENCES `Inspeccion_RelevamientoAsignacionDetalle` (`id`),
  CONSTRAINT `FK_2C3B6E85E760374E` FOREIGN KEY (`Resultado_id`) REFERENCES `Inspeccion_RelevamientoResultado` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inspeccion_RelevamientoAsignacionResultado`
--

LOCK TABLES `Inspeccion_RelevamientoAsignacionResultado` WRITE;
/*!40000 ALTER TABLE `Inspeccion_RelevamientoAsignacionResultado` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inspeccion_RelevamientoAsignacionResultado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inspeccion_RelevamientoResultado`
--

DROP TABLE IF EXISTS `Inspeccion_RelevamientoResultado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inspeccion_RelevamientoResultado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Grupo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `Suprimido` tinyint(1) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inspeccion_RelevamientoResultado`
--

LOCK TABLES `Inspeccion_RelevamientoResultado` WRITE;
/*!40000 ALTER TABLE `Inspeccion_RelevamientoResultado` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inspeccion_RelevamientoResultado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Nomina_Dispositivo`
--

DROP TABLE IF EXISTS `Nomina_Dispositivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Nomina_Dispositivo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Marca` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Modelo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NumeroSerie` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `IdentificadorUnico` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Firmware` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Encargado_id` int(11) DEFAULT NULL,
  `Departamento_id` int(11) DEFAULT NULL,
  `DispositivoTipo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E21350F7554483A6` (`Encargado_id`),
  KEY `IDX_E21350F7D254FE13` (`Departamento_id`),
  CONSTRAINT `FK_E21350F7554483A6` FOREIGN KEY (`Encargado_id`) REFERENCES `Base_Persona` (`id`),
  CONSTRAINT `FK_E21350F7D254FE13` FOREIGN KEY (`Departamento_id`) REFERENCES `Organizacion_Departamento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Nomina_Dispositivo`
--

LOCK TABLES `Nomina_Dispositivo` WRITE;
/*!40000 ALTER TABLE `Nomina_Dispositivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Nomina_Dispositivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Nomina_DispositivoGenerico`
--

DROP TABLE IF EXISTS `Nomina_DispositivoGenerico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Nomina_DispositivoGenerico` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_E8182DB3BF396750` FOREIGN KEY (`id`) REFERENCES `Nomina_Dispositivo` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Nomina_DispositivoGenerico`
--

LOCK TABLES `Nomina_DispositivoGenerico` WRITE;
/*!40000 ALTER TABLE `Nomina_DispositivoGenerico` DISABLE KEYS */;
/*!40000 ALTER TABLE `Nomina_DispositivoGenerico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Nomina_DispositivoRastreadorGps`
--

DROP TABLE IF EXISTS `Nomina_DispositivoRastreadorGps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Nomina_DispositivoRastreadorGps` (
  `id` int(11) NOT NULL,
  `TelefonoNumero` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_A3EA8AA1BF396750` FOREIGN KEY (`id`) REFERENCES `Nomina_Dispositivo` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Nomina_DispositivoRastreadorGps`
--

LOCK TABLES `Nomina_DispositivoRastreadorGps` WRITE;
/*!40000 ALTER TABLE `Nomina_DispositivoRastreadorGps` DISABLE KEYS */;
/*!40000 ALTER TABLE `Nomina_DispositivoRastreadorGps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Nomina_DispositivoRastreo`
--

DROP TABLE IF EXISTS `Nomina_DispositivoRastreo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Nomina_DispositivoRastreo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Ubicacion` point NOT NULL COMMENT '(DC2Type:point)',
  `Velocidad` int(11) NOT NULL,
  `Rumbo` int(11) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Dispositivo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D432619F30538FA3` (`Dispositivo_id`),
  CONSTRAINT `FK_D432619F30538FA3` FOREIGN KEY (`Dispositivo_id`) REFERENCES `Nomina_DispositivoRastreadorGps` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Nomina_DispositivoRastreo`
--

LOCK TABLES `Nomina_DispositivoRastreo` WRITE;
/*!40000 ALTER TABLE `Nomina_DispositivoRastreo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Nomina_DispositivoRastreo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Nomina_Inmueble`
--

DROP TABLE IF EXISTS `Nomina_Inmueble`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Nomina_Inmueble` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Telefonos` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Horario` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `DomicilioNumero` int(11) DEFAULT NULL,
  `DomicilioPiso` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DomicilioPuerta` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `Ubicacion` point DEFAULT NULL COMMENT '(DC2Type:point)',
  `UbicacionFecha` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Partida_id` int(11) NOT NULL,
  `DomicilioCalle_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9C62DF18BE071A57` (`Partida_id`),
  KEY `IDX_9C62DF1824A57A5` (`DomicilioCalle_id`),
  CONSTRAINT `FK_9C62DF1824A57A5` FOREIGN KEY (`DomicilioCalle_id`) REFERENCES `Catastro_Calle` (`id`),
  CONSTRAINT `FK_9C62DF18BE071A57` FOREIGN KEY (`Partida_id`) REFERENCES `Catastro_Partida` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Nomina_Inmueble`
--

LOCK TABLES `Nomina_Inmueble` WRITE;
/*!40000 ALTER TABLE `Nomina_Inmueble` DISABLE KEYS */;
/*!40000 ALTER TABLE `Nomina_Inmueble` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Nomina_InmuebleEtiqueta`
--

DROP TABLE IF EXISTS `Nomina_InmuebleEtiqueta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Nomina_InmuebleEtiqueta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Nomina_InmuebleEtiqueta`
--

LOCK TABLES `Nomina_InmuebleEtiqueta` WRITE;
/*!40000 ALTER TABLE `Nomina_InmuebleEtiqueta` DISABLE KEYS */;
/*!40000 ALTER TABLE `Nomina_InmuebleEtiqueta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Nomina_Inmueble_InmuebleEtiqueta`
--

DROP TABLE IF EXISTS `Nomina_Inmueble_InmuebleEtiqueta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Nomina_Inmueble_InmuebleEtiqueta` (
  `inmueble_id` int(11) NOT NULL,
  `inmuebleetiqueta_id` int(11) NOT NULL,
  PRIMARY KEY (`inmueble_id`,`inmuebleetiqueta_id`),
  KEY `IDX_DF2386DF932498D9` (`inmueble_id`),
  KEY `IDX_DF2386DFD34D5452` (`inmuebleetiqueta_id`),
  CONSTRAINT `FK_DF2386DF932498D9` FOREIGN KEY (`inmueble_id`) REFERENCES `Nomina_Inmueble` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_DF2386DFD34D5452` FOREIGN KEY (`inmuebleetiqueta_id`) REFERENCES `Nomina_InmuebleEtiqueta` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Nomina_Inmueble_InmuebleEtiqueta`
--

LOCK TABLES `Nomina_Inmueble_InmuebleEtiqueta` WRITE;
/*!40000 ALTER TABLE `Nomina_Inmueble_InmuebleEtiqueta` DISABLE KEYS */;
/*!40000 ALTER TABLE `Nomina_Inmueble_InmuebleEtiqueta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Notif_Mensaje`
--

DROP TABLE IF EXISTS `Notif_Mensaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Notif_Mensaje` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Leido` tinyint(1) NOT NULL,
  `Agrupamiento` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Acciones` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Notas` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Archivado` tinyint(1) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Destinatario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1B1DC48C3DA1C55F` (`Destinatario_id`),
  KEY `Notif_Mensaje_Destinatario_Leido` (`Destinatario_id`,`Leido`),
  KEY `Notif_Mensaje_Destinatario_Agrupamiento_createdAt` (`Destinatario_id`,`Agrupamiento`,`createdAt`),
  CONSTRAINT `FK_1B1DC48C3DA1C55F` FOREIGN KEY (`Destinatario_id`) REFERENCES `Base_Persona` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Notif_Mensaje`
--

LOCK TABLES `Notif_Mensaje` WRITE;
/*!40000 ALTER TABLE `Notif_Mensaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `Notif_Mensaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ObrasParticulares_ActaObra`
--

DROP TABLE IF EXISTS `ObrasParticulares_ActaObra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ObrasParticulares_ActaObra` (
  `id` int(11) NOT NULL,
  `TipoObra` int(11) DEFAULT NULL,
  `TipoConstruccion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EstadoAvance` int(11) NOT NULL,
  `FechaDescargo` datetime DEFAULT NULL,
  `Plazo` int(11) DEFAULT NULL,
  `DescargoDetalle` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Cumplido` tinyint(1) NOT NULL,
  `Profesional_id` int(11) DEFAULT NULL,
  `Partida_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A9068C75FC590761` (`Profesional_id`),
  KEY `IDX_A9068C75BE071A57` (`Partida_id`),
  CONSTRAINT `FK_A9068C75BE071A57` FOREIGN KEY (`Partida_id`) REFERENCES `Catastro_Partida` (`id`),
  CONSTRAINT `FK_A9068C75BF396750` FOREIGN KEY (`id`) REFERENCES `Inspeccion_Acta` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A9068C75FC590761` FOREIGN KEY (`Profesional_id`) REFERENCES `ObrasParticulares_Matriculado` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ObrasParticulares_ActaObra`
--

LOCK TABLES `ObrasParticulares_ActaObra` WRITE;
/*!40000 ALTER TABLE `ObrasParticulares_ActaObra` DISABLE KEYS */;
/*!40000 ALTER TABLE `ObrasParticulares_ActaObra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ObrasParticulares_ActaObra_TipoFalta`
--

DROP TABLE IF EXISTS `ObrasParticulares_ActaObra_TipoFalta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ObrasParticulares_ActaObra_TipoFalta` (
  `actaobra_id` int(11) NOT NULL,
  `tipofalta_id` int(11) NOT NULL,
  PRIMARY KEY (`actaobra_id`,`tipofalta_id`),
  KEY `IDX_BE1AB3B7D049D82D` (`actaobra_id`),
  KEY `IDX_BE1AB3B75028F4B3` (`tipofalta_id`),
  CONSTRAINT `FK_BE1AB3B75028F4B3` FOREIGN KEY (`tipofalta_id`) REFERENCES `ObrasParticulares_TipoFalta` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_BE1AB3B7D049D82D` FOREIGN KEY (`actaobra_id`) REFERENCES `ObrasParticulares_ActaObra` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ObrasParticulares_ActaObra_TipoFalta`
--

LOCK TABLES `ObrasParticulares_ActaObra_TipoFalta` WRITE;
/*!40000 ALTER TABLE `ObrasParticulares_ActaObra_TipoFalta` DISABLE KEYS */;
/*!40000 ALTER TABLE `ObrasParticulares_ActaObra_TipoFalta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ObrasParticulares_CatEd`
--

DROP TABLE IF EXISTS `ObrasParticulares_CatEd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ObrasParticulares_CatEd` (
  `id` int(11) NOT NULL,
  `FechaValidezHasta` date DEFAULT NULL,
  `Partida_id` int(11) NOT NULL,
  `Local_id` int(11) DEFAULT NULL,
  `ActividadPrincipal_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A3C49242BE071A57` (`Partida_id`),
  KEY `IDX_A3C49242A42C4357` (`Local_id`),
  KEY `IDX_A3C492423030A316` (`ActividadPrincipal_id`),
  CONSTRAINT `FK_A3C492423030A316` FOREIGN KEY (`ActividadPrincipal_id`) REFERENCES `Comercio_Actividad` (`id`),
  CONSTRAINT `FK_A3C49242A42C4357` FOREIGN KEY (`Local_id`) REFERENCES `Comercio_Local` (`id`),
  CONSTRAINT `FK_A3C49242BE071A57` FOREIGN KEY (`Partida_id`) REFERENCES `Catastro_Partida` (`id`),
  CONSTRAINT `FK_A3C49242BF396750` FOREIGN KEY (`id`) REFERENCES `Tramites_Comprobante` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ObrasParticulares_CatEd`
--

LOCK TABLES `ObrasParticulares_CatEd` WRITE;
/*!40000 ALTER TABLE `ObrasParticulares_CatEd` DISABLE KEYS */;
/*!40000 ALTER TABLE `ObrasParticulares_CatEd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ObrasParticulares_EmpresaConstructora`
--

DROP TABLE IF EXISTS `ObrasParticulares_EmpresaConstructora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ObrasParticulares_EmpresaConstructora` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Numero` int(11) DEFAULT NULL,
  `NombreFantasia` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FechaVencimiento` date DEFAULT NULL,
  `Suprimido` tinyint(1) NOT NULL,
  `Archivado` tinyint(1) NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Persona_id` int(11) NOT NULL,
  `RepresentanteTecnico_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E8171710BAA58E69` (`Persona_id`),
  KEY `IDX_E81717101095BAA8` (`RepresentanteTecnico_id`),
  CONSTRAINT `FK_E81717101095BAA8` FOREIGN KEY (`RepresentanteTecnico_id`) REFERENCES `ObrasParticulares_Matriculado` (`id`),
  CONSTRAINT `FK_E8171710BAA58E69` FOREIGN KEY (`Persona_id`) REFERENCES `Base_Persona` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ObrasParticulares_EmpresaConstructora`
--

LOCK TABLES `ObrasParticulares_EmpresaConstructora` WRITE;
/*!40000 ALTER TABLE `ObrasParticulares_EmpresaConstructora` DISABLE KEYS */;
/*!40000 ALTER TABLE `ObrasParticulares_EmpresaConstructora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ObrasParticulares_Matriculado`
--

DROP TABLE IF EXISTS `ObrasParticulares_Matriculado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ObrasParticulares_Matriculado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Numero` int(11) DEFAULT NULL,
  `NumeroMatriculaColegio` int(11) DEFAULT NULL,
  `Profesion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FechaVencimiento` date DEFAULT NULL,
  `CursoAntisismico` int(11) DEFAULT NULL,
  `FechaInscripcionMunicipalidad` date DEFAULT NULL,
  `Suprimido` tinyint(1) NOT NULL,
  `Archivado` tinyint(1) NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Persona_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Persona_id` (`Persona_id`),
  UNIQUE KEY `Numero` (`Numero`),
  CONSTRAINT `FK_9D07DDF3BAA58E69` FOREIGN KEY (`Persona_id`) REFERENCES `Base_Persona` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ObrasParticulares_Matriculado`
--

LOCK TABLES `ObrasParticulares_Matriculado` WRITE;
/*!40000 ALTER TABLE `ObrasParticulares_Matriculado` DISABLE KEYS */;
/*!40000 ALTER TABLE `ObrasParticulares_Matriculado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ObrasParticulares_ObraDestino`
--

DROP TABLE IF EXISTS `ObrasParticulares_ObraDestino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ObrasParticulares_ObraDestino` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ObrasParticulares_ObraDestino`
--

LOCK TABLES `ObrasParticulares_ObraDestino` WRITE;
/*!40000 ALTER TABLE `ObrasParticulares_ObraDestino` DISABLE KEYS */;
/*!40000 ALTER TABLE `ObrasParticulares_ObraDestino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ObrasParticulares_TipoFalta`
--

DROP TABLE IF EXISTS `ObrasParticulares_TipoFalta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ObrasParticulares_TipoFalta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FaltaCompromiso` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ObrasParticulares_TipoFalta`
--

LOCK TABLES `ObrasParticulares_TipoFalta` WRITE;
/*!40000 ALTER TABLE `ObrasParticulares_TipoFalta` DISABLE KEYS */;
/*!40000 ALTER TABLE `ObrasParticulares_TipoFalta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ObrasParticulares_TramiteCatEd`
--

DROP TABLE IF EXISTS `ObrasParticulares_TramiteCatEd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ObrasParticulares_TramiteCatEd` (
  `id` int(11) NOT NULL,
  `ExpedienteNumero` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TurnoFecha` datetime DEFAULT NULL,
  `ProvisorioHasta` datetime DEFAULT NULL,
  `UltimoSeguimiento_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_39DC2B4A451EAD33` (`UltimoSeguimiento_id`),
  CONSTRAINT `FK_39DC2B4A451EAD33` FOREIGN KEY (`UltimoSeguimiento_id`) REFERENCES `Administracion_Seguimiento` (`id`),
  CONSTRAINT `FK_39DC2B4ABF396750` FOREIGN KEY (`id`) REFERENCES `Tramites_Tramite` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ObrasParticulares_TramiteCatEd`
--

LOCK TABLES `ObrasParticulares_TramiteCatEd` WRITE;
/*!40000 ALTER TABLE `ObrasParticulares_TramiteCatEd` DISABLE KEYS */;
/*!40000 ALTER TABLE `ObrasParticulares_TramiteCatEd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ObrasParticulares_TramitePlano`
--

DROP TABLE IF EXISTS `ObrasParticulares_TramitePlano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ObrasParticulares_TramitePlano` (
  `id` int(11) NOT NULL,
  `NumeroPrevia` int(11) NOT NULL,
  `PlanoTipo` int(11) NOT NULL,
  `TipoAprobacion` int(11) NOT NULL,
  `TipoConstruccion` int(11) NOT NULL,
  `EstadoCategoria` int(11) NOT NULL,
  `InicioDeObra` date DEFAULT NULL,
  `SuperficieProyectada` double NOT NULL,
  `SuperficieAprobada` double NOT NULL,
  `SuperficieRelevada` double NOT NULL,
  `FechaAprobadaPrevia` datetime DEFAULT NULL,
  `ImporteLiquidado` double DEFAULT NULL,
  `MoratoriaOM3617` int(11) NOT NULL,
  `ExpedienteNumero` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Profesional_id` int(11) NOT NULL,
  `UltimoSeguimiento_id` int(11) DEFAULT NULL,
  `Partida_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_17B95BBFFC590761` (`Profesional_id`),
  KEY `IDX_17B95BBF451EAD33` (`UltimoSeguimiento_id`),
  KEY `IDX_17B95BBFBE071A57` (`Partida_id`),
  CONSTRAINT `FK_17B95BBF451EAD33` FOREIGN KEY (`UltimoSeguimiento_id`) REFERENCES `Administracion_Seguimiento` (`id`),
  CONSTRAINT `FK_17B95BBFBE071A57` FOREIGN KEY (`Partida_id`) REFERENCES `Catastro_Partida` (`id`),
  CONSTRAINT `FK_17B95BBFBF396750` FOREIGN KEY (`id`) REFERENCES `Tramites_Tramite` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_17B95BBFFC590761` FOREIGN KEY (`Profesional_id`) REFERENCES `ObrasParticulares_Matriculado` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ObrasParticulares_TramitePlano`
--

LOCK TABLES `ObrasParticulares_TramitePlano` WRITE;
/*!40000 ALTER TABLE `ObrasParticulares_TramitePlano` DISABLE KEYS */;
/*!40000 ALTER TABLE `ObrasParticulares_TramitePlano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ObrasParticulares_TramitePlano_ObraDestino`
--

DROP TABLE IF EXISTS `ObrasParticulares_TramitePlano_ObraDestino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ObrasParticulares_TramitePlano_ObraDestino` (
  `obradestino_id` int(11) NOT NULL,
  `Tramite_id` int(11) NOT NULL,
  PRIMARY KEY (`Tramite_id`,`obradestino_id`),
  KEY `IDX_530CCAA6CD512B99` (`Tramite_id`),
  KEY `IDX_530CCAA63BCA15FD` (`obradestino_id`),
  CONSTRAINT `FK_530CCAA63BCA15FD` FOREIGN KEY (`obradestino_id`) REFERENCES `ObrasParticulares_ObraDestino` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_530CCAA6CD512B99` FOREIGN KEY (`Tramite_id`) REFERENCES `ObrasParticulares_TramitePlano` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ObrasParticulares_TramitePlano_ObraDestino`
--

LOCK TABLES `ObrasParticulares_TramitePlano_ObraDestino` WRITE;
/*!40000 ALTER TABLE `ObrasParticulares_TramitePlano_ObraDestino` DISABLE KEYS */;
/*!40000 ALTER TABLE `ObrasParticulares_TramitePlano_ObraDestino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ObrasSanitarias_TramiteCatSa`
--

DROP TABLE IF EXISTS `ObrasSanitarias_TramiteCatSa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ObrasSanitarias_TramiteCatSa` (
  `id` int(11) NOT NULL,
  `ExpedienteNumero` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TurnoFecha` datetime DEFAULT NULL,
  `ProvisorioHasta` datetime DEFAULT NULL,
  `UltimoSeguimiento_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_ADCF2060451EAD33` (`UltimoSeguimiento_id`),
  CONSTRAINT `FK_ADCF2060451EAD33` FOREIGN KEY (`UltimoSeguimiento_id`) REFERENCES `Administracion_Seguimiento` (`id`),
  CONSTRAINT `FK_ADCF2060BF396750` FOREIGN KEY (`id`) REFERENCES `Tramites_Tramite` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ObrasSanitarias_TramiteCatSa`
--

LOCK TABLES `ObrasSanitarias_TramiteCatSa` WRITE;
/*!40000 ALTER TABLE `ObrasSanitarias_TramiteCatSa` DISABLE KEYS */;
/*!40000 ALTER TABLE `ObrasSanitarias_TramiteCatSa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Organizacion_Departamento`
--

DROP TABLE IF EXISTS `Organizacion_Departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Organizacion_Departamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Rango` int(11) DEFAULT NULL,
  `Codigo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NombreOriginal` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HaceParteDiario` tinyint(1) NOT NULL,
  `CodigoPayroll` int(11) NOT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `Suprimido` tinyint(1) NOT NULL,
  `ImportSrc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ImportId` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ImportedAt` datetime DEFAULT NULL,
  `MaterializedPath` longtext COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `ParentNode_id` int(11) DEFAULT NULL,
  `Secretaria` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Direccion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ImportSrcId` (`ImportSrc`,`ImportId`),
  KEY `Organizacion_Departamento_ParentNode_id` (`ParentNode_id`),
  CONSTRAINT `FK_18DF13E98CEEC9FB` FOREIGN KEY (`ParentNode_id`) REFERENCES `Organizacion_Departamento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=923 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Organizacion_Departamento`
--

LOCK TABLES `Organizacion_Departamento` WRITE;
/*!40000 ALTER TABLE `Organizacion_Departamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Organizacion_Departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Requerimientos_Categoria`
--

DROP TABLE IF EXISTS `Requerimientos_Categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Requerimientos_Categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PermiteAnonimos` int(11) NOT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Encargado_id` int(11) DEFAULT NULL,
  `Administrador_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_67B336AD554483A6` (`Encargado_id`),
  KEY `IDX_67B336AD5FE090CA` (`Administrador_id`),
  CONSTRAINT `FK_67B336AD554483A6` FOREIGN KEY (`Encargado_id`) REFERENCES `Base_Persona` (`id`),
  CONSTRAINT `FK_67B336AD5FE090CA` FOREIGN KEY (`Administrador_id`) REFERENCES `Base_Persona` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Requerimientos_Categoria`
--

LOCK TABLES `Requerimientos_Categoria` WRITE;
/*!40000 ALTER TABLE `Requerimientos_Categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `Requerimientos_Categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Requerimientos_Perfil`
--

DROP TABLE IF EXISTS `Requerimientos_Perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Requerimientos_Perfil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PermiteAnonimos` int(11) NOT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `Suprimido` tinyint(1) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Administrador_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DC172FD65FE090CA` (`Administrador_id`),
  CONSTRAINT `FK_DC172FD65FE090CA` FOREIGN KEY (`Administrador_id`) REFERENCES `Base_Persona` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Requerimientos_Perfil`
--

LOCK TABLES `Requerimientos_Perfil` WRITE;
/*!40000 ALTER TABLE `Requerimientos_Perfil` DISABLE KEYS */;
/*!40000 ALTER TABLE `Requerimientos_Perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Requerimientos_PerfilCategoria`
--

DROP TABLE IF EXISTS `Requerimientos_PerfilCategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Requerimientos_PerfilCategoria` (
  `perfil_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  PRIMARY KEY (`perfil_id`,`categoria_id`),
  KEY `IDX_4C2FA6D357291544` (`perfil_id`),
  KEY `IDX_4C2FA6D33397707A` (`categoria_id`),
  CONSTRAINT `FK_4C2FA6D33397707A` FOREIGN KEY (`categoria_id`) REFERENCES `Requerimientos_Categoria` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_4C2FA6D357291544` FOREIGN KEY (`perfil_id`) REFERENCES `Requerimientos_Perfil` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Requerimientos_PerfilCategoria`
--

LOCK TABLES `Requerimientos_PerfilCategoria` WRITE;
/*!40000 ALTER TABLE `Requerimientos_PerfilCategoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `Requerimientos_PerfilCategoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Requerimientos_PerfilEncargado`
--

DROP TABLE IF EXISTS `Requerimientos_PerfilEncargado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Requerimientos_PerfilEncargado` (
  `perfil_id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  PRIMARY KEY (`perfil_id`,`persona_id`),
  KEY `IDX_FE3F53DD57291544` (`perfil_id`),
  KEY `IDX_FE3F53DDF5F88DB9` (`persona_id`),
  CONSTRAINT `FK_FE3F53DD57291544` FOREIGN KEY (`perfil_id`) REFERENCES `Requerimientos_Perfil` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_FE3F53DDF5F88DB9` FOREIGN KEY (`persona_id`) REFERENCES `Base_Persona` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Requerimientos_PerfilEncargado`
--

LOCK TABLES `Requerimientos_PerfilEncargado` WRITE;
/*!40000 ALTER TABLE `Requerimientos_PerfilEncargado` DISABLE KEYS */;
/*!40000 ALTER TABLE `Requerimientos_PerfilEncargado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Requerimientos_Requerimiento`
--

DROP TABLE IF EXISTS `Requerimientos_Requerimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Requerimientos_Requerimiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UsuarioNombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UsuarioEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UsuarioDireccion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UsuarioTelefono` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Estado` int(11) NOT NULL,
  `Prioridad` int(11) DEFAULT NULL,
  `Calificacion` int(11) DEFAULT NULL,
  `Ubicacion` point DEFAULT NULL COMMENT '(DC2Type:point)',
  `InternoNumero` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Token` int(11) NOT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Notas` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `ImportSrc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ImportId` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ImportedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Encargado_id` int(11) DEFAULT NULL,
  `Perfil_id` int(11) DEFAULT NULL,
  `Categoria_id` int(11) DEFAULT NULL,
  `Usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_416C0B53D5D897E7` (`Perfil_id`),
  KEY `IDX_416C0B532BA6AB82` (`Categoria_id`),
  KEY `IDX_416C0B539465404E` (`Usuario_id`),
  KEY `Requerimientos_Requerimiento_Encargado` (`Encargado_id`),
  KEY `Requerimientos_Requerimiento_Estado` (`Estado`),
  CONSTRAINT `FK_416C0B532BA6AB82` FOREIGN KEY (`Categoria_id`) REFERENCES `Requerimientos_Categoria` (`id`),
  CONSTRAINT `FK_416C0B53554483A6` FOREIGN KEY (`Encargado_id`) REFERENCES `Base_Persona` (`id`),
  CONSTRAINT `FK_416C0B539465404E` FOREIGN KEY (`Usuario_id`) REFERENCES `Base_Persona` (`id`),
  CONSTRAINT `FK_416C0B53D5D897E7` FOREIGN KEY (`Perfil_id`) REFERENCES `Requerimientos_Perfil` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Requerimientos_Requerimiento`
--

LOCK TABLES `Requerimientos_Requerimiento` WRITE;
/*!40000 ALTER TABLE `Requerimientos_Requerimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Requerimientos_Requerimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Requerimientos_Requerimiento_Novedad`
--

DROP TABLE IF EXISTS `Requerimientos_Requerimiento_Novedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Requerimientos_Requerimiento_Novedad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UsuarioNombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UsuarioEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UsuarioDireccion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UsuarioTelefono` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NuevoEstado` int(11) DEFAULT NULL,
  `Privada` int(11) NOT NULL,
  `Automatica` int(11) NOT NULL,
  `Notas` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Requerimiento_id` int(11) NOT NULL,
  `Usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C4341DAA46E2727D` (`Requerimiento_id`),
  KEY `IDX_C4341DAA9465404E` (`Usuario_id`),
  CONSTRAINT `FK_C4341DAA46E2727D` FOREIGN KEY (`Requerimiento_id`) REFERENCES `Requerimientos_Requerimiento` (`id`),
  CONSTRAINT `FK_C4341DAA9465404E` FOREIGN KEY (`Usuario_id`) REFERENCES `Base_Persona` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Requerimientos_Requerimiento_Novedad`
--

LOCK TABLES `Requerimientos_Requerimiento_Novedad` WRITE;
/*!40000 ALTER TABLE `Requerimientos_Requerimiento_Novedad` DISABLE KEYS */;
/*!40000 ALTER TABLE `Requerimientos_Requerimiento_Novedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rrhh_Agente`
--

DROP TABLE IF EXISTS `Rrhh_Agente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rrhh_Agente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Categoria` int(11) NOT NULL,
  `Planta` int(11) NOT NULL,
  `PlantaDecreto` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PlantaDecretoFecha` date DEFAULT NULL,
  `CategoriaACargo` tinyint(1) NOT NULL,
  `Situacion` int(11) NOT NULL,
  `Funcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FechaIngreso` date DEFAULT NULL,
  `BajaFecha` date DEFAULT NULL,
  `BajaMotivo` smallint(6) DEFAULT NULL,
  `EstudiosNivel` smallint(6) NOT NULL,
  `EstudiosTitulo` int(11) DEFAULT NULL,
  `ExCombatiente` tinyint(1) NOT NULL,
  `Discapacitado` tinyint(1) NOT NULL,
  `ManoHabil` smallint(6) NOT NULL,
  `FechaNacionalizacion` date DEFAULT NULL,
  `UltimaActualizacionDomicilio` date DEFAULT NULL,
  `LugarNacimiento` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FechaPsicofisico` date DEFAULT NULL,
  `FechaCertificadoBuenaConducta` date DEFAULT NULL,
  `FechaCertificadoAntecedentesPenales` date DEFAULT NULL,
  `FechaCertificadoDomicilio` date DEFAULT NULL,
  `ApareceEnParte` tinyint(1) DEFAULT NULL,
  `ControlaHorario` tinyint(1) DEFAULT NULL,
  `MarcaEnReloj` tinyint(1) DEFAULT NULL,
  `NumeroCuentaBanco` int(11) DEFAULT NULL,
  `CBUCuentaAgente` varchar(23) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BajaFechaContrato` date DEFAULT NULL,
  `BajaDecreto` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HorarioIngreso` time DEFAULT NULL,
  `HorarioSalida` time DEFAULT NULL,
  `Horario2Ingreso` time DEFAULT NULL,
  `Horario2Salida` time DEFAULT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Suprimido` tinyint(1) NOT NULL,
  `Archivado` tinyint(1) NOT NULL,
  `ImportSrc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ImportId` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ImportedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Persona_id` int(11) NOT NULL,
  `Departamento_id` int(11) DEFAULT NULL,
  `DepartamentoParte_id` int(11) DEFAULT NULL,
  `Cargo_id` int(11) DEFAULT NULL,
  `SectorParteDiario_id` int(11) DEFAULT NULL,
  `Banco_id` int(11) DEFAULT NULL,
  `DigitoVerificador` int(11) DEFAULT NULL,
  `DireccionEnGestion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ImportSrcId` (`ImportSrc`,`ImportId`),
  KEY `IDX_5FED3BEABAA58E69` (`Persona_id`),
  KEY `IDX_5FED3BEAD254FE13` (`Departamento_id`),
  KEY `IDX_5FED3BEAF98ABA7B` (`DepartamentoParte_id`),
  KEY `IDX_5FED3BEA784CA1D6` (`Cargo_id`),
  KEY `IDX_5FED3BEA2F7862DF` (`SectorParteDiario_id`),
  KEY `IDX_5FED3BEA3572C568` (`Banco_id`),
  CONSTRAINT `FK_5FED3BEA2F7862DF` FOREIGN KEY (`SectorParteDiario_id`) REFERENCES `Organizacion_Departamento` (`id`),
  CONSTRAINT `FK_5FED3BEA3572C568` FOREIGN KEY (`Banco_id`) REFERENCES `Base_Banco` (`id`),
  CONSTRAINT `FK_5FED3BEA784CA1D6` FOREIGN KEY (`Cargo_id`) REFERENCES `Rrhh_Cargo` (`id`),
  CONSTRAINT `FK_5FED3BEABAA58E69` FOREIGN KEY (`Persona_id`) REFERENCES `Base_Persona` (`id`),
  CONSTRAINT `FK_5FED3BEAD254FE13` FOREIGN KEY (`Departamento_id`) REFERENCES `Organizacion_Departamento` (`id`),
  CONSTRAINT `FK_5FED3BEAF98ABA7B` FOREIGN KEY (`DepartamentoParte_id`) REFERENCES `Organizacion_Departamento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=744 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rrhh_Agente`
--

LOCK TABLES `Rrhh_Agente` WRITE;
/*!40000 ALTER TABLE `Rrhh_Agente` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rrhh_Agente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rrhh_AgenteAntiguedad`
--

DROP TABLE IF EXISTS `Rrhh_AgenteAntiguedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rrhh_AgenteAntiguedad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Desde` date NOT NULL,
  `Hasta` date DEFAULT NULL,
  `Tipo` smallint(6) NOT NULL,
  `Reparticion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PresentarReparticion` tinyint(1) NOT NULL,
  `ReconoceAnses` tinyint(1) NOT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Agente_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_205769EC8714FA3C` (`Agente_id`),
  CONSTRAINT `FK_205769EC8714FA3C` FOREIGN KEY (`Agente_id`) REFERENCES `Rrhh_Agente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rrhh_AgenteAntiguedad`
--

LOCK TABLES `Rrhh_AgenteAntiguedad` WRITE;
/*!40000 ALTER TABLE `Rrhh_AgenteAntiguedad` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rrhh_AgenteAntiguedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rrhh_AgenteCargoGremialMovim`
--

DROP TABLE IF EXISTS `Rrhh_AgenteCargoGremialMovim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rrhh_AgenteCargoGremialMovim` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CargoGremial` int(11) DEFAULT NULL,
  `FechaAlta` date DEFAULT NULL,
  `FechaBaja` date DEFAULT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Agente_id` int(11) NOT NULL,
  `Gremio_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1E9F8A948714FA3C` (`Agente_id`),
  KEY `IDX_1E9F8A94B10C7D00` (`Gremio_id`),
  CONSTRAINT `FK_1E9F8A948714FA3C` FOREIGN KEY (`Agente_id`) REFERENCES `Rrhh_Agente` (`id`),
  CONSTRAINT `FK_1E9F8A94B10C7D00` FOREIGN KEY (`Gremio_id`) REFERENCES `Rrhh_Gremio` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rrhh_AgenteCargoGremialMovim`
--

LOCK TABLES `Rrhh_AgenteCargoGremialMovim` WRITE;
/*!40000 ALTER TABLE `Rrhh_AgenteCargoGremialMovim` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rrhh_AgenteCargoGremialMovim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rrhh_AgenteCargoMovim`
--

DROP TABLE IF EXISTS `Rrhh_AgenteCargoMovim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rrhh_AgenteCargoMovim` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FechaCarga` datetime DEFAULT NULL,
  `FechaAlta` datetime NOT NULL,
  `FechaBaja` datetime DEFAULT NULL,
  `FechaNotificacion` datetime DEFAULT NULL,
  `ActoAdministrativoFecha` datetime DEFAULT NULL,
  `ActoAdministrativoNumero` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Agente_id` int(11) NOT NULL,
  `Cargo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D153D0268714FA3C` (`Agente_id`),
  KEY `IDX_D153D026784CA1D6` (`Cargo_id`),
  CONSTRAINT `FK_D153D026784CA1D6` FOREIGN KEY (`Cargo_id`) REFERENCES `Rrhh_Cargo` (`id`),
  CONSTRAINT `FK_D153D0268714FA3C` FOREIGN KEY (`Agente_id`) REFERENCES `Rrhh_Agente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rrhh_AgenteCargoMovim`
--

LOCK TABLES `Rrhh_AgenteCargoMovim` WRITE;
/*!40000 ALTER TABLE `Rrhh_AgenteCargoMovim` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rrhh_AgenteCargoMovim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rrhh_AgenteCategoriaMovim`
--

DROP TABLE IF EXISTS `Rrhh_AgenteCategoriaMovim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rrhh_AgenteCategoriaMovim` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Categoria` int(11) NOT NULL,
  `Fecha` datetime NOT NULL,
  `ACargo` tinyint(1) NOT NULL,
  `ActoAdministrativoNumero` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Agente_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_AEE85BE38714FA3C` (`Agente_id`),
  KEY `Rrhh_AgenteCategoriaMovim_Agente_Categoria_Fecha_ACargo` (`Agente_id`,`Categoria`,`Fecha`,`ACargo`),
  CONSTRAINT `FK_AEE85BE38714FA3C` FOREIGN KEY (`Agente_id`) REFERENCES `Rrhh_Agente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rrhh_AgenteCategoriaMovim`
--

LOCK TABLES `Rrhh_AgenteCategoriaMovim` WRITE;
/*!40000 ALTER TABLE `Rrhh_AgenteCategoriaMovim` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rrhh_AgenteCategoriaMovim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rrhh_AgenteFamiliar`
--

DROP TABLE IF EXISTS `Rrhh_AgenteFamiliar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rrhh_AgenteFamiliar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Apellido` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DocumentoTipo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DocumentoNumero` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Genero` int(11) NOT NULL,
  `Parentesco` smallint(6) NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `Residencia` smallint(6) DEFAULT NULL,
  `FechaBaja` date DEFAULT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Suprimido` tinyint(1) NOT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Agente_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DBAF304F8714FA3C` (`Agente_id`),
  KEY `Rrhh_AgenteFamiliar_AgenteDocumentoNumero` (`Agente_id`,`DocumentoNumero`),
  CONSTRAINT `FK_DBAF304F8714FA3C` FOREIGN KEY (`Agente_id`) REFERENCES `Rrhh_Agente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rrhh_AgenteFamiliar`
--

LOCK TABLES `Rrhh_AgenteFamiliar` WRITE;
/*!40000 ALTER TABLE `Rrhh_AgenteFamiliar` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rrhh_AgenteFamiliar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rrhh_AgenteGrupo`
--

DROP TABLE IF EXISTS `Rrhh_AgenteGrupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rrhh_AgenteGrupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NombreLdap` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `Suprimido` tinyint(1) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_94981661F08B48D3` (`Parent_id`),
  CONSTRAINT `FK_94981661F08B48D3` FOREIGN KEY (`Parent_id`) REFERENCES `Rrhh_AgenteGrupo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rrhh_AgenteGrupo`
--

LOCK TABLES `Rrhh_AgenteGrupo` WRITE;
/*!40000 ALTER TABLE `Rrhh_AgenteGrupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rrhh_AgenteGrupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rrhh_AgenteInasistencia`
--

DROP TABLE IF EXISTS `Rrhh_AgenteInasistencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rrhh_AgenteInasistencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AnioLicencia` int(11) NOT NULL,
  `Estado` int(11) NOT NULL,
  `FechaDesde` date NOT NULL,
  `FechaHasta` date NOT NULL,
  `Suprimido` tinyint(1) NOT NULL,
  `ImportSrc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ImportId` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ImportedAt` datetime DEFAULT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Agente_id` int(11) NOT NULL,
  `Licencia_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_290FFB7CBC93D5F4` (`Licencia_id`),
  KEY `Rrhh_AgenteInasistencia_Agente` (`Agente_id`),
  KEY `Rrhh_AgenteInasistencia_ImportSrc_ImportId_Estado` (`ImportSrc`,`ImportId`,`Estado`),
  KEY `Rrhh_AgenteInasistencia_Estado` (`Estado`),
  KEY `Rrhh_AgenteInasistencia_Agente_L_AL_FD_FH_E` (`Agente_id`,`Licencia_id`,`AnioLicencia`,`FechaDesde`,`FechaHasta`,`Estado`),
  CONSTRAINT `FK_290FFB7C8714FA3C` FOREIGN KEY (`Agente_id`) REFERENCES `Rrhh_Agente` (`id`),
  CONSTRAINT `FK_290FFB7CBC93D5F4` FOREIGN KEY (`Licencia_id`) REFERENCES `Rrhh_Licencia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rrhh_AgenteInasistencia`
--

LOCK TABLES `Rrhh_AgenteInasistencia` WRITE;
/*!40000 ALTER TABLE `Rrhh_AgenteInasistencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rrhh_AgenteInasistencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rrhh_Agente_AgenteGrupo`
--

DROP TABLE IF EXISTS `Rrhh_Agente_AgenteGrupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rrhh_Agente_AgenteGrupo` (
  `agentegrupo_id` int(11) NOT NULL,
  `Agente_id` int(11) NOT NULL,
  PRIMARY KEY (`Agente_id`,`agentegrupo_id`),
  KEY `IDX_CFBFAAFA8714FA3C` (`Agente_id`),
  KEY `IDX_CFBFAAFA114D63DB` (`agentegrupo_id`),
  CONSTRAINT `FK_CFBFAAFA114D63DB` FOREIGN KEY (`agentegrupo_id`) REFERENCES `Rrhh_AgenteGrupo` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_CFBFAAFA8714FA3C` FOREIGN KEY (`Agente_id`) REFERENCES `Rrhh_Agente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rrhh_Agente_AgenteGrupo`
--

LOCK TABLES `Rrhh_Agente_AgenteGrupo` WRITE;
/*!40000 ALTER TABLE `Rrhh_Agente_AgenteGrupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rrhh_Agente_AgenteGrupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rrhh_Cargo`
--

DROP TABLE IF EXISTS `Rrhh_Cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rrhh_Cargo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `Suprimido` tinyint(1) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rrhh_Cargo`
--

LOCK TABLES `Rrhh_Cargo` WRITE;
/*!40000 ALTER TABLE `Rrhh_Cargo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rrhh_Cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rrhh_EvaluacionDesempeno`
--

DROP TABLE IF EXISTS `Rrhh_EvaluacionDesempeno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rrhh_EvaluacionDesempeno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Periodo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PuntResponsabilidad` int(11) NOT NULL,
  `PuntConocimientos` int(11) NOT NULL,
  `PuntResultados` int(11) NOT NULL,
  `PuntCalidad` int(11) NOT NULL,
  `PuntIniciativa` int(11) NOT NULL,
  `PuntCriterio` int(11) NOT NULL,
  `PuntPuntualidad` int(11) NOT NULL,
  `Sumatoria` int(11) NOT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `Suprimido` tinyint(1) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Agente_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D02FF1328714FA3C` (`Agente_id`),
  CONSTRAINT `FK_D02FF1328714FA3C` FOREIGN KEY (`Agente_id`) REFERENCES `Rrhh_Agente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rrhh_EvaluacionDesempeno`
--

LOCK TABLES `Rrhh_EvaluacionDesempeno` WRITE;
/*!40000 ALTER TABLE `Rrhh_EvaluacionDesempeno` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rrhh_EvaluacionDesempeno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rrhh_Gremio`
--

DROP TABLE IF EXISTS `Rrhh_Gremio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rrhh_Gremio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `Suprimido` tinyint(1) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rrhh_Gremio`
--

LOCK TABLES `Rrhh_Gremio` WRITE;
/*!40000 ALTER TABLE `Rrhh_Gremio` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rrhh_Gremio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rrhh_Licencia`
--

DROP TABLE IF EXISTS `Rrhh_Licencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rrhh_Licencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Dias` int(11) NOT NULL,
  `Solicitable` tinyint(1) NOT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Suprimido` tinyint(1) NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rrhh_Licencia`
--

LOCK TABLES `Rrhh_Licencia` WRITE;
/*!40000 ALTER TABLE `Rrhh_Licencia` DISABLE KEYS */;
INSERT INTO `Rrhh_Licencia` VALUES (37,0,0,'Falta sin aviso',0,1,NULL,'2016-07-20 14:34:24','2016-07-20 14:34:24');
/*!40000 ALTER TABLE `Rrhh_Licencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rrhh_Parte`
--

DROP TABLE IF EXISTS `Rrhh_Parte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rrhh_Parte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Hora` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Estado` int(11) NOT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Departamento_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Rrhh_Parte_Departamento` (`Departamento_id`),
  KEY `Rrhh_Parte_Departamento_Fecha_Hora` (`Departamento_id`,`Fecha`,`Hora`),
  KEY `Rrhh_Parte_Fecha_Hora` (`Fecha`,`Hora`),
  KEY `Rrhh_Parte_Fecha_Departamento` (`Fecha`,`Departamento_id`),
  CONSTRAINT `FK_5CC61C48D254FE13` FOREIGN KEY (`Departamento_id`) REFERENCES `Organizacion_Departamento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=386 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rrhh_Parte`
--

LOCK TABLES `Rrhh_Parte` WRITE;
/*!40000 ALTER TABLE `Rrhh_Parte` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rrhh_Parte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rrhh_ParteDetalle`
--

DROP TABLE IF EXISTS `Rrhh_ParteDetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rrhh_ParteDetalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Parte_id` int(11) NOT NULL,
  `Agente_id` int(11) DEFAULT NULL,
  `Licencia_id` int(11) DEFAULT NULL,
  `Inasistencia_id` int(11) DEFAULT NULL,
  `InasistenciaJustificacion_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_ABFA1133C2859A28` (`Parte_id`),
  KEY `IDX_ABFA11338714FA3C` (`Agente_id`),
  KEY `IDX_ABFA1133BC93D5F4` (`Licencia_id`),
  KEY `IDX_ABFA1133745F9C97` (`Inasistencia_id`),
  KEY `Rrhh_ParteDetalle_Parte_Agente` (`Parte_id`,`Agente_id`),
  KEY `IDX_ABFA11336A79196F` (`InasistenciaJustificacion_id`),
  CONSTRAINT `FK_ABFA11336A79196F` FOREIGN KEY (`InasistenciaJustificacion_id`) REFERENCES `Rrhh_AgenteInasistencia` (`id`),
  CONSTRAINT `FK_ABFA1133745F9C97` FOREIGN KEY (`Inasistencia_id`) REFERENCES `Rrhh_AgenteInasistencia` (`id`),
  CONSTRAINT `FK_ABFA11338714FA3C` FOREIGN KEY (`Agente_id`) REFERENCES `Rrhh_Agente` (`id`),
  CONSTRAINT `FK_ABFA1133BC93D5F4` FOREIGN KEY (`Licencia_id`) REFERENCES `Rrhh_Licencia` (`id`),
  CONSTRAINT `FK_ABFA1133C2859A28` FOREIGN KEY (`Parte_id`) REFERENCES `Rrhh_Parte` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=702 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rrhh_ParteDetalle`
--

LOCK TABLES `Rrhh_ParteDetalle` WRITE;
/*!40000 ALTER TABLE `Rrhh_ParteDetalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rrhh_ParteDetalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rrhh_Reloj`
--

DROP TABLE IF EXISTS `Rrhh_Reloj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rrhh_Reloj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DireccionIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `Suprimido` tinyint(1) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rrhh_Reloj`
--

LOCK TABLES `Rrhh_Reloj` WRITE;
/*!40000 ALTER TABLE `Rrhh_Reloj` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rrhh_Reloj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rrhh_RelojMovim`
--

DROP TABLE IF EXISTS `Rrhh_RelojMovim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rrhh_RelojMovim` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` datetime NOT NULL,
  `Tipo` smallint(6) NOT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Agente_id` int(11) DEFAULT NULL,
  `Reloj_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `FechaAgenteReloj` (`Fecha`,`Agente_id`,`Reloj_id`),
  KEY `IDX_87838E958714FA3C` (`Agente_id`),
  KEY `IDX_87838E952606C68` (`Reloj_id`),
  CONSTRAINT `FK_87838E952606C68` FOREIGN KEY (`Reloj_id`) REFERENCES `Rrhh_Reloj` (`id`),
  CONSTRAINT `FK_87838E958714FA3C` FOREIGN KEY (`Agente_id`) REFERENCES `Rrhh_Agente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rrhh_RelojMovim`
--

LOCK TABLES `Rrhh_RelojMovim` WRITE;
/*!40000 ALTER TABLE `Rrhh_RelojMovim` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rrhh_RelojMovim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SeguridadHigiene_Carnet`
--

DROP TABLE IF EXISTS `SeguridadHigiene_Carnet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SeguridadHigiene_Carnet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Vencimiento` date NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeguridadHigiene_Carnet`
--

LOCK TABLES `SeguridadHigiene_Carnet` WRITE;
/*!40000 ALTER TABLE `SeguridadHigiene_Carnet` DISABLE KEYS */;
/*!40000 ALTER TABLE `SeguridadHigiene_Carnet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SeguridadHigiene_Matriculado`
--

DROP TABLE IF EXISTS `SeguridadHigiene_Matriculado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SeguridadHigiene_Matriculado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NumeroMatricula` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Titulo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Suprimido` tinyint(1) NOT NULL,
  `Archivado` tinyint(1) NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Persona_id` int(11) NOT NULL,
  `VencimientoMatricula` date NOT NULL,
  `RegistroHistorico` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Persona_id` (`Persona_id`),
  KEY `SeguridadHigiene_Matriculado_NumeroMatricula` (`NumeroMatricula`),
  CONSTRAINT `FK_B8142D6BBAA58E69` FOREIGN KEY (`Persona_id`) REFERENCES `Base_Persona` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeguridadHigiene_Matriculado`
--

LOCK TABLES `SeguridadHigiene_Matriculado` WRITE;
/*!40000 ALTER TABLE `SeguridadHigiene_Matriculado` DISABLE KEYS */;
/*!40000 ALTER TABLE `SeguridadHigiene_Matriculado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SeguridadHigiene_TramiteCatSeg`
--

DROP TABLE IF EXISTS `SeguridadHigiene_TramiteCatSeg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SeguridadHigiene_TramiteCatSeg` (
  `id` int(11) NOT NULL,
  `ExpedienteNumero` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TurnoFecha` datetime DEFAULT NULL,
  `ProvisorioHasta` datetime DEFAULT NULL,
  `UltimoSeguimiento_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9271564D451EAD33` (`UltimoSeguimiento_id`),
  CONSTRAINT `FK_9271564D451EAD33` FOREIGN KEY (`UltimoSeguimiento_id`) REFERENCES `Administracion_Seguimiento` (`id`),
  CONSTRAINT `FK_9271564DBF396750` FOREIGN KEY (`id`) REFERENCES `Tramites_Tramite` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeguridadHigiene_TramiteCatSeg`
--

LOCK TABLES `SeguridadHigiene_TramiteCatSeg` WRITE;
/*!40000 ALTER TABLE `SeguridadHigiene_TramiteCatSeg` DISABLE KEYS */;
/*!40000 ALTER TABLE `SeguridadHigiene_TramiteCatSeg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tramites_Comprobante`
--

DROP TABLE IF EXISTS `Tramites_Comprobante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tramites_Comprobante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NumeroPrefijo` int(11) NOT NULL,
  `Numero` int(11) NOT NULL,
  `Token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `ComprobanteTipo_id` int(11) NOT NULL,
  `TramiteOrigen_id` int(11) NOT NULL,
  `Titular_id` int(11) NOT NULL,
  `ComprobanteTipo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_60CE8ED1C20D5041` (`ComprobanteTipo_id`),
  KEY `IDX_60CE8ED13D60C0E8` (`TramiteOrigen_id`),
  KEY `IDX_60CE8ED1B6ADFCB4` (`Titular_id`),
  CONSTRAINT `FK_60CE8ED13D60C0E8` FOREIGN KEY (`TramiteOrigen_id`) REFERENCES `Tramites_Tramite` (`id`),
  CONSTRAINT `FK_60CE8ED1B6ADFCB4` FOREIGN KEY (`Titular_id`) REFERENCES `Base_Persona` (`id`),
  CONSTRAINT `FK_60CE8ED1C20D5041` FOREIGN KEY (`ComprobanteTipo_id`) REFERENCES `Tramites_ComprobanteTipo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tramites_Comprobante`
--

LOCK TABLES `Tramites_Comprobante` WRITE;
/*!40000 ALTER TABLE `Tramites_Comprobante` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tramites_Comprobante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tramites_ComprobanteSimple`
--

DROP TABLE IF EXISTS `Tramites_ComprobanteSimple`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tramites_ComprobanteSimple` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_CF26AB58BF396750` FOREIGN KEY (`id`) REFERENCES `Tramites_Comprobante` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tramites_ComprobanteSimple`
--

LOCK TABLES `Tramites_ComprobanteSimple` WRITE;
/*!40000 ALTER TABLE `Tramites_ComprobanteSimple` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tramites_ComprobanteSimple` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tramites_ComprobanteTipo`
--

DROP TABLE IF EXISTS `Tramites_ComprobanteTipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tramites_ComprobanteTipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Clase` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PeriodoValidez` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `InstrumentoEspejo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BD97C197C8EC55C9` (`InstrumentoEspejo_id`),
  CONSTRAINT `FK_BD97C197C8EC55C9` FOREIGN KEY (`InstrumentoEspejo_id`) REFERENCES `Tramites_Instrumento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tramites_ComprobanteTipo`
--

LOCK TABLES `Tramites_ComprobanteTipo` WRITE;
/*!40000 ALTER TABLE `Tramites_ComprobanteTipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tramites_ComprobanteTipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tramites_EstadoRequisito`
--

DROP TABLE IF EXISTS `Tramites_EstadoRequisito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tramites_EstadoRequisito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Estado` int(11) NOT NULL,
  `FechaAprobado` datetime DEFAULT NULL,
  `EstoyTrabajando` tinyint(1) NOT NULL,
  `FechaVencimiento` date DEFAULT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `FechaValidezHasta` date DEFAULT NULL,
  `Tramite_id` int(11) NOT NULL,
  `Subtramite_id` int(11) DEFAULT NULL,
  `AsociacionRequisito_id` int(11) NOT NULL,
  `EstadoRequisitoPadre_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `TramiteAsociacionRequisito` (`Tramite_id`,`AsociacionRequisito_id`),
  KEY `IDX_5D8EF5256EE3841F` (`Subtramite_id`),
  KEY `IDX_5D8EF525C57B5C49` (`AsociacionRequisito_id`),
  KEY `IDX_5D8EF525A17F9FB9` (`EstadoRequisitoPadre_id`),
  KEY `Tramites_EstadoRequisito_Tramite` (`Tramite_id`),
  CONSTRAINT `FK_5D8EF5256EE3841F` FOREIGN KEY (`Subtramite_id`) REFERENCES `Tramites_Tramite` (`id`),
  CONSTRAINT `FK_5D8EF525A17F9FB9` FOREIGN KEY (`EstadoRequisitoPadre_id`) REFERENCES `Tramites_EstadoRequisito` (`id`),
  CONSTRAINT `FK_5D8EF525C57B5C49` FOREIGN KEY (`AsociacionRequisito_id`) REFERENCES `Tramites_TramiteTipo_Requisito` (`id`),
  CONSTRAINT `FK_5D8EF525CD512B99` FOREIGN KEY (`Tramite_id`) REFERENCES `Tramites_Tramite` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tramites_EstadoRequisito`
--

LOCK TABLES `Tramites_EstadoRequisito` WRITE;
/*!40000 ALTER TABLE `Tramites_EstadoRequisito` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tramites_EstadoRequisito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tramites_Instrumento`
--

DROP TABLE IF EXISTS `Tramites_Instrumento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tramites_Instrumento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Tipo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tramites_Instrumento`
--

LOCK TABLES `Tramites_Instrumento` WRITE;
/*!40000 ALTER TABLE `Tramites_Instrumento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tramites_Instrumento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tramites_Requisito`
--

DROP TABLE IF EXISTS `Tramites_Requisito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tramites_Requisito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Lugar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Codigo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CostoUF` decimal(6,2) DEFAULT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Notas` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Departamento_id` int(11) DEFAULT NULL,
  `TramiteTipoEspejo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4F4B7F32D254FE13` (`Departamento_id`),
  KEY `IDX_4F4B7F321890874D` (`TramiteTipoEspejo_id`),
  CONSTRAINT `FK_4F4B7F321890874D` FOREIGN KEY (`TramiteTipoEspejo_id`) REFERENCES `Tramites_TramiteTipo` (`id`),
  CONSTRAINT `FK_4F4B7F32D254FE13` FOREIGN KEY (`Departamento_id`) REFERENCES `Organizacion_Departamento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tramites_Requisito`
--

LOCK TABLES `Tramites_Requisito` WRITE;
/*!40000 ALTER TABLE `Tramites_Requisito` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tramites_Requisito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tramites_Requisito_Requisito`
--

DROP TABLE IF EXISTS `Tramites_Requisito_Requisito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tramites_Requisito_Requisito` (
  `MeRequiere_id` int(11) NOT NULL,
  `Requiere_id` int(11) NOT NULL,
  PRIMARY KEY (`MeRequiere_id`,`Requiere_id`),
  KEY `IDX_C7929A811AD709F` (`MeRequiere_id`),
  KEY `IDX_C7929A812F0E6D3C` (`Requiere_id`),
  CONSTRAINT `FK_C7929A811AD709F` FOREIGN KEY (`MeRequiere_id`) REFERENCES `Tramites_Requisito` (`id`),
  CONSTRAINT `FK_C7929A812F0E6D3C` FOREIGN KEY (`Requiere_id`) REFERENCES `Tramites_Requisito` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tramites_Requisito_Requisito`
--

LOCK TABLES `Tramites_Requisito_Requisito` WRITE;
/*!40000 ALTER TABLE `Tramites_Requisito_Requisito` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tramites_Requisito_Requisito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tramites_Resultado`
--

DROP TABLE IF EXISTS `Tramites_Resultado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tramites_Resultado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tramites_Resultado`
--

LOCK TABLES `Tramites_Resultado` WRITE;
/*!40000 ALTER TABLE `Tramites_Resultado` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tramites_Resultado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tramites_Tramite`
--

DROP TABLE IF EXISTS `Tramites_Tramite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tramites_Tramite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Estado` int(11) NOT NULL,
  `FechaTerminado` datetime DEFAULT NULL,
  `CostoUF` decimal(6,2) DEFAULT NULL,
  `Token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `TramiteTipo_id` int(11) NOT NULL,
  `TramitePadre_id` int(11) DEFAULT NULL,
  `Comprobante_id` int(11) DEFAULT NULL,
  `Titular_id` int(11) NOT NULL,
  `TramiteTipoClase` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_42011F95FE4394E4` (`TramiteTipo_id`),
  KEY `IDX_42011F95820883B0` (`TramitePadre_id`),
  KEY `IDX_42011F95E80253E2` (`Comprobante_id`),
  KEY `IDX_42011F95B6ADFCB4` (`Titular_id`),
  CONSTRAINT `FK_42011F95820883B0` FOREIGN KEY (`TramitePadre_id`) REFERENCES `Tramites_Tramite` (`id`),
  CONSTRAINT `FK_42011F95B6ADFCB4` FOREIGN KEY (`Titular_id`) REFERENCES `Base_Persona` (`id`),
  CONSTRAINT `FK_42011F95E80253E2` FOREIGN KEY (`Comprobante_id`) REFERENCES `Tramites_Comprobante` (`id`),
  CONSTRAINT `FK_42011F95FE4394E4` FOREIGN KEY (`TramiteTipo_id`) REFERENCES `Tramites_TramiteTipo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tramites_Tramite`
--

LOCK TABLES `Tramites_Tramite` WRITE;
/*!40000 ALTER TABLE `Tramites_Tramite` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tramites_Tramite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tramites_TramiteSimple`
--

DROP TABLE IF EXISTS `Tramites_TramiteSimple`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tramites_TramiteSimple` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_A26E815CBF396750` FOREIGN KEY (`id`) REFERENCES `Tramites_Tramite` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tramites_TramiteSimple`
--

LOCK TABLES `Tramites_TramiteSimple` WRITE;
/*!40000 ALTER TABLE `Tramites_TramiteSimple` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tramites_TramiteSimple` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tramites_TramiteTipo`
--

DROP TABLE IF EXISTS `Tramites_TramiteTipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tramites_TramiteTipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Clase` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 1,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `ComprobanteTipo_id` int(11) DEFAULT NULL,
  `Formulario_id` int(11) DEFAULT NULL,
  `RequisitoEspejo_id` int(11) DEFAULT NULL,
  `Notas` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Etapas` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Departamento_id` int(11) DEFAULT NULL,
  `RolPrincipal_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CC32565FF2B1A9C1` (`Formulario_id`),
  KEY `IDX_CC32565FE06A37CF` (`RequisitoEspejo_id`),
  KEY `IDX_CC32565FC20D5041` (`ComprobanteTipo_id`),
  KEY `IDX_CC32565FD254FE13` (`Departamento_id`),
  KEY `IDX_CC32565F9B606347` (`RolPrincipal_id`),
  CONSTRAINT `FK_CC32565F9B606347` FOREIGN KEY (`RolPrincipal_id`) REFERENCES `Base_PersonaRol` (`id`),
  CONSTRAINT `FK_CC32565FC20D5041` FOREIGN KEY (`ComprobanteTipo_id`) REFERENCES `Tramites_ComprobanteTipo` (`id`),
  CONSTRAINT `FK_CC32565FD254FE13` FOREIGN KEY (`Departamento_id`) REFERENCES `Organizacion_Departamento` (`id`),
  CONSTRAINT `FK_CC32565FE06A37CF` FOREIGN KEY (`RequisitoEspejo_id`) REFERENCES `Tramites_Requisito` (`id`),
  CONSTRAINT `FK_CC32565FF2B1A9C1` FOREIGN KEY (`Formulario_id`) REFERENCES `Tramites_Instrumento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tramites_TramiteTipo`
--

LOCK TABLES `Tramites_TramiteTipo` WRITE;
/*!40000 ALTER TABLE `Tramites_TramiteTipo` DISABLE KEYS */;
INSERT INTO `Tramites_TramiteTipo` VALUES (1,'\\Yacare\\ComercioBundle\\Entity\\TramiteHabilitacion','Habilitación','<p>Es necesario obtener un Certificado de Habilitaci&oacute;n Comercial para el ejercicio de actividades comerciales dentro de los l&iacute;mites de la ciudad.</p>','http://www.riogrande.gob.ar/tramites/guia-de-tramites/habilitacioncomercial/',14,'2015-07-22 11:19:37','2017-03-13 10:08:37',1,NULL,1,'','Provisorio,Final',1254,37),(2,'\\Yacare\\ObrasParticularesBundle\\Entity\\TramiteCatEd','Certificado de Aptitud Edilicia','<p>Deber&aacute; obtener un&nbsp;Certificado de Aptitud Edilicia del local donde se realizar&aacute; una actividad comercial.</p>',NULL,8,'2015-07-22 11:58:54','2016-09-22 09:44:34',2,NULL,9,NULL,'Provisorio,Final',1348,NULL),(3,'\\Yacare\\BromatologiaBundle\\Entity\\TramiteCatBr','Certificado de Aptitud Bromatológica',NULL,NULL,8,'2015-07-23 16:00:45','2016-06-06 15:43:43',3,NULL,13,NULL,NULL,1975,NULL),(4,'\\Yacare\\EcologiaBundle\\Entity\\TramiteCatEc','Certificado de Aptitud Ecológica',NULL,NULL,8,'2015-11-04 09:32:24','2016-09-22 09:55:03',4,NULL,49,NULL,'Provisorio,Final',1396,NULL),(5,'\\Yacare\\ObrasParticularesBundle\\Entity\\TramitePlano','Aprobación de Planos',NULL,'http://www.riogrande.gob.ar/tramites/guia-de-tramites/aprobacion-de-planos/',7,'2015-11-13 11:40:14','2016-02-22 13:21:38',NULL,NULL,52,NULL,'Inicio de obra,Final',1348,18),(6,'\\Yacare\\ObrasSanitariasBundle\\Entity\\TramiteCatSa','Certificado de Aptitud Sanitaria',NULL,NULL,7,'2016-03-10 10:33:59','2016-09-22 09:40:55',5,NULL,85,NULL,'Provisorio,Final',1352,NULL),(7,'\\Yacare\\SeguridadHigieneBundle\\Entity\\TramiteCatSeg','Certificado de Aptitud Seguridad e Higiene',NULL,NULL,2,'2016-08-02 10:37:22','2016-08-03 12:18:11',6,NULL,136,NULL,'Provisorio,Final',1973,NULL);
/*!40000 ALTER TABLE `Tramites_TramiteTipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tramites_TramiteTipo_Requisito`
--

DROP TABLE IF EXISTS `Tramites_TramiteTipo_Requisito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tramites_TramiteTipo_Requisito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Propiedad` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Instancia` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Tipo` int(11) NOT NULL,
  `CondicionQue` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CondicionEs` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CondicionCuanto` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Etapa` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RequeridoAlIniciar` tinyint(1) DEFAULT NULL,
  `Orden` int(11) NOT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Notas` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Suprimido` tinyint(1) NOT NULL,
  `TramiteTipo_id` int(11) NOT NULL,
  `Requisito_id` int(11) NOT NULL,
  `RolPrincipal_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C7385B6DFE4394E4` (`TramiteTipo_id`),
  KEY `IDX_C7385B6DE261C276` (`Requisito_id`),
  KEY `IDX_C7385B6D9B606347` (`RolPrincipal_id`),
  CONSTRAINT `FK_C7385B6D9B606347` FOREIGN KEY (`RolPrincipal_id`) REFERENCES `Base_PersonaRol` (`id`),
  CONSTRAINT `FK_C7385B6DE261C276` FOREIGN KEY (`Requisito_id`) REFERENCES `Tramites_Requisito` (`id`),
  CONSTRAINT `FK_C7385B6DFE4394E4` FOREIGN KEY (`TramiteTipo_id`) REFERENCES `Tramites_TramiteTipo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tramites_TramiteTipo_Requisito`
--

LOCK TABLES `Tramites_TramiteTipo_Requisito` WRITE;
/*!40000 ALTER TABLE `Tramites_TramiteTipo_Requisito` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tramites_TramiteTipo_Requisito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transporte_LicenciaCategoria`
--

DROP TABLE IF EXISTS `Transporte_LicenciaCategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Transporte_LicenciaCategoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Notas` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Suprimido` tinyint(1) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transporte_LicenciaCategoria`
--

LOCK TABLES `Transporte_LicenciaCategoria` WRITE;
/*!40000 ALTER TABLE `Transporte_LicenciaCategoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `Transporte_LicenciaCategoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transporte_LicenciaConducir`
--

DROP TABLE IF EXISTS `Transporte_LicenciaConducir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Transporte_LicenciaConducir` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FechaVencimiento` date NOT NULL,
  `FechaRenovacion` date DEFAULT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `Suprimido` tinyint(1) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Persona_id` int(11) NOT NULL,
  `Departamento_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_60CE62D6BAA58E69` (`Persona_id`),
  KEY `IDX_60CE62D6D254FE13` (`Departamento_id`),
  CONSTRAINT `FK_60CE62D6BAA58E69` FOREIGN KEY (`Persona_id`) REFERENCES `Base_Persona` (`id`),
  CONSTRAINT `FK_60CE62D6D254FE13` FOREIGN KEY (`Departamento_id`) REFERENCES `Organizacion_Departamento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transporte_LicenciaConducir`
--

LOCK TABLES `Transporte_LicenciaConducir` WRITE;
/*!40000 ALTER TABLE `Transporte_LicenciaConducir` DISABLE KEYS */;
/*!40000 ALTER TABLE `Transporte_LicenciaConducir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transporte_LicenciaConducir_Categoria`
--

DROP TABLE IF EXISTS `Transporte_LicenciaConducir_Categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Transporte_LicenciaConducir_Categoria` (
  `Licencia_id` int(11) NOT NULL,
  `Categoria_id` int(11) NOT NULL,
  PRIMARY KEY (`Licencia_id`,`Categoria_id`),
  KEY `IDX_457D7E5FBC93D5F4` (`Licencia_id`),
  KEY `IDX_457D7E5F2BA6AB82` (`Categoria_id`),
  CONSTRAINT `FK_457D7E5F2BA6AB82` FOREIGN KEY (`Categoria_id`) REFERENCES `Transporte_LicenciaCategoria` (`id`),
  CONSTRAINT `FK_457D7E5FBC93D5F4` FOREIGN KEY (`Licencia_id`) REFERENCES `Transporte_LicenciaConducir` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transporte_LicenciaConducir_Categoria`
--

LOCK TABLES `Transporte_LicenciaConducir_Categoria` WRITE;
/*!40000 ALTER TABLE `Transporte_LicenciaConducir_Categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `Transporte_LicenciaConducir_Categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transporte_Vehiculo`
--

DROP TABLE IF EXISTS `Transporte_Vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Transporte_Vehiculo` (
  `id` int(11) NOT NULL,
  `Combustible` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Anio` int(11) DEFAULT NULL,
  `Color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Suprimido` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_D1DAD34BBF396750` FOREIGN KEY (`id`) REFERENCES `Nomina_Dispositivo` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transporte_Vehiculo`
--

LOCK TABLES `Transporte_Vehiculo` WRITE;
/*!40000 ALTER TABLE `Transporte_Vehiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Transporte_Vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transporte_VehiculoCarga`
--

DROP TABLE IF EXISTS `Transporte_VehiculoCarga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Transporte_VehiculoCarga` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ChoferConfirmado` tinyint(1) NOT NULL,
  `Litros` int(11) DEFAULT NULL,
  `Importe` double DEFAULT NULL,
  `Kilometraje` int(11) DEFAULT NULL,
  `Combustible` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Obs` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `Vehiculo_id` int(11) NOT NULL,
  `Persona_id` int(11) DEFAULT NULL,
  `Chofer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1E686EE5A36B5AA2` (`Vehiculo_id`),
  KEY `IDX_1E686EE5BAA58E69` (`Persona_id`),
  KEY `IDX_1E686EE5A8AFCC21` (`Chofer_id`),
  CONSTRAINT `FK_1E686EE5A36B5AA2` FOREIGN KEY (`Vehiculo_id`) REFERENCES `Transporte_Vehiculo` (`id`),
  CONSTRAINT `FK_1E686EE5A8AFCC21` FOREIGN KEY (`Chofer_id`) REFERENCES `Base_Persona` (`id`),
  CONSTRAINT `FK_1E686EE5BAA58E69` FOREIGN KEY (`Persona_id`) REFERENCES `Base_Persona` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transporte_VehiculoCarga`
--

LOCK TABLES `Transporte_VehiculoCarga` WRITE;
/*!40000 ALTER TABLE `Transporte_VehiculoCarga` DISABLE KEYS */;
/*!40000 ALTER TABLE `Transporte_VehiculoCarga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acta_adjunto`
--

DROP TABLE IF EXISTS `acta_adjunto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acta_adjunto` (
  `acta_id` int(11) NOT NULL,
  `adjunto_id` int(11) NOT NULL,
  PRIMARY KEY (`acta_id`,`adjunto_id`),
  KEY `IDX_DC78541028052F90` (`acta_id`),
  KEY `IDX_DC785410E7B2473D` (`adjunto_id`),
  CONSTRAINT `FK_DC78541028052F90` FOREIGN KEY (`acta_id`) REFERENCES `Inspeccion_Acta` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_DC785410E7B2473D` FOREIGN KEY (`adjunto_id`) REFERENCES `Base_Adjunto` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acta_adjunto`
--

LOCK TABLES `acta_adjunto` WRITE;
/*!40000 ALTER TABLE `acta_adjunto` DISABLE KEYS */;
/*!40000 ALTER TABLE `acta_adjunto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catbr_actividad`
--

DROP TABLE IF EXISTS `catbr_actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catbr_actividad` (
  `catbr_id` int(11) NOT NULL,
  `actividad_id` int(11) NOT NULL,
  PRIMARY KEY (`catbr_id`,`actividad_id`),
  KEY `IDX_AECC39F83DF020AF` (`catbr_id`),
  KEY `IDX_AECC39F86014FACA` (`actividad_id`),
  CONSTRAINT `FK_AECC39F83DF020AF` FOREIGN KEY (`catbr_id`) REFERENCES `Bromatologia_CatBr` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AECC39F86014FACA` FOREIGN KEY (`actividad_id`) REFERENCES `Comercio_Actividad` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catbr_actividad`
--

LOCK TABLES `catbr_actividad` WRITE;
/*!40000 ALTER TABLE `catbr_actividad` DISABLE KEYS */;
/*!40000 ALTER TABLE `catbr_actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cated_actividad`
--

DROP TABLE IF EXISTS `cated_actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cated_actividad` (
  `cated_id` int(11) NOT NULL,
  `actividad_id` int(11) NOT NULL,
  PRIMARY KEY (`cated_id`,`actividad_id`),
  KEY `IDX_9C17DEFFFAA2F4FC` (`cated_id`),
  KEY `IDX_9C17DEFF6014FACA` (`actividad_id`),
  CONSTRAINT `FK_9C17DEFF6014FACA` FOREIGN KEY (`actividad_id`) REFERENCES `Comercio_Actividad` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_9C17DEFFFAA2F4FC` FOREIGN KEY (`cated_id`) REFERENCES `ObrasParticulares_CatEd` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cated_actividad`
--

LOCK TABLES `cated_actividad` WRITE;
/*!40000 ALTER TABLE `cated_actividad` DISABLE KEYS */;
/*!40000 ALTER TABLE `cated_actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadorequisito_adjunto`
--

DROP TABLE IF EXISTS `estadorequisito_adjunto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadorequisito_adjunto` (
  `estadorequisito_id` int(11) NOT NULL,
  `adjunto_id` int(11) NOT NULL,
  PRIMARY KEY (`estadorequisito_id`,`adjunto_id`),
  KEY `IDX_198702989EE14220` (`estadorequisito_id`),
  KEY `IDX_19870298E7B2473D` (`adjunto_id`),
  CONSTRAINT `FK_198702989EE14220` FOREIGN KEY (`estadorequisito_id`) REFERENCES `Tramites_EstadoRequisito` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_19870298E7B2473D` FOREIGN KEY (`adjunto_id`) REFERENCES `Base_Adjunto` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadorequisito_adjunto`
--

LOCK TABLES `estadorequisito_adjunto` WRITE;
/*!40000 ALTER TABLE `estadorequisito_adjunto` DISABLE KEYS */;
/*!40000 ALTER TABLE `estadorequisito_adjunto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `muni_maraton`
--

DROP TABLE IF EXISTS `muni_maraton`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `muni_maraton` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apellido` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `domicilio` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `documento` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fechanac` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `recorrido` int(11) NOT NULL,
  `fechainscr` datetime NOT NULL,
  `numcontrol` int(11) NOT NULL,
  `fechaacred` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `muni_maraton`
--

LOCK TABLES `muni_maraton` WRITE;
/*!40000 ALTER TABLE `muni_maraton` DISABLE KEYS */;
/*!40000 ALTER TABLE `muni_maraton` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tramite_adjunto`
--

DROP TABLE IF EXISTS `tramite_adjunto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tramite_adjunto` (
  `tramite_id` int(11) NOT NULL,
  `adjunto_id` int(11) NOT NULL,
  PRIMARY KEY (`tramite_id`,`adjunto_id`),
  KEY `IDX_9E731E6D820C2849` (`tramite_id`),
  KEY `IDX_9E731E6DE7B2473D` (`adjunto_id`),
  CONSTRAINT `FK_9E731E6D820C2849` FOREIGN KEY (`tramite_id`) REFERENCES `Tramites_Tramite` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_9E731E6DE7B2473D` FOREIGN KEY (`adjunto_id`) REFERENCES `Base_Adjunto` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tramite_adjunto`
--

LOCK TABLES `tramite_adjunto` WRITE;
/*!40000 ALTER TABLE `tramite_adjunto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tramite_adjunto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tramitehabilitacion_actividad`
--

DROP TABLE IF EXISTS `tramitehabilitacion_actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tramitehabilitacion_actividad` (
  `tramitehabilitacion_id` int(11) NOT NULL,
  `actividad_id` int(11) NOT NULL,
  PRIMARY KEY (`tramitehabilitacion_id`,`actividad_id`),
  KEY `IDX_6173892C332B9BF` (`tramitehabilitacion_id`),
  KEY `IDX_61738926014FACA` (`actividad_id`),
  CONSTRAINT `FK_61738926014FACA` FOREIGN KEY (`actividad_id`) REFERENCES `Comercio_Actividad` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_6173892C332B9BF` FOREIGN KEY (`tramitehabilitacion_id`) REFERENCES `Comercio_TramiteHabilitacion` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tramitehabilitacion_actividad`
--

LOCK TABLES `tramitehabilitacion_actividad` WRITE;
/*!40000 ALTER TABLE `tramitehabilitacion_actividad` DISABLE KEYS */;
/*!40000 ALTER TABLE `tramitehabilitacion_actividad` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-22 16:37:20
