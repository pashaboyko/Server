-- MySQL dump 10.13  Distrib 8.0.13, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: aircraft_construction
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `brigade`
--

DROP TABLE IF EXISTS `brigade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `brigade` (
  `id_brigade` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `id_brigadier` int(11) DEFAULT NULL,
  `id_district` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_brigade`),
  KEY `id_district_brigade` (`id_district`,`id_brigade`),
  KEY `id_district` (`id_district`),
  KEY `id_brigadier_idx` (`id_brigadier`),
  CONSTRAINT `id_brigadier` FOREIGN KEY (`id_brigadier`) REFERENCES `staff_value` (`id_staff_value`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `id_districtds` FOREIGN KEY (`id_district`) REFERENCES `district` (`id_district`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=511 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brigade`
--

LOCK TABLES `brigade` WRITE;
/*!40000 ALTER TABLE `brigade` DISABLE KEYS */;
INSERT INTO `brigade` VALUES (501,'N1',803,701),(502,'N2',806,702),(503,'N3',812,703),(504,'N4',813,704),(505,'N5',814,705),(506,'N6',815,706),(507,'N7',816,707),(508,'N8',817,705),(509,'N9',NULL,704),(510,'N10',NULL,701);
/*!40000 ALTER TABLE `brigade` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `brigade_BEFORE_INSERT` BEFORE INSERT ON `brigade` FOR EACH ROW BEGIN

DECLARE nom INT default 0;


SELECT staff_value.id_staff INTO nom FROM staff_value
                          WHERE new.id_brigadier = staff_value.id_staff_value ;

IF (not nom = 1202)       
THEN BEGIN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data brigadir ';
END ;
else 
SELECT staff_value.id_brigade INTO nom FROM staff_value
                          WHERE new.id_brigadier = staff_value.id_staff_value ;
IF (not nom = new.id_brigade)       
THEN 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data brigadir ';
END if ;

end if;


    


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `brigade_BEFORE_UPDATE` BEFORE UPDATE ON `brigade` FOR EACH ROW BEGIN


DECLARE nom INT default 0;


SELECT staff_value.id_staff INTO nom FROM staff_value
                          WHERE new.id_brigadier = staff_value.id_staff_value ;

IF (not nom = 1202)       
THEN BEGIN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data brigadir ';
END ;
else 
SELECT staff_value.id_brigade INTO nom FROM staff_value
                          WHERE new.id_brigadier = staff_value.id_staff_value ;
IF (not nom = new.id_brigade)       
THEN 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data brigadir ';
END if ;

end if;



END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `car_characteristic`
--

DROP TABLE IF EXISTS `car_characteristic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `car_characteristic` (
  `id_car_characteristic` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `id_parent` int(11) DEFAULT NULL,
  `id_car_type` int(11) NOT NULL,
  PRIMARY KEY (`id_car_characteristic`),
  KEY `name` (`name`,`id_parent`,`id_car_type`),
  KEY `id_car_type` (`id_car_type`),
  CONSTRAINT `id_carss_type` FOREIGN KEY (`id_car_type`) REFERENCES `car_type` (`id_car_type`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=944 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_characteristic`
--

LOCK TABLES `car_characteristic` WRITE;
/*!40000 ALTER TABLE `car_characteristic` DISABLE KEYS */;
INSERT INTO `car_characteristic` VALUES (927,'Висота',925,104),(936,'Висота ракети',933,105),(917,'Двигун',914,103),(922,'Длина вертольоту без лопатей',919,103),(923,'Длина с лопатями',919,103),(926,'Довжина',925,104),(935,'Довжина головки',933,105),(909,'Довжина літака',907,101),(934,'Довжина ракети',933,105),(903,'Екіпаж',901,101),(907,'ЕКСПЛУАТАЦІЙНІ ХАРАКТЕРИСТИКИ',NULL,101),(919,'ЕКСПЛУАТАЦІЙНІ ХАРАКТЕРИСТИКИ',NULL,103),(933,'ЕКСПЛУАТАЦІЙНІ ХАРАКТЕРИСТИКИ',NULL,105),(941,'ЕКСПЛУАТАЦІЙНІ ХАРАКТЕРИСТИКИ',0,106),(904,'Кількість двигунів',901,101),(915,'Кількість місць ',914,103),(913,'Колір',911,102),(930,'Колір',929,105),(943,'Колір',941,106),(908,'Крейсерська швидкість',907,101),(940,'Максимальна вага заряду',933,105),(938,'Максимальна висота польоту ',933,105),(916,'Максимальна дальність польоту',914,103),(939,'Максимальна довжина польоту',933,105),(924,'Максимальна злітна маса',919,103),(905,'Модель',901,101),(901,'ОСНОВНІ ХАРАКТЕРИСТИКИ',NULL,101),(911,'ОСНОВНІ ХАРАКТЕРИСТИКИ',NULL,102),(914,'ОСНОВНІ ХАРАКТЕРИСТИКИ',NULL,103),(929,'ОСНОВНІ ХАРАКТЕРИСТИКИ',NULL,105),(925,'ОСНОВНІ ХАРАКТЕРИСТИКИ',0,104),(931,'Потужність заряду',929,105),(902,'Розмір',901,101),(942,'Розмір',941,106),(912,'Розмір Крила',911,102),(910,'Розмах крила',907,101),(906,'Тип Двигуна',901,101),(932,'Тип заряду',929,105),(918,'Тяга',914,103),(928,'Ширина',925,104),(920,'Ширина вертольоту без лопатей',919,103),(937,'Ширина ракети',933,105),(921,'Ширина с лопаті',919,103);
/*!40000 ALTER TABLE `car_characteristic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_characteristic_value`
--

DROP TABLE IF EXISTS `car_characteristic_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `car_characteristic_value` (
  `id_car_characteristic_value` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(45) NOT NULL,
  `unit` varchar(45) DEFAULT NULL,
  `id_car_characteristic` int(11) NOT NULL,
  `id_car_value` int(11) NOT NULL,
  `id_car_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_car_characteristic_value`),
  UNIQUE KEY `id_car_characteristic` (`id_car_characteristic`,`id_car_value`,`id_car_type`),
  KEY `id_car_type` (`id_car_type`),
  KEY `id_car_value_idx` (`id_car_value`),
  KEY `id_car_value_type` (`id_car_value`,`id_car_type`),
  CONSTRAINT `id_car_tyype` FOREIGN KEY (`id_car_type`) REFERENCES `car_type` (`id_car_type`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `id_car_value` FOREIGN KEY (`id_car_value`) REFERENCES `car_value` (`id_car_value`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `id_car_value_type` FOREIGN KEY (`id_car_value`, `id_car_type`) REFERENCES `car_value` (`id_car_value`, `id_car_type`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_characteristic_value`
--

LOCK TABLES `car_characteristic_value` WRITE;
/*!40000 ALTER TABLE `car_characteristic_value` DISABLE KEYS */;
INSERT INTO `car_characteristic_value` VALUES (1,'1000','m',909,1,101),(2,'15',NULL,903,1,101),(3,'4',NULL,904,1,101),(4,' 980 ',' km/h',908,1,101),(5,'1000X300X500','m',902,1,101),(6,'RX-7',NULL,906,1,101);
/*!40000 ALTER TABLE `car_characteristic_value` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `car_characteristic_value_BEFORE_INSERT` BEFORE INSERT ON `car_characteristic_value` FOR EACH ROW BEGIN
DECLARE nomType INT default 0;

SELECT car_model.id_car_type INTO nomType FROM car_model,car_value,car_characteristic 
                          WHERE car_value.id_car_model = car_model.id_car_model AND car_value.id_car_value = new.id_car_value and car_characteristic.id_car_characteristic = new.id_car_characteristic and  car_characteristic.id_car_type =  car_model.id_car_type ;

if(nomType = 0)
then begin
 SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
END ;
Else
set new.id_car_type = nomType;
end if;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `car_characteristic_value_BEFORE_UPDATE` BEFORE UPDATE ON `car_characteristic_value` FOR EACH ROW BEGIN
DECLARE nomType INT default 0;

SELECT car_model.id_car_type INTO nomType FROM car_model,car_value,car_characteristic 
                          WHERE car_value.id_car_model = car_model.id_car_model AND car_value.id_car_value = new.id_car_value and car_characteristic.id_car_characteristic = new.id_car_characteristic and  car_characteristic.id_car_type =  car_model.id_car_type ;

if(nomType = 0)
then begin
 SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
END ;
Else
set new.id_car_type = nomType;
end if;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `car_class`
--

DROP TABLE IF EXISTS `car_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `car_class` (
  `id_car_class` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `id_car_type` int(11) NOT NULL,
  PRIMARY KEY (`id_car_class`),
  KEY `id_car_mark` (`id_car_type`),
  CONSTRAINT `id_cars_type` FOREIGN KEY (`id_car_type`) REFERENCES `car_type` (`id_car_type`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_class`
--

LOCK TABLES `car_class` WRITE;
/*!40000 ALTER TABLE `car_class` DISABLE KEYS */;
INSERT INTO `car_class` VALUES (201,'Цивільні',101),(202,'Транспортні',101),(203,'Війскові',101),(204,'Артилерійські ',105),(205,'Авіаційні',105),(206,'Військово-морські',105);
/*!40000 ALTER TABLE `car_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_model`
--

DROP TABLE IF EXISTS `car_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `car_model` (
  `id_car_model` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `id_car_type` int(11) NOT NULL,
  `id_car_class` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_car_model`),
  KEY `id_car_type` (`id_car_type`),
  KEY `id_car_class` (`id_car_class`),
  CONSTRAINT `id_car_class` FOREIGN KEY (`id_car_class`) REFERENCES `car_class` (`id_car_class`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `id_car_type` FOREIGN KEY (`id_car_type`) REFERENCES `car_type` (`id_car_type`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=412 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_model`
--

LOCK TABLES `car_model` WRITE;
/*!40000 ALTER TABLE `car_model` DISABLE KEYS */;
INSERT INTO `car_model` VALUES (401,'AE203',101,201),(402,'AE201',101,202),(403,'AE202',101,203),(404,'HIAIR23',102,NULL),(405,'OP23',103,NULL),(406,'WiDe23',103,NULL),(407,'Delta1',104,NULL),(408,'BigBom1',105,204),(409,'DethIsLife',105,205),(410,'Ручка',106,NULL),(411,'Ножка',106,NULL);
/*!40000 ALTER TABLE `car_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_type`
--

DROP TABLE IF EXISTS `car_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `car_type` (
  `id_car_type` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_car_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_type`
--

LOCK TABLES `car_type` WRITE;
/*!40000 ALTER TABLE `car_type` DISABLE KEYS */;
INSERT INTO `car_type` VALUES (101,'Літак'),(102,'Планер'),(103,'Вертольот'),(104,'Дельтаплан'),(105,'Ракет'),(106,'Інший вироб');
/*!40000 ALTER TABLE `car_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_value`
--

DROP TABLE IF EXISTS `car_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `car_value` (
  `id_car_value` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `id_car_model` int(11) NOT NULL,
  `id_car_type` int(11) DEFAULT NULL,
  `id_district` int(11) DEFAULT NULL,
  `id_manufactory` int(11) DEFAULT NULL,
  `date_start` date NOT NULL,
  `date_finish` date DEFAULT NULL,
  `id_work` int(11) DEFAULT NULL,
  `testing` tinyint(4) DEFAULT '0',
  `id_testing` int(11) DEFAULT NULL,
  `finish` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id_car_value`),
  KEY `id_car_model` (`id_car_model`),
  KEY `id_car_type` (`id_car_type`),
  KEY `id_work` (`id_work`),
  KEY `id_manufactory_district` (`id_district`,`id_manufactory`),
  KEY `id_car_value_type` (`id_car_value`,`id_car_type`),
  CONSTRAINT `id_caar_type` FOREIGN KEY (`id_car_type`) REFERENCES `car_type` (`id_car_type`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `id_car_model` FOREIGN KEY (`id_car_model`) REFERENCES `car_model` (`id_car_model`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `id_manufactory_disstrict` FOREIGN KEY (`id_district`, `id_manufactory`) REFERENCES `district` (`id_district`, `id_manufactory`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `id_work` FOREIGN KEY (`id_work`) REFERENCES `work` (`id_work`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_value`
--

LOCK TABLES `car_value` WRITE;
/*!40000 ALTER TABLE `car_value` DISABLE KEYS */;
INSERT INTO `car_value` VALUES (1,'SS1',401,101,0,0,'2020-02-21','2020-04-23',1,0,NULL,1),(2,'SS2',401,101,0,0,'2020-01-13','2020-04-23',1,0,NULL,1),(3,'SW1',402,101,0,0,'2020-01-13','2020-04-23',1,0,1,1),(4,'RW3',403,101,0,0,'2020-01-13',NULL,1,0,NULL,0),(8,'D1',408,105,0,0,'2020-01-13','2020-04-23',66,0,5,1),(9,'F2',409,105,0,0,'2020-01-13',NULL,66,1,7,0),(10,'d2',401,101,0,0,'2020-03-01',NULL,1,1,20,0),(11,'sw',402,101,0,0,'2020-03-01',NULL,1,0,NULL,0),(12,'ji',405,103,0,0,'2020-03-23',NULL,67,0,NULL,0),(13,'Ui',404,102,701,1,'2020-02-23',NULL,37,0,NULL,0),(14,'Wq',401,101,707,2,'2020-03-23',NULL,31,0,NULL,0),(15,'wer',404,102,701,1,'2020-03-15',NULL,37,0,NULL,0),(16,'Piop',402,101,702,1,'2020-03-12',NULL,48,0,NULL,0),(17,'Join',403,101,707,2,'2020-02-18',NULL,31,0,NULL,0),(18,'Zoom',407,104,706,2,'2020-03-20',NULL,58,0,NULL,0),(19,'Kild',406,103,701,1,'2020-03-01',NULL,56,0,NULL,0);
/*!40000 ALTER TABLE `car_value` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `car_value_BEFORE_INSERT_1` BEFORE INSERT ON `car_value` FOR EACH ROW BEGIN
DECLARE nomDog INT default 0;
DECLARE nomType INT default 0;
DECLARE nomWork INT default 0;
DECLARE nomDate INT default 0;
DECLARE nomNomer INT default 0;


SELECT car_model.id_car_type INTO nomType FROM car_model
                          WHERE new.id_car_model = car_model.id_car_model ;
set new.id_car_type = nomType;

IF(isnull(New.id_work))
Then
Select work.id_work INTO nomWork FROM work
                          WHERE new.id_car_type = work.id_car_type and work.nomer = 1 ;

set new.id_work = nomWork;
END IF;


Select work.nomer INTO nomNomer FROM work
                          WHERE new.id_work = work.id_work ;

IF(nomNomer = 0) 
then 
	if(isnull(New.date_finish))
    then
    set new.date_finish = now();
end if;
end if;

SELECT work.id_district INTO nomWork FROM work
                          WHERE new.id_work = work.id_work ;
                          
set  new.id_district =nomWork;

SELECT district.id_manufactory INTO nomDog FROM district
                          WHERE new.id_district= district.id_district ;
set new.id_manufactory = nomDog;





IF (NEW.date_start > NEW.date_finish OR NEW.date_start > now())        
        THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data date_start > date_finish or date_start > now';
    END IF;
    
if(not new.id_district = 0) 
then       
INSERT INTO aircraft_construction.log_to_edit_constuction (name, date, id_district_new , id_work_new) VALUES ( 'Add new',now(), new.id_district, new.id_work);
end if ;
    

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `car_value_AFTER_INSERT` AFTER INSERT ON `car_value` FOR EACH ROW BEGIN
INSERT INTO aircraft_construction.car_value_history (name, date_modification, id_car_value, name_car, id_car_model, id_car_type, id_district, id_manufactory, date_start, date_finish, id_work,testing,finish) VALUES ('Add new', now(), new.id_car_value, new.name, new.id_car_model, new.id_car_type, new.id_district, new.id_manufactory, new.date_start, new.date_finish, new.id_work,new.testing,new.finish);

    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `car_value_BEFORE_UPDATE` BEFORE UPDATE ON `car_value` FOR EACH ROW BEGIN

DECLARE nomDog INT default 0;
DECLARE nomType INT default 0;
DECLARE nomWork INT default 0;
DECLARE nomDate INT default 0;
DECLARE nomNomer INT default 0;

SELECT car_model.id_car_type INTO nomType FROM car_model
                          WHERE new.id_car_model = car_model.id_car_model ;
set new.id_car_type = nomType;



Select work.nomer INTO nomNomer FROM work
                          WHERE new.id_work = work.id_work ;

if(New.finish=1)
then
IF(nomNomer = 0) 
then 
	if(isnull(New.date_finish))
    then
    set new.date_finish = now();
end if;
set new.testing = 0;
end if;
end if;

SELECT work.id_district INTO nomWork FROM work
                          WHERE new.id_work = work.id_work ;
                          
set  new.id_district =nomWork;

SELECT district.id_manufactory INTO nomDog FROM district
                          WHERE new.id_district= district.id_district ;
set new.id_manufactory = nomDog;





IF (NEW.date_start > NEW.date_finish OR NEW.date_start > now())        
        THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data date_start > date_finish or date_start > now';
    END IF;
if(not new.id_district = 0) 
then   
    
INSERT INTO aircraft_construction.log_to_edit_constuction (name, date,id_distict_old,  id_district_new ,id_work_old,  id_work_new) VALUES ( 'Updating',now(),old. id_district , new.id_district, old.id_work,new.id_work);
 end if ;
INSERT INTO aircraft_construction.car_value_history (name, date_modification, id_car_value, name_car, id_car_model, id_car_type, id_district, id_manufactory, date_start, date_finish, id_work,testing, finish) VALUES ('Updating', now(), new.id_car_value, new.name, new.id_car_model, new.id_car_type, new.id_district, new.id_manufactory, new.date_start, new.date_finish, new.id_work,new.testing,new.finish);

    
    

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `car_value_history`
--

DROP TABLE IF EXISTS `car_value_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `car_value_history` (
  `id_car_value_history` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `date_modification` datetime NOT NULL,
  `id_car_value` int(11) DEFAULT NULL,
  `name_car` varchar(45) DEFAULT NULL,
  `id_car_model` int(11) DEFAULT NULL,
  `id_car_type` int(11) DEFAULT NULL,
  `id_district` int(11) DEFAULT NULL,
  `id_manufactory` int(11) DEFAULT NULL,
  `date_start` date NOT NULL,
  `date_finish` varchar(45) DEFAULT NULL,
  `id_work` int(11) DEFAULT NULL,
  `testing` tinyint(4) DEFAULT NULL,
  `finish` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id_car_value_history`),
  KEY `id_car_value` (`id_car_value`),
  KEY `id_car_model` (`id_car_model`),
  KEY `id_car_type` (`id_car_type`),
  KEY `id_district` (`id_district`),
  KEY `id_manufactory` (`id_manufactory`),
  KEY `id_work` (`id_work`),
  KEY `id_manufactory_district` (`id_district`,`id_manufactory`),
  CONSTRAINT `id_car_modell` FOREIGN KEY (`id_car_model`) REFERENCES `car_model` (`id_car_model`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `id_car_valuee` FOREIGN KEY (`id_car_value`) REFERENCES `car_value` (`id_car_value`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `id_cars_ttype` FOREIGN KEY (`id_car_type`) REFERENCES `car_type` (`id_car_type`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `id_distrisct` FOREIGN KEY (`id_district`) REFERENCES `district` (`id_district`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `id_manufactory_district` FOREIGN KEY (`id_district`, `id_manufactory`) REFERENCES `district` (`id_district`, `id_manufactory`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `id_manufactorye` FOREIGN KEY (`id_manufactory`) REFERENCES `manufactory` (`id_manufactory`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `id_wooork` FOREIGN KEY (`id_work`) REFERENCES `work` (`id_work`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_value_history`
--

LOCK TABLES `car_value_history` WRITE;
/*!40000 ALTER TABLE `car_value_history` DISABLE KEYS */;
INSERT INTO `car_value_history` VALUES (1,'Updating','2020-04-23 01:39:30',10,'d2',401,101,701,1,'2020-03-01',NULL,1,0,0),(2,'Updating','2020-04-23 01:39:41',9,'F2',409,105,707,2,'2020-01-13',NULL,61,0,0),(3,'Updating','2020-04-23 01:40:00',9,'F2',409,105,706,2,'2020-01-13',NULL,63,0,0),(4,'Updating','2020-04-23 01:40:01',9,'F2',409,105,706,2,'2020-01-13',NULL,64,0,0),(5,'Updating','2020-04-23 01:40:02',9,'F2',409,105,707,2,'2020-01-13',NULL,66,0,0),(6,'Updating','2020-04-23 01:40:30',9,'F2',409,105,707,2,'2020-01-13',NULL,66,0,0),(7,'Updating','2020-04-23 01:41:52',8,'D1',408,105,707,2,'2020-01-13',NULL,61,0,0),(8,'Updating','2020-04-23 01:41:53',8,'D1',408,105,706,2,'2020-01-13',NULL,63,0,0),(9,'Updating','2020-04-23 01:41:58',8,'D1',408,105,706,2,'2020-01-13',NULL,64,0,0),(10,'Updating','2020-04-23 01:42:07',8,'D1',408,105,707,2,'2020-01-13',NULL,66,0,0),(11,'Updating','2020-04-23 01:52:52',4,'RW3',403,101,703,1,'2020-01-13',NULL,48,0,0),(12,'Updating','2020-04-23 01:52:54',4,'RW3',403,101,704,1,'2020-01-13',NULL,49,0,0),(13,'Updating','2020-04-23 01:52:55',4,'RW3',403,101,701,1,'2020-01-13',NULL,50,0,0),(14,'Updating','2020-04-23 01:52:56',4,'RW3',403,101,702,1,'2020-01-13',NULL,51,0,0),(15,'Updating','2020-04-23 01:52:57',4,'RW3',403,101,701,1,'2020-01-13',NULL,1,0,0),(16,'Updating','2020-04-23 01:53:45',8,'D1',408,105,707,2,'2020-01-13',NULL,66,0,0),(17,'Updating','2020-04-23 01:53:45',4,'RW3',403,101,701,1,'2020-01-13',NULL,1,0,0),(18,'Updating','2020-04-23 01:54:03',3,'SW1',402,101,704,1,'2020-01-13',NULL,49,0,0),(19,'Updating','2020-04-23 01:54:05',3,'SW1',402,101,701,1,'2020-01-13',NULL,50,0,0),(20,'Updating','2020-04-23 01:54:06',3,'SW1',402,101,702,1,'2020-01-13',NULL,51,0,0),(21,'Updating','2020-04-23 01:54:10',3,'SW1',402,101,701,1,'2020-01-13',NULL,1,0,0),(22,'Updating','2020-04-23 01:55:48',2,'SS2',401,101,701,1,'2020-01-13',NULL,1,0,0),(24,'Add new','2020-04-23 02:00:38',11,'sw',402,101,702,1,'2020-03-01',NULL,31,0,0),(25,'Updating','2020-04-23 02:01:04',11,'sw',402,101,703,1,'2020-03-01',NULL,48,0,0),(26,'Updating','2020-04-23 02:01:07',11,'sw',402,101,704,1,'2020-03-01',NULL,49,0,0),(27,'Updating','2020-04-23 02:01:39',11,'sw',402,101,701,1,'2020-03-01',NULL,50,0,0),(28,'Updating','2020-04-23 02:03:02',11,'sw',402,101,702,1,'2020-03-01',NULL,51,0,0),(29,'Updating','2020-04-23 02:03:03',11,'sw',402,101,701,1,'2020-03-01',NULL,1,0,0),(30,'Add new','2020-04-23 02:03:42',12,'ji',405,103,705,2,'2020-03-23',NULL,56,0,0),(31,'Updating','2020-04-23 20:01:30',1,'SS1',401,101,701,1,'2020-02-21',NULL,1,0,0),(32,'Updating','2020-04-23 20:03:21',1,'SS1',401,101,701,1,'2020-02-21',NULL,1,0,0),(33,'Updating','2020-04-23 20:10:57',1,'SS1',401,101,701,1,'2020-02-21',NULL,1,0,0),(34,'Updating','2020-04-23 20:23:55',11,'sw',402,101,0,0,'2020-03-01',NULL,1,0,0),(35,'Updating','2020-04-23 20:23:55',10,'d2',401,101,0,0,'2020-03-01',NULL,1,0,0),(36,'Updating','2020-04-23 20:23:55',9,'F2',409,105,0,0,'2020-01-13',NULL,66,0,0),(37,'Updating','2020-04-23 20:23:55',8,'D1',408,105,0,0,'2020-01-13',NULL,66,0,0),(38,'Updating','2020-04-23 20:23:55',4,'RW3',403,101,0,0,'2020-01-13',NULL,1,0,0),(39,'Updating','2020-04-23 20:23:55',3,'SW1',402,101,0,0,'2020-01-13',NULL,1,0,0),(40,'Updating','2020-04-23 20:23:55',2,'SS2',401,101,0,0,'2020-01-13',NULL,1,0,0),(41,'Add new','2020-04-23 20:37:57',13,'Ui',404,102,701,1,'2020-02-23',NULL,37,0,0),(42,'Updating','2020-04-23 20:38:21',12,'ji',405,103,705,2,'2020-03-23',NULL,57,0,0),(43,'Updating','2020-04-23 20:38:34',12,'ji',405,103,0,0,'2020-03-23',NULL,67,0,0),(44,'Updating','2020-04-23 20:42:08',1,'SS1',401,101,0,0,'2020-02-21','2020-04-23',1,0,1),(45,'Updating','2020-04-23 20:59:25',1,'SS1',401,101,0,0,'2020-02-21','2020-04-23',1,0,1),(46,'Updating','2020-04-23 21:00:20',1,'SS1',401,101,0,0,'2020-02-21','2020-04-23',1,0,1),(47,'Updating','2020-04-23 21:01:59',1,'SS1',401,101,0,0,'2020-02-21','2020-04-23',1,0,1),(48,'Updating','2020-04-23 21:02:48',1,'SS1',401,101,0,0,'2020-02-21','2020-04-23',1,0,1),(49,'Updating','2020-04-23 21:02:48',1,'SS1',401,101,0,0,'2020-02-21','2020-04-23',1,0,1),(50,'Updating','2020-04-23 21:03:21',2,'SS2',401,101,0,0,'2020-01-13',NULL,1,1,0),(51,'Updating','2020-04-23 21:05:43',2,'SS2',401,101,0,0,'2020-01-13','2020-04-23',1,0,1),(52,'Updating','2020-04-23 22:05:07',3,'SW1',402,101,0,0,'2020-01-13',NULL,1,1,0),(53,'Updating','2020-04-23 22:28:55',8,'D1',408,105,0,0,'2020-01-13',NULL,66,1,0),(54,'Updating','2020-04-23 22:32:14',9,'F2',409,105,0,0,'2020-01-13',NULL,66,1,0),(55,'Updating','2020-04-23 22:33:41',9,'F2',409,105,0,0,'2020-01-13',NULL,66,0,0),(56,'Updating','2020-04-23 22:34:57',9,'F2',409,105,0,0,'2020-01-13',NULL,66,1,0),(57,'Updating','2020-04-23 22:37:29',3,'SW1',402,101,0,0,'2020-01-13',NULL,1,1,0),(58,'Updating','2020-04-23 22:37:29',8,'D1',408,105,0,0,'2020-01-13',NULL,66,1,0),(59,'Updating','2020-04-23 22:37:29',9,'F2',409,105,0,0,'2020-01-13',NULL,66,1,0),(60,'Updating','2020-04-23 22:44:34',3,'SW1',402,101,0,0,'2020-01-13',NULL,1,1,0),(61,'Updating','2020-04-23 22:46:34',3,'SW1',402,101,0,0,'2020-01-13',NULL,1,1,0),(62,'Updating','2020-04-23 22:46:59',3,'SW1',402,101,0,0,'2020-01-13','2020-04-23',1,0,1),(63,'Updating','2020-04-23 22:48:06',8,'D1',408,105,0,0,'2020-01-13','2020-04-23',66,0,1),(64,'Updating','2020-04-24 00:05:38',9,'F2',409,105,0,0,'2020-01-13',NULL,66,1,0),(65,'Updating','2020-04-24 00:51:53',10,'d2',401,101,0,0,'2020-03-01',NULL,1,NULL,0),(66,'Updating','2020-04-24 00:54:30',10,'d2',401,101,0,0,'2020-03-01',NULL,1,NULL,0),(67,'Updating','2020-04-24 00:59:08',10,'d2',401,101,0,0,'2020-03-01',NULL,1,NULL,0),(68,'Updating','2020-04-24 01:10:05',10,'d2',401,101,0,0,'2020-03-01',NULL,1,1,0),(69,'Updating','2020-04-24 01:18:24',10,'d2',401,101,0,0,'2020-03-01',NULL,1,1,0),(70,'Updating','2020-04-24 01:34:11',10,'d2',401,101,0,0,'2020-03-01',NULL,1,1,0),(71,'Updating','2020-04-24 01:42:17',10,'d2',401,101,0,0,'2020-03-01',NULL,1,1,0),(72,'Add new','2020-04-24 04:31:56',14,NULL,401,101,707,2,'2020-03-23',NULL,31,0,0),(74,'Add new','2020-04-24 04:33:26',15,'wer',404,102,701,1,'2020-03-15',NULL,37,0,0),(75,'Updating','2020-04-24 04:33:26',14,'Wq',401,101,707,2,'2020-03-23',NULL,31,0,0),(76,'Add new','2020-04-24 04:34:00',16,NULL,402,101,707,2,'2020-03-18',NULL,31,0,0),(77,'Updating','2020-04-24 04:35:16',16,'Piop',402,101,707,2,'2020-03-12',NULL,31,0,0),(78,'Add new','2020-04-24 04:35:16',17,'Join',403,101,707,2,'2020-02-18',NULL,31,0,0),(79,'Add new','2020-04-24 04:35:16',18,'Zoom',407,104,706,2,'2020-03-20',NULL,58,0,0),(80,'Add new','2020-04-24 04:35:16',19,'Kild',406,103,701,1,'2020-03-01',NULL,56,0,0),(81,'Updating','2020-04-24 04:49:01',16,'Piop',402,101,702,1,'2020-03-12',NULL,48,0,0);
/*!40000 ALTER TABLE `car_value_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `district` (
  `id_district` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `id_manufactory` int(11) DEFAULT NULL,
  `id_boss` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_district`),
  KEY `id_manufactory` (`id_manufactory`),
  KEY `id_boss` (`id_boss`),
  KEY `id_manufactory_district` (`id_district`,`id_manufactory`),
  CONSTRAINT `id_bosss` FOREIGN KEY (`id_boss`) REFERENCES `staff_value` (`id_staff_value`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `id_manufactory` FOREIGN KEY (`id_manufactory`) REFERENCES `manufactory` (`id_manufactory`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=708 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` VALUES (701,'district1',1,801),(702,'district2',1,802),(703,'district3',1,807),(704,'dicstrict4',1,808),(705,'districta1',2,822),(706,'districta2',2,823),(707,'districta3',2,824);
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `district_BEFORE_INSERT` BEFORE INSERT ON `district` FOR EACH ROW BEGIN

DECLARE nom INT default 0;
DECLARE nomDistrict INT default 0;

SELECT staff_value.id_staff INTO nom FROM staff_value
                          WHERE new.id_boss = staff_value.id_staff_value ;
                          
SELECT brigade.id_district INTO nomDistrict FROM staff_value, brigade
                          WHERE new.id_boss = staff_value.id_staff_value and staff_value.id_brigade = brigade.id_brigade and brigade.id_district = new.id_district ;
                          

IF (not nom = 1201 or nomDistrict = 0)       
        THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data boss ';
    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `district_BEFORE_UPDATE` BEFORE UPDATE ON `district` FOR EACH ROW BEGIN

DECLARE nom INT default 0;
DECLARE nomDistrict INT default 0;

SELECT staff_value.id_staff INTO nom FROM staff_value
                          WHERE new.id_boss = staff_value.id_staff_value ;
                          
SELECT brigade.id_district INTO nomDistrict FROM staff_value, brigade
                          WHERE new.id_boss = staff_value.id_staff_value and staff_value.id_brigade = brigade.id_brigade and brigade.id_district = new.id_district ;
                          

IF (not nom = 1201 or nomDistrict = 0)       
        THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data boss ';
    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `equipment` (
  `id_equipment` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `id_testing` int(11) DEFAULT NULL,
  `id_laboratory` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_equipment`),
  KEY `id_testing` (`id_testing`)
) ENGINE=InnoDB AUTO_INCREMENT=4019 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES (4001,'Перевірка краски',7,NULL),(4002,'Перевірка обдуву',7,NULL),(4003,'Перевірка крила',7,NULL),(4004,'перевірка деталей',7,NULL),(4005,'перевірка розмірів',7,NULL),(4006,'перевірка двигуна',7,NULL),(4007,'перевірка шин',7,NULL),(4008,'перевірка електрики',7,NULL),(4009,'перевірка головного компютера',20,3004),(4010,'Перевірка фарби2',20,3004),(4011,'Перевірка обдуву2',20,3005),(4012,'Перевірка крила2',20,3005),(4013,'перевірка деталей2',NULL,NULL),(4014,'перевірка розмірів2',NULL,NULL),(4015,'перевірка двигуна2',NULL,NULL),(4016,'перевірка шин2',NULL,NULL),(4017,'перевірка електрики2',NULL,NULL),(4018,'перевірка головного компютера',NULL,NULL);
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `equipment_BEFORE_UPDATE` BEFORE UPDATE ON `equipment` FOR EACH ROW BEGIN
if( not isnull( new.id_testing))
then
INSERT INTO log_equipment(id_testing, id_equipment,id_laboratory ) VALUES (new.id_testing, new.id_equipment, new.id_laboratory);
end if;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `laboratory`
--

DROP TABLE IF EXISTS `laboratory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `laboratory` (
  `id_laboratory` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_laboratory`)
) ENGINE=InnoDB AUTO_INCREMENT=3006 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratory`
--

LOCK TABLES `laboratory` WRITE;
/*!40000 ALTER TABLE `laboratory` DISABLE KEYS */;
INSERT INTO `laboratory` VALUES (3001,'Пушкінська ','Житомир вул. Лохушкіна 78'),(3002,'20-х ','Лівів вул. Шевченка 90'),(3003,'21-х ','Львів вул Жорівска 56'),(3004,'НовийСвіт','Донецьк вул. Біляша 43'),(3005,'Зомів','Одеса вул. Діхтірьовська 80');
/*!40000 ALTER TABLE `laboratory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboratory_staff`
--

DROP TABLE IF EXISTS `laboratory_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `laboratory_staff` (
  `id_laboratory_staff` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `id_testing` varchar(45) DEFAULT NULL,
  `id_laboratory` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_laboratory_staff`)
) ENGINE=InnoDB AUTO_INCREMENT=4517 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratory_staff`
--

LOCK TABLES `laboratory_staff` WRITE;
/*!40000 ALTER TABLE `laboratory_staff` DISABLE KEYS */;
INSERT INTO `laboratory_staff` VALUES (4501,'Маслов Лев Романович','7',NULL),(4502,'Зуев Ярослав Васильевич','7',NULL),(4503,'Титов Лаврентий Ростиславович','7',NULL),(4504,'Наумов Яков Фролович','7',NULL),(4505,'Ефремов Илья Валерьянович','20',3004),(4506,'Жуков Матвей Валерьевич','20',3004),(4507,'Маслова Мила Наумовна','20',3005),(4508,'Наумова Нинна Сергеевна','20',3005),(4509,'Лаврентьева Ника Васильевна','7',NULL),(4510,'Журавлёва Эльвина Семеновна','7',NULL),(4511,'Ефимова Ясмина Евгеньевна','7',NULL),(4512,'Пестова Мария Юлиановна','7',NULL),(4513,'Королёва Лариса Парфеньевна',NULL,NULL),(4514,'Архипов Егор Данилович',NULL,NULL),(4515,'Вишняков Богдан Миронович',NULL,NULL),(4516,'Рожков Назарий Семенович',NULL,NULL);
/*!40000 ALTER TABLE `laboratory_staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `laboratory_staff_BEFORE_UPDATE` BEFORE UPDATE ON `laboratory_staff` FOR EACH ROW BEGIN
if( not isnull( new.id_testing))
then
INSERT INTO log_laboratory_staff (id_testing,  id_laboratory_staff , id_laboratory) VALUES (new.id_testing, new.id_laboratory_staff, new.id_laboratory);
end if;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `log_equipment`
--

DROP TABLE IF EXISTS `log_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `log_equipment` (
  `id_log_equipment` int(11) NOT NULL AUTO_INCREMENT,
  `id_testing` int(11) NOT NULL,
  `id_equipment` int(11) NOT NULL,
  `id_laboratory` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_log_equipment`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_equipment`
--

LOCK TABLES `log_equipment` WRITE;
/*!40000 ALTER TABLE `log_equipment` DISABLE KEYS */;
INSERT INTO `log_equipment` VALUES (1,1,4001,3001),(2,1,4002,3001),(3,1,4003,3001),(4,1,4004,3001),(5,7,4005,3002),(6,7,4006,3002),(7,7,4007,3002),(8,7,4008,3002),(9,7,4001,3003),(10,7,4002,3003),(11,7,4003,3003),(12,7,4004,3003),(23,20,4009,3004),(24,20,4010,3004),(25,20,4011,3005),(26,20,4012,3005);
/*!40000 ALTER TABLE `log_equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_laboratory_staff`
--

DROP TABLE IF EXISTS `log_laboratory_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `log_laboratory_staff` (
  `id_log_laboratory_staff` int(11) NOT NULL AUTO_INCREMENT,
  `id_testing` int(11) DEFAULT NULL,
  `id_laboratory_staff` int(11) DEFAULT NULL,
  `id_laboratory` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_log_laboratory_staff`),
  KEY `id_laboratory_staff` (`id_laboratory_staff`),
  KEY `id_testing` (`id_testing`),
  CONSTRAINT `id_laboratory_staff` FOREIGN KEY (`id_laboratory_staff`) REFERENCES `laboratory_staff` (`id_laboratory_staff`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `id_testing` FOREIGN KEY (`id_testing`) REFERENCES `testing_value` (`id_testing_value`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_laboratory_staff`
--

LOCK TABLES `log_laboratory_staff` WRITE;
/*!40000 ALTER TABLE `log_laboratory_staff` DISABLE KEYS */;
INSERT INTO `log_laboratory_staff` VALUES (1,1,4501,3001),(2,1,4502,3001),(3,1,4503,3001),(4,1,4504,3001),(5,5,4505,3001),(6,5,4506,3001),(7,5,4507,3001),(8,5,4508,3001),(13,7,4509,3002),(14,7,4510,3002),(15,7,4511,3002),(16,7,4512,3002),(17,7,4501,3003),(18,7,4502,3003),(19,7,4503,3003),(20,7,4504,3003),(33,20,4505,3004),(34,20,4506,3004),(35,20,4507,3005),(36,20,4508,3005);
/*!40000 ALTER TABLE `log_laboratory_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_to_edit_constuction`
--

DROP TABLE IF EXISTS `log_to_edit_constuction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `log_to_edit_constuction` (
  `id_log_to_edit_constuction` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `id_distict_old` int(11) DEFAULT NULL,
  `id_district_new` int(11) DEFAULT NULL,
  `id_brigade_old` int(11) DEFAULT NULL,
  `id_brigade_new` int(11) DEFAULT NULL,
  `id_work_old` int(11) DEFAULT NULL,
  `id_work_new` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_log_to_edit_constuction`),
  KEY `id_district_new` (`id_district_new`),
  KEY `id_brigade_old` (`id_brigade_old`),
  KEY `id_work_old` (`id_work_old`),
  KEY `id_distict_old` (`id_distict_old`),
  KEY `id_brigade_new` (`id_brigade_new`),
  KEY `id_work_new` (`id_work_new`),
  CONSTRAINT `id_brigade_new` FOREIGN KEY (`id_brigade_new`) REFERENCES `brigade` (`id_brigade`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `id_brigade_old` FOREIGN KEY (`id_brigade_old`) REFERENCES `brigade` (`id_brigade`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `id_distict_old` FOREIGN KEY (`id_distict_old`) REFERENCES `district` (`id_district`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `id_district_new` FOREIGN KEY (`id_district_new`) REFERENCES `district` (`id_district`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `id_work_new` FOREIGN KEY (`id_work_new`) REFERENCES `work` (`id_work`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `id_work_old` FOREIGN KEY (`id_work_old`) REFERENCES `work` (`id_work`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_to_edit_constuction`
--

LOCK TABLES `log_to_edit_constuction` WRITE;
/*!40000 ALTER TABLE `log_to_edit_constuction` DISABLE KEYS */;
INSERT INTO `log_to_edit_constuction` VALUES (3,'Add new','2020-04-23 01:22:39',NULL,702,NULL,508,NULL,31),(4,'Updating','2020-04-23 01:25:45',702,703,508,501,31,48),(5,'Updating','2020-04-23 01:26:06',703,704,501,502,48,49),(6,'Updating','2020-04-23 01:26:11',704,701,502,505,49,50),(7,'Updating','2020-04-23 01:26:13',701,702,505,503,50,51),(8,'Updating','2020-04-23 01:26:14',702,701,503,NULL,51,1),(9,'Updating','2020-04-23 01:39:30',701,701,NULL,NULL,1,1),(10,'Updating','2020-04-23 01:39:41',702,707,508,504,62,61),(11,'Updating','2020-04-23 01:40:00',707,706,504,503,61,63),(12,'Updating','2020-04-23 01:40:01',706,706,503,503,63,64),(13,'Updating','2020-04-23 01:40:02',706,707,503,NULL,64,66),(14,'Updating','2020-04-23 01:40:30',707,707,NULL,NULL,66,66),(15,'Updating','2020-04-23 01:41:52',701,707,508,504,62,61),(16,'Updating','2020-04-23 01:41:53',707,706,504,503,61,63),(17,'Updating','2020-04-23 01:41:58',706,706,503,503,63,64),(18,'Updating','2020-04-23 01:42:07',706,707,503,NULL,64,66),(19,'Updating','2020-04-23 01:52:52',706,703,508,501,31,48),(20,'Updating','2020-04-23 01:52:54',703,704,501,502,48,49),(21,'Updating','2020-04-23 01:52:55',704,701,502,505,49,50),(22,'Updating','2020-04-23 01:52:56',701,702,505,503,50,51),(23,'Updating','2020-04-23 01:52:57',702,701,503,NULL,51,1),(24,'Updating','2020-04-23 01:53:45',707,707,NULL,NULL,66,66),(25,'Updating','2020-04-23 01:53:45',701,701,NULL,NULL,1,1),(26,'Updating','2020-04-23 01:54:03',705,704,501,502,48,49),(27,'Updating','2020-04-23 01:54:05',704,701,502,505,49,50),(28,'Updating','2020-04-23 01:54:06',701,702,505,503,50,51),(29,'Updating','2020-04-23 01:54:10',702,701,503,NULL,51,1),(30,'Updating','2020-04-23 01:55:48',702,701,NULL,NULL,1,1),(35,'Add new','2020-04-23 02:00:38',NULL,702,NULL,508,NULL,31),(36,'Updating','2020-04-23 02:01:04',702,703,508,501,31,48),(37,'Updating','2020-04-23 02:01:07',703,704,501,502,48,49),(38,'Updating','2020-04-23 02:01:39',704,701,502,505,49,50),(39,'Updating','2020-04-23 02:03:02',701,702,505,503,50,51),(40,'Updating','2020-04-23 02:03:03',702,701,503,NULL,51,1),(42,'Add new','2020-04-23 02:03:42',NULL,705,NULL,508,NULL,56),(56,'Updating','2020-04-23 20:38:21',705,705,501,508,56,57),(83,'Add new','2020-04-24 04:31:56',NULL,707,NULL,507,NULL,31),(85,'Add new','2020-04-24 04:33:26',NULL,701,NULL,501,NULL,37),(86,'Updating','2020-04-24 04:33:26',707,707,507,507,31,31),(87,'Add new','2020-04-24 04:34:00',NULL,707,NULL,507,NULL,31),(88,'Updating','2020-04-24 04:35:16',707,707,507,507,31,31),(89,'Add new','2020-04-24 04:35:16',NULL,707,NULL,507,NULL,31),(90,'Add new','2020-04-24 04:35:16',NULL,706,NULL,506,NULL,58),(91,'Add new','2020-04-24 04:35:16',NULL,701,NULL,501,NULL,56),(92,'Updating','2020-04-24 04:49:01',707,702,507,502,31,48);
/*!40000 ALTER TABLE `log_to_edit_constuction` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_to_edit_constuction_BEFORE_INSERT` BEFORE INSERT ON `log_to_edit_constuction` FOR EACH ROW BEGIN
DECLARE nomWorkOld INT default 0;
DECLARE nomWorkNew INT default 0;



SELECT work.id_brigade INTO nomWorkOld FROM work
                          WHERE new.id_work_old = work.id_work ;
if( Not nomWorkOld = 0) 
then                      
set  new.id_brigade_old =nomWorkOld;

end if;

SELECT work.id_brigade INTO nomWorkNew FROM work
                          WHERE new.id_work_new = work.id_work ;
                          
if( Not nomWorkNew = 0) 
then 
set  new.id_brigade_new =nomWorkNew;

end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `manufactory`
--

DROP TABLE IF EXISTS `manufactory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `manufactory` (
  `id_manufactory` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `adress` varchar(45) DEFAULT NULL,
  `id_boss` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_manufactory`),
  KEY `id_boss` (`id_boss`),
  CONSTRAINT `id_boss` FOREIGN KEY (`id_boss`) REFERENCES `staff_value` (`id_staff_value`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufactory`
--

LOCK TABLES `manufactory` WRITE;
/*!40000 ALTER TABLE `manufactory` DISABLE KEYS */;
INSERT INTO `manufactory` VALUES (1,'Кободгородский','м.Київ Проспект перемоги 170',801),(2,'НовийЖитомир','м. Житомир ул. Петра 80',822);
/*!40000 ALTER TABLE `manufactory` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `manufactory_BEFORE_INSERT` BEFORE INSERT ON `manufactory` FOR EACH ROW BEGIN

DECLARE nom INT default 0;

SELECT staff_value.id_staff INTO nom FROM staff_value
                          WHERE new.id_boss = staff_value.id_staff_value ;

IF (not nom = 1201)       
        THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data boss ';
    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `manufactory_BEFORE_UPDATE` BEFORE UPDATE ON `manufactory` FOR EACH ROW BEGIN


DECLARE nom INT default 0;

SELECT staff_value.id_staff INTO nom FROM staff_value
                          WHERE new.id_boss = staff_value.id_staff_value ;

IF (not nom = 1201)       
        THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data boss ';
        END IF;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `staff` (
  `id_staff` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_staff`)
) ENGINE=InnoDB AUTO_INCREMENT=1204 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1201,'Інженерно-технічний персонал'),(1202,'Робітники');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_categories`
--

DROP TABLE IF EXISTS `staff_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `staff_categories` (
  `id_staff_categories` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `id_staff` int(11) NOT NULL,
  PRIMARY KEY (`id_staff_categories`),
  KEY `id_staff` (`id_staff`),
  KEY `id_staff_categories_staff` (`id_staff_categories`,`id_staff`),
  CONSTRAINT `id_staff` FOREIGN KEY (`id_staff`) REFERENCES `staff` (`id_staff`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1308 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_categories`
--

LOCK TABLES `staff_categories` WRITE;
/*!40000 ALTER TABLE `staff_categories` DISABLE KEYS */;
INSERT INTO `staff_categories` VALUES (1301,'Інженери',1201),(1302,'Технологи',1201),(1303,'Техніки',1201),(1304,'Збирачі',1202),(1305,'Токарі',1202),(1306,'Слюсарі',1202),(1307,'Зарювальники',1202);
/*!40000 ALTER TABLE `staff_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_characteristic`
--

DROP TABLE IF EXISTS `staff_characteristic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `staff_characteristic` (
  `id_staff_characteristic` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `id_parent` int(11) DEFAULT NULL,
  `id_staff` int(11) NOT NULL,
  PRIMARY KEY (`id_staff_characteristic`),
  KEY `name` (`name`,`id_parent`,`id_staff`),
  KEY `id_staff` (`id_staff`),
  CONSTRAINT `id_stafff` FOREIGN KEY (`id_staff`) REFERENCES `staff` (`id_staff`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2019 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_characteristic`
--

LOCK TABLES `staff_characteristic` WRITE;
/*!40000 ALTER TABLE `staff_characteristic` DISABLE KEYS */;
INSERT INTO `staff_characteristic` VALUES (2005,' Пол',2001,1201),(2012,' Пол',2011,1202),(2008,'ДОДАТКОВІ ХАРАКТЕРИСТИКИ',NULL,1201),(2017,'ДОДАТКОВІ ХАРАКТЕРИСТИКИ',NULL,1202),(2007,'Коли виходить на работу',2001,1201),(2015,'Коли виходить на работу',2011,1202),(2001,'ОСНОВНІ ХАРАКТЕРИСТИКИ',NULL,1201),(2011,'ОСНОВНІ ХАРАКТЕРИСТИКИ',NULL,1202),(2014,'Стан здоров\'я',2011,1202),(2006,'Телефон ',2001,1201),(2013,'Телефон ',2011,1202),(2010,'Треба іжа на роботі',2008,1201),(2018,'Треба медична страховка ',2017,1202),(2016,'Як багато може працювати в день',2011,1202),(2009,'Як багато проектів зробили',2008,1201);
/*!40000 ALTER TABLE `staff_characteristic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_characteristic_value`
--

DROP TABLE IF EXISTS `staff_characteristic_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `staff_characteristic_value` (
  `id_staff_characteristic_value` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(45) DEFAULT NULL,
  `id_staff_characteristic` int(11) DEFAULT NULL,
  `id_staff_value` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_staff_characteristic_value`),
  KEY `id_staff_value` (`id_staff_value`),
  KEY `id_staff_characteristic` (`id_staff_characteristic`),
  CONSTRAINT `id_staff_characteristics` FOREIGN KEY (`id_staff_characteristic`) REFERENCES `staff_characteristic` (`id_staff_characteristic`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_staff_value` FOREIGN KEY (`id_staff_value`) REFERENCES `staff_value` (`id_staff_value`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_characteristic_value`
--

LOCK TABLES `staff_characteristic_value` WRITE;
/*!40000 ALTER TABLE `staff_characteristic_value` DISABLE KEYS */;
INSERT INTO `staff_characteristic_value` VALUES (1,'Мужской',2005,801),(2,'8:00',2007,801),(3,'380995678123',2006,801),(4,'Так',2010,801);
/*!40000 ALTER TABLE `staff_characteristic_value` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `staff_characteristic_value_BEFORE_INSERT` BEFORE INSERT ON `staff_characteristic_value` FOR EACH ROW BEGIN
DECLARE nomType INT default 0;

SELECT staff_categories.id_staff INTO nomType FROM staff_categories,staff_value , staff_characteristic
                          WHERE new.id_staff_value = staff_value.id_staff_value AND staff_value.id_staff_categories = staff_categories.id_staff_categories and staff_characteristic.id_staff_characteristic = new.id_staff_characteristic and  staff_characteristic.id_staff =  staff_categories.id_staff  ;
if(nomType = 0)
then
 SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
END if;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `staff_characteristic_value_BEFORE_UPDATE` BEFORE UPDATE ON `staff_characteristic_value` FOR EACH ROW BEGIN
DECLARE nomType INT default 0;

SELECT staff_categories.id_staff INTO nomType FROM staff_categories,staff_value , staff_characteristic
                          WHERE new.id_staff_value = staff_value.id_staff_value AND staff_value.id_staff_categories = staff_categories.id_staff_categories and staff_characteristic.id_staff_characteristic = new.id_staff_characteristic and  staff_characteristic.id_staff =  staff_categories.id_staff  ;
if(nomType = 0)
then
 SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
END if;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `staff_value`
--

DROP TABLE IF EXISTS `staff_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `staff_value` (
  `id_staff_value` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `id_staff` int(11) DEFAULT NULL,
  `id_staff_categories` int(11) NOT NULL,
  `id_brigade` int(11) DEFAULT NULL,
  `master` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id_staff_value`),
  KEY `id_staffs_idx` (`id_staff`),
  KEY `id_staff_categories_idx` (`id_staff_categories`),
  KEY `id_brigade` (`id_brigade`),
  KEY `id_staff_categories_staff` (`id_staff_categories`,`id_staff`),
  CONSTRAINT `id_brigeade` FOREIGN KEY (`id_brigade`) REFERENCES `brigade` (`id_brigade`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `id_staff_categories` FOREIGN KEY (`id_staff_categories`) REFERENCES `staff_categories` (`id_staff_categories`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `id_staff_categories_staff` FOREIGN KEY (`id_staff_categories`, `id_staff`) REFERENCES `staff_categories` (`id_staff_categories`, `id_staff`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `id_staffs` FOREIGN KEY (`id_staff`) REFERENCES `staff` (`id_staff`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=861 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_value`
--

LOCK TABLES `staff_value` WRITE;
/*!40000 ALTER TABLE `staff_value` DISABLE KEYS */;
INSERT INTO `staff_value` VALUES (801,'Шубин Елисей Германнович',1201,1301,501,0),(802,'Шубин Андрей Германнович',1201,1301,502,0),(803,'Калашников Аввакум Глебович',1202,1306,501,0),(806,'Бирюков Августин Игоревич',1202,1306,502,0),(807,'Фролов Натан Святославович',1201,1302,503,0),(808,'Морозов Юлиан Парфеньевич',1201,1302,504,0),(809,'Большаков Трофим Наумович',1201,1302,505,0),(810,'Князев Марк Егорович',1202,1304,501,0),(811,'Кузьмин Оскар Евсеевич',1202,1305,502,0),(812,'Карпов Корнелий Вадимович',1202,1304,503,0),(813,'Беляев Остап Агафонович',1202,1305,504,0),(814,'Орлов Андрей Павлович',1202,1306,505,0),(815,'Соловьёв Вячеслав Авксентьевич',1202,1306,506,0),(816,'Зуев Илья Вениаминович',1202,1307,507,0),(817,'Калашников Юлий Русланович',1202,1307,508,0),(818,'Федотов Тимур Серапионович',1202,1307,505,0),(819,'Исаев Виссарион Проклович',1202,1307,506,0),(820,'Кабанов Моисей Онисимович',1202,1305,507,0),(821,'Ковалёв Афанасий Валерьянович',1202,1304,501,0),(822,'Максимов Мирон Оскарович',1201,1303,505,0),(823,'Баранов Марк Яковлевич',1201,1302,506,0),(824,'Калашников Павел Русланович',1201,1303,507,0),(825,'Локинов Дима Димонович',1201,1302,509,0),(826,'Попитанкин Жора Александрович',1201,1301,508,0),(848,'Борисов Терентий Макарович',1201,1302,501,1),(849,'Фомичёв Ираклий Валентинович',1201,1301,501,1),(850,'Журавлёв Лев Андреевич',1201,1301,502,1),(851,'Ермаков Тимофей Константинович',1201,1301,502,1),(852,'Давыдов Дональд Адольфович',1201,1301,503,1),(853,'Мясников Аввакум Аристархович',1201,1303,504,1),(854,'Марков Лаврентий Пётрович',1201,1303,506,1),(855,'Кириллов Любовь Геннадиевич',1201,1302,505,1),(856,'Молчанов Платон Валентинович',1201,1302,508,1),(857,'Фёдоров Никифор Давидович',1201,1301,506,1),(858,'Тимофеев Леонтий Семёнович',1201,1302,507,1),(859,'Волков Семен Арсеньевич',1201,1303,507,1),(860,'Филатов Богдан Авдеевич',1201,1302,506,1);
/*!40000 ALTER TABLE `staff_value` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `staff_value_BEFORE_INSERT` BEFORE INSERT ON `staff_value` FOR EACH ROW BEGIN
DECLARE nomDog INT default 0;
DECLARE nomBos INT default 0;

	SELECT staff_categories.id_staff INTO nomDog FROM staff_categories
                          WHERE new.id_staff_categories= staff_categories.id_staff_categories ;
set new.id_staff = nomDog;


if(new.master = 1 and new.id_staff = 1202)
then
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data мастер повинен бути інженерно-технічним персоналом' ;
end if;

SELECT district.id_boss INTO nomBos FROM district, brigade 
                          WHERE new.id_brigade = brigade.id_brigade AND brigade.id_district = district.id_district  ;


if(new.master = 1 and new.id_staff_value = nomBos)
then
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data мастер повинен  бути не начальником' ;
end if;



END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `staff_value_BEFORE_UPDATE` BEFORE UPDATE ON `staff_value` FOR EACH ROW BEGIN
DECLARE nomDog INT default 0;
DECLARE nomBos INT default 0;
	SELECT staff_categories.id_staff INTO nomDog FROM staff_categories
                          WHERE new.id_staff_categories= staff_categories.id_staff_categories ;
set new.id_staff = nomDog;

if(new.master = 1 and new.id_staff = 1202)
then
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data мастер повинен бути інженерно-технічним персоналом' ;
end if;
SELECT district.id_boss INTO nomBos FROM district, brigade 
                          WHERE new.id_brigade = brigade.id_brigade AND brigade.id_district = district.id_district  ;


if(new.master = 1 and new.id_staff_value = nomBos)
then
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data мастер повинен бути не начальником' ;
end if;




END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `testing_value`
--

DROP TABLE IF EXISTS `testing_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `testing_value` (
  `id_testing` int(11) NOT NULL AUTO_INCREMENT,
  `id_testing_value` int(11) DEFAULT NULL,
  `id_car_value` int(11) DEFAULT NULL,
  `id_laboratory` int(11) DEFAULT NULL,
  `start_testing` date DEFAULT NULL,
  `end_testing` date DEFAULT NULL,
  PRIMARY KEY (`id_testing`),
  KEY `id_car_value` (`id_car_value`),
  KEY `id_laboratory` (`id_laboratory`),
  KEY `id_testing_value` (`id_testing_value`),
  CONSTRAINT `id_car_value_n` FOREIGN KEY (`id_car_value`) REFERENCES `car_value` (`id_car_value`) ON UPDATE CASCADE,
  CONSTRAINT `id_laboratory` FOREIGN KEY (`id_laboratory`) REFERENCES `laboratory` (`id_laboratory`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testing_value`
--

LOCK TABLES `testing_value` WRITE;
/*!40000 ALTER TABLE `testing_value` DISABLE KEYS */;
INSERT INTO `testing_value` VALUES (1,1,3,3001,'2020-04-23','2020-04-23'),(2,5,8,3001,'2020-04-23','2020-04-23'),(3,7,9,3002,'2020-04-23',NULL),(6,7,9,3003,'2020-04-24',NULL),(20,20,10,3004,'2020-04-24',NULL),(21,20,10,3005,'2020-04-24',NULL);
/*!40000 ALTER TABLE `testing_value` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `testing_value_BEFORE_INSERT` BEFORE INSERT ON `testing_value` FOR EACH ROW BEGIN
DECLARE nomid INT default 0; 
IF new.id_testing IS NULL or new.id_testing = 0
then
       SELECT max(testing_value.id_testing) INTO nomid FROM testing_value;
        set NEW.id_testing = nomid + 1;
END IF;


if(isnull(new.id_testing_value) or new.id_testing_value = 0)
then
set new.id_testing_value = new.id_testing;
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `work`
--

DROP TABLE IF EXISTS `work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `work` (
  `id_work` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `id_car_type` int(11) DEFAULT NULL,
  `id_district` int(11) DEFAULT NULL,
  `id_brigade` int(11) DEFAULT NULL,
  `nomer` int(11) NOT NULL,
  PRIMARY KEY (`id_work`),
  KEY `id_car_type` (`id_car_type`),
  KEY `id_brigade` (`id_brigade`),
  KEY `id_district` (`id_district`),
  KEY `id_district_brigade` (`id_district`,`id_brigade`),
  CONSTRAINT `id_brigadee` FOREIGN KEY (`id_brigade`) REFERENCES `brigade` (`id_brigade`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `id_ccar_type` FOREIGN KEY (`id_car_type`) REFERENCES `car_type` (`id_car_type`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `id_disstrict` FOREIGN KEY (`id_district`) REFERENCES `district` (`id_district`),
  CONSTRAINT `id_district_brigades` FOREIGN KEY (`id_district`, `id_brigade`) REFERENCES `brigade` (`id_district`, `id_brigade`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work`
--

LOCK TABLES `work` WRITE;
/*!40000 ALTER TABLE `work` DISABLE KEYS */;
INSERT INTO `work` VALUES (1,'Роботи закінчені',101,0,NULL,0),(31,'Чертеж',101,707,507,1),(37,'Чертеж',102,701,501,1),(48,'Подготовка Деталей',101,702,502,2),(49,'Подготовка крила',101,703,503,3),(50,'Сборка',101,707,507,4),(51,'Покраска',101,704,504,5),(52,'Подготовка Деталей',102,702,502,2),(53,'Подготовка крила',102,704,504,3),(54,'Сборка',102,707,507,4),(55,'Покраска',102,706,506,5),(56,'Проектирование',103,701,501,1),(57,'Сборка',103,705,508,2),(58,'Покупка деталей ',104,706,506,1),(59,'Сборка',104,707,507,2),(60,'Шлифовка',104,702,502,3),(61,'Покупка разрешения',105,706,506,2),(62,'Схема',105,706,508,1),(63,'Покраска 1',105,702,502,3),(64,'Покраска 2',105,702,502,4),(65,'Роботи закінчені',104,0,NULL,0),(66,'Роботи закінчені',105,0,NULL,0),(67,'Роботи закінчені',103,0,NULL,0),(68,'Роботи закінчені',102,0,NULL,0),(71,'Роботи закінчені',106,0,NULL,0);
/*!40000 ALTER TABLE `work` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `work_BEFORE_INSERT` BEFORE INSERT ON `work` FOR EACH ROW BEGIN
DECLARE nomDog INT default 0;
SELECT brigade.id_district INTO nomDog FROM brigade
                          WHERE new.id_brigade= brigade.id_brigade ;
set new.id_district = nomDog;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `work_BEFORE_UPDATE` BEFORE UPDATE ON `work` FOR EACH ROW BEGIN
DECLARE nomDog INT default 0;
SELECT brigade.id_district INTO nomDog FROM brigade
                          WHERE new.id_brigade= brigade.id_brigade ;
set new.id_district = nomDog;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'aircraft_construction'
--

--
-- Dumping routines for database 'aircraft_construction'
--
/*!50003 DROP PROCEDURE IF EXISTS `1 вироби що збираються по типу` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `1 вироби що збираються по типу`(IN type varchar(45))
BEGIN
If (type= '')
  THEN BEGIN 
	Select  car_value.name as "Ім'я машини" , car_model.name as "Модель" ,car_type.name as "Тип",  district.name as "Дільниця" ,manufactory.name as "Цех" , car_value.date_start as "дата старта"  , work.name as "Робота"  from car_value, district,car_model,car_type, manufactory,work 
	where district.id_district = car_value.id_district AND car_model.id_car_model = car_value.id_car_model 
    AND car_model.id_car_type = car_type.id_car_type And manufactory.id_manufactory = car_value.id_manufactory  AND  car_value.id_work=work. id_work AND ISNULL(car_value.date_finish) ;
		END; 
 ELSE 
		Select  car_value.name as "Ім'я машини" , car_model.name as "Модель" ,car_type.name as "Тип",  district.name as "Дільниця" ,manufactory.name as "Цех" , car_value.date_start as "дата старта"  , work.name as "Робота"  from car_value, district,car_model,car_type, manufactory,work 
	where district.id_district = car_value.id_district AND car_model.id_car_model = car_value.id_car_model
    AND car_model.id_car_type = car_type.id_car_type And manufactory.id_manufactory = car_value.id_manufactory AND car_type.name=type AND  car_value.id_work=work. id_work AND ISNULL(car_value.date_finish) ;
END IF;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `1 вироби що збираються по цеху` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `1 вироби що збираються по цеху`(IN manufactury_name varchar(45))
BEGIN
If (manufactury_name= '')
  THEN BEGIN 
	Select  car_value.name as "Ім'я машини" , car_model.name as "Модель" ,car_type.name as "Тип",  district.name as "Дільниця" ,manufactory.name as "Цех" , car_value.date_start as "дата старта"  , work.name as "Робота"  from car_value, district,car_model,car_type, manufactory,work 
	where district.id_district = car_value.id_district AND car_model.id_car_model = car_value.id_car_model
    AND car_model.id_car_type = car_type.id_car_type And manufactory.id_manufactory = car_value.id_manufactory  AND  car_value.id_work=work. id_work AND ISNULL(car_value.date_finish) ;
		END; 
 ELSE 
		Select  car_value.name as "Ім'я машини" , car_model.name as "Модель" ,car_type.name as "Тип",  district.name as "Дільниця" ,manufactory.name as "Цех" , car_value.date_start as "дата старта"  , work.name as "Робота"  from car_value, district,car_model,car_type, manufactory,work 
	where district.id_district = car_value.id_district AND car_model.id_car_model = car_value.id_car_model 
    AND car_model.id_car_type = car_type.id_car_type And manufactory.id_manufactory = car_value.id_manufactory AND manufactory.name=manufactury_name AND  car_value.id_work=work. id_work AND ISNULL(car_value.date_finish) ;
END IF;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `1 вироби що збираються по цеху та типу` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `1 вироби що збираються по цеху та типу`(IN manufactury_name varchar(45), IN type varchar(45))
BEGIN
If (type= '' OR manufactury_name= '')
  THEN BEGIN 
	Select "Нет параметров"   ;
    END; 
 ELSE 
		Select  car_value.name as "Ім'я машини" , car_model.name as "Модель" ,car_type.name as "Тип", district.name as "Дільниця" ,manufactory.name as "Цех" , car_value.date_start as "дата старта"  , work.name as "Робота"  from car_value, district,car_model,car_type, manufactory,work 
	where district.id_district = car_value.id_district AND car_model.id_car_model = car_value.id_car_model
    AND car_model.id_car_type = car_type.id_car_type And manufactory.id_manufactory = car_value.id_manufactory AND manufactory.name=manufactury_name  AND car_type.name=type AND  car_value.id_work=work.id_work ;  #AND ISNULL(car_value.date_finish) ;
END IF;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `10 вивід лабораторії по виробу` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `10 вивід лабораторії по виробу`(IN name_car varchar(45))
BEGIN
If (name_car= '')
  THEN BEGIN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data name_car' ;
    END; 
 ELSE 
	Select laboratory.name as "Лабоаратория" from laboratory , testing_value , car_value 
	where  car_value.name = name_car and testing_value.id_car_value = car_value.id_car_value and laboratory.id_laboratory = testing_value.id_laboratory;
END IF;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `11 вивід виробів по лабоаторії та категорії` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `11 вивід виробів по лабоаторії та категорії`(IN laboratory_name varchar(45), IN typename varchar(45), IN data_period_start varchar(45) , IN data_period_finish varchar(45))
BEGIN
If (laboratory_name = ''  OR data_period_start= '' OR data_period_finish= '' )
  THEN BEGIN 
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data ' ;
    END; 
 ELSE 
	If ( typename=''  )
    then BEGIN
    select car_value.name as "Ім'я машини", car_model.name as "Модель", car_type.name as "Тип", laboratory_name as "Лабораторія" ,  testing_value.start_testing as "Начало теста" from laboratory, testing_value, car_type,car_model,car_value
where  car_value.id_car_type = car_type.id_car_type  AND car_model.id_car_model = car_value.id_car_model  And testing_value.id_laboratory = laboratory.id_laboratory AND laboratory.name=laboratory_name AND car_value.id_car_value = testing_value.id_car_value AND  testing_value.start_testing  >  data_period_start AND   testing_value.start_testing < data_period_finish ;
END ;   
 else
    select car_value.name as "Ім'я машини", car_model.name as "Модель", car_type.name as "Тип", laboratory_name as "Лабораторія" ,  testing_value.start_testing as "Начало теста" from laboratory, testing_value, car_type,car_model,car_value
where  car_value.id_car_type = car_type.id_car_type AND car_type.name =  typename  AND car_model.id_car_model = car_value.id_car_model  And testing_value.id_laboratory = laboratory.id_laboratory AND laboratory.name=laboratory_name AND car_value.id_car_value = testing_value.id_car_value AND  testing_value.start_testing  >  data_period_start AND   testing_value.start_testing < data_period_finish ;
END IF;  
END IF; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `12 вивід випробувачів по  категорії` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `12 вивід випробувачів по  категорії`(IN name_type  varchar(45))
BEGIN
If (name_type= '')
	THEN BEGIN 
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data name_car' ;
    END;
ELSE
Select laboratory_staff.name as "Випробувач"   from laboratory_staff , log_laboratory_staff,  testing_value , car_value , car_type 
	where   car_value.id_car_type = car_type.id_car_type and car_type.name = name_type and testing_value.id_car_value = car_value.id_car_value and log_laboratory_staff.id_testing = testing_value.id_testing_value AND laboratory_staff.id_laboratory_staff = log_laboratory_staff.id_laboratory_staff group by laboratory_staff.id_laboratory_staff;
END IF; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `12 вивід випробувачів по виробу` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `12 вивід випробувачів по виробу`(IN name_car varchar(45) )
BEGIN
If (name_car= '')
  THEN BEGIN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data name_car' ;
    END; 
 ELSE 
Select laboratory_staff.name as "Випробувач"   from laboratory_staff , log_laboratory_staff,  testing_value , car_value , car_type 
where  car_value.name = name_car and  car_value.id_car_type = car_type.id_car_type  and testing_value.id_car_value = car_value.id_car_value and log_laboratory_staff.id_testing = testing_value.id_testing_value AND laboratory_staff.id_laboratory_staff = log_laboratory_staff.id_laboratory_staff group by laboratory_staff.id_laboratory_staff  ;

END IF;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `12 вивід випробувачів по лабораторії` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `12 вивід випробувачів по лабораторії`(IN laboratory_name varchar(45),  IN data_period_start varchar(45) , IN data_period_finish varchar(45))
BEGIN
If (laboratory_name = ''  OR data_period_start= '' OR data_period_finish= '' )
  THEN BEGIN 
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data ' ;
    END; 
 ELSE 
 
Select laboratory_staff.name as "Випробувач"   from laboratory_staff , log_laboratory_staff,  testing_value , laboratory  
where laboratory.name = laboratory_name  and log_laboratory_staff.id_laboratory = laboratory.id_laboratory and log_laboratory_staff.id_testing = testing_value.id_testing_value AND laboratory_staff.id_laboratory_staff = log_laboratory_staff.id_laboratory_staff and testing_value.start_testing >  data_period_start And testing_value.start_testing <  data_period_finish  group by laboratory_staff.id_laboratory_staff  ;

 
 END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `13 вивід обладнання по виробу` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `13 вивід обладнання по виробу`(IN name_car varchar(45) )
BEGIN
If (name_car= '')
  THEN BEGIN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data name_car' ;
    END; 
 ELSE 
Select equipment.name as "Випробувач"   from equipment , log_equipment,  testing_value , car_value , car_type 
where  car_value.name = name_car and  car_value.id_car_type = car_type.id_car_type  and testing_value.id_car_value = car_value.id_car_value and log_equipment.id_testing = testing_value.id_testing_value AND equipment.id_equipment = log_equipment.id_equipment group by equipment.id_equipment  ;

END IF;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `13 вивід обладнання по категорії` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `13 вивід обладнання по категорії`(IN name_type  varchar(45))
BEGIN
If (name_type= '')
	THEN BEGIN 
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data name_car' ;
    END;
ELSE
Select equipment.name as "Випробувач"   from equipment , log_equipment,  testing_value , car_value , car_type 
	where   car_value.id_car_type = car_type.id_car_type and car_type.name = name_type and testing_value.id_car_value = car_value.id_car_value and log_equipment.id_testing = testing_value.id_testing_value AND equipment.id_equipment = log_equipment.id_equipment group by equipment.id_equipment;
END IF; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `13 вивід обладнання по лабораторії` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `13 вивід обладнання по лабораторії`(IN laboratory_name varchar(45),  IN data_period_start varchar(45) , IN data_period_finish varchar(45))
BEGIN
If (laboratory_name = ''  OR data_period_start= '' OR data_period_finish= '' )
  THEN BEGIN 
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data ' ;
    END; 
 ELSE 
 
Select equipment.name as "Випробувач"   from equipment , log_equipment,  testing_value , laboratory  
where laboratory.name = laboratory_name  and log_equipment.id_laboratory = laboratory.id_laboratory and log_equipment.id_testing = testing_value.id_testing_value AND equipment.id_equipment = log_equipment.id_equipment and testing_value.start_testing >  data_period_start And testing_value.start_testing <  data_period_finish  group by equipment.id_equipment ;

 
 END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `14 число виробів що збирається по ділянці` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `14 число виробів що збирається по ділянці`(IN distict_name varchar(45))
BEGIN
If (distict_name= '')
  THEN BEGIN 
	Select  count(*) AS 'Count Car', district.name as "Дільниця"  from car_value, district
	where district.id_district = car_value.id_district  AND ISNULL(car_value.date_finish)  group by car_value.id_district ;
    END; 
 ELSE 
		Select  count(car_value.name) AS 'Count Car', district.name as "Дільниця"   from car_value, district
	where district.id_district = car_value.id_district AND district.name=distict_name  AND ISNULL(car_value.date_finish) group by car_value.id_district ;
END IF;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `14 число виробів що збирається по ділянці та типу` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `14 число виробів що збирається по ділянці та типу`(IN distict_name varchar(45), IN typename varchar(45))
BEGIN
If (distict_name= '' OR typename = '')
  THEN BEGIN 
	Select  " проблеми з параметрами " ;
    END; 
 ELSE 
		Select  count(car_value.name) AS 'Count Car', district.name as "Дільниця", car_type.name as "Тип"    from car_value, district, car_type
	where district.id_district = car_value.id_district AND  car_type.id_car_type = car_value.id_car_type AND car_type.name= typename AND district.name=distict_name  AND ISNULL(car_value.date_finish) group by car_value.id_district ;
END IF;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `14 число виробів що збирається по типу` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `14 число виробів що збирається по типу`(IN type_name varchar(45))
BEGIN
If (type_name= '')
  THEN BEGIN 
	Select  count(*) AS 'Count Car', car_type.name as "Тип"  from car_value, car_type
	where district.id_district = car_value.id_district  AND ISNULL(car_value.date_finish)  group by car_value.id_district ;
    END; 
 ELSE 
		Select  count(car_value.name) AS 'Count Car', car_type.name as "Тип"   from car_value, car_type,district
	where car_type.id_car_type = car_value.id_car_type AND car_type.name=type_name  AND ISNULL(car_value.date_finish) AND district.id_district = car_value.id_district group by car_value.id_car_type ;
END IF;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `14 число виробів що збирається по цеху` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `14 число виробів що збирається по цеху`(IN manufactory_name varchar(45))
BEGIN
If (manufactory_name= '')
  THEN BEGIN 
	Select  count(*) AS 'Count Car', manufactory.name as "Цех"  from car_value, manufactory
	where manufactory.id_manufactory = car_value.id_manufactory  AND ISNULL(car_value.date_finish)  group by car_value.id_manufactory ;
    END; 
 ELSE 
		Select  count(car_value.name) AS 'Count Car', manufactory.name as "Цех"  from car_value, manufactory
	where manufactory.id_manufactory = car_value.id_manufactory AND manufactory.name=manufactory_name  AND ISNULL(car_value.date_finish) group by car_value.id_manufactory ;
END IF;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `14 число виробів що збирається по цеху та типу` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `14 число виробів що збирається по цеху та типу`(IN manufactory_name varchar(45), IN typename varchar(45))
BEGIN
If (manufactory_name= '' OR typename = '')
  THEN BEGIN 
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data ';
    END; 
 ELSE 
		Select  count(car_value.name) AS 'Count Car', manufactory.name as "Цех", car_type.name as "Тип" from car_value, manufactory, car_type
	where manufactory.id_manufactory = car_value.id_manufactory AND  car_type.id_car_type = car_value.id_car_type AND car_type.name= typename AND manufactory.name=manufactory_name  AND ISNULL(car_value.date_finish) group by car_value.id_manufactory ;
END IF;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `2 вивід готових виробів по ділянці та типу` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `2 вивід готових виробів по ділянці та типу`(IN district_name varchar(45), IN typename varchar(45), IN data_period_start varchar(45) , IN data_period_finish varchar(45))
BEGIN
DECLARE nomtesting INT default 0;
If (district_name= '' OR typename='' OR data_period_start= '' OR data_period_finish= '' )
  THEN BEGIN 
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data ' ;
    END; 
 ELSE 
 
Select  car_value.name as "Ім'я машини" , car_model.name as "Модель" ,car_type.name as "Тип",  district.name as "Дільниця" ,manufactory.name as "Цех" , car_value.date_start as "дата старта"  , car_value.date_finish as "дата финиша сбоки " , work.name as "Робота"  from car_value, district,car_model,car_type, manufactory,work, car_value_history 
where district.id_district = car_value_history.id_district AND car_model.id_car_model = car_value.id_car_model AND car_value_history.id_car_value = car_value.id_car_value
AND car_model.id_car_type = car_type.id_car_type And manufactory.id_manufactory = district.id_manufactory AND district.name=district_name AND  car_value.id_work=work. id_work AND typename=car_type.name AND car_value.finish = 1  AND  car_value_history.date_modification >  data_period_start AND  car_value_history.date_modification < data_period_finish group by  car_value.id_car_value ;
END IF;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `2 вивід готових виробів по цеху` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `2 вивід готових виробів по цеху`(IN manufactury_name varchar(45),  IN data_period_start varchar(45) , IN data_period_finish varchar(45))
BEGIN
If (manufactury_name= '' OR data_period_start= '' OR data_period_finish= '' )
  THEN BEGIN 
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data ' ;
    END; 
 ELSE 
Select  car_value.name as "Ім'я машини" , car_model.name as "Модель" ,car_type.name as "Тип",  district.name as "Дільниця" ,manufactory.name as "Цех" , car_value.date_start as "дата старта"  , car_value.date_finish as "дата финиша сбоки " , work.name as "Робота"  from car_value, district,car_model,car_type, manufactory,work, car_value_history 
where manufactory.id_manufactory = car_value_history.id_manufactory AND car_model.id_car_model = car_value.id_car_model AND car_value_history.id_car_value = car_value.id_car_value
AND car_model.id_car_type = car_type.id_car_type And manufactory.id_manufactory = district.id_manufactory AND manufactory.name=manufactury_name AND  car_value.id_work=work. id_work  AND car_value.finish = 1  AND  car_value_history.date_modification >  data_period_start AND  car_value_history.date_modification < data_period_finish group by  car_value.id_car_value ;
END IF;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `2 вивід готових виробів по цеху та типу` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `2 вивід готових виробів по цеху та типу`(IN manufactury_name varchar(45), IN typename varchar(45), IN data_period_start varchar(45) , IN data_period_finish varchar(45))
BEGIN
If (manufactury_name= '' OR typename='' OR data_period_start= '' OR data_period_finish= '' )
  THEN BEGIN 
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data ' ;
    END; 
 ELSE 
Select  car_value.name as "Ім'я машини" , car_model.name as "Модель" ,car_type.name as "Тип",  district.name as "Дільниця" ,manufactory.name as "Цех" , car_value.date_start as "дата старта"  , car_value.date_finish as "дата финиша сбоки " , work.name as "Робота"  from car_value, district,car_model,car_type, manufactory,work, car_value_history 
where manufactory.id_manufactory = car_value_history.id_manufactory AND car_model.id_car_model = car_value.id_car_model AND car_value_history.id_car_value = car_value.id_car_value
AND car_model.id_car_type = car_type.id_car_type And manufactory.id_manufactory = district.id_manufactory AND manufactory.name=manufactury_name AND  car_value.id_work=work. id_work AND typename=car_type.name AND car_value.finish = 1  AND  car_value_history.date_modification >  data_period_start AND  car_value_history.date_modification < data_period_finish group by  car_value.id_car_value ;
END IF;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `2 вивід готових виробів тільки по даті` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `2 вивід готових виробів тільки по даті`( IN data_period_start varchar(45) , IN data_period_finish varchar(45))
BEGIN
If (data_period_start= '' OR data_period_finish= '' )
  THEN BEGIN 
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data ' ;
    END; 
 ELSE 
Select  car_value.name as "Ім'я машини" , car_model.name as "Модель" ,car_type.name as "Тип",  district.name as "Дільниця" ,manufactory.name as "Цех" , car_value.date_start as "дата старта"  , car_value.date_finish as "дата финиша сбоки " , work.name as "Робота"  from car_value, district,car_model,car_type, manufactory,work, car_value_history 
where manufactory.id_manufactory = car_value_history.id_manufactory AND car_model.id_car_model = car_value.id_car_model AND car_value_history.id_car_value = car_value.id_car_value
AND car_model.id_car_type = car_type.id_car_type And manufactory.id_manufactory = district.id_manufactory AND  car_value.id_work=work. id_work  AND car_value.finish = 1  AND  car_value_history.date_modification >  data_period_start AND  car_value_history.date_modification < data_period_finish group by  car_value.id_car_value ;
END IF;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3 вивід персоналу по цеху та категорії` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3 вивід персоналу по цеху та категорії`(IN namemanufactory varchar(45), IN categorie varchar(45))
BEGIN

If (namemanufactory= '' AND  categorie='')
  THEN BEGIN 
	Select staff_value.name AS 'Ім`я' ,  manufactory.name as "Цех" , staff.name  as "Персонал",  staff_categories.name as "Категорія персоналу" from district, manufactory, staff_value, brigade, staff , staff_categories
	where  manufactory.id_manufactory = district.id_manufactory AND district.id_district = brigade.id_district AND brigade.id_brigade =  staff_value.id_brigade AND staff.id_staff = staff_value.id_staff  AND staff_categories.id_staff_categories =staff_value.id_staff_categories ;
END; 
 ELSE 
 If( namemanufactory= '' )
 THEN BEGIN
 Select staff_value.name AS 'Ім`я' ,  manufactory.name as "Цех" , staff.name  as "Персонал",  staff_categories.name as "Категорія персоналу" from district, manufactory, staff_value, brigade, staff , staff_categories
where  manufactory.id_manufactory = district.id_manufactory   AND manufactory.id_manufactory = district.id_manufactory  AND district.id_district = brigade.id_district AND brigade.id_brigade =  staff_value.id_brigade AND staff.id_staff = staff_value.id_staff  AND staff_categories.name =  categorie   AND staff_categories.id_staff_categories =staff_value.id_staff_categories ;
END ;
else
 If( categorie= '' )
 THEN BEGIN
 Select staff_value.name AS 'Ім`я' ,  manufactory.name as "Цех" , staff.name  as "Персонал",  staff_categories.name as "Категорія персоналу" from district, manufactory, staff_value, brigade, staff , staff_categories
where  manufactory.id_manufactory = district.id_manufactory   AND manufactory.id_manufactory = district.id_manufactory  AND district.id_district = brigade.id_district AND brigade.id_brigade =  staff_value.id_brigade AND staff.id_staff = staff_value.id_staff  AND manufactory.name =  namemanufactory   AND staff_categories.id_staff_categories =staff_value.id_staff_categories ;
END ;
ELSE

Select staff_value.name AS 'Ім`я' ,  manufactory.name as "Цех" , staff.name  as "Персонал",  staff_categories.name as "Категорія персоналу" from district, manufactory, staff_value, brigade, staff , staff_categories
where  manufactory.id_manufactory = district.id_manufactory   AND manufactory.id_manufactory = district.id_manufactory  AND district.id_district = brigade.id_district AND brigade.id_brigade =  staff_value.id_brigade AND staff.id_staff = staff_value.id_staff  AND manufactory.name =  namemanufactory AND staff_categories.name =  categorie   AND staff_categories.id_staff_categories =staff_value.id_staff_categories ;

END IF;
END IF;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4 вивід інформації про ділянки з начальниками по Цеху` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4 вивід інформації про ділянки з начальниками по Цеху`(IN namemanufactory varchar(45))
BEGIN
If (namemanufactory= '')
  THEN BEGIN 
	Select district.name AS  ' Ділянка' ,  manufactory.name as "Цех" , staff_value.name as "Начльник ділянки" from district, manufactory, staff_value
	where  manufactory.id_manufactory = district.id_manufactory AND district.id_boss = staff_value.id_staff_value  ;
    END; 
 ELSE 
		Select district.name AS  ' Ділянка' ,  manufactory.name as "Цех" , staff_value.name as "Начльник ділянки" from district, manufactory, staff_value
where  manufactory.id_manufactory = district.id_manufactory AND manufactory.name =  namemanufactory AND district.id_boss = staff_value.id_staff_value ;
END IF;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4 вивід числа ділянок по Цеху` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4 вивід числа ділянок по Цеху`(IN namemanufactory varchar(45))
BEGIN
If (namemanufactory= '')
  THEN BEGIN 
	Select count(district.name) AS  'Кількість ділянок' ,  manufactory.name as "Цех"  from district, manufactory
	where  manufactory.id_manufactory = district.id_manufactory group by district.id_manufactory;
    END; 
 ELSE 
		Select count(district.name) AS 'Кількість ділянок' ,  manufactory.name as "Цеx" from district, manufactory
where  manufactory.id_manufactory = district.id_manufactory AND manufactory.name =  namemanufactory group by district.id_manufactory;
END IF;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `5 вивід роботи по виробу` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `5 вивід роботи по виробу`(IN namecar varchar(45))
BEGIN
If (namecar='')
  THEN BEGIN 
	Select  " Проблема з параметром " ;
 END; 
 ELSE 
		Select car_value.name AS 'Name car' ,  work.name as "Work"  from car_value, work 
where  car_value.name = namecar AND work.id_car_type = car_value.id_car_type  ;
END IF;  

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `6 склад бригад по ділянці` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `6 склад бригад по ділянці`(IN namedistrict varchar(45))
BEGIN

If (namedistrict= '' )
  THEN BEGIN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data namedistrict' ;
        END; 
 ELSE 
 
Select staff_value.name AS 'Ім`я' ,  district.name as "Ділянка" , brigade.name as "Бригада" , staff.name  as "Персонал",  staff_categories.name as "Категорія персоналу" from district, staff_value, brigade, staff , staff_categories
where  district.id_district = brigade.id_district AND brigade.id_brigade =  staff_value.id_brigade AND staff.id_staff = staff_value.id_staff  AND district.name =  namedistrict AND staff_categories.id_staff_categories =staff_value.id_staff_categories ;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `6 склад бригад по цеху` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `6 склад бригад по цеху`(IN namemanufactory varchar(45))
BEGIN

If (namemanufactory= '' )
  THEN BEGIN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data namemanufactory' ;
        END; 
 ELSE 
 
Select staff_value.name AS 'Ім`я' ,  manufactory.name as "Цех" , brigade.name as "Бригада" , staff.name  as "Персонал",  staff_categories.name as "Категорія персоналу" from district, manufactory, staff_value, brigade, staff , staff_categories
where  manufactory.id_manufactory = district.id_manufactory   AND manufactory.id_manufactory = district.id_manufactory  AND district.id_district = brigade.id_district AND brigade.id_brigade =  staff_value.id_brigade AND staff.id_staff = staff_value.id_staff  AND manufactory.name =  namemanufactory AND staff_categories.id_staff_categories =staff_value.id_staff_categories ;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `7 майстри по ділянці` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `7 майстри по ділянці`(IN namedistrict varchar(45))
BEGIN

If (namedistrict= '' )
  THEN BEGIN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data namemanufactory' ;
        END; 
 ELSE 
 
Select staff_value.name AS 'Ім`я' ,  manufactory.name as "Цех" , district.name as "Ділянка"   from district, manufactory, staff_value, brigade
where  manufactory.id_manufactory = district.id_manufactory   AND manufactory.id_manufactory = district.id_manufactory  AND district.id_district = brigade.id_district AND brigade.id_brigade =  staff_value.id_brigade  AND district.name =  namedistrict and staff_value.master = 1  ;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `7 майстри по цеху` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `7 майстри по цеху`(IN namemanufactory varchar(45))
BEGIN

If (namemanufactory= '' )
  THEN BEGIN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data namemanufactory' ;
        END; 
 ELSE 
 
Select staff_value.name AS 'Ім`я' ,  manufactory.name as "Цех" , district.name as "Ділянка"   from district, manufactory, staff_value, brigade
where  manufactory.id_manufactory = district.id_manufactory   AND manufactory.id_manufactory = district.id_manufactory  AND district.id_district = brigade.id_district AND brigade.id_brigade =  staff_value.id_brigade  AND manufactory.name =  namemanufactory and staff_value.master = 1  ;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `8 вироби що збираються по ділянці` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `8 вироби що збираються по ділянці`(IN distict_name varchar(45))
BEGIN
If (distict_name= '')
  THEN BEGIN 
	Select "Проблемы с параметром " ; 
    END; 
 ELSE 
		Select  car_value.name as "Ім'я машини" , car_model.name as "Модель" ,car_type.name as "Тип",  district.name as "Дільниця" ,manufactory.name as "Цех" , car_value.date_start as "дата старта"  , work.name as "Робота"  from car_value, district,car_model,car_type, manufactory,work 
	where district.id_district = car_value.id_district AND car_model.id_car_model = car_value.id_car_model 
    AND car_model.id_car_type = car_type.id_car_type And manufactory.id_manufactory = car_value.id_manufactory AND district.name=distict_name AND  car_value.id_work=work. id_work AND ISNULL(car_value.date_finish) ;
END IF;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `8 вироби що збираються по ділянці та типу` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `8 вироби що збираються по ділянці та типу`(IN district_name varchar(45), IN type varchar(45))
BEGIN
If (type= '' OR district_name= '')
  THEN BEGIN 
	Select "Нет параметров"   ;
    END; 
 ELSE 
		Select  car_value.name as "Ім'я машини" , car_model.name as "Модель" ,car_type.name as "Тип",  district.name as "Дільниця" ,manufactory.name as "Цех" , car_value.date_start as "дата старта"  , work.name as "Робота"  from car_value, district,car_model,car_type, manufactory,work 
	where district.id_district = car_value.id_district AND car_model.id_car_model = car_value.id_car_model 
    AND car_model.id_car_type = car_type.id_car_type And manufactory.id_manufactory = car_value.id_manufactory AND district.name=district_name  AND car_type.name=type AND  car_value.id_work=work. id_work  AND ISNULL(car_value.date_finish) ;
END IF;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `9 склад бригад по виробу` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `9 склад бригад по виробу`(IN namecar  varchar(45) )
BEGIN

If (namecar= '' )
  THEN BEGIN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data namecar' ;
        END; 
 ELSE 
 
Select staff_value.name AS 'Ім`я' ,  district.name as "Ділянка" , brigade.name as "Бригада" , staff.name  as "Персонал",  staff_categories.name as "Категорія персоналу" from district, staff_value, brigade, staff , staff_categories , car_value, work
where  district.id_district = brigade.id_district AND brigade.id_brigade =  staff_value.id_brigade AND staff.id_staff = staff_value.id_staff  AND staff_categories.id_staff_categories =staff_value.id_staff_categories AND car_value.name = namecar AND car_value.id_car_type = work.id_car_type AND staff_value.id_brigade = work.id_brigade GROUP BY staff_value.id_staff_value order by brigade.name;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Finish` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Finish`(IN car_name varchar(45))
BEGIN

DECLARE nomNomer INT default 3000;
DECLARE nomTesting INT default 3000;


Select work.nomer INTO nomNomer FROM work, car_value
                          WHERE car_value.id_work = work.id_work and car_name=car_value.name ;
                          
                          
IF(nomNomer = 0 ) 
then begin
UPDATE car_value  SET car_value.finish = 1  WHERE  car_value.name =  car_name;

Select testing_value.id_testing_value INTO nomTesting FROM testing_value, car_value
                          WHERE car_value.id_testing = testing_value.id_testing_value  and car_name=car_value.name ;
                          
                          
UPDATE testing_value  SET testing_value.end_testing = now() WHERE id_testing_value=nomTesting;
UPDATE equipment  SET equipment.id_testing = NULL , equipment.id_laboratory = NULL  WHERE id_testing = nomTesting;
UPDATE laboratory_staff  SET laboratory_staff.id_testing = NULL  , laboratory.id_laboratory = NULL WHERE id_testing = nomTesting;



end ; 
else 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data - не построен продук';

 end if;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Вивід характеристик виробу` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Вивід характеристик виробу`(IN car_name varchar(45))
BEGIN

If (car_name= '' )
  THEN BEGIN 
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data car_name' ;
    END; 
 ELSE
 
 select car_characteristic.name as "Характеристика" , car_characteristic_value.value as "Значення" , car_characteristic_value.unit as " Розмірність" from car_characteristic, car_characteristic_value, car_value
 where car_value.name = car_name and car_value.id_car_value = car_characteristic_value.id_car_value and car_characteristic.id_car_characteristic = car_characteristic_value.id_car_characteristic ;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Вивід характеристик персоналу` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Вивід характеристик персоналу`(IN staff_name varchar(45))
BEGIN

If (staff_name= '' )
  THEN BEGIN 
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data car_name' ;
    END; 
 ELSE
 
 select staff_characteristic.name as "Характеристика" , staff_characteristic_value.value as "Значення"  from staff_characteristic, staff_characteristic_value, staff_value
 where staff_value.name = staff_name and staff_value.id_staff_value = staff_characteristic_value.id_staff_value and staff_characteristic.id_staff_characteristic = staff_characteristic_value.id_staff_characteristic ;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Переход на следующий этап` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Переход на следующий этап`(IN car_name varchar(45))
BEGIN
DECLARE nomType INT default 0;
DECLARE nomOldWork INT default 0;
DECLARE nomWork INT default 300;
DECLARE nomNumber INT default 0;
DECLARE nomNewNumber INT default 0;


If (car_name= '' )
  THEN BEGIN 
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data car_name' ;
    END; 
 ELSE
SELECT car_value.id_car_type INTO nomType FROM car_value
                          WHERE car_value.name =  car_name;
                  
SELECT car_value.id_work INTO nomOldWork FROM car_value
                          WHERE car_value.name =  car_name;

SELECT work.nomer INTO nomNumber FROM work
                          WHERE work.id_work =  nomOldWork;                          
                          
If (nomType=0 OR nomNumber=0)
  THEN BEGIN 
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data ' ;
    END; 
 ELSE
SELECT work.id_work INTO nomWork FROM work
                          WHERE work.nomer =  (nomNumber+1) and  work.id_car_type =  nomType;


If (nomWork=300 )
  THEN BEGIN 
	SELECT work.id_work INTO nomWork FROM work
                          WHERE work.nomer = 0 and  work.id_car_type =  nomType;
	If (nomWork=300)
  THEN BEGIN 
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data car_name' ;
    END; 
 ELSE
	UPDATE car_value   SET id_work = nomWork where name =  car_name  ;
    END IF; 
    END;
 ELSE
 
UPDATE car_value  SET id_work = nomWork WHERE  name =  car_name;

END IF; 
END IF;   
END IF;  




END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Старт тестування продукту` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Старт тестування продукту`(IN car_name varchar(45), IN lab_name varchar(45) , list_of_staff VARCHAR(32), list_of_equipments VARCHAR(32))
BEGIN
DECLARE nomNomer INT default 3000;
DECLARE nomlab INT default 0;
DECLARE nomcar INT default 0;
DECLARE nomtesting INT default 0;



Select laboratory.id_laboratory INTO nomlab FROM laboratory
                          WHERE  lab_name=laboratory.name ;
                          
                          
Select work.nomer INTO nomNomer FROM work, car_value
                          WHERE car_value.id_work = work.id_work and car_name=car_value.name ;
                          
Select car_value.id_car_value INTO nomcar FROM  car_value
                          WHERE  car_name=car_value.name and car_value.finish = 0 ;
                          
if(  nomlab = 0 or   nomcar = 0 or not nomNomer = 0 )
then begin                
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data ' ;
end;
else 

Select testing_value.id_testing_value INTO nomtesting FROM testing_value
                          WHERE  testing_value.id_car_value=  nomcar group by testing_value.id_testing_value;

if(nomtesting = 0)
then begin

INSERT INTO testing_value( id_car_value, id_laboratory, start_testing) VALUES (nomcar , nomlab , now());

end;
else
INSERT INTO testing_value( id_testing_value, id_car_value, id_laboratory, start_testing) VALUES (nomtesting, nomcar , nomlab , now());
end if;

                          
Select testing_value.id_testing_value INTO nomtesting FROM testing_value
                          WHERE  testing_value.id_car_value=  nomcar group by testing_value.id_testing_value;
                          



set @sql = concat("UPDATE `laboratory_staff` SET `id_testing` = " , nomtesting, " , `id_laboratory` = " , nomlab , "
                      WHERE `laboratory_staff`.id_laboratory_staff in (" , list_of_staff , ") ");

PREPARE stmt FROM @sql;
EXECUTE stmt;



set @sql = concat("UPDATE `equipment` SET `id_testing` = " , nomtesting, " , `id_laboratory` = " , nomlab , "
                      WHERE `equipment`.id_equipment in (" , list_of_equipments , ") ");
                      
PREPARE stmt FROM @sql;
EXECUTE stmt;

UPDATE car_value  SET car_value.testing = 1 , car_value.id_testing= nomtesting  WHERE  car_value.name =  car_name;


end if;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-24 15:10:43
