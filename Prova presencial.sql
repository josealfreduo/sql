CREATE DATABASE  IF NOT EXISTS `biblioteca` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `biblioteca`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: biblioteca
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `disponiveis`
--

DROP TABLE IF EXISTS `disponiveis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disponiveis` (
  `iddisponiveis` int NOT NULL AUTO_INCREMENT,
  `status_disponivel` varchar(45) DEFAULT NULL,
  `livros_idlivros` int NOT NULL,
  PRIMARY KEY (`iddisponiveis`),
  KEY `fk_disponiveis_livros1_idx` (`livros_idlivros`),
  CONSTRAINT `fk_disponiveis_livros1` FOREIGN KEY (`livros_idlivros`) REFERENCES `livros` (`idlivros`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disponiveis`
--

LOCK TABLES `disponiveis` WRITE;
/*!40000 ALTER TABLE `disponiveis` DISABLE KEYS */;
INSERT INTO `disponiveis` VALUES (1,'indiponível',11),(2,'indiponível',12),(3,'indiponível',13),(4,'indiponível',14),(5,'indiponível',15),(6,'disponível',16),(7,'disponível',17),(8,'acervo local',18),(9,'acervo local',19),(10,'indiponível',20);
/*!40000 ALTER TABLE `disponiveis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emprestimos`
--

DROP TABLE IF EXISTS `emprestimos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emprestimos` (
  `idemprestimo` int NOT NULL AUTO_INCREMENT,
  `status_emprestimo` varchar(45) DEFAULT NULL,
  `livros_idlivros` int NOT NULL,
  PRIMARY KEY (`idemprestimo`),
  KEY `fk_emprestimos_livros1_idx` (`livros_idlivros`),
  CONSTRAINT `fk_emprestimos_livros1` FOREIGN KEY (`livros_idlivros`) REFERENCES `livros` (`idlivros`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emprestimos`
--

LOCK TABLES `emprestimos` WRITE;
/*!40000 ALTER TABLE `emprestimos` DISABLE KEYS */;
INSERT INTO `emprestimos` VALUES (1,'emprestado',11),(2,'emprestado',12),(3,'emprestado',13),(4,'emprestado',14),(5,'emprestado',15),(6,'emprestado',16),(7,'emprestado',17),(8,'disponível',18),(9,'disponível',19),(10,'emprestado',20);
/*!40000 ALTER TABLE `emprestimos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_espera`
--

DROP TABLE IF EXISTS `lista_espera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_espera` (
  `idlista de espera` int NOT NULL,
  `status_espera` varchar(45) NOT NULL,
  `data` date NOT NULL,
  `autor` varchar(45) NOT NULL,
  `disponiveis_iddisponiveis` int NOT NULL,
  PRIMARY KEY (`idlista de espera`),
  KEY `fk_lista de espera_disponiveis1_idx` (`disponiveis_iddisponiveis`),
  CONSTRAINT `fk_lista de espera_disponiveis1` FOREIGN KEY (`disponiveis_iddisponiveis`) REFERENCES `disponiveis` (`iddisponiveis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_espera`
--

LOCK TABLES `lista_espera` WRITE;
/*!40000 ALTER TABLE `lista_espera` DISABLE KEYS */;
/*!40000 ALTER TABLE `lista_espera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livros`
--

DROP TABLE IF EXISTS `livros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livros` (
  `idlivros` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) DEFAULT NULL,
  `exemplares` varchar(45) DEFAULT NULL,
  `genero` varchar(45) DEFAULT NULL,
  `autor` varchar(45) DEFAULT NULL,
  `n_pag` varchar(45) DEFAULT NULL,
  `ISBN` varchar(45) DEFAULT NULL,
  `sinopse` varchar(100) DEFAULT NULL,
  `editora` varchar(45) DEFAULT NULL,
  `tipo_acervo` varchar(45) DEFAULT NULL,
  `reservas_idreservas` int DEFAULT NULL,
  PRIMARY KEY (`idlivros`),
  KEY `fk_livros_reservas` (`reservas_idreservas`),
  CONSTRAINT `fk_livros_emprestimos` FOREIGN KEY (`idlivros`) REFERENCES `emprestimos` (`livros_idlivros`),
  CONSTRAINT `fk_livros_reservas` FOREIGN KEY (`reservas_idreservas`) REFERENCES `reservas` (`idreservas`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livros`
--

LOCK TABLES `livros` WRITE;
/*!40000 ALTER TABLE `livros` DISABLE KEYS */;
INSERT INTO `livros` VALUES (11,'amo ciencia','2','Tecnologia e Ciência','Einstein','300','7881234567890','formula da bomba atomica','Erica','livro',NULL),(12,'O Senhor dos Anéis: As Duas Torres','4','Ficção Científica','J.R.R. Tolkien','432','9788533619379','A segunda parte da jornada épica na Terra Média','Martins Fontes','livro',NULL),(13,'Maus','3','História em Quadrinhos','Art Spiegelman','296','9788535913582','A narrativa gráfica do Holocausto em forma de fábulas','Companhia das Letras','HQ',NULL),(14,'O Príncipe','5','Literatura Infantil','Maquiavel','176','9788573260748','Clássico sobre estratégias de governo e poder','Martin Claret','livro',NULL),(15,'A Guerra dos Tronos','4','Fantasia','George R.R. Martin','592','9788544102782','Início da série \"As Crônicas de Gelo e Fogo\"','LeYa','livro',NULL),(16,'A Divina Comédia','3','Ficção Científica','Dante Alighieri','544','9788525422648','Viagem pelo Inferno, Purgatório e Paraíso','L&PM Editores','resvista',NULL),(17,'Sapiens: Uma Breve História da Humanidade','6','Ficção Científica','Yuval Noah Harari','464','9788539004136','Visão abrangente sobre o Milênio','Objetiva','livro',NULL),(18,'O Hobbit','4','Fantasia','J.R.R. Tolkien','328','9788578277331','As aventuras de Bilbo Bolseiro','WMF Martins Fontes','livro',NULL),(19,'Um Amor para Toda Vida','3','Épico','Homero','592','7891234567890','A guerra de Troia narrada em verso','ceu azul','livro',NULL),(20,'O Silmarillion','5','Fantasia','J.R.R. Tolkien','480','9788578273371','A história da Terra Média antes de O Senhor dos Anéis','WMF Martins Fontes','livro',NULL);
/*!40000 ALTER TABLE `livros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multa`
--

DROP TABLE IF EXISTS `multa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multa` (
  `idmulta` int NOT NULL AUTO_INCREMENT,
  `valor` decimal(10,0) DEFAULT NULL,
  `usuarios_idusuario` int NOT NULL,
  `livros_idlivros` int NOT NULL,
  PRIMARY KEY (`idmulta`),
  KEY `fk_multa_usuarios1_idx` (`usuarios_idusuario`),
  KEY `fk_multa_livros1_idx` (`livros_idlivros`),
  CONSTRAINT `fk_multa_livros1` FOREIGN KEY (`livros_idlivros`) REFERENCES `livros` (`idlivros`),
  CONSTRAINT `fk_multa_usuarios1` FOREIGN KEY (`usuarios_idusuario`) REFERENCES `usuarios` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multa`
--

LOCK TABLES `multa` WRITE;
/*!40000 ALTER TABLE `multa` DISABLE KEYS */;
/*!40000 ALTER TABLE `multa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `idreservas` int NOT NULL AUTO_INCREMENT,
  `data_reservas` date NOT NULL,
  `data_retirada` date NOT NULL,
  `data_entrega` date NOT NULL,
  `usuario_idusuario` int NOT NULL,
  `livros_idlivros` int NOT NULL,
  `data_limite_entrega` date DEFAULT NULL,
  `dias_em_atraso` int DEFAULT '0',
  `multa_valor` decimal(10,2) DEFAULT NULL,
  `situacao` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`idreservas`),
  KEY `fk_reservas_usuario_idx` (`usuario_idusuario`),
  KEY `fk_reservas_livros1_idx` (`livros_idlivros`),
  CONSTRAINT `fk_reservas_livros1` FOREIGN KEY (`livros_idlivros`) REFERENCES `livros` (`idlivros`),
  CONSTRAINT `fk_reservas_usuario` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuarios` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
INSERT INTO `reservas` VALUES (1,'2023-03-01','2023-08-23','2023-10-03',11,11,'2023-10-04',NULL,0.00,'devolvido'),(2,'2023-03-09','2023-08-22','2023-08-30',12,12,'2023-08-20',NULL,0.00,'devolvido'),(3,'2023-04-01','2023-04-02','2023-05-03',13,13,'2023-03-01',63,63.00,'emprestado'),(4,'2023-08-20','2023-08-21','2023-08-30',14,14,'2023-09-01',NULL,0.00,'emprestado'),(5,'2023-08-23','2023-08-27','2023-08-29',15,15,'2023-08-30',NULL,0.00,'devolvido'),(6,'2023-04-04','2023-04-06','2023-05-05',16,16,'2023-04-30',5,5.00,'emprestado'),(7,'2023-07-30','2023-02-01','2023-04-04',17,17,'2023-04-06',2,2.00,'emprestado'),(8,'2023-08-01','2023-08-05','2023-08-18',18,18,'2023-09-02',NULL,0.00,'disponivel'),(9,'2024-01-07','2024-01-08','2024-01-10',19,19,'2024-04-26',NULL,0.00,'disponivel'),(10,'2024-02-09','2024-02-10','2024-02-15',20,20,'2024-05-25',NULL,0.00,'emprestado');
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `reservas_idreservas` int NOT NULL,
  `disponiveis_iddisponiveis` int NOT NULL,
  `emprestimos_idemprestimo` int NOT NULL,
  KEY `fk_status_reservas1_idx` (`reservas_idreservas`),
  KEY `fk_status_disponiveis1_idx` (`disponiveis_iddisponiveis`),
  KEY `fk_status_emprestimos1_idx` (`emprestimos_idemprestimo`),
  CONSTRAINT `fk_status_disponiveis1` FOREIGN KEY (`disponiveis_iddisponiveis`) REFERENCES `disponiveis` (`iddisponiveis`),
  CONSTRAINT `fk_status_emprestimos1` FOREIGN KEY (`emprestimos_idemprestimo`) REFERENCES `emprestimos` (`idemprestimo`),
  CONSTRAINT `fk_status_reservas1` FOREIGN KEY (`reservas_idreservas`) REFERENCES `reservas` (`idreservas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `cpf` varchar(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `telefone` varchar(11) DEFAULT NULL,
  `reservas_idreservas` int DEFAULT NULL,
  `status_usuario` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `CPF_UNIQUE` (`cpf`),
  UNIQUE KEY `EMAIL_UNIQUE` (`email`),
  KEY `fk_usuarios_reservas` (`reservas_idreservas`),
  CONSTRAINT `fk_usuarios_reservas` FOREIGN KEY (`reservas_idreservas`) REFERENCES `reservas` (`idreservas`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (11,'12345678901','Julia','teste@teste.com','48123456789',1,'habilitado','Laguna'),(12,'23456789012','Carlos','carlos@teste.com','49234567890',2,'habilitado','Itapema'),(13,'34567890123','Ana','ana@teste.com','50345678901',3,'habilitado','Imbituba'),(14,'45678901234','Pedro','pedro@estudante.sesisenai.org.br','51456789012',4,'desabilitado','Florianópolis'),(15,'56789012345','Mariana','mariana@teste.com','52567890123',5,'habilitado','Chapecó'),(16,'67890123456','Lucas','lucas@teste.com','53678901234',6,'habilitado','Balneário Canburiu'),(17,'78901234567','Camila','camila@estudante.sesisenai.org.br','54789012345',7,'desabilitado','Criciúma'),(18,'89012345678','Gabriel','gabriel@teste.com','55890123456',8,'habilitado','Tubarão'),(19,'90123456789','Isabela','isabela@teste.com','56901234567',9,'habilitado','Itapirubá'),(20,'12345678931','Julio','Julio@estudante.sesisenai.org.br','48123456785',10,'desabilitado','Jaraguá do Sul');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'biblioteca'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-12 18:34:22
