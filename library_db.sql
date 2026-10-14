-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: library_db
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `author_id` int NOT NULL AUTO_INCREMENT,
  `author_name` varchar(100) NOT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'Abraham Silberschatz','American','author1@example.com'),(2,'Robert Martin','American','author2@example.com'),(3,'Andrew Tanenbaum','American','author3@example.com'),(4,'John Smith','American','author4@example.com'),(6,'Stuart Russell','British','author6@example.com'),(7,'Tom Mitchell','American','author7@example.com'),(8,'Herbert Schildt','American','author8@example.com'),(9,'Ian Sommerville','British','author9@example.com'),(10,'Rajkumar Buyya','Australian','author10@example.com'),(11,'Galvin','American','author11@example.com'),(12,'Seymour Lipschutz','American','author12@example.com'),(13,'William Stallings','British','author13@example.com'),(14,'Uttam Roy','Indian','author14@example.com'),(15,'Kenneth Rosen','American','author15@example.com'),(16,'Jiawei Han','Chinese','author16@example.com'),(17,'Ian Goodfellow','British','author17@example.com'),(18,'Ramakrishnan','Indian','author18@example.com'),(19,'Alfred Aho','American','author19@example.com'),(20,'Donald Hearn','American','author20@example.com');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `author` varchar(100) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `total_copies` int NOT NULL,
  `available_copies` int NOT NULL,
  `author_id` int DEFAULT NULL,
  `publisher_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  KEY `fk_book_author` (`author_id`),
  KEY `fk_book_publisher` (`publisher_id`),
  KEY `fk_book_category` (`category_id`),
  CONSTRAINT `fk_book_author` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`),
  CONSTRAINT `fk_book_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  CONSTRAINT `fk_book_publisher` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`publisher_id`),
  CONSTRAINT `books_chk_1` CHECK ((`total_copies` >= 0)),
  CONSTRAINT `books_chk_2` CHECK ((`available_copies` >= 0)),
  CONSTRAINT `books_chk_3` CHECK ((`available_copies` <= `total_copies`))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Database System Concepts','Silberschatz','DBMS',5,4,1,1,1),(2,'Clean Code','Robert Martin','Programming',3,3,2,2,2),(3,'Computer Networks','Tanenbaum','Networking',4,4,3,3,3),(4,'Python Programming','John Smith','Programming',6,6,4,4,2),(5,'Operating Systems','Galvin','OS',3,3,11,5,11),(6,'Artificial Intelligence','Stuart Russell','AI',5,5,6,1,4),(7,'Machine Learning','Tom Mitchell','AI-ML',4,4,7,2,5),(8,'Data Structures','Seymour Lipschutz','Programming',6,6,12,3,2),(9,'Computer Organization','William Stallings','Computer Science',3,3,13,4,9),(10,'Software Engineering','Ian Sommerville','Software',5,5,9,5,12),(11,'Cloud Computing','Rajkumar Buyya','Cloud',4,4,10,1,6),(12,'Java Programming','Herbert Schildt','Programming',7,7,8,2,2),(13,'Web Technologies','Uttam Roy','Web Development',5,5,14,3,13),(14,'Cyber Security','William Stallings','Security',4,4,13,4,7),(15,'Discrete Mathematics','Kenneth Rosen','Mathematics',6,6,15,5,8),(16,'Data Mining','Jiawei Han','Data Science',3,3,16,1,10),(17,'Deep Learning','Ian Goodfellow','AI-ML',4,4,17,2,5),(18,'Database Management Systems','Ramakrishnan','DBMS',5,5,18,3,1),(19,'Compiler Design','Alfred Aho','Computer Science',3,3,19,4,9),(20,'Computer Graphics','Donald Hearn','Graphics',4,4,20,5,14);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(70) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'DBMS','Database management and SQL'),(2,'Programming','Programming languages and coding'),(3,'Networking','Computer networks and communication'),(4,'AI','Artificial intelligence'),(5,'AI-ML','Artificial intelligence and machine learning'),(6,'Cloud','Cloud computing technologies'),(7,'Security','Cybersecurity and information security'),(8,'Mathematics','Mathematical and theoretical concepts'),(9,'Computer Science','Core computer science subjects'),(10,'Data Science','Data analytics and mining'),(11,'OS','Operating systems'),(12,'Software','Software engineering'),(13,'Web Development','Web application development'),(14,'Graphics','Computer graphics');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fines`
--

DROP TABLE IF EXISTS `fines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fines` (
  `fine_id` int NOT NULL AUTO_INCREMENT,
  `issue_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(20) DEFAULT 'Unpaid',
  PRIMARY KEY (`fine_id`),
  UNIQUE KEY `issue_id` (`issue_id`),
  CONSTRAINT `fines_ibfk_1` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`issue_id`),
  CONSTRAINT `fines_chk_1` CHECK ((`amount` >= 0)),
  CONSTRAINT `fines_chk_2` CHECK ((`status` in (_utf8mb4'Paid',_utf8mb4'Unpaid')))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fines`
--

LOCK TABLES `fines` WRITE;
/*!40000 ALTER TABLE `fines` DISABLE KEYS */;
INSERT INTO `fines` VALUES (1,2,25.00,'Unpaid'),(2,3,30.00,'Unpaid'),(3,4,20.00,'Unpaid'),(4,5,30.00,'Unpaid');
/*!40000 ALTER TABLE `fines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issues` (
  `issue_id` int NOT NULL AUTO_INCREMENT,
  `book_id` int NOT NULL,
  `member_id` int NOT NULL,
  `issue_date` date NOT NULL,
  `due_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  PRIMARY KEY (`issue_id`),
  KEY `book_id` (`book_id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `issues_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  CONSTRAINT `issues_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`),
  CONSTRAINT `issues_chk_1` CHECK ((`due_date` >= `issue_date`)),
  CONSTRAINT `issues_chk_2` CHECK (((`return_date` is null) or (`return_date` >= `issue_date`)))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issues`
--

LOCK TABLES `issues` WRITE;
/*!40000 ALTER TABLE `issues` DISABLE KEYS */;
INSERT INTO `issues` VALUES (1,1,1,'2026-10-14','2026-10-28',NULL),(2,2,2,'2026-09-01','2026-09-15','2026-09-20'),(3,3,3,'2026-09-05','2026-09-19','2026-09-25'),(4,4,4,'2026-09-10','2026-09-24','2026-09-28'),(5,5,5,'2026-09-15','2026-09-29','2026-10-05'),(6,6,6,'2026-10-01','2026-10-15',NULL),(7,7,7,'2026-10-05','2026-10-19',NULL);
/*!40000 ALTER TABLE `issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'John','john@gmail.com','CSE'),(2,'Mark','mark@gmail.com','CSE'),(3,'Sara','sara@gmail.com','IT'),(4,'Emma','emma@gmail.com','AI-ML'),(5,'Alice','alice@gmail.com','CSE'),(6,'David','david@gmail.com','IT'),(7,'Sophia','sophia@gmail.com','AI-ML'),(8,'James','james@gmail.com','CSE'),(9,'Olivia','olivia@gmail.com','ECE'),(10,'Robert','robert@gmail.com','Mechanical'),(11,'Emily','emily@gmail.com','IT'),(12,'Michael','michael@gmail.com','Civil');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publishers` (
  `publisher_id` int NOT NULL AUTO_INCREMENT,
  `publisher_name` varchar(100) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`publisher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers`
--

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
INSERT INTO `publishers` VALUES (1,'McGraw Hill','New York','USA'),(2,'Pearson','London','UK'),(3,'O Reilly Media','Sebastopol','USA'),(4,'Wiley','Hoboken','USA'),(5,'Springer','Berlin','Germany');
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-15  2:35:59
