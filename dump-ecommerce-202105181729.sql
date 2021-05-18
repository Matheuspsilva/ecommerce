-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `cpf` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (3,'Matheus','123123123123','matheuspsilva@email.com','$2a$10$KknS56k7aEEGBJIvb7a8JuGPcgPK2545yNdvrE0Ll1A2ko9anQRna'),(4,'José','31314855337','jose@email.com','$2a$10$cW9NxXkM9oe1ZlFqxZ6yd.TihXvXAzsiVCyKqCAUfZkUEUnwssBRK');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cep` varchar(255) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `logradouro` varchar(255) DEFAULT NULL,
  `cliente_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8s7ivtl4foyhrfam9xqom73n9` (`cliente_id`),
  CONSTRAINT `FK8s7ivtl4foyhrfam9xqom73n9` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,'123123123','Em frente ao Condomínio ABC','Avenida Jerônimo de Albuquerque, 20',3),(2,'2341231245','Em frente ao Colégio Vinícius ','Avenida dos Holandeses, 20',3);
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (1);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens_pedido`
--

DROP TABLE IF EXISTS `itens_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itens_pedido` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantidade` int DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `pedido_id` bigint DEFAULT NULL,
  `produto_id` bigint DEFAULT NULL,
  `valor_total` double DEFAULT NULL,
  `valor_unitario` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdrlbqwi9u15b2nnaj826e229x` (`pedido_id`),
  KEY `FK3uo2duj20r2i4mwplv4vb26u6` (`produto_id`),
  CONSTRAINT `FK3uo2duj20r2i4mwplv4vb26u6` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`id`),
  CONSTRAINT `FKdrlbqwi9u15b2nnaj826e229x` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_pedido`
--

LOCK TABLES `itens_pedido` WRITE;
/*!40000 ALTER TABLE `itens_pedido` DISABLE KEYS */;
INSERT INTO `itens_pedido` VALUES (1,2,NULL,1,1,2599.98,1299.99),(2,1,NULL,2,1,1299.99,1299.99),(3,1,NULL,3,1,1299.99,1299.99),(4,1,NULL,7,1,1299.99,1299.99),(5,1,NULL,9,1,1299.99,1299.99),(6,1,NULL,10,1,1299.99,1299.99),(7,1,NULL,11,1,1299.99,1299.99),(8,1,NULL,12,2,1399.99,1399.99),(9,1,NULL,13,1,1299.99,1299.99),(10,1,NULL,14,1,1299.99,1299.99),(11,1,NULL,15,1,1299.99,1299.99),(12,1,NULL,16,1,1299.99,1299.99),(13,1,NULL,16,4,12850.99,12850.99),(14,1,NULL,17,1,1299.99,1299.99),(15,1,NULL,23,3,1979.99,1979.99),(16,1,NULL,26,1,1299.99,1299.99),(17,1,NULL,27,1,1299.99,1299.99),(18,1,NULL,28,1,1299.99,1299.99),(19,1,NULL,29,1,1299.99,1299.99),(20,1,NULL,30,3,1979.99,1979.99),(21,1,NULL,31,2,1399.99,1399.99),(22,1,NULL,32,1,1299.99,1299.99),(23,1,NULL,33,4,12850.99,12850.99);
/*!40000 ALTER TABLE `itens_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `data_entrega` datetime(6) DEFAULT NULL,
  `data_pedido` datetime(6) DEFAULT NULL,
  `forma_pagamento` varchar(255) DEFAULT NULL,
  `frete` double DEFAULT NULL,
  `observacoes` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `cliente_id` bigint DEFAULT NULL,
  `endereco_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK30s8j2ktpay6of18lbyqn3632` (`cliente_id`),
  KEY `FKsot2og0lvhm2t4kuu9s2obef3` (`endereco_id`),
  CONSTRAINT `FK30s8j2ktpay6of18lbyqn3632` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  CONSTRAINT `FKsot2og0lvhm2t4kuu9s2obef3` FOREIGN KEY (`endereco_id`) REFERENCES `endereco` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,NULL,'2021-05-17 22:09:58.859000','credito',10,NULL,NULL,2599.98,3,NULL),(2,NULL,'2021-05-18 10:18:29.022000','boleto',10,NULL,NULL,1299.99,4,NULL),(3,NULL,'2021-05-18 10:32:19.548000','credito',10,NULL,NULL,1299.99,3,NULL),(4,NULL,'2021-05-18 10:44:41.036000','credito',20,NULL,NULL,0,3,NULL),(5,NULL,'2021-05-18 10:44:46.415000','credito',30,NULL,NULL,0,3,NULL),(6,NULL,'2021-05-18 10:45:48.584000','credito',10,NULL,NULL,0,3,NULL),(7,NULL,'2021-05-18 10:47:57.716000','credito',10,NULL,NULL,1299.99,3,NULL),(8,NULL,'2021-05-18 10:51:06.130000','credito',20,NULL,NULL,0,3,NULL),(9,NULL,'2021-05-18 10:54:34.280000','credito',20,NULL,NULL,1299.99,3,2),(10,NULL,'2021-05-18 11:51:28.462000','credito',10,NULL,NULL,1299.99,3,2),(11,NULL,'2021-05-18 12:15:04.634000','credito',30,NULL,NULL,1299.99,3,1),(12,NULL,'2021-05-18 12:16:01.691000','credito',20,NULL,NULL,1399.99,3,1),(13,NULL,'2021-05-18 13:41:44.908000','credito',10,NULL,NULL,1299.99,3,1),(14,NULL,'2021-05-18 14:54:06.534000','credito',30,NULL,NULL,1299.99,3,1),(15,NULL,'2021-05-18 14:58:54.087000','credito',20,NULL,NULL,1299.99,3,1),(16,NULL,'2021-05-18 15:22:10.615000','credito',10,NULL,NULL,14150.98,3,1),(17,NULL,'2021-05-18 16:22:10.769000','credito',20,NULL,NULL,1299.99,3,1),(18,NULL,'2021-05-18 16:22:25.943000','credito',10,NULL,NULL,0,3,1),(19,NULL,'2021-05-18 16:23:28.444000','credito',10,NULL,NULL,0,3,1),(20,NULL,'2021-05-18 16:23:54.028000','credito',30,NULL,NULL,0,3,1),(21,NULL,'2021-05-18 16:25:15.910000','credito',30,NULL,NULL,0,3,1),(22,NULL,'2021-05-18 16:25:23.260000','credito',30,NULL,NULL,0,3,1),(23,NULL,'2021-05-18 16:25:26.583000','credito',20,NULL,NULL,1979.99,3,1),(24,NULL,'2021-05-18 16:30:46.408000','credito',30,NULL,NULL,0,3,1),(25,NULL,'2021-05-18 16:30:59.378000','credito',30,NULL,NULL,0,3,1),(26,NULL,'2021-05-18 16:31:01.170000','credito',20,NULL,NULL,1299.99,3,1),(27,NULL,'2021-05-18 16:31:06.051000','credito',20,NULL,NULL,1299.99,3,1),(28,NULL,'2021-05-18 16:31:43.351000','credito',20,NULL,NULL,1299.99,3,1),(29,NULL,'2021-05-18 16:32:11.055000','credito',20,NULL,NULL,1299.99,3,1),(30,NULL,'2021-05-18 16:33:48.995000','credito',20,NULL,NULL,1979.99,3,1),(31,NULL,'2021-05-18 16:33:57.027000','credito',10,NULL,NULL,1399.99,3,1),(32,NULL,'2021-05-18 16:34:54.392000','credito',20,NULL,NULL,1299.99,3,1),(33,NULL,'2021-05-18 16:37:43.331000','credito',30,NULL,NULL,12850.99,3,1);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `url_foto` varchar(255) DEFAULT NULL,
  `url_produto` varchar(255) DEFAULT NULL,
  `valor` decimal(19,2) DEFAULT NULL,
  `quantidade` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Smartphone Moto G10 Cinza, com Tela de 6,5, 4G, 64GB','Moto G10','https://images-na.ssl-images-amazon.com/images/I/61pBPPHcV2S._AC_SL1000_.jpg',NULL,1299.99,5),(2,'Xiaomi Redmi Note 10 4GB+64GB Versão global Onyx Gray','Redmi Note 10','https://images-na.ssl-images-amazon.com/images/I/61bD%2B2ZxGyS._AC_SL1500_.jpg',NULL,1399.99,5),(3,'Celular Xiaomi Poco X3 6GB/128GB NFC - Shadow Grey','Xiaomi Poco X3 ','https://images-na.ssl-images-amazon.com/images/I/81WiYD9AVcL._AC_SL1500_.jpg',NULL,1979.99,5),(4,'Macbook Pro Retina Apple 13.3\", 8GB, SSD 512GB, Processador M1, Touch Bar e Touch ID - Cinza Espacial','Macbook Pro Retina ','https://images-na.ssl-images-amazon.com/images/I/41XgUQHMdjS._AC_SL1000_.jpg',NULL,12850.99,5),(5,'Kindle Paperwhite 8 GB - Agora à prova d´água','Kindle Paperwhite','https://images-na.ssl-images-amazon.com/images/I/61ldUg%2BPqQL._AC_SL1000_.jpg',NULL,499.99,5),(6,'Monitor LG Gamer UltraWide 25\" IPS Full HD 1ms MBR 25UM58G','Monitor LG Gamer UltraWide','https://images-na.ssl-images-amazon.com/images/I/71%2BuCmkWDWL._AC_SL1500_.jpg',NULL,883.42,5),(11,'Echo Dot (3ª Geração): Smart Speaker com Alexa - Cor Preta','Echo Dot','https://images-na.ssl-images-amazon.com/images/I/41GZCWFJB1L._AC_.jpg','#',339.99,2);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportadora`
--

DROP TABLE IF EXISTS `transportadora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transportadora` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `valor_frete` double DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportadora`
--

LOCK TABLES `transportadora` WRITE;
/*!40000 ALTER TABLE `transportadora` DISABLE KEYS */;
INSERT INTO `transportadora` VALUES (1,50,'Log'),(2,50,'Correio');
/*!40000 ALTER TABLE `transportadora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ecommerce'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-18 17:29:36
