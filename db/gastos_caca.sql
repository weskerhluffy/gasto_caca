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
INSERT INTO `deudas_egresos` VALUES (1,232);
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
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egresos`
--

LOCK TABLES `egresos` WRITE;
/*!40000 ALTER TABLE `egresos` DISABLE KEYS */;
INSERT INTO `egresos` VALUES (1,'papas',8.0000,2,'2013-06-25 05:54:00',2,'2013-06-25 05:54:43','2013-06-25 05:54:43'),(2,'tortillas',11.0000,2,'2013-06-25 05:54:00',2,'2013-06-25 05:55:02','2013-06-25 05:55:02'),(3,'salchichas',15.0000,2,'2013-06-25 05:55:00',2,'2013-06-25 05:55:22','2013-06-25 05:55:22'),(4,'leche',24.0000,2,'2013-06-25 05:55:00',2,'2013-06-25 05:55:56','2013-06-25 05:55:56'),(5,'camion',24.5000,1,'2013-06-25 05:56:00',2,'2013-06-25 05:56:41','2013-07-02 09:27:28'),(6,'benzal',79.5000,5,'2013-06-26 19:05:00',3,'2013-07-02 09:31:00','2013-07-02 09:31:00'),(78,'sabritas',5.5000,2,'2013-06-30 00:00:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(79,'pasta fideo 1 p',3.9000,2,'2013-06-30 00:00:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(80,'pasta fideo 1 p',3.6000,2,'2013-06-30 00:00:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(81,'limon .180',2.2500,2,'2013-06-30 00:00:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(82,'manzana 1 p',3.6100,2,'2013-06-30 00:00:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(83,'crema',17.0000,2,'2013-06-26 19:56:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(84,'aceite 2 p',37.6000,2,'2013-06-26 19:56:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(85,'palomitas 2 p',11.0000,2,'2013-06-26 19:56:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(86,'boing 1 l',11.9000,2,'2013-06-26 19:56:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(87,'frijol',12.5000,2,'2013-06-26 19:56:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(88,'cebolla .245',2.6700,2,'2013-06-30 15:07:17',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(89,'cilantro',5.5000,2,'2013-06-30 15:07:17',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(90,'magnum almendras',22.0000,2,'2013-06-30 15:07:17',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(91,'kiwi 2 p',6.9000,2,'2013-06-30 15:07:17',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(92,'boing .5 l 2 p',13.0000,2,'2013-06-30 15:07:17',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(93,'zanahoria 4 p',1.5800,2,'2013-06-30 15:07:17',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(109,'retiro',1000.0000,5,'2013-06-30 15:07:17',1,'2013-07-04 00:11:00','2013-07-04 00:11:00'),(110,'camion',24.0000,1,'2013-07-05 02:27:00',2,'2013-07-04 05:33:28','2013-07-04 05:33:28'),(111,'camiones',24.0000,1,'2013-07-05 02:27:00',2,'2013-07-05 01:25:43','2013-07-05 01:25:43'),(112,'torta ahogada',25.0000,2,'2013-07-05 02:27:00',2,'2013-07-05 01:34:23','2013-07-05 02:06:14'),(113,'salsa valentina 2 p',37.8000,2,'2013-07-05 17:20:00',3,'2013-07-05 02:07:47','2013-07-05 02:07:47'),(114,'listerine',125.0000,5,'2013-07-05 17:20:00',3,'2013-07-05 02:09:10','2013-07-05 02:09:18'),(115,'jabones',24.9000,5,'2013-07-05 17:20:00',3,'2013-07-05 02:09:50','2013-07-05 02:09:50'),(116,'9 cosas de 3 pesos',27.0000,2,'2013-07-05 02:27:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(117,'pan',20.0000,2,'2013-07-05 02:27:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(118,'guacal madera',20.0000,2,'2013-07-05 02:27:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(119,'leche 1 l',24.0000,2,'2013-07-05 02:27:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(120,'transporte',12.0000,2,'2013-07-05 02:27:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(121,'coladera grande',30.0000,2,'2013-07-05 02:27:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(122,'cuchara especial',15.0000,2,'2013-07-05 02:27:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(123,'higado .25',12.0000,2,'2013-07-05 02:27:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(124,'aplanador',15.0000,2,'2013-07-05 02:27:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(125,'arroz',20.7500,2,'2013-07-05 02:27:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(126,'encendedor',28.7500,2,'2013-07-05 02:27:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(131,'retiro',400.0000,5,'2013-07-05 02:27:00',1,'2013-07-05 02:53:19','2013-07-05 02:53:19'),(132,'comida sbarro',49.0000,2,'2013-07-05 06:20:00',2,'2013-07-06 06:20:22','2013-07-06 06:20:22'),(133,'camiones',6.0000,1,'2013-07-05 06:21:00',2,'2013-07-06 06:21:32','2013-07-06 06:21:32'),(138,'brocoli',3.0000,2,'2013-07-06 13:08:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(139,'calabaza 2 p',4.5000,2,'2013-07-06 13:08:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(140,'col',0.5000,2,'2013-07-06 13:08:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(141,'elote 2 p',8.0000,2,'2013-07-06 13:08:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(142,'espinaca',10.0000,2,'2013-07-06 13:08:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(143,'germinado de soya .1',5.0000,2,'2013-07-06 13:08:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(144,'jamon .1',7.0000,2,'2013-07-06 13:08:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(145,'jitomate .5',4.0000,2,'2013-07-06 13:08:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(146,'kiwi 3 p',12.0000,2,'2013-07-06 13:08:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(147,'limon 1',8.0000,2,'2013-07-06 13:08:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(148,'melon',13.5000,2,'2013-07-06 13:08:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(149,'papa 2',23.5000,2,'2013-07-06 13:08:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(150,'papaya',9.5000,2,'2013-07-06 13:08:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(151,'pera 4 p',31.5000,2,'2013-07-06 13:08:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(152,'piña',14.5000,2,'2013-07-06 13:08:00',2,'0000-00-00 00:00:00','2013-07-06 23:46:34'),(153,'pollo 1 pechuga',49.0000,2,'2013-07-06 13:08:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(154,'queso panela .4',21.0000,2,'2013-07-06 13:08:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(155,'sandia',13.0000,2,'2013-07-06 13:08:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(156,'tocino .1',8.0000,2,'2013-07-06 13:08:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(157,'vinagre',12.0000,2,'2013-07-06 13:08:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(158,'zanahoria 2p',2.0000,2,'2013-07-06 13:08:00',2,'0000-00-00 00:00:00','2013-07-07 03:20:09'),(169,'camiones a atemajac',24.0000,1,'2013-07-06 22:17:00',2,'2013-07-07 03:18:03','2013-07-07 03:18:03'),(170,'crema',0.0000,2,'2013-07-07 18:41:00',2,'2013-07-08 01:20:15','2013-07-08 01:20:15'),(171,'frijol',12.5000,2,'2013-07-07 18:41:00',2,'2013-07-08 01:20:56','2013-07-08 01:20:56'),(172,'camiones papa',12.0000,1,'2013-07-07 00:00:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(173,'2 cosas de $3',6.0000,5,'2013-07-07 00:00:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(174,'pan integral',15.0000,2,'2013-07-07 00:00:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(175,'leche 1 l',13.0000,2,'2013-07-07 00:00:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(176,'2 pinzas electricas',10.0000,5,'2013-07-07 00:00:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(177,'frijol',13.0000,2,'2013-07-07 00:00:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(178,'crema',14.0000,2,'2013-07-07 00:00:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(179,'costilla .516',25.5000,2,'2013-07-08 00:00:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(180,'pata de res .644',21.1900,2,'2013-07-08 00:00:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(181,'mayonesa',25.2500,2,'2013-07-08 00:00:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(182,'milanesa .358',30.9700,2,'2013-07-08 00:00:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(183,'huevo',30.0000,2,'2013-07-08 00:00:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(184,'arroz',21.0000,2,'2013-07-08 00:00:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(185,'pan molido',10.0000,2,'2013-07-08 00:00:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(186,'leche',17.4000,2,'2013-07-09 07:41:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(187,'bollillo',4.8000,2,'2013-07-09 07:41:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(188,'camiones',36.0000,1,'2013-07-09 23:27:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(189,'doctor',160.0000,3,'2013-07-09 23:27:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(190,'paletas para la tos',27.0000,3,'2013-07-09 23:27:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(203,'prestamo JCL\r\nPAGO CUENTA DE TERCERO/ 0021737011\r\nCUENTA: 2799727795 BNET',1500.0000,5,'2013-07-02 04:39:00',1,'2013-07-10 04:40:44','2013-07-10 04:40:44'),(204,'pago de boletos azrael y señora pati\r\nPAGO INTERBANCARIO TDC/ 0046518008\r\nERNESTO ALVARADO ***7559',1029.0000,1,'2013-07-02 02:41:00',1,'2013-07-10 04:42:26','2013-07-10 04:42:26'),(205,'retiro\r\nRETIRO CAJERO AUTOMATICO/******6009\r\nJUL03 09:20 BANCOMER 7629 FOLIO:5121',400.0000,5,'2013-07-03 09:20:00',1,'2013-07-10 04:47:19','2013-07-10 04:47:19'),(206,'comision SPEI',34.8000,5,'2013-07-08 04:47:00',1,'2013-07-10 04:48:24','2013-07-10 04:48:24'),(207,'restante de renta\r\nTEF ENVIADO SCOTIABANK/1113734204 044\r\n0080713DEUDA RENTA',400.0000,5,'2013-07-08 16:06:00',1,'2013-07-10 04:50:21','2013-07-10 04:50:21'),(208,'retiro\r\nRETIRO CAJERO AUTOMATICO/******6009\r\nJUL08 16:06 BANCOMER 0771 FOLIO:6216\r\n',400.0000,5,'2013-07-08 16:06:00',1,'2013-07-10 04:51:17','2013-07-10 04:51:17'),(209,'tiempo aire honeypot\r\nCOMPRA DE TIEMPO AIRE/******3309\r\nJUL09 09:54 BANCOMER VNET FOLIO:5196',100.0000,1,'2013-07-09 09:54:00',1,'2013-07-10 04:52:49','2013-07-10 04:52:49'),(210,'BENAVIDES S19420 TRANSGUADALAJARA JJA MX',309.5000,3,'2013-06-26 19:03:45',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(211,'BENAVIDES S19420 TRANSGUADALAJARA JJA MX',79.5000,3,'2013-06-26 19:08:30',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(212,'F AHORRO GDAL ALCALDE GUADALAJARA 14 MX',437.0000,3,'2013-06-26 21:13:17',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(213,'F AHORRO GDAL ALCALDE GUADALAJARA 14 MX',33.5000,3,'2013-06-28 21:16:32',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(214,'F AHORRO GDAL ALCALDE GUADALAJARA 14 MX',78.5000,3,'2013-06-28 21:21:50',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(215,'CINEPOLIS DULCERIA MORELIA MICH MI MX',432.0000,5,'2013-06-29 17:39:23',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(216,'F AHORRO GDEX EXPERIENGUADALAJARA 14 MX',70.0000,3,'2013-06-30 20:27:02',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(217,'comida 100 NATURAL ANDARES ZAPOPAN JAL JA MX ',187.7000,2,'2013-07-02 13:29:50',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(218,'enjuague y salsa valentina 2 p SUPERCENTER PATRIA ZAPOPAN JAL 000MX ',21.1900,5,'2013-07-04 17:20:26',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(225,'guantes',27.0000,5,'2013-07-11 06:11:00',2,'2013-07-12 06:11:53','2013-07-12 06:11:53'),(226,'mermelada',20.0000,2,'2013-07-11 06:12:00',2,'2013-07-12 06:12:28','2013-07-12 06:12:28'),(227,'limpia vidrios',30.0000,5,'2013-07-11 06:12:00',2,'2013-07-12 06:12:55','2013-07-12 06:12:55'),(228,'papa 1',16.0000,2,'2013-07-11 06:13:00',2,'2013-07-12 06:13:26','2013-07-12 06:13:26'),(229,'camiones',12.0000,1,'2013-07-11 06:13:00',2,'2013-07-12 06:13:56','2013-07-12 06:13:56'),(230,'deuda banco\r\nPAGO INTERBANCARIO TDC/ 0036983008\r\nERNESTO ALVARADO ***7559',100.9900,5,'2013-07-11 06:23:00',1,'2013-07-12 06:23:52','2013-07-17 00:56:00'),(231,'pago de deuda de JCL\r\nPAGO CUENTA DE TERCERO/ 0069289015\r\nCUENTA: 2799727795 BNET',1500.0000,5,'2013-07-12 00:00:00',4,'2013-07-17 01:07:15','2013-07-17 02:09:32'),(232,'pago lavadora\r\nPAGO INTERBANCARIO TDC/ 0049967009\r\nERNESTO ALVARADO ***7559',800.0000,5,'2013-07-12 00:00:00',1,'2013-07-17 01:10:42','2013-07-17 01:10:42'),(233,'RETIRO CAJERO AUTOMATICO/******6009\r\nJUL12 20:27 BANCOMER 7289 FOLIO:8243',400.0000,5,'2013-07-12 20:27:00',1,'2013-07-17 01:11:50','2013-07-17 01:11:50'),(234,'RETIRO CAJERO AUTOMATICO/******6009\r\nJUL15 09:33 BANCOMER 2446 FOLIO:9112',400.0000,5,'2013-07-15 09:33:00',1,'2013-07-17 01:14:19','2013-07-17 01:14:19'),(235,'boletos\r\nETN INTERNET CIB/******6009\r\nRFC: ETN 9102079WA 17:40 AUT: 453677',1299.6000,1,'2013-07-15 17:40:00',1,'2013-07-17 01:15:14','2013-07-17 01:15:24'),(267,'fotos',45.0000,5,'2013-07-12 00:00:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(268,'hamburguesa 100% natural',64.0000,2,'2013-07-12 13:19:00',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(269,'leche 2 l; birote y caf',37.0000,2,'2013-07-14 13:29:50',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(270,'camiones',24.0000,1,'2013-07-15 00:00:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(271,'taxi a casa',168.0000,1,'2013-07-15 06:00:15',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(272,'pescado .686',43.1500,2,'2013-07-15 10:06:21',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(273,'jamon .1',6.0000,2,'2013-07-15 10:51:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(274,'sabino .1',6.0000,2,'2013-07-15 10:51:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(275,'oaxaca',21.0000,2,'2013-07-15 10:51:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(276,'manchego .1',14.0000,2,'2013-07-15 10:51:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(277,'paquete sbarro\r\nSBARRO ANDARES GDL MEXICO DF 000MX	',49.0000,2,'2013-07-15 13:21:00',3,'0000-00-00 00:00:00','2013-07-17 01:39:11'),(278,'pan blanco',11.0000,2,'2013-07-15 20:51:15',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(279,'palomitas 3 p',16.5000,2,'2013-07-15 20:51:15',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(280,'espaguetti 2 p',5.8000,2,'2013-07-15 20:51:15',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(281,'aceite 2 l',37.6000,2,'2013-07-15 20:51:15',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(282,'camiones',30.0000,1,'2013-07-16 00:00:00',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(298,'cine pacific rim\r\nCINEPOLIS TAQUILLA MORELIA MICH MI MX	',57.0000,5,'2013-07-13 12:41:00',3,'2013-07-17 01:33:22','2013-07-17 01:33:22'),(299,'ropa, cinturon para azrael y para la casa.\r\nMULTIMARCAS PRO E M MEXICO DF 000MX',196.0000,5,'2013-07-13 15:26:00',3,'2013-07-17 01:35:13','2013-07-17 01:35:13'),(300,'juego de la pelota que cae\r\nTODO PARA MI ESC MEXICO DF 000MX',515.0000,5,'2013-07-13 15:47:00',3,'2013-07-17 01:36:30','2013-07-17 01:36:30'),(301,'pago tarjeta credito (intereses y membresia)',80.3300,5,'2013-07-16 20:55:00',1,'2013-07-17 01:55:37','2013-07-17 01:55:37'),(302,'comida vips\r\nVIPS OBSERVATORIO MEXI',672.0000,2,'2013-07-15 00:00:00',1,'2013-07-17 01:56:47','2013-07-17 01:56:47');
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingresos`
--

LOCK TABLES `ingresos` WRITE;
/*!40000 ALTER TABLE `ingresos` DISABLE KEYS */;
INSERT INTO `ingresos` VALUES (13,'retiro',1000.0000,'2013-06-30 15:07:17',2,109,'2013-07-04 00:11:00','2013-07-04 00:11:00'),(14,'saldo iniclal',778.0100,'2013-07-09 05:18:00',3,NULL,'2013-07-04 05:19:12','2013-07-10 04:56:00'),(15,'retiro',400.0000,'2013-07-05 02:27:00',2,131,'2013-07-05 02:53:19','2013-07-05 02:53:19'),(17,'prestamo JCL\r\nPAGO CUENTA DE TERCERO/ 0021737011\r\nCUENTA: 2799727795 BNET',1500.0000,'2013-07-02 04:39:00',4,203,'2013-07-10 04:40:44','2013-07-10 04:40:44'),(18,'retiro\r\nRETIRO CAJERO AUTOMATICO/******6009\r\nJUL03 09:20 BANCOMER 7629 FOLIO:5121',400.0000,'2013-07-03 09:20:00',2,205,'2013-07-10 04:47:19','2013-07-10 04:47:19'),(19,'retiro\r\nRETIRO CAJERO AUTOMATICO/******6009\r\nJUL08 16:06 BANCOMER 0771 FOLIO:6216\r\n',400.0000,'2013-07-08 16:06:00',2,208,'2013-07-10 04:51:17','2013-07-10 04:51:17'),(20,'saldo inicial',98187.6900,'2013-07-10 04:53:00',1,NULL,'2013-07-10 04:53:38','2013-07-10 04:53:38'),(21,'saldo inicial',65.0000,'2013-07-10 05:33:00',2,NULL,'2013-07-10 05:33:58','2013-07-10 05:33:58'),(23,'pago nomina\r\nSPEI RECIBIDOBANAMEX/0005059548 002\r\n0002938ORACLE DE MEXICO SA DE CV',18224.9400,'2013-07-12 00:00:00',1,NULL,'2013-07-17 00:56:59','2013-07-17 00:56:59'),(25,'RETIRO CAJERO AUTOMATICO/******6009\r\nJUL12 20:27 BANCOMER 7289 FOLIO:8243',400.0000,'2013-07-12 20:27:00',2,233,'2013-07-17 01:11:50','2013-07-17 01:11:50'),(26,'RETIRO CAJERO AUTOMATICO/******6009\r\nJUL15 09:33 BANCOMER 2446 FOLIO:9112',400.0000,'2013-07-15 09:33:00',2,234,'2013-07-17 01:14:19','2013-07-17 01:14:19'),(27,'salario',2668.0000,'2013-07-11 22:23:00',3,NULL,'2013-07-17 01:29:28','2013-07-17 01:29:28'),(28,'dinero honeypot',300.0000,'2013-07-14 00:00:00',2,NULL,'2013-07-17 01:30:22','2013-07-17 01:30:22'),(29,'pago de deuda de JCL\r\nPAGO CUENTA DE TERCERO/ 0069289015\r\nCUENTA: 2799727795 BNET',1500.0000,'2013-07-12 00:00:00',1,231,'2013-07-17 02:09:32','2013-07-17 02:09:32');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_egresos`
--

LOCK TABLES `tipo_egresos` WRITE;
/*!40000 ALTER TABLE `tipo_egresos` DISABLE KEYS */;
INSERT INTO `tipo_egresos` VALUES (1,'Transporte','2013-06-25 05:38:30','2013-06-25 05:38:30'),(2,'Comida','2013-06-25 05:38:30','2013-06-25 05:38:30'),(3,'Medico','2013-06-25 05:38:30','2013-06-25 05:38:30'),(4,'Escolar','2013-06-25 05:38:30','2013-06-25 05:38:30'),(5,'Miscelaneo','2013-06-25 05:38:30','2013-06-25 05:38:30'),(6,'Ahorro','2013-07-06 18:02:50','2013-07-06 18:02:50'),(7,'Tiempo aire','2013-07-10 04:52:03','2013-07-10 04:52:03');
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

-- Dump completed on 2013-07-16 21:12:18
