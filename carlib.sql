-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: oc_carlib
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorie` (
  `categorieid` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`categorieid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie`
--

LOCK TABLES `categorie` WRITE;
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` VALUES (1,'Standard'),(2,'Special'),(3,'JeunesConducteurs');
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorie_produit`
--

DROP TABLE IF EXISTS `categorie_produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorie_produit` (
  `categorieid` int NOT NULL,
  `produitid` int NOT NULL,
  PRIMARY KEY (`categorieid`,`produitid`),
  KEY `produitid_idx` (`produitid`),
  CONSTRAINT `categorieid` FOREIGN KEY (`categorieid`) REFERENCES `categorie` (`categorieid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `produit_id` FOREIGN KEY (`produitid`) REFERENCES `produit` (`produitid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie_produit`
--

LOCK TABLES `categorie_produit` WRITE;
/*!40000 ALTER TABLE `categorie_produit` DISABLE KEYS */;
INSERT INTO `categorie_produit` VALUES (1,1),(1,2),(1,3),(3,4);
/*!40000 ALTER TABLE `categorie_produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commentaire` (
  `commentaireid` int NOT NULL AUTO_INCREMENT,
  `contenu` varchar(255) DEFAULT NULL,
  `produitid` int NOT NULL,
  PRIMARY KEY (`commentaireid`),
  KEY `produitid_idx` (`produitid`),
  CONSTRAINT `produitid` FOREIGN KEY (`produitid`) REFERENCES `produit` (`produitid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentaire`
--

LOCK TABLES `commentaire` WRITE;
/*!40000 ALTER TABLE `commentaire` DISABLE KEYS */;
INSERT INTO `commentaire` VALUES (1,'Assurance avec un bon rapport qualité prix',2),(2,'Minimum du minimum, un peu deçu',1),(3,'Ce qu\'on peut attendre d\'une assurance au tiers, ni plus, ni moins',1),(4,'Excellente assurance tous risques ! Prix compétitif vis à vis des autres assureurs',3),(5,'L\'assurance est bien, mais les délais de traitement ne me conviennent pas, trop d\'attente!',3);
/*!40000 ALTER TABLE `commentaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produit`
--

DROP TABLE IF EXISTS `produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produit` (
  `produitid` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `cout` int DEFAULT NULL,
  PRIMARY KEY (`produitid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produit`
--

LOCK TABLES `produit` WRITE;
/*!40000 ALTER TABLE `produit` DISABLE KEYS */;
INSERT INTO `produit` VALUES (1,'AssuranceAuTiersSimple','Assurance couvrant uniquement les dégats matériels et corporels que vous êtes susceptible de causer à autrui avec votre véhicule.',500),(2,'AssuranceAuTiersEtendue','Assurance couvrant le minimum de la garantie responsabilité civile et le bris de glace, le vol, l\'attentat, les catastrophes naturelles et technologiques',800),(3,'AssuranceTousRisques','Assurance qui reprend les garanties de l\'assurance au tiers étendue et auxquelles on ajoute la garantie dommage tous accidents (responsable ou non).',1500),(4,'AssuranceTousRisquesJeunes','L\'assurance tous risques pour les jeunes conducteurs (- 2 ans de permis de conduire)',2200);
/*!40000 ALTER TABLE `produit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-05 11:45:10
