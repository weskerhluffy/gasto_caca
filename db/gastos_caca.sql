-- MySQL dump 10.13  Distrib 5.6.12, for osx10.7 (x86_64)
--
-- Host: localhost    Database: gatos_caca
-- ------------------------------------------------------
-- Server version	5.6.12

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
-- Table structure for table `aplicacion_periodicas`
--

DROP TABLE IF EXISTS `aplicacion_periodicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aplicacion_periodicas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `periodo_id` int(11) DEFAULT NULL,
  `monto` decimal(10,0) DEFAULT NULL,
  `descripcion` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deuda_id` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_aplicacion_periodicas_on_periodo_id` (`periodo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aplicacion_periodicas`
--

LOCK TABLES `aplicacion_periodicas` WRITE;
/*!40000 ALTER TABLE `aplicacion_periodicas` DISABLE KEYS */;
INSERT INTO `aplicacion_periodicas` VALUES (1,3,800,'pago mensual lavadora','2013-07-03 08:47:29','2013-07-03 08:47:29','1'),(3,1,4100,'renta','2013-07-03 08:50:05','2013-07-03 08:50:05','');
/*!40000 ALTER TABLE `aplicacion_periodicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditos`
--

DROP TABLE IF EXISTS `creditos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creditos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditos`
--

LOCK TABLES `creditos` WRITE;
/*!40000 ALTER TABLE `creditos` DISABLE KEYS */;
INSERT INTO `creditos` VALUES (1,'Tarjeta de credito banorte','2013-06-25 05:38:30','2013-06-25 05:38:30'),(2,'Carro','2013-06-25 05:38:30','2013-06-25 05:38:30');
/*!40000 ALTER TABLE `creditos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deudas`
--

DROP TABLE IF EXISTS `deudas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deudas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `monto` decimal(10,0) DEFAULT NULL,
  `contraido` datetime DEFAULT NULL,
  `descripcion` text COLLATE utf8_unicode_ci,
  `credito_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_deudas_on_credito_id` (`credito_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deudas`
--

LOCK TABLES `deudas` WRITE;
/*!40000 ALTER TABLE `deudas` DISABLE KEYS */;
INSERT INTO `deudas` VALUES (1,8000,'2013-07-03 03:39:00','lavadora',1,'2013-07-03 08:40:13','2013-07-03 08:40:13');
/*!40000 ALTER TABLE `deudas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deudas_egresos`
--

DROP TABLE IF EXISTS `deudas_egresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deudas_egresos` (
  `deuda_id` int(11) DEFAULT NULL,
  `egreso_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deudas_egresos`
--

LOCK TABLES `deudas_egresos` WRITE;
/*!40000 ALTER TABLE `deudas_egresos` DISABLE KEYS */;
/*!40000 ALTER TABLE `deudas_egresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egresos`
--

DROP TABLE IF EXISTS `egresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egresos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` text COLLATE utf8_unicode_ci,
  `monto` decimal(10,4) DEFAULT NULL,
  `tipo_egreso_id` int(11) DEFAULT NULL,
  `aplicacion` datetime DEFAULT NULL,
  `tipo_ingreso_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_egresos_on_tipo_egreso_id` (`tipo_egreso_id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egresos`
--

LOCK TABLES `egresos` WRITE;
/*!40000 ALTER TABLE `egresos` DISABLE KEYS */;
INSERT INTO `egresos` VALUES (1,'papas',8.0000,2,'2013-06-25 05:54:00',2,'2013-06-25 05:54:43','2013-06-25 05:54:43'),(2,'tortillas',11.0000,2,'2013-06-25 05:54:00',2,'2013-06-25 05:55:02','2013-06-25 05:55:02'),(3,'salchichas',15.0000,2,'2013-06-25 05:55:00',2,'2013-06-25 05:55:22','2013-06-25 05:55:22'),(4,'leche',24.0000,2,'2013-06-25 05:55:00',2,'2013-06-25 05:55:56','2013-06-25 05:55:56'),(5,'camion',24.5000,1,'2013-06-25 05:56:00',2,'2013-06-25 05:56:41','2013-07-02 09:27:28'),(6,'benzal',79.5000,5,'2013-06-26 19:05:00',3,'2013-07-02 09:31:00','2013-07-02 09:31:00'),(78,'sabritas',5.5000,2,'2013-06-30 00:00:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(79,'pasta fideo 1 p',3.9000,2,'2013-06-30 00:00:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(80,'pasta fideo 1 p',3.6000,2,'2013-06-30 00:00:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(81,'limon .180',2.2500,2,'2013-06-30 00:00:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(82,'manzana 1 p',3.6100,2,'2013-06-30 00:00:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(83,'crema',17.0000,2,'2013-06-26 19:56:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(84,'aceite 2 p',37.6000,2,'2013-06-26 19:56:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(85,'palomitas 2 p',11.0000,2,'2013-06-26 19:56:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(86,'boing 1 l',11.9000,2,'2013-06-26 19:56:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(87,'frijol',12.5000,2,'2013-06-26 19:56:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(88,'cebolla .245',2.6700,2,'2013-06-30 15:07:17',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(89,'cilantro',5.5000,2,'2013-06-30 15:07:17',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(90,'magnum almendras',22.0000,2,'2013-06-30 15:07:17',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(91,'kiwi 2 p',6.9000,2,'2013-06-30 15:07:17',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(92,'boing .5 l 2 p',13.0000,2,'2013-06-30 15:07:17',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(93,'zanahoria 4 p',1.5800,2,'2013-06-30 15:07:17',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(109,'retiro',1000.0000,5,'2013-06-30 15:07:17',1,'2013-07-04 00:11:00','2013-07-04 00:11:00'),(110,'camion',24.0000,1,'2013-07-05 02:27:00',2,'2013-07-04 05:33:28','2013-07-04 05:33:28'),(111,'camiones',24.0000,1,'2013-07-05 02:27:00',2,'2013-07-05 01:25:43','2013-07-05 01:25:43'),(112,'torta ahogada',25.0000,2,'2013-07-05 02:27:00',2,'2013-07-05 01:34:23','2013-07-05 02:06:14'),(113,'salsa valentina 2 p',37.8000,2,'2013-07-05 17:20:00',3,'2013-07-05 02:07:47','2013-07-05 02:07:47'),(114,'listerine',125.0000,5,'2013-07-05 17:20:00',3,'2013-07-05 02:09:10','2013-07-05 02:09:18'),(115,'jabones',24.9000,5,'2013-07-05 17:20:00',3,'2013-07-05 02:09:50','2013-07-05 02:09:50'),(116,'9 cosas de 3 pesos',27.0000,2,'2013-07-05 02:27:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(117,'pan',20.0000,2,'2013-07-05 02:27:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(118,'guacal madera',20.0000,2,'2013-07-05 02:27:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(119,'leche 1 l',24.0000,2,'2013-07-05 02:27:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(120,'transporte',12.0000,2,'2013-07-05 02:27:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(121,'coladera grande',30.0000,2,'2013-07-05 02:27:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(122,'cuchara especial',15.0000,2,'2013-07-05 02:27:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(123,'higado .25',12.0000,2,'2013-07-05 02:27:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(124,'aplanador',15.0000,2,'2013-07-05 02:27:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(125,'arroz',20.7500,2,'2013-07-05 02:27:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(126,'encendedor',28.7500,2,'2013-07-05 02:27:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(131,'retiro',400.0000,5,'2013-07-05 02:27:00',1,'2013-07-05 02:53:19','2013-07-05 02:53:19'),(132,'comida sbarro',49.0000,2,'2013-07-05 06:20:00',2,'2013-07-06 06:20:22','2013-07-06 06:20:22'),(133,'camiones',6.0000,1,'2013-07-05 06:21:00',2,'2013-07-06 06:21:32','2013-07-06 06:21:32');
/*!40000 ALTER TABLE `egresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingresos`
--

DROP TABLE IF EXISTS `ingresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingresos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` text COLLATE utf8_unicode_ci,
  `monto` decimal(10,4) DEFAULT NULL,
  `aplicacion` datetime DEFAULT NULL,
  `tipo_ingreso_id` int(11) DEFAULT NULL,
  `egreso_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_ingresos_on_tipo_ingreso_id` (`tipo_ingreso_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingresos`
--

LOCK TABLES `ingresos` WRITE;
/*!40000 ALTER TABLE `ingresos` DISABLE KEYS */;
INSERT INTO `ingresos` VALUES (13,'retiro',1000.0000,'2013-06-30 15:07:17',2,109,'2013-07-04 00:11:00','2013-07-04 00:11:00'),(14,'pago',2904.5700,'2013-06-13 05:18:00',3,NULL,'2013-07-04 05:19:12','2013-07-04 05:25:02'),(15,'retiro',400.0000,'2013-07-05 02:27:00',2,131,'2013-07-05 02:53:19','2013-07-05 02:53:19');
/*!40000 ALTER TABLE `ingresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago_deudas`
--

DROP TABLE IF EXISTS `pago_deudas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pago_deudas` (
  `deuda_id` int(11) DEFAULT NULL,
  `egreso_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago_deudas`
--

LOCK TABLES `pago_deudas` WRITE;
/*!40000 ALTER TABLE `pago_deudas` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago_deudas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodos`
--

DROP TABLE IF EXISTS `periodos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `periodos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodos`
--

LOCK TABLES `periodos` WRITE;
/*!40000 ALTER TABLE `periodos` DISABLE KEYS */;
INSERT INTO `periodos` VALUES (1,'Dias','2013-06-25 05:38:30','2013-06-25 05:38:30'),(2,'Semanas','2013-06-25 05:38:30','2013-06-25 05:38:30'),(3,'Meses','2013-06-25 05:38:30','2013-06-25 05:38:30'),(4,'Años','2013-06-25 05:38:30','2013-06-25 05:38:30');
/*!40000 ALTER TABLE `periodos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20130623065723'),('20130623065734'),('20130623192935'),('20130623194830'),('20130623200446'),('20130623200457'),('20130623211328'),('20130624055754'),('20130624055925');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_egresos`
--

DROP TABLE IF EXISTS `tipo_egresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_egresos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_egresos`
--

LOCK TABLES `tipo_egresos` WRITE;
/*!40000 ALTER TABLE `tipo_egresos` DISABLE KEYS */;
INSERT INTO `tipo_egresos` VALUES (1,'Transporte','2013-06-25 05:38:30','2013-06-25 05:38:30'),(2,'Comida','2013-06-25 05:38:30','2013-06-25 05:38:30'),(3,'Medico','2013-06-25 05:38:30','2013-06-25 05:38:30'),(4,'Escolar','2013-06-25 05:38:30','2013-06-25 05:38:30'),(5,'Miscelaneo','2013-06-25 05:38:30','2013-06-25 05:38:30'),(6,'Ahorro','2013-07-06 18:02:50','2013-07-06 18:02:50');
/*!40000 ALTER TABLE `tipo_egresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_ingresos`
--

DROP TABLE IF EXISTS `tipo_ingresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_ingresos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_ingresos`
--

LOCK TABLES `tipo_ingresos` WRITE;
/*!40000 ALTER TABLE `tipo_ingresos` DISABLE KEYS */;
INSERT INTO `tipo_ingresos` VALUES (1,'Banco','2013-06-25 05:38:30','2013-06-25 05:38:30'),(2,'Efectivo','2013-06-25 05:38:30','2013-06-25 05:38:30'),(3,'Si vale','2013-06-25 05:38:30','2013-06-25 05:38:30'),(4,'Prestamo','2013-06-25 05:38:30','2013-06-25 05:38:30'),(5,'Ahorro','2013-07-06 18:03:05','2013-07-06 18:03:05');
/*!40000 ALTER TABLE `tipo_ingresos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-07-06 18:35:17
