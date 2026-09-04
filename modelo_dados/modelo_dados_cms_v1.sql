/*
SQLyog Community v13.2.1 (64 bit)
MySQL - 11.8.6-MariaDB-log : Database - db_consulado_homolog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_consulado_homolog` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci */;

/*Table structure for table `admin_permissions` */

DROP TABLE IF EXISTS `admin_permissions`;

CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `action_parameters` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`action_parameters`)),
  `subject` varchar(255) DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `conditions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`conditions`)),
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_permissions_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `admin_permissions_created_by_id_fk` (`created_by_id`),
  KEY `admin_permissions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `admin_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `admin_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=386 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `admin_permissions_api_token_lnk` */

DROP TABLE IF EXISTS `admin_permissions_api_token_lnk`;

CREATE TABLE `admin_permissions_api_token_lnk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned DEFAULT NULL,
  `api_token_id` int(10) unsigned DEFAULT NULL,
  `permission_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_api_token_lnk_uq` (`permission_id`,`api_token_id`),
  KEY `admin_permissions_api_token_lnk_fk` (`permission_id`),
  KEY `admin_permissions_api_token_lnk_ifk` (`api_token_id`),
  KEY `admin_permissions_api_token_lnk_oifk` (`permission_ord`),
  CONSTRAINT `admin_permissions_api_token_lnk_fk` FOREIGN KEY (`permission_id`) REFERENCES `admin_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_permissions_api_token_lnk_ifk` FOREIGN KEY (`api_token_id`) REFERENCES `strapi_api_tokens` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `admin_permissions_role_lnk` */

DROP TABLE IF EXISTS `admin_permissions_role_lnk`;

CREATE TABLE `admin_permissions_role_lnk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned DEFAULT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  `permission_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_role_lnk_uq` (`permission_id`,`role_id`),
  KEY `admin_permissions_role_lnk_fk` (`permission_id`),
  KEY `admin_permissions_role_lnk_ifk` (`role_id`),
  KEY `admin_permissions_role_lnk_oifk` (`permission_ord`),
  CONSTRAINT `admin_permissions_role_lnk_fk` FOREIGN KEY (`permission_id`) REFERENCES `admin_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_permissions_role_lnk_ifk` FOREIGN KEY (`role_id`) REFERENCES `admin_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=440 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `admin_roles` */

DROP TABLE IF EXISTS `admin_roles`;

CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_roles_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `admin_roles_created_by_id_fk` (`created_by_id`),
  KEY `admin_roles_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `admin_roles_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `admin_roles_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `admin_users` */

DROP TABLE IF EXISTS `admin_users`;

CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `registration_token` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `prefered_language` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_users_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `admin_users_created_by_id_fk` (`created_by_id`),
  KEY `admin_users_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `admin_users_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `admin_users_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `admin_users_roles_lnk` */

DROP TABLE IF EXISTS `admin_users_roles_lnk`;

CREATE TABLE `admin_users_roles_lnk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  `role_ord` double unsigned DEFAULT NULL,
  `user_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_roles_lnk_uq` (`user_id`,`role_id`),
  KEY `admin_users_roles_lnk_fk` (`user_id`),
  KEY `admin_users_roles_lnk_ifk` (`role_id`),
  KEY `admin_users_roles_lnk_ofk` (`role_ord`),
  KEY `admin_users_roles_lnk_oifk` (`user_ord`),
  CONSTRAINT `admin_users_roles_lnk_fk` FOREIGN KEY (`user_id`) REFERENCES `admin_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_users_roles_lnk_ifk` FOREIGN KEY (`role_id`) REFERENCES `admin_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `areas` */

DROP TABLE IF EXISTS `areas`;

CREATE TABLE `areas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `areas_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `areas_created_by_id_fk` (`created_by_id`),
  KEY `areas_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `areas_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `areas_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `colaboradors` */

DROP TABLE IF EXISTS `colaboradors`;

CREATE TABLE `colaboradors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `cpf` varchar(255) DEFAULT NULL,
  `cep` varchar(255) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `email_principal` varchar(255) DEFAULT NULL,
  `telefone_principal` varchar(255) DEFAULT NULL,
  `papel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `colaboradors_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `colaboradors_created_by_id_fk` (`created_by_id`),
  KEY `colaboradors_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `colaboradors_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `colaboradors_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `colaboradors_cmps` */

DROP TABLE IF EXISTS `colaboradors_cmps`;

CREATE TABLE `colaboradors_cmps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `cmp_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `colaboradors_uq` (`entity_id`,`cmp_id`,`field`,`component_type`),
  KEY `colaboradors_field_idx` (`field`),
  KEY `colaboradors_component_type_idx` (`component_type`),
  KEY `colaboradors_entity_fk` (`entity_id`),
  CONSTRAINT `colaboradors_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `colaboradors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_atividades_alternativas` */

DROP TABLE IF EXISTS `components_atividades_alternativas`;

CREATE TABLE `components_atividades_alternativas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resposta` longtext DEFAULT NULL,
  `correta` tinyint(1) DEFAULT NULL,
  `explicacao` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_atividades_aula_ao_vivos` */

DROP TABLE IF EXISTS `components_atividades_aula_ao_vivos`;

CREATE TABLE `components_atividades_aula_ao_vivos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `descricao` longtext DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `activity_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_atividades_aula_presencials` */

DROP TABLE IF EXISTS `components_atividades_aula_presencials`;

CREATE TABLE `components_atividades_aula_presencials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `descricao` longtext DEFAULT NULL,
  `activity_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_atividades_certificados` */

DROP TABLE IF EXISTS `components_atividades_certificados`;

CREATE TABLE `components_atividades_certificados` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `activity_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_atividades_download_de_conteudos` */

DROP TABLE IF EXISTS `components_atividades_download_de_conteudos`;

CREATE TABLE `components_atividades_download_de_conteudos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `descricao` longtext DEFAULT NULL,
  `activity_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_atividades_entrevistas` */

DROP TABLE IF EXISTS `components_atividades_entrevistas`;

CREATE TABLE `components_atividades_entrevistas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `presencial` tinyint(1) DEFAULT NULL,
  `data_entrevista` datetime(6) DEFAULT NULL,
  `localidade` longtext DEFAULT NULL,
  `endereco_online` varchar(255) DEFAULT NULL,
  `activity_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_atividades_gatilho_de_comunicacaos` */

DROP TABLE IF EXISTS `components_atividades_gatilho_de_comunicacaos`;

CREATE TABLE `components_atividades_gatilho_de_comunicacaos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tempo` int(11) DEFAULT NULL,
  `medida` varchar(255) DEFAULT NULL,
  `email` tinyint(1) DEFAULT NULL,
  `whatsapp` tinyint(1) DEFAULT NULL,
  `mensagem` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`mensagem`)),
  `activity_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_atividades_link_externos` */

DROP TABLE IF EXISTS `components_atividades_link_externos`;

CREATE TABLE `components_atividades_link_externos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `descricao` longtext DEFAULT NULL,
  `activity_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_atividades_llicao_de_casas` */

DROP TABLE IF EXISTS `components_atividades_llicao_de_casas`;

CREATE TABLE `components_atividades_llicao_de_casas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `instrucao` longtext DEFAULT NULL,
  `dica` longtext DEFAULT NULL,
  `activity_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_atividades_mensagems` */

DROP TABLE IF EXISTS `components_atividades_mensagems`;

CREATE TABLE `components_atividades_mensagems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `envio_email` tinyint(1) DEFAULT NULL,
  `envio_whatsapp` tinyint(1) DEFAULT NULL,
  `mensagem_whatsapp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`mensagem_whatsapp`)),
  `activity_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_atividades_plano_acaos` */

DROP TABLE IF EXISTS `components_atividades_plano_acaos`;

CREATE TABLE `components_atividades_plano_acaos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `descricao` longtext DEFAULT NULL,
  `activity_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_atividades_prova2s` */

DROP TABLE IF EXISTS `components_atividades_prova2s`;

CREATE TABLE `components_atividades_prova2s` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `obrigatorio` tinyint(1) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `activity_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_atividades_prova2s_cmps` */

DROP TABLE IF EXISTS `components_atividades_prova2s_cmps`;

CREATE TABLE `components_atividades_prova2s_cmps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `cmp_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_atividades_prova2s_uq` (`entity_id`,`cmp_id`,`field`,`component_type`),
  KEY `components_atividades_prova2s_field_idx` (`field`),
  KEY `components_atividades_prova2s_component_type_idx` (`component_type`),
  KEY `components_atividades_prova2s_entity_fk` (`entity_id`),
  CONSTRAINT `components_atividades_prova2s_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components_atividades_prova2s` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_atividades_prova_de_conhecimento2s` */

DROP TABLE IF EXISTS `components_atividades_prova_de_conhecimento2s`;

CREATE TABLE `components_atividades_prova_de_conhecimento2s` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo_questao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_atividades_prova_de_conhecimento2s_cmps` */

DROP TABLE IF EXISTS `components_atividades_prova_de_conhecimento2s_cmps`;

CREATE TABLE `components_atividades_prova_de_conhecimento2s_cmps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `cmp_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_atividades_prova_de_conhecimento2s_uq` (`entity_id`,`cmp_id`,`field`,`component_type`),
  KEY `components_atividades_prova_de_conhecimento2s_field_idx` (`field`),
  KEY `components_atividades_prova_de_1c466_component_type_idx` (`component_type`),
  KEY `components_atividades_prova_de_conhecimento2s_entity_fk` (`entity_id`),
  CONSTRAINT `components_atividades_prova_de_conhecimento2s_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components_atividades_prova_de_conhecimento2s` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_atividades_prova_de_conhecimentos` */

DROP TABLE IF EXISTS `components_atividades_prova_de_conhecimentos`;

CREATE TABLE `components_atividades_prova_de_conhecimentos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo_q` varchar(255) DEFAULT NULL,
  `enunciado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_atividades_prova_de_conhecimentos_cmps` */

DROP TABLE IF EXISTS `components_atividades_prova_de_conhecimentos_cmps`;

CREATE TABLE `components_atividades_prova_de_conhecimentos_cmps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `cmp_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_atividades_prova_de_conhecimentos_uq` (`entity_id`,`cmp_id`,`field`,`component_type`),
  KEY `components_atividades_prova_de_conhecimentos_field_idx` (`field`),
  KEY `components_atividades_prova_de_d3461_component_type_idx` (`component_type`),
  KEY `components_atividades_prova_de_conhecimentos_entity_fk` (`entity_id`),
  CONSTRAINT `components_atividades_prova_de_conhecimentos_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components_atividades_prova_de_conhecimentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_atividades_questionarios` */

DROP TABLE IF EXISTS `components_atividades_questionarios`;

CREATE TABLE `components_atividades_questionarios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo_questionario` varchar(255) DEFAULT NULL,
  `activity_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_atividades_registro_faturamentos` */

DROP TABLE IF EXISTS `components_atividades_registro_faturamentos`;

CREATE TABLE `components_atividades_registro_faturamentos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `competencia` varchar(255) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `faturamento` tinyint(1) DEFAULT NULL,
  `renda` tinyint(1) DEFAULT NULL,
  `investimento` tinyint(1) DEFAULT NULL,
  `poupanca` tinyint(1) DEFAULT NULL,
  `despesas` tinyint(1) DEFAULT NULL,
  `numero_clientes` tinyint(1) DEFAULT NULL,
  `numero_produtos` tinyint(1) DEFAULT NULL,
  `activity_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_atividades_resposta_abertas` */

DROP TABLE IF EXISTS `components_atividades_resposta_abertas`;

CREATE TABLE `components_atividades_resposta_abertas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pergunta` varchar(255) DEFAULT NULL,
  `obrigatorio` tinyint(1) DEFAULT NULL,
  `activity_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_atividades_tarefa_de_casas` */

DROP TABLE IF EXISTS `components_atividades_tarefa_de_casas`;

CREATE TABLE `components_atividades_tarefa_de_casas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `instrucao` longtext DEFAULT NULL,
  `descricao` longtext DEFAULT NULL,
  `requer_aprovacao` tinyint(1) DEFAULT NULL,
  `activity_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_atividades_temporizadors` */

DROP TABLE IF EXISTS `components_atividades_temporizadors`;

CREATE TABLE `components_atividades_temporizadors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `duracao` int(11) DEFAULT NULL,
  `unidade` varchar(255) DEFAULT NULL,
  `activity_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_atividades_teste_de_conhecimentos` */

DROP TABLE IF EXISTS `components_atividades_teste_de_conhecimentos`;

CREATE TABLE `components_atividades_teste_de_conhecimentos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `descricao` longtext DEFAULT NULL,
  `texto_reforco` longtext DEFAULT NULL,
  `activity_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_atividades_teste_de_conhecimentos_cmps` */

DROP TABLE IF EXISTS `components_atividades_teste_de_conhecimentos_cmps`;

CREATE TABLE `components_atividades_teste_de_conhecimentos_cmps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `cmp_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_atividades_teste_de_conhecimentos_uq` (`entity_id`,`cmp_id`,`field`,`component_type`),
  KEY `components_atividades_teste_de_conhecimentos_field_idx` (`field`),
  KEY `components_atividades_teste_de_a448d_component_type_idx` (`component_type`),
  KEY `components_atividades_teste_de_conhecimentos_entity_fk` (`entity_id`),
  CONSTRAINT `components_atividades_teste_de_conhecimentos_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components_atividades_teste_de_conhecimentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_atividades_videos` */

DROP TABLE IF EXISTS `components_atividades_videos`;

CREATE TABLE `components_atividades_videos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `descricao` longtext DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `activity_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_atividades_visita_tecnicas` */

DROP TABLE IF EXISTS `components_atividades_visita_tecnicas`;

CREATE TABLE `components_atividades_visita_tecnicas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `descricao` longtext DEFAULT NULL,
  `activity_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_criterio_qualificacao_criterio_qualificacaos` */

DROP TABLE IF EXISTS `components_criterio_qualificacao_criterio_qualificacaos`;

CREATE TABLE `components_criterio_qualificacao_criterio_qualificacaos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tempo_negocio` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tempo_negocio`)),
  `renda_familiar_percapta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`renda_familiar_percapta`)),
  `nao_possuir_carteira_assinada` tinyint(1) DEFAULT NULL,
  `nao_exercer_cargo_publico` tinyint(1) DEFAULT NULL,
  `possuir_acesso_internet` tinyint(1) DEFAULT NULL,
  `possuir_whatsapp` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_criterios_criterio_beneficiamentos` */

DROP TABLE IF EXISTS `components_criterios_criterio_beneficiamentos`;

CREATE TABLE `components_criterios_criterio_beneficiamentos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `percentual_minimo` int(11) DEFAULT NULL,
  `tipos_atividade` longtext DEFAULT NULL,
  `modo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_criterios_criterio_certificacaos` */

DROP TABLE IF EXISTS `components_criterios_criterio_certificacaos`;

CREATE TABLE `components_criterios_criterio_certificacaos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `percentual_minimo` int(11) DEFAULT NULL,
  `tipos_atividade` longtext DEFAULT NULL,
  `presenca_minima` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_criterios_criterio_selecaos` */

DROP TABLE IF EXISTS `components_criterios_criterio_selecaos`;

CREATE TABLE `components_criterios_criterio_selecaos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regra` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `valor` varchar(255) DEFAULT NULL,
  `consequencia` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_email_emails` */

DROP TABLE IF EXISTS `components_email_emails`;

CREATE TABLE `components_email_emails` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_equipe_equipes` */

DROP TABLE IF EXISTS `components_equipe_equipes`;

CREATE TABLE `components_equipe_equipes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `papel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_equipe_equipes_colaborador_lnk` */

DROP TABLE IF EXISTS `components_equipe_equipes_colaborador_lnk`;

CREATE TABLE `components_equipe_equipes_colaborador_lnk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `equipe_id` int(10) unsigned DEFAULT NULL,
  `colaborador_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_equipe_equipes_colaborador_lnk_uq` (`equipe_id`,`colaborador_id`),
  KEY `components_equipe_equipes_colaborador_lnk_fk` (`equipe_id`),
  KEY `components_equipe_equipes_colaborador_lnk_ifk` (`colaborador_id`),
  CONSTRAINT `components_equipe_equipes_colaborador_lnk_fk` FOREIGN KEY (`equipe_id`) REFERENCES `components_equipe_equipes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `components_equipe_equipes_colaborador_lnk_ifk` FOREIGN KEY (`colaborador_id`) REFERENCES `colaboradors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_gestor_turma_gestor_turmas` */

DROP TABLE IF EXISTS `components_gestor_turma_gestor_turmas`;

CREATE TABLE `components_gestor_turma_gestor_turmas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rotulo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_gestor_turma_gestor_turmas_colaborador_lnk` */

DROP TABLE IF EXISTS `components_gestor_turma_gestor_turmas_colaborador_lnk`;

CREATE TABLE `components_gestor_turma_gestor_turmas_colaborador_lnk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gestor_turma_id` int(10) unsigned DEFAULT NULL,
  `colaborador_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_gestor_turma_gestor_turmas_colaborad921b3_uq` (`gestor_turma_id`,`colaborador_id`),
  KEY `components_gestor_turma_gestor_turmas_colaborad921b3_fk` (`gestor_turma_id`),
  KEY `components_gestor_turma_gestor_turmas_colabora921b3_ifk` (`colaborador_id`),
  CONSTRAINT `components_gestor_turma_gestor_turmas_colabora921b3_ifk` FOREIGN KEY (`colaborador_id`) REFERENCES `colaboradors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `components_gestor_turma_gestor_turmas_colaborad921b3_fk` FOREIGN KEY (`gestor_turma_id`) REFERENCES `components_gestor_turma_gestor_turmas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_gestor_unidade_gestor_ddbf63_colaborador_lnk` */

DROP TABLE IF EXISTS `components_gestor_unidade_gestor_ddbf63_colaborador_lnk`;

CREATE TABLE `components_gestor_unidade_gestor_ddbf63_colaborador_lnk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gestor_de_unidade_id` int(10) unsigned DEFAULT NULL,
  `colaborador_id` int(10) unsigned DEFAULT NULL,
  `colaborador_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_gestor_unidade_gestor_ddbf63_colaborbcded_uq` (`gestor_de_unidade_id`,`colaborador_id`),
  KEY `components_gestor_unidade_gestor_ddbf63_colaborbcded_fk` (`gestor_de_unidade_id`),
  KEY `components_gestor_unidade_gestor_ddbf63_colabobcded_ifk` (`colaborador_id`),
  KEY `components_gestor_unidade_gestor_ddbf63_colabobcded_ofk` (`colaborador_ord`),
  CONSTRAINT `components_gestor_unidade_gestor_ddbf63_colabobcded_ifk` FOREIGN KEY (`colaborador_id`) REFERENCES `colaboradors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `components_gestor_unidade_gestor_ddbf63_colaborbcded_fk` FOREIGN KEY (`gestor_de_unidade_id`) REFERENCES `components_gestor_unidade_gestor_de_unidades` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_gestor_unidade_gestor_de_undbf63_unidade_lnk` */

DROP TABLE IF EXISTS `components_gestor_unidade_gestor_de_undbf63_unidade_lnk`;

CREATE TABLE `components_gestor_unidade_gestor_de_undbf63_unidade_lnk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gestor_de_unidade_id` int(10) unsigned DEFAULT NULL,
  `localidade_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_gestor_unidade_gestor_de_undbf63_uni8960b_uq` (`gestor_de_unidade_id`,`localidade_id`),
  KEY `components_gestor_unidade_gestor_de_undbf63_uni8960b_fk` (`gestor_de_unidade_id`),
  KEY `components_gestor_unidade_gestor_de_undbf63_un8960b_ifk` (`localidade_id`),
  CONSTRAINT `components_gestor_unidade_gestor_de_undbf63_un8960b_ifk` FOREIGN KEY (`localidade_id`) REFERENCES `localidades` (`id`) ON DELETE CASCADE,
  CONSTRAINT `components_gestor_unidade_gestor_de_undbf63_uni8960b_fk` FOREIGN KEY (`gestor_de_unidade_id`) REFERENCES `components_gestor_unidade_gestor_de_unidades` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_gestor_unidade_gestor_de_unidades` */

DROP TABLE IF EXISTS `components_gestor_unidade_gestor_de_unidades`;

CREATE TABLE `components_gestor_unidade_gestor_de_unidades` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `grupo_whatsapp` varchar(255) DEFAULT NULL,
  `rotulo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_meta_metas` */

DROP TABLE IF EXISTS `components_meta_metas`;

CREATE TABLE `components_meta_metas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `participantes` int(11) DEFAULT NULL,
  `beneficiados` int(11) DEFAULT NULL,
  `mentorados` int(11) DEFAULT NULL,
  `doacoes` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_organizacao_organizacaos` */

DROP TABLE IF EXISTS `components_organizacao_organizacaos`;

CREATE TABLE `components_organizacao_organizacaos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) DEFAULT NULL,
  `rotulo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_organizacao_organizacaos_organizacao_lnk` */

DROP TABLE IF EXISTS `components_organizacao_organizacaos_organizacao_lnk`;

CREATE TABLE `components_organizacao_organizacaos_organizacao_lnk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `organizacao_id` int(10) unsigned DEFAULT NULL,
  `inv_organizacao_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_organizacao_organizacaos_organizacao_lnk_uq` (`organizacao_id`,`inv_organizacao_id`),
  KEY `components_organizacao_organizacaos_organizacao_lnk_fk` (`organizacao_id`),
  KEY `components_organizacao_organizacaos_organizacao_lnk_ifk` (`inv_organizacao_id`),
  CONSTRAINT `components_organizacao_organizacaos_organizacao_lnk_fk` FOREIGN KEY (`organizacao_id`) REFERENCES `components_organizacao_organizacaos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `components_organizacao_organizacaos_organizacao_lnk_ifk` FOREIGN KEY (`inv_organizacao_id`) REFERENCES `organizacaos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_programa_programa3s` */

DROP TABLE IF EXISTS `components_programa_programa3s`;

CREATE TABLE `components_programa_programa3s` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `periodos_disponiveis` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`periodos_disponiveis`)),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_programa_programa_3_s_programa_lnk` */

DROP TABLE IF EXISTS `components_programa_programa_3_s_programa_lnk`;

CREATE TABLE `components_programa_programa_3_s_programa_lnk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `programa_3_id` int(10) unsigned DEFAULT NULL,
  `programa_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_programa_programa_3_s_programa_lnk_uq` (`programa_3_id`,`programa_id`),
  KEY `components_programa_programa_3_s_programa_lnk_fk` (`programa_3_id`),
  KEY `components_programa_programa_3_s_programa_lnk_ifk` (`programa_id`),
  CONSTRAINT `components_programa_programa_3_s_programa_lnk_fk` FOREIGN KEY (`programa_3_id`) REFERENCES `components_programa_programa3s` (`id`) ON DELETE CASCADE,
  CONSTRAINT `components_programa_programa_3_s_programa_lnk_ifk` FOREIGN KEY (`programa_id`) REFERENCES `programas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_programa_programas` */

DROP TABLE IF EXISTS `components_programa_programas`;

CREATE TABLE `components_programa_programas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_programa_programas_modulos_lnk` */

DROP TABLE IF EXISTS `components_programa_programas_modulos_lnk`;

CREATE TABLE `components_programa_programas_modulos_lnk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `programa_id` int(10) unsigned DEFAULT NULL,
  `modulo_id` int(10) unsigned DEFAULT NULL,
  `modulo_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_programa_programas_modulos_lnk_uq` (`programa_id`,`modulo_id`),
  KEY `components_programa_programas_modulos_lnk_fk` (`programa_id`),
  KEY `components_programa_programas_modulos_lnk_ifk` (`modulo_id`),
  KEY `components_programa_programas_modulos_lnk_ofk` (`modulo_ord`),
  CONSTRAINT `components_programa_programas_modulos_lnk_fk` FOREIGN KEY (`programa_id`) REFERENCES `components_programa_programas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `components_programa_programas_modulos_lnk_ifk` FOREIGN KEY (`modulo_id`) REFERENCES `modulos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_telefone_telefones` */

DROP TABLE IF EXISTS `components_telefone_telefones`;

CREATE TABLE `components_telefone_telefones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `telefone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_tipos_atividade_resposta_abertas` */

DROP TABLE IF EXISTS `components_tipos_atividade_resposta_abertas`;

CREATE TABLE `components_tipos_atividade_resposta_abertas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pergunta` longtext DEFAULT NULL,
  `resposta_obrigatoria` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_tipos_atividade_teste_de_conhecimentos` */

DROP TABLE IF EXISTS `components_tipos_atividade_teste_de_conhecimentos`;

CREATE TABLE `components_tipos_atividade_teste_de_conhecimentos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `resposta_multipla` tinyint(1) DEFAULT NULL,
  `descricao` longtext DEFAULT NULL,
  `texto_reforco` longtext DEFAULT NULL,
  `resposta_obrigatoria` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_tipos_atividade_teste_de_conhecimentos_cmps` */

DROP TABLE IF EXISTS `components_tipos_atividade_teste_de_conhecimentos_cmps`;

CREATE TABLE `components_tipos_atividade_teste_de_conhecimentos_cmps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `cmp_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_tipos_atividade_teste_de_conhecimentos_uq` (`entity_id`,`cmp_id`,`field`,`component_type`),
  KEY `components_tipos_atividade_teste_de_conhd5808_field_idx` (`field`),
  KEY `components_tipos_atividade_testd5808_component_type_idx` (`component_type`),
  KEY `components_tipos_atividade_teste_de_conhd5808_entity_fk` (`entity_id`),
  CONSTRAINT `components_tipos_atividade_teste_de_conhd5808_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components_tipos_atividade_teste_de_conhecimentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_whatsapp_item_mensagem_whatsapps` */

DROP TABLE IF EXISTS `components_whatsapp_item_mensagem_whatsapps`;

CREATE TABLE `components_whatsapp_item_mensagem_whatsapps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo_atividade` varchar(255) DEFAULT NULL,
  `template` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`template`)),
  `titulo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_whatsapp_mensagem_inicials` */

DROP TABLE IF EXISTS `components_whatsapp_mensagem_inicials`;

CREATE TABLE `components_whatsapp_mensagem_inicials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`template`)),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_whatsapp_selecao_aprovadas` */

DROP TABLE IF EXISTS `components_whatsapp_selecao_aprovadas`;

CREATE TABLE `components_whatsapp_selecao_aprovadas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`template`)),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_whatsapp_selecao_convite_entrevistas` */

DROP TABLE IF EXISTS `components_whatsapp_selecao_convite_entrevistas`;

CREATE TABLE `components_whatsapp_selecao_convite_entrevistas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`template`)),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `components_whatsapp_selecao_nao_selecionadas` */

DROP TABLE IF EXISTS `components_whatsapp_selecao_nao_selecionadas`;

CREATE TABLE `components_whatsapp_selecao_nao_selecionadas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`template`)),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `constantes` */

DROP TABLE IF EXISTS `constantes`;

CREATE TABLE `constantes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `texto` longtext DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `constantes_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `constantes_created_by_id_fk` (`created_by_id`),
  KEY `constantes_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `constantes_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `constantes_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `edicaos` */

DROP TABLE IF EXISTS `edicaos`;

CREATE TABLE `edicaos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `ano_referencia` int(11) DEFAULT NULL,
  `edicao` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  `abertura_inscricao` datetime(6) DEFAULT NULL,
  `encerramento_inscricao` datetime(6) DEFAULT NULL,
  `inicio_selecao` date DEFAULT NULL,
  `termino_selecao` date DEFAULT NULL,
  `inicio_programa` date DEFAULT NULL,
  `termino_programa` date DEFAULT NULL,
  `instrucao_inscricao` longtext DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `mensagem_inscricao` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`mensagem_inscricao`)),
  `permite_envio_whatsapp` tinyint(1) DEFAULT NULL,
  `periodos_disponiveis` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`periodos_disponiveis`)),
  `teste_senna` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`teste_senna`)),
  PRIMARY KEY (`id`),
  KEY `edicaos_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `edicaos_created_by_id_fk` (`created_by_id`),
  KEY `edicaos_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `edicaos_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `edicaos_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `edicaos_cmps` */

DROP TABLE IF EXISTS `edicaos_cmps`;

CREATE TABLE `edicaos_cmps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `cmp_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `edicaos_uq` (`entity_id`,`cmp_id`,`field`,`component_type`),
  KEY `edicaos_field_idx` (`field`),
  KEY `edicaos_component_type_idx` (`component_type`),
  KEY `edicaos_entity_fk` (`entity_id`),
  CONSTRAINT `edicaos_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `edicaos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `edicaos_formulario_lnk` */

DROP TABLE IF EXISTS `edicaos_formulario_lnk`;

CREATE TABLE `edicaos_formulario_lnk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `edicao_id` int(10) unsigned DEFAULT NULL,
  `formulario_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `edicaos_formulario_lnk_uq` (`edicao_id`,`formulario_id`),
  KEY `edicaos_formulario_lnk_fk` (`edicao_id`),
  KEY `edicaos_formulario_lnk_ifk` (`formulario_id`),
  CONSTRAINT `edicaos_formulario_lnk_fk` FOREIGN KEY (`edicao_id`) REFERENCES `edicaos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `edicaos_formulario_lnk_ifk` FOREIGN KEY (`formulario_id`) REFERENCES `formularios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `edicaos_mensagens_whatsapp_lnk` */

DROP TABLE IF EXISTS `edicaos_mensagens_whatsapp_lnk`;

CREATE TABLE `edicaos_mensagens_whatsapp_lnk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `edicao_id` int(10) unsigned DEFAULT NULL,
  `mensagens_whatsapp_id` int(10) unsigned DEFAULT NULL,
  `edicao_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `edicaos_mensagens_whatsapp_lnk_uq` (`edicao_id`,`mensagens_whatsapp_id`),
  KEY `edicaos_mensagens_whatsapp_lnk_fk` (`edicao_id`),
  KEY `edicaos_mensagens_whatsapp_lnk_ifk` (`mensagens_whatsapp_id`),
  KEY `edicaos_mensagens_whatsapp_lnk_oifk` (`edicao_ord`),
  CONSTRAINT `edicaos_mensagens_whatsapp_lnk_fk` FOREIGN KEY (`edicao_id`) REFERENCES `edicaos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `edicaos_mensagens_whatsapp_lnk_ifk` FOREIGN KEY (`mensagens_whatsapp_id`) REFERENCES `mensagens_whatsapps` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `edicaos_modulos_lnk` */

DROP TABLE IF EXISTS `edicaos_modulos_lnk`;

CREATE TABLE `edicaos_modulos_lnk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `edicao_id` int(10) unsigned DEFAULT NULL,
  `modulo_id` int(10) unsigned DEFAULT NULL,
  `modulo_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `edicaos_modulos_lnk_uq` (`edicao_id`,`modulo_id`),
  KEY `edicaos_modulos_lnk_fk` (`edicao_id`),
  KEY `edicaos_modulos_lnk_ifk` (`modulo_id`),
  KEY `edicaos_modulos_lnk_ofk` (`modulo_ord`),
  CONSTRAINT `edicaos_modulos_lnk_fk` FOREIGN KEY (`edicao_id`) REFERENCES `edicaos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `edicaos_modulos_lnk_ifk` FOREIGN KEY (`modulo_id`) REFERENCES `modulos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `edicaos_programa_lnk` */

DROP TABLE IF EXISTS `edicaos_programa_lnk`;

CREATE TABLE `edicaos_programa_lnk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `edicao_id` int(10) unsigned DEFAULT NULL,
  `programa_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `edicaos_programa_lnk_uq` (`edicao_id`,`programa_id`),
  KEY `edicaos_programa_lnk_fk` (`edicao_id`),
  KEY `edicaos_programa_lnk_ifk` (`programa_id`),
  CONSTRAINT `edicaos_programa_lnk_fk` FOREIGN KEY (`edicao_id`) REFERENCES `edicaos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `edicaos_programa_lnk_ifk` FOREIGN KEY (`programa_id`) REFERENCES `programas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `files` */

DROP TABLE IF EXISTS `files`;

CREATE TABLE `files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alternative_text` longtext DEFAULT NULL,
  `caption` longtext DEFAULT NULL,
  `focal_point` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`focal_point`)),
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `formats` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`formats`)),
  `hash` varchar(255) DEFAULT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `mime` varchar(255) DEFAULT NULL,
  `size` decimal(10,2) DEFAULT NULL,
  `url` longtext DEFAULT NULL,
  `preview_url` longtext DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `provider_metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`provider_metadata`)),
  `folder_path` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `upload_files_folder_path_index` (`folder_path`),
  KEY `upload_files_created_at_index` (`created_at`),
  KEY `upload_files_updated_at_index` (`updated_at`),
  KEY `upload_files_name_index` (`name`),
  KEY `upload_files_size_index` (`size`),
  KEY `upload_files_ext_index` (`ext`),
  KEY `files_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `files_created_by_id_fk` (`created_by_id`),
  KEY `files_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `files_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `files_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `files_folder_lnk` */

DROP TABLE IF EXISTS `files_folder_lnk`;

CREATE TABLE `files_folder_lnk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int(10) unsigned DEFAULT NULL,
  `folder_id` int(10) unsigned DEFAULT NULL,
  `file_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `files_folder_lnk_uq` (`file_id`,`folder_id`),
  KEY `files_folder_lnk_fk` (`file_id`),
  KEY `files_folder_lnk_ifk` (`folder_id`),
  KEY `files_folder_lnk_oifk` (`file_ord`),
  CONSTRAINT `files_folder_lnk_fk` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `files_folder_lnk_ifk` FOREIGN KEY (`folder_id`) REFERENCES `upload_folders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `files_related_mph` */

DROP TABLE IF EXISTS `files_related_mph`;

CREATE TABLE `files_related_mph` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int(10) unsigned DEFAULT NULL,
  `related_id` int(10) unsigned DEFAULT NULL,
  `related_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `files_related_mph_fk` (`file_id`),
  KEY `files_related_mph_oidx` (`order`),
  KEY `files_related_mph_idix` (`related_id`),
  CONSTRAINT `files_related_mph_fk` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `formularios` */

DROP TABLE IF EXISTS `formularios`;

CREATE TABLE `formularios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `formularios_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `formularios_created_by_id_fk` (`created_by_id`),
  KEY `formularios_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `formularios_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `formularios_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `formularios_cmps` */

DROP TABLE IF EXISTS `formularios_cmps`;

CREATE TABLE `formularios_cmps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `cmp_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `formularios_uq` (`entity_id`,`cmp_id`,`field`,`component_type`),
  KEY `formularios_field_idx` (`field`),
  KEY `formularios_component_type_idx` (`component_type`),
  KEY `formularios_entity_fk` (`entity_id`),
  CONSTRAINT `formularios_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `formularios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `gupshup_credenciais` */

DROP TABLE IF EXISTS `gupshup_credenciais`;

CREATE TABLE `gupshup_credenciais` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `app_id` varchar(255) DEFAULT NULL,
  `api_key` varchar(255) DEFAULT NULL,
  `source_phone` varchar(255) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gupshup_credenciais_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `gupshup_credenciais_created_by_id_fk` (`created_by_id`),
  KEY `gupshup_credenciais_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `gupshup_credenciais_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `gupshup_credenciais_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `i18n_locale` */

DROP TABLE IF EXISTS `i18n_locale`;

CREATE TABLE `i18n_locale` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `i18n_locale_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `i18n_locale_created_by_id_fk` (`created_by_id`),
  KEY `i18n_locale_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `i18n_locale_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `i18n_locale_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `localidades` */

DROP TABLE IF EXISTS `localidades`;

CREATE TABLE `localidades` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `localidades_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `localidades_created_by_id_fk` (`created_by_id`),
  KEY `localidades_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `localidades_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `localidades_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `mensagens_whatsapps` */

DROP TABLE IF EXISTS `mensagens_whatsapps`;

CREATE TABLE `mensagens_whatsapps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `descricao` longtext DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mensagens_whatsapps_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `mensagens_whatsapps_created_by_id_fk` (`created_by_id`),
  KEY `mensagens_whatsapps_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `mensagens_whatsapps_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `mensagens_whatsapps_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `mensagens_whatsapps_cmps` */

DROP TABLE IF EXISTS `mensagens_whatsapps_cmps`;

CREATE TABLE `mensagens_whatsapps_cmps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `cmp_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mensagens_whatsapps_uq` (`entity_id`,`cmp_id`,`field`,`component_type`),
  KEY `mensagens_whatsapps_field_idx` (`field`),
  KEY `mensagens_whatsapps_component_type_idx` (`component_type`),
  KEY `mensagens_whatsapps_entity_fk` (`entity_id`),
  CONSTRAINT `mensagens_whatsapps_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `mensagens_whatsapps` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `modulos` */

DROP TABLE IF EXISTS `modulos`;

CREATE TABLE `modulos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `versao` int(11) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `metodo_aplicacao` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `modulos_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `modulos_created_by_id_fk` (`created_by_id`),
  KEY `modulos_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `modulos_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `modulos_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `modulos_area_lnk` */

DROP TABLE IF EXISTS `modulos_area_lnk`;

CREATE TABLE `modulos_area_lnk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `modulo_id` int(10) unsigned DEFAULT NULL,
  `area_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `modulos_area_lnk_uq` (`modulo_id`,`area_id`),
  KEY `modulos_area_lnk_fk` (`modulo_id`),
  KEY `modulos_area_lnk_ifk` (`area_id`),
  CONSTRAINT `modulos_area_lnk_fk` FOREIGN KEY (`modulo_id`) REFERENCES `modulos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `modulos_area_lnk_ifk` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `modulos_cmps` */

DROP TABLE IF EXISTS `modulos_cmps`;

CREATE TABLE `modulos_cmps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `cmp_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `modulos_uq` (`entity_id`,`cmp_id`,`field`,`component_type`),
  KEY `modulos_field_idx` (`field`),
  KEY `modulos_component_type_idx` (`component_type`),
  KEY `modulos_entity_fk` (`entity_id`),
  CONSTRAINT `modulos_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `modulos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=460 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `organizacaos` */

DROP TABLE IF EXISTS `organizacaos`;

CREATE TABLE `organizacaos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `razao_social` varchar(255) DEFAULT NULL,
  `nome_fantasia` varchar(255) DEFAULT NULL,
  `cep` varchar(255) DEFAULT NULL,
  `cnpj` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `responsavel` varchar(255) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `uf` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organizacaos_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `organizacaos_created_by_id_fk` (`created_by_id`),
  KEY `organizacaos_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `organizacaos_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `organizacaos_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `programas` */

DROP TABLE IF EXISTS `programas`;

CREATE TABLE `programas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `descricao` longtext DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `programas_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `programas_created_by_id_fk` (`created_by_id`),
  KEY `programas_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `programas_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `programas_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `ramo_atuacaos` */

DROP TABLE IF EXISTS `ramo_atuacaos`;

CREATE TABLE `ramo_atuacaos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ramo_atuacaos_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `ramo_atuacaos_created_by_id_fk` (`created_by_id`),
  KEY `ramo_atuacaos_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `ramo_atuacaos_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ramo_atuacaos_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `setor_atuacaos` */

DROP TABLE IF EXISTS `setor_atuacaos`;

CREATE TABLE `setor_atuacaos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `setor_atuacaos_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `setor_atuacaos_created_by_id_fk` (`created_by_id`),
  KEY `setor_atuacaos_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `setor_atuacaos_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `setor_atuacaos_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `strapi_ai_localization_jobs` */

DROP TABLE IF EXISTS `strapi_ai_localization_jobs`;

CREATE TABLE `strapi_ai_localization_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content_type` varchar(255) NOT NULL,
  `related_document_id` varchar(255) NOT NULL,
  `source_locale` varchar(255) NOT NULL,
  `target_locales` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`target_locales`)),
  `status` varchar(255) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `strapi_ai_metadata_jobs` */

DROP TABLE IF EXISTS `strapi_ai_metadata_jobs`;

CREATE TABLE `strapi_ai_metadata_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `completed_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `strapi_api_token_permissions` */

DROP TABLE IF EXISTS `strapi_api_token_permissions`;

CREATE TABLE `strapi_api_token_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_api_token_permissions_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `strapi_api_token_permissions_created_by_id_fk` (`created_by_id`),
  KEY `strapi_api_token_permissions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_api_token_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_api_token_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `strapi_api_token_permissions_token_lnk` */

DROP TABLE IF EXISTS `strapi_api_token_permissions_token_lnk`;

CREATE TABLE `strapi_api_token_permissions_token_lnk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `api_token_permission_id` int(10) unsigned DEFAULT NULL,
  `api_token_id` int(10) unsigned DEFAULT NULL,
  `api_token_permission_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_api_token_permissions_token_lnk_uq` (`api_token_permission_id`,`api_token_id`),
  KEY `strapi_api_token_permissions_token_lnk_fk` (`api_token_permission_id`),
  KEY `strapi_api_token_permissions_token_lnk_ifk` (`api_token_id`),
  KEY `strapi_api_token_permissions_token_lnk_oifk` (`api_token_permission_ord`),
  CONSTRAINT `strapi_api_token_permissions_token_lnk_fk` FOREIGN KEY (`api_token_permission_id`) REFERENCES `strapi_api_token_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `strapi_api_token_permissions_token_lnk_ifk` FOREIGN KEY (`api_token_id`) REFERENCES `strapi_api_tokens` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `strapi_api_tokens` */

DROP TABLE IF EXISTS `strapi_api_tokens`;

CREATE TABLE `strapi_api_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `kind` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `access_key` varchar(255) DEFAULT NULL,
  `encrypted_key` longtext DEFAULT NULL,
  `last_used_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `lifespan` bigint(20) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_api_tokens_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `strapi_api_tokens_created_by_id_fk` (`created_by_id`),
  KEY `strapi_api_tokens_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_api_tokens_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_api_tokens_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `strapi_api_tokens_admin_user_owner_lnk` */

DROP TABLE IF EXISTS `strapi_api_tokens_admin_user_owner_lnk`;

CREATE TABLE `strapi_api_tokens_admin_user_owner_lnk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `api_token_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `api_token_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_api_tokens_admin_user_owner_lnk_uq` (`api_token_id`,`user_id`),
  KEY `strapi_api_tokens_admin_user_owner_lnk_fk` (`api_token_id`),
  KEY `strapi_api_tokens_admin_user_owner_lnk_ifk` (`user_id`),
  KEY `strapi_api_tokens_admin_user_owner_lnk_oifk` (`api_token_ord`),
  CONSTRAINT `strapi_api_tokens_admin_user_owner_lnk_fk` FOREIGN KEY (`api_token_id`) REFERENCES `strapi_api_tokens` (`id`) ON DELETE CASCADE,
  CONSTRAINT `strapi_api_tokens_admin_user_owner_lnk_ifk` FOREIGN KEY (`user_id`) REFERENCES `admin_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `strapi_core_store_settings` */

DROP TABLE IF EXISTS `strapi_core_store_settings`;

CREATE TABLE `strapi_core_store_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `environment` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `strapi_database_schema` */

DROP TABLE IF EXISTS `strapi_database_schema`;

CREATE TABLE `strapi_database_schema` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `schema` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`schema`)),
  `time` datetime DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `strapi_history_versions` */

DROP TABLE IF EXISTS `strapi_history_versions`;

CREATE TABLE `strapi_history_versions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content_type` varchar(255) NOT NULL,
  `related_document_id` varchar(255) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `schema` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`schema`)),
  `created_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_history_versions_created_by_id_fk` (`created_by_id`),
  CONSTRAINT `strapi_history_versions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `strapi_migrations` */

DROP TABLE IF EXISTS `strapi_migrations`;

CREATE TABLE `strapi_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `strapi_migrations_internal` */

DROP TABLE IF EXISTS `strapi_migrations_internal`;

CREATE TABLE `strapi_migrations_internal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `strapi_release_actions` */

DROP TABLE IF EXISTS `strapi_release_actions`;

CREATE TABLE `strapi_release_actions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `entry_document_id` varchar(255) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `is_entry_valid` tinyint(1) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_release_actions_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `strapi_release_actions_created_by_id_fk` (`created_by_id`),
  KEY `strapi_release_actions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_release_actions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_release_actions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `strapi_release_actions_release_lnk` */

DROP TABLE IF EXISTS `strapi_release_actions_release_lnk`;

CREATE TABLE `strapi_release_actions_release_lnk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `release_action_id` int(10) unsigned DEFAULT NULL,
  `release_id` int(10) unsigned DEFAULT NULL,
  `release_action_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_release_actions_release_lnk_uq` (`release_action_id`,`release_id`),
  KEY `strapi_release_actions_release_lnk_fk` (`release_action_id`),
  KEY `strapi_release_actions_release_lnk_ifk` (`release_id`),
  KEY `strapi_release_actions_release_lnk_oifk` (`release_action_ord`),
  CONSTRAINT `strapi_release_actions_release_lnk_fk` FOREIGN KEY (`release_action_id`) REFERENCES `strapi_release_actions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `strapi_release_actions_release_lnk_ifk` FOREIGN KEY (`release_id`) REFERENCES `strapi_releases` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `strapi_releases` */

DROP TABLE IF EXISTS `strapi_releases`;

CREATE TABLE `strapi_releases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `released_at` datetime(6) DEFAULT NULL,
  `scheduled_at` datetime(6) DEFAULT NULL,
  `timezone` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_releases_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `strapi_releases_created_by_id_fk` (`created_by_id`),
  KEY `strapi_releases_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_releases_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_releases_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `strapi_sessions` */

DROP TABLE IF EXISTS `strapi_sessions`;

CREATE TABLE `strapi_sessions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `child_id` varchar(255) DEFAULT NULL,
  `device_id` varchar(255) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `absolute_expires_at` datetime(6) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_sessions_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `strapi_sessions_created_by_id_fk` (`created_by_id`),
  KEY `strapi_sessions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_sessions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_sessions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `strapi_transfer_token_permissions` */

DROP TABLE IF EXISTS `strapi_transfer_token_permissions`;

CREATE TABLE `strapi_transfer_token_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_transfer_token_permissions_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `strapi_transfer_token_permissions_created_by_id_fk` (`created_by_id`),
  KEY `strapi_transfer_token_permissions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_transfer_token_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_transfer_token_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `strapi_transfer_token_permissions_token_lnk` */

DROP TABLE IF EXISTS `strapi_transfer_token_permissions_token_lnk`;

CREATE TABLE `strapi_transfer_token_permissions_token_lnk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transfer_token_permission_id` int(10) unsigned DEFAULT NULL,
  `transfer_token_id` int(10) unsigned DEFAULT NULL,
  `transfer_token_permission_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_transfer_token_permissions_token_lnk_uq` (`transfer_token_permission_id`,`transfer_token_id`),
  KEY `strapi_transfer_token_permissions_token_lnk_fk` (`transfer_token_permission_id`),
  KEY `strapi_transfer_token_permissions_token_lnk_ifk` (`transfer_token_id`),
  KEY `strapi_transfer_token_permissions_token_lnk_oifk` (`transfer_token_permission_ord`),
  CONSTRAINT `strapi_transfer_token_permissions_token_lnk_fk` FOREIGN KEY (`transfer_token_permission_id`) REFERENCES `strapi_transfer_token_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `strapi_transfer_token_permissions_token_lnk_ifk` FOREIGN KEY (`transfer_token_id`) REFERENCES `strapi_transfer_tokens` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `strapi_transfer_tokens` */

DROP TABLE IF EXISTS `strapi_transfer_tokens`;

CREATE TABLE `strapi_transfer_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `access_key` varchar(255) DEFAULT NULL,
  `last_used_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `lifespan` bigint(20) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_transfer_tokens_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `strapi_transfer_tokens_created_by_id_fk` (`created_by_id`),
  KEY `strapi_transfer_tokens_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_transfer_tokens_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_transfer_tokens_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `strapi_webhooks` */

DROP TABLE IF EXISTS `strapi_webhooks`;

CREATE TABLE `strapi_webhooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` longtext DEFAULT NULL,
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`headers`)),
  `events` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`events`)),
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `strapi_workflows` */

DROP TABLE IF EXISTS `strapi_workflows`;

CREATE TABLE `strapi_workflows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content_types` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`content_types`)),
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_workflows_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `strapi_workflows_created_by_id_fk` (`created_by_id`),
  KEY `strapi_workflows_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_workflows_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_workflows_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `strapi_workflows_stage_required_to_publish_lnk` */

DROP TABLE IF EXISTS `strapi_workflows_stage_required_to_publish_lnk`;

CREATE TABLE `strapi_workflows_stage_required_to_publish_lnk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `workflow_id` int(10) unsigned DEFAULT NULL,
  `workflow_stage_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_workflows_stage_required_to_publish_lnk_uq` (`workflow_id`,`workflow_stage_id`),
  KEY `strapi_workflows_stage_required_to_publish_lnk_fk` (`workflow_id`),
  KEY `strapi_workflows_stage_required_to_publish_lnk_ifk` (`workflow_stage_id`),
  CONSTRAINT `strapi_workflows_stage_required_to_publish_lnk_fk` FOREIGN KEY (`workflow_id`) REFERENCES `strapi_workflows` (`id`) ON DELETE CASCADE,
  CONSTRAINT `strapi_workflows_stage_required_to_publish_lnk_ifk` FOREIGN KEY (`workflow_stage_id`) REFERENCES `strapi_workflows_stages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `strapi_workflows_stages` */

DROP TABLE IF EXISTS `strapi_workflows_stages`;

CREATE TABLE `strapi_workflows_stages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_workflows_stages_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `strapi_workflows_stages_created_by_id_fk` (`created_by_id`),
  KEY `strapi_workflows_stages_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_workflows_stages_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_workflows_stages_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `strapi_workflows_stages_permissions_lnk` */

DROP TABLE IF EXISTS `strapi_workflows_stages_permissions_lnk`;

CREATE TABLE `strapi_workflows_stages_permissions_lnk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `workflow_stage_id` int(10) unsigned DEFAULT NULL,
  `permission_id` int(10) unsigned DEFAULT NULL,
  `permission_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_workflows_stages_permissions_lnk_uq` (`workflow_stage_id`,`permission_id`),
  KEY `strapi_workflows_stages_permissions_lnk_fk` (`workflow_stage_id`),
  KEY `strapi_workflows_stages_permissions_lnk_ifk` (`permission_id`),
  KEY `strapi_workflows_stages_permissions_lnk_ofk` (`permission_ord`),
  CONSTRAINT `strapi_workflows_stages_permissions_lnk_fk` FOREIGN KEY (`workflow_stage_id`) REFERENCES `strapi_workflows_stages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `strapi_workflows_stages_permissions_lnk_ifk` FOREIGN KEY (`permission_id`) REFERENCES `admin_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `strapi_workflows_stages_workflow_lnk` */

DROP TABLE IF EXISTS `strapi_workflows_stages_workflow_lnk`;

CREATE TABLE `strapi_workflows_stages_workflow_lnk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `workflow_stage_id` int(10) unsigned DEFAULT NULL,
  `workflow_id` int(10) unsigned DEFAULT NULL,
  `workflow_stage_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_workflows_stages_workflow_lnk_uq` (`workflow_stage_id`,`workflow_id`),
  KEY `strapi_workflows_stages_workflow_lnk_fk` (`workflow_stage_id`),
  KEY `strapi_workflows_stages_workflow_lnk_ifk` (`workflow_id`),
  KEY `strapi_workflows_stages_workflow_lnk_oifk` (`workflow_stage_ord`),
  CONSTRAINT `strapi_workflows_stages_workflow_lnk_fk` FOREIGN KEY (`workflow_stage_id`) REFERENCES `strapi_workflows_stages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `strapi_workflows_stages_workflow_lnk_ifk` FOREIGN KEY (`workflow_id`) REFERENCES `strapi_workflows` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `turmas` */

DROP TABLE IF EXISTS `turmas`;

CREATE TABLE `turmas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `grupo_whatsapp` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `vagas` int(11) DEFAULT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_fim` date DEFAULT NULL,
  `regiao` varchar(255) DEFAULT NULL,
  `modelo_mensagem_grupo` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `turmas_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `turmas_created_by_id_fk` (`created_by_id`),
  KEY `turmas_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `turmas_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `turmas_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `turmas_cmps` */

DROP TABLE IF EXISTS `turmas_cmps`;

CREATE TABLE `turmas_cmps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `cmp_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `turmas_uq` (`entity_id`,`cmp_id`,`field`,`component_type`),
  KEY `turmas_field_idx` (`field`),
  KEY `turmas_component_type_idx` (`component_type`),
  KEY `turmas_entity_fk` (`entity_id`),
  CONSTRAINT `turmas_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `turmas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `turmas_edicao_lnk` */

DROP TABLE IF EXISTS `turmas_edicao_lnk`;

CREATE TABLE `turmas_edicao_lnk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `turma_id` int(10) unsigned DEFAULT NULL,
  `edicao_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `turmas_edicao_lnk_uq` (`turma_id`,`edicao_id`),
  KEY `turmas_edicao_lnk_fk` (`turma_id`),
  KEY `turmas_edicao_lnk_ifk` (`edicao_id`),
  CONSTRAINT `turmas_edicao_lnk_fk` FOREIGN KEY (`turma_id`) REFERENCES `turmas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `turmas_edicao_lnk_ifk` FOREIGN KEY (`edicao_id`) REFERENCES `edicaos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `turmas_unidade_lnk` */

DROP TABLE IF EXISTS `turmas_unidade_lnk`;

CREATE TABLE `turmas_unidade_lnk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `turma_id` int(10) unsigned DEFAULT NULL,
  `localidade_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `turmas_unidade_lnk_uq` (`turma_id`,`localidade_id`),
  KEY `turmas_unidade_lnk_fk` (`turma_id`),
  KEY `turmas_unidade_lnk_ifk` (`localidade_id`),
  CONSTRAINT `turmas_unidade_lnk_fk` FOREIGN KEY (`turma_id`) REFERENCES `turmas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `turmas_unidade_lnk_ifk` FOREIGN KEY (`localidade_id`) REFERENCES `localidades` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `up_permissions` */

DROP TABLE IF EXISTS `up_permissions`;

CREATE TABLE `up_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `up_permissions_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `up_permissions_created_by_id_fk` (`created_by_id`),
  KEY `up_permissions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `up_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `up_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `up_permissions_role_lnk` */

DROP TABLE IF EXISTS `up_permissions_role_lnk`;

CREATE TABLE `up_permissions_role_lnk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned DEFAULT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  `permission_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `up_permissions_role_lnk_uq` (`permission_id`,`role_id`),
  KEY `up_permissions_role_lnk_fk` (`permission_id`),
  KEY `up_permissions_role_lnk_ifk` (`role_id`),
  KEY `up_permissions_role_lnk_oifk` (`permission_ord`),
  CONSTRAINT `up_permissions_role_lnk_fk` FOREIGN KEY (`permission_id`) REFERENCES `up_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `up_permissions_role_lnk_ifk` FOREIGN KEY (`role_id`) REFERENCES `up_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `up_roles` */

DROP TABLE IF EXISTS `up_roles`;

CREATE TABLE `up_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `up_roles_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `up_roles_created_by_id_fk` (`created_by_id`),
  KEY `up_roles_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `up_roles_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `up_roles_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `up_users` */

DROP TABLE IF EXISTS `up_users`;

CREATE TABLE `up_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `up_users_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `up_users_created_by_id_fk` (`created_by_id`),
  KEY `up_users_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `up_users_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `up_users_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `up_users_role_lnk` */

DROP TABLE IF EXISTS `up_users_role_lnk`;

CREATE TABLE `up_users_role_lnk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  `user_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `up_users_role_lnk_uq` (`user_id`,`role_id`),
  KEY `up_users_role_lnk_fk` (`user_id`),
  KEY `up_users_role_lnk_ifk` (`role_id`),
  KEY `up_users_role_lnk_oifk` (`user_ord`),
  CONSTRAINT `up_users_role_lnk_fk` FOREIGN KEY (`user_id`) REFERENCES `up_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `up_users_role_lnk_ifk` FOREIGN KEY (`role_id`) REFERENCES `up_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `upload_folders` */

DROP TABLE IF EXISTS `upload_folders`;

CREATE TABLE `upload_folders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `path_id` int(11) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `upload_folders_path_id_index` (`path_id`),
  UNIQUE KEY `upload_folders_path_index` (`path`),
  KEY `upload_folders_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `upload_folders_created_by_id_fk` (`created_by_id`),
  KEY `upload_folders_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `upload_folders_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `upload_folders_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `upload_folders_parent_lnk` */

DROP TABLE IF EXISTS `upload_folders_parent_lnk`;

CREATE TABLE `upload_folders_parent_lnk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `folder_id` int(10) unsigned DEFAULT NULL,
  `inv_folder_id` int(10) unsigned DEFAULT NULL,
  `folder_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `upload_folders_parent_lnk_uq` (`folder_id`,`inv_folder_id`),
  KEY `upload_folders_parent_lnk_fk` (`folder_id`),
  KEY `upload_folders_parent_lnk_ifk` (`inv_folder_id`),
  KEY `upload_folders_parent_lnk_oifk` (`folder_ord`),
  CONSTRAINT `upload_folders_parent_lnk_fk` FOREIGN KEY (`folder_id`) REFERENCES `upload_folders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `upload_folders_parent_lnk_ifk` FOREIGN KEY (`inv_folder_id`) REFERENCES `upload_folders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `variavel_whatsapps` */

DROP TABLE IF EXISTS `variavel_whatsapps`;

CREATE TABLE `variavel_whatsapps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `campo_backend` varchar(255) DEFAULT NULL,
  `descricao` longtext DEFAULT NULL,
  `permite_texto_manual` tinyint(1) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variavel_whatsapps_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `variavel_whatsapps_created_by_id_fk` (`created_by_id`),
  KEY `variavel_whatsapps_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `variavel_whatsapps_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `variavel_whatsapps_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
