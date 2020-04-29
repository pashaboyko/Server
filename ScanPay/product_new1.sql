-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: product_new1
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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `bordercode` bigint(18) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_admin`),
  UNIQUE KEY `bordercode_UNIQUE` (`bordercode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Pasha',855555555555,'secret'),(2,'Sveta',877777777777,'secret');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_category` (
  `id_category` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,'одежда'),(2,'техника'),(3,'продукты'),(4,'бытовая_химия');
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_features`
--

DROP TABLE IF EXISTS `product_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_features` (
  `id_feature` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_feature`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_features`
--

LOCK TABLES `product_features` WRITE;
/*!40000 ALTER TABLE `product_features` DISABLE KEYS */;
INSERT INTO `product_features` VALUES (1,'быстропортящийся',3),(2,'размер',1),(3,'цвет',1),(4,'пол',1),(5,'гарантия',2),(6,'экологичность',4);
/*!40000 ALTER TABLE `product_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_features_value`
--

DROP TABLE IF EXISTS `product_features_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_features_value` (
  `id_feature_value` int(11) NOT NULL,
  `value` varchar(45) DEFAULT NULL,
  `id_feature` int(11) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL,
  `id_subcategory` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_feature_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_features_value`
--

LOCK TABLES `product_features_value` WRITE;
/*!40000 ALTER TABLE `product_features_value` DISABLE KEYS */;
INSERT INTO `product_features_value` VALUES (1,'0',1,1,3,10),(2,'1',1,2,3,9),(3,'1',5,3,2,7),(4,'0',5,4,2,5),(5,'40',2,5,1,2),(6,'42',2,6,1,1),(7,'1',6,7,4,15),(8,'0',6,8,4,14),(9,'красный',3,5,1,2),(10,'синий',3,6,1,1),(11,'ж',4,5,1,2),(12,'м',4,6,1,3);
/*!40000 ALTER TABLE `product_features_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_manufacturer`
--

DROP TABLE IF EXISTS `product_manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_manufacturer` (
  `id_manufacturer` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_manufacturer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_manufacturer`
--

LOCK TABLES `product_manufacturer` WRITE;
/*!40000 ALTER TABLE `product_manufacturer` DISABLE KEYS */;
INSERT INTO `product_manufacturer` VALUES (1,'H&M',1),(2,'Inextenso',1),(3,'Odjii',1),(4,'Zara',1),(5,'Mango',1),(6,'Supreme',1),(7,'Samsung',2),(8,'Sony',2),(9,'Apple',2),(10,'Nikon',2),(11,'Xiaomi',2),(12,'LG',2),(13,'Alpro',3),(14,'Мясокомбинат',3),(15,'Nescafe',3),(16,'Хлебзавод',3),(17,'7Days',3),(18,'Lovare',3),(19,'Фрекен_Бок',4),(20,'Nivea',4),(21,'MrMuscle',4),(22,'Ariel',4),(23,'Vanish',4),(24,'Garnier',4);
/*!40000 ALTER TABLE `product_manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_subcategory`
--

DROP TABLE IF EXISTS `product_subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_subcategory` (
  `id_subcategory` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_subcategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_subcategory`
--

LOCK TABLES `product_subcategory` WRITE;
/*!40000 ALTER TABLE `product_subcategory` DISABLE KEYS */;
INSERT INTO `product_subcategory` VALUES (1,'брюки',1),(2,'рубашка',1),(3,'футболка',1),(4,'куртка',1),(5,'телефон',2),(6,'плеер',2),(7,'фото_видео_техника',2),(8,'телевизор',2),(9,'молочные_продукты',3),(10,'бакалея',3),(11,'мясные_продукты',3),(12,'хлебобулочные_изделия',3),(13,'порошок_стиральный',4),(14,'моющее_средство',4),(15,'средства_личной_гигиены',4),(16,'отбеливающие_средства',4);
/*!40000 ALTER TABLE `product_subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_value`
--

DROP TABLE IF EXISTS `product_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_value` (
  `id_product_value` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `bordercode` bigint(18) NOT NULL,
  `price` double DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL,
  `id_subcategory` int(11) DEFAULT NULL,
  `id_manufacturer` int(11) DEFAULT NULL,
  `photo` varchar(45) DEFAULT '0.jpg',
  `points` int(11) DEFAULT '0',
  `delivery_date` varchar(45) DEFAULT '23.03.2020',
  `quantity` int(11) DEFAULT '0',
  PRIMARY KEY (`id_product_value`),
  UNIQUE KEY `bordercode_UNIQUE` (`bordercode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_value`
--

LOCK TABLES `product_value` WRITE;
/*!40000 ALTER TABLE `product_value` DISABLE KEYS */;
INSERT INTO `product_value` VALUES (1,'кофе',644832819197,150,3,10,15,'0.jpg',0,'23.03.2020',0),(2,'йогурт',438233939273,30,3,9,13,'0.jpg',0,'23.03.2020',0),(3,'фотоаппарат',437628788237,5400,2,7,10,'0.jpg',0,'23.03.2020',0),(4,'смартфон',477343947478,8700,2,5,9,'0.jpg',0,'23.03.2020',0),(5,'рубашка',733749933993,400,1,2,1,'0.jpg',0,'23.03.2020',0),(6,'джинсы',393820102933,600,1,1,4,'0.jpg',0,'23.03.2020',0),(7,'шампунь',636762719117,80,4,15,20,'0.jpg',0,'23.03.2020',0),(8,'спрей_для_окон',987654900020,60,4,14,21,'0.jpg',0,'23.03.2020',0);
/*!40000 ALTER TABLE `product_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `bordercode` bigint(18) NOT NULL DEFAULT '0',
  `name` varchar(45) NOT NULL DEFAULT 'Анна',
  `surname` varchar(45) NOT NULL DEFAULT 'Сиренко',
  `phone` varchar(45) NOT NULL DEFAULT '0676676767',
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT 'secret',
  `points` int(11) DEFAULT '0',
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `bordercode_UNIQUE` (`bordercode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,576879889088,'Анна','Сиренко','0676676767',NULL,'secret',0),(2,933938937372,'Ольга','Кузьменко','0933333333',NULL,'secret',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-25 14:37:18
