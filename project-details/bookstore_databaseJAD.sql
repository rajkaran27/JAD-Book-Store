CREATE DATABASE  IF NOT EXISTS `bookstore` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bookstore`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: bookstore
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'pranjal','pejay');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `author_id` int NOT NULL AUTO_INCREMENT,
  `author_name` varchar(255) NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'HARUMI MURAKAMI'),(2,'JAMES CLEAR'),(3,'NAPOLEON HILL'),(4,'J.K. ROWLING'),(5,'AGATHA CHRISTIE'),(6,'ISAAC ASIMOV'),(7,'JANE AUSTEN'),(8,'DAN BROWN'),(9,'STEPHEN KING'),(10,'MICHELLE OBAMA'),(11,'NEIL GAIMAN'),(12,'FREIDA MCFADDEN'),(13,'SARAH ADAMS');
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
  `category_id` int NOT NULL,
  `isbn` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `author_id` int NOT NULL,
  `publisher_id` int NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `publication_date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  KEY `category_id` (`category_id`),
  KEY `author_id` (`author_id`),
  KEY `publisher_id` (`publisher_id`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  CONSTRAINT `books_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`),
  CONSTRAINT `books_ibfk_3` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`publisher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,1,'9780747532743','HARRY POTTER AND THE PHILOSOPHER\'S STONE',10,19.99,4,1,'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1170803558l/72193.jpg','Harry Potter is an eleven-year-old boy who lives with his neglectful relatives, the Dursleys. On his eleventh birthday, he learns from a mysterious stranger, Rubeus Hagrid, that he is actually a wizard, famous in the Wizarding World for surviving an attack by the evil Lord Voldemort when Harry was just a baby. Hagrid takes Harry to Diagon Alley to buy school supplies before taking him to King\'s Cross station to board a train to Hogwarts School of Witchcraft and Wizardry.',5,'26 June 1997'),(2,2,'9780007119278','MURDER ON THE ORIENT EXPRESS',8,14.99,5,2,'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1486131451i/853510.jpg','Hercule Poirot, a famous Belgian detective, is traveling on the Orient Express when he is called upon to investigate the murder of a wealthy American businessman. The passengers on the train are all suspects, and Poirot must use all his skills to solve the mystery before the killer strikes again.',4,'1 January 1934'),(3,3,'9780553380163','FOUNDATION',5,9.99,6,3,'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1417900846i/29579.jpg','The Foundation is a series of science fiction novels by Isaac Asimov. The series is set in the Galactic Empire, which is slowly crumbling. Hari Seldon, a mathematician, predicts the fall of the Empire and creates a Foundation to preserve human knowledge and culture.',3,'15 September 1951'),(4,2,'9780312330873','AND THEN THERE WERE NONE',10,14.99,5,2,'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1638425885i/16299.jpg','And Then There Were None is a mystery novel by Agatha Christie. The novel tells the story of ten strangers who are invited to Soldier Island, an isolated island off the coast of Devon. The guests are all strangers to each other, and they soon discover that they are all being hunted down one by one.',5,'6 November 1939'),(5,2,'9781734452594','THE MYSTERIOUS AFFAIR AT STYLES',15,14.99,5,2,'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1585632445i/52843028.jpg','The Mysterious Affair at Styles is the first novel featuring Hercule Poirot, a famous Belgian detective. The novel tells the story of a young woman who is found dead at Styles Court, an English country house. Poirot is called in to investigate, and he soon discovers that the murder is more complicated than it seems.',4,'26 October 1916'),(6,1,'9780375704024','NORWEGIAN WOOD',18,17.99,1,3,'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1630460042i/11297.jpg','Norwegian Wood is a novel by Haruki Murakami. The novel tells the story of Toru Watanabe, a young man who is struggling to come to terms with the death of his girlfriend. Watanabe meets a group of friends, and they help him to deal with his grief.',5,'19 September 1987'),(7,1,'9781400079278','KAFKA ON THE SHORE',18,18.99,1,3,'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1429638085i/4929.jpg','Kafka on the Shore is a novel by Haruki Murakami. The novel tells the story of Kafka Tamura, a young man who runs away from home and finds himself in a strange town where he meets a young woman named Sakura. Kafka is on a quest to find his identity, and Sakura helps him to along the way.',3,'29 July 2005'),(8,3,'9780553293371','FOUNDATION AND EMPIRE',10,12.99,3,3,'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1391454612i/29581.jpg','Foundation and Empire is the second novel in the Foundation series by Isaac Asimov. The novel picks up where the first novel left off, and it follows the Foundation as it struggles to survive against the forces of the Galactic Empire.',4,'15 May 1952'),(9,3,'9780553382587','SECOND FOUNDATION',10,11.99,3,3,'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1661015922i/29580.jpg','Second Foundation is the third novel in the Foundation series by Isaac Asimov. The novel tells the story of the Second Foundation, a secret organization that is dedicated to protecting the Foundation.',4,'15 November 1953'),(10,4,'9780141439518','PRIDE AND PREJUDICE',8,11.99,7,4,'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1320399351i/1885.jpg','Pride and Prejudice is a novel by Jane Austen. The novel tells the story of Elizabeth Bennet, a young woman who must choose between two suitors: the wealthy and arrogant Mr. Darcy, and the charming and intelligent Mr. Bingley.',4,'28 January 1813'),(11,5,'9780552172127','THE DA VINCI CODE',12,14.99,8,6,'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1463592438i/30228538.jpg','The Da Vinci Code is a mystery novel by Dan Brown. The novel tells the story of Robert Langdon, a professor of symbology, who is called in to investigate the murder of Jacques Saunière, the curator of the Louvre Museum. Langdon soon discovers that Saunière was a member of a secret society known as the Priory of Sion, and that his murder is connected to the Holy Grail.',5,'18 March 2003'),(12,6,'9781501180989','THE SHINING',5,9.99,9,5,'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1353277730i/11588.jpg','The Shining is a horror novel by Stephen King. The novel tells the story of Jack Torrance, a writer who takes a job as the winter caretaker of the Overlook Hotel, a remote hotel in the Colorado Rockies. Jack\'s wife, Wendy, and their son, Danny, move into the hotel with him. However, the hotel is haunted by ghosts, and Jack begins to lose his sanity.',3,'24 September 1977'),(13,7,'9781524763138','BECOMING',10,17.99,10,3,'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1528206996i/38746485.jpg','Becoming is a memoir by Michelle Obama. The memoir tells the story of Obama\'s life, from her childhood in Chicago to her time as First Lady of the United States. Obama writes about her struggles and triumphs, and she offers her insights on marriage, motherhood, and leadership.',2,'14 November 2018'),(14,8,'9780062316642','AMERICAN GODS',6,12.99,11,2,'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1462924585i/30165203.jpg','American Gods is a novel by Neil Gaiman. The novel tells the story of Shadow Moon, a man who is released from prison on the day of his wife\'s funeral. Shadow is hired by a mysterious man named Wednesday to serve as his bodyguard. Wednesday is a con man, but he is also a god. He is on a quest to gather the old gods of myth and legend, in order to fight against the new gods of technology and consumerism.',5,'10 June 2001'),(15,1,'9780099461845','1Q84',8,14.99,1,4,'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1483103331i/10357575.jpg','1Q84 is a novel by Haruki Murakami. The novel tells the story of Aomame, a young woman who works as a bodyguard. Aomame is drawn into a strange world where the year is 1Q84, and where there are two moons in the sky. Aomame meets Tengo, a young man who is also drawn into this strange world. Together, they must try to find a way to escape.',5,'20 September 2009'),(16,6,'9780785833529','THINK AND GROW RICH',10,17.99,3,5,'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1463241782i/30186948.jpg','Think and Grow Rich is a self-help book by Napoleon Hill. The book tells the story of Hill\'s research into the lives of successful people. Hill found that there were certain common traits that all successful people had. These traits included a positive attitude, self-discipline, and the ability to set goals.',4,'6 October 1937'),(17,11,'9780062995315','THE OCEAN AT THE END OF THE LANE',8,12.34,11,2,'https://m.media-amazon.com/images/I/51KrIRgAd2L._SX325_BO1,204,203,200_.jpg','A man returns to the site of his childhood home where, years before, he knew a girl named Lettie Hempstock who showed him the most marvelous, dangerous, and outrageous things, but when he gets there he learns that nothing is as he remembered.',5,'5 November 2019'),(18,11,'9780060735562','CORALINE',9,13.87,11,3,'https://cdn.kobo.com/book-images/28f3afa5-9a3d-4430-88b4-94a7ec7748b9/353/569/90/False/coraline-2.jpg','When Coraline steps through a door to find another house strangely similar to her own (only better), things seem marvelous.',5,'11 November 2003'),(19,11,'9780063070738','ANASI BOYS: A NOVEL',7,11.99,11,4,'https://m.media-amazon.com/images/I/41vcL3cd0JL._SX329_BO1,204,203,200_.jpg','When Fat Charlie’s dad named something, it stuck. Like calling Fat Charlie “Fat Charlie.” Even now, twenty years later, Charlie Nancy can’t shake that name, one of the many embarrassing “gifts” his father bestowed—before he dropped dead on a karaoke stage and ruined Fat Charlie’s life. Because Mr. Nancy left Fat Charlie things',3,'20 April 2021'),(20,11,'9780061793059','NEVERWHERE',5,14.99,11,2,'https://cdn.kobo.com/book-images/7626b78c-cd03-434f-9f55-625aab991d0f/353/569/90/False/neverwhere-1.jpg','It is the story of Richard Mayhew, a young London businessman with a good heart and an ordinary life, which is changed forever when he discovers a girl bleeding on the sidewalk. He stops to help her—an act of kindness that plunges him into a world he never dreamed existed.',3,'17 March 2009'),(21,8,'9780452279605','THE GUNSLINGER',15,14.99,9,3,'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1554220416i/43615.jpg','He is a haunting figure, a loner on a spellbinding journey into good and evil. In his desolate world, which frighteningly mirrors our own, Roland pursues The Man in Black, encounters an alluring woman named Alice, and begins a friendship with the Kid from Earth called Jake. Both grippingly realistic and eerily dreamlike, The Gunslinger leaves readers eagerly awaiting the next chapter.\r\n',4,'1 July 2003'),(22,10,'9781408728512','THE HOUSEMAID',20,18.99,12,4,'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1646534743i/60556912.jpg','Welcome to the family, Nina Winchester says as I shake her elegant, manicured hand. I smile politely, gazing around the marble hallway. Working here is my last chance to start fresh. I can pretend to be whoever I like. But Ill soon learn that the Winchesters secrets are far more dangerous than my own',4,'26 April 2022'),(23,10,'9798515308803','THE LOCKED DOOR',20,14.99,12,3,'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1618859577i/57795665.jpg','While eleven-year-old Nora Davis was up in her bedroom doing homework, she had no idea her father was killing women in the basement.\r\nUntil the day the police arrived at their front door.',3,'4 June 2021'),(24,9,'9780593500804','PRACTICE MAKES PERFECT',20,17.99,13,1,'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1659979546i/61897968.jpg','Annie Walker is on a quest to find her perfect match-someone who nicely compliments her happy, quiet life running her flower shop in Rome, Kentucky. Unfortunately, she worries her goal might be too far out of reach when she overhears her date saying she is \"sounbelievably boring.\" Is it too late to become flirtatious and fun like the leading ladies in her favorite romance movies?',3,'2 May 2023');
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
  `category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'FICTION'),(2,'MYSTERY'),(3,'SCIENCE FICTION'),(4,'BIOGRAPHY'),(5,'HISTORICAL FICTION'),(6,'SELF-HELP'),(7,'SCIENCE'),(8,'HORROR'),(9,'ROMANCE'),(10,'THRILLER'),(11,'FANTASY');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'p@gmail.com','PJGWD','pj123'),(2,'r@gmail.com','rajkaran','raj123'),(3,'d@gmail.com','delvin','delv123'),(6,'a@gmail.com','abi','abi123');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `book_ids` varchar(255) DEFAULT NULL,
  `order_cost` decimal(10,2) DEFAULT NULL,
  `member_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publishers` (
  `publisher_id` int NOT NULL AUTO_INCREMENT,
  `publisher_name` varchar(255) NOT NULL,
  PRIMARY KEY (`publisher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers`
--

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
INSERT INTO `publishers` VALUES (1,'HACHETTE BOOK GROUP'),(2,'MACMILLAN PUBLISHERS'),(3,'SCHOLASTIC CORPORATION'),(4,'PENGUIN RANDOM HOUSE'),(5,'HARPERCOLLINS'),(6,'SIMON & SCHUSTER');
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'bookstore'
--
/*!50003 DROP PROCEDURE IF EXISTS `AdminLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AdminLogin`(IN userName varchar(50), passwd varchar(50))
BEGIN
	SELECT * FROM admin WHERE username=userName AND password=passwd;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteBook` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteBook`(IN bookId int)
BEGIN
	DELETE FROM books WHERE books.book_id=bookId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteMember`(IN memberId int)
BEGIN
DELETE FROM members WHERE members.member_id=memberId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MemberLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MemberLogin`(IN userName varchar(50), passwd varchar(50))
BEGIN
	SELECT * FROM members WHERE username = userName AND password = passwd;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegisterMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegisterMember`(IN Email varchar(50), userName varchar(50),  passwd varchar(50))
BEGIN
INSERT INTO members(email,username,password) VALUES (Email,userName,passwd);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchBookIndex` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchBookIndex`(IN bookTitle varchar(80), authorName varchar(80))
BEGIN
SELECT books.*, authors.author_name,categories.category_name FROM books JOIN authors ON books.author_id = authors.author_id JOIN categories ON books.category_id=categories.category_id WHERE books.title LIKE CONCAT('%', bookTitle, '%') OR authors.author_name LIKE CONCAT('%',authorName,'%');
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

-- Dump completed on 2023-06-18 19:53:42
