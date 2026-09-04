/*
SQLyog Community v13.2.1 (64 bit)
MySQL - 11.8.6-MariaDB-log : Database - consulado_main
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`consulado_main` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

/*Table structure for table `_prisma_migrations` */

DROP TABLE IF EXISTS `_prisma_migrations`;

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) NOT NULL,
  `checksum` varchar(64) NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) NOT NULL,
  `logs` text DEFAULT NULL,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `applied_steps_count` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_acesso_internet` */

DROP TABLE IF EXISTS `tab_acesso_internet`;

CREATE TABLE `tab_acesso_internet` (
  `int_acesso_internet_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `str_slug` varchar(100) NOT NULL,
  `str_nome` varchar(100) NOT NULL,
  PRIMARY KEY (`int_acesso_internet_id_pk`),
  UNIQUE KEY `tab_acesso_internet_str_slug_key` (`str_slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_como_ficou_sabendo` */

DROP TABLE IF EXISTS `tab_como_ficou_sabendo`;

CREATE TABLE `tab_como_ficou_sabendo` (
  `int_como_ficou_sabendo_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `str_slug` varchar(100) NOT NULL,
  `str_nome` varchar(255) NOT NULL,
  PRIMARY KEY (`int_como_ficou_sabendo_id_pk`),
  UNIQUE KEY `tab_como_ficou_sabendo_slug_uq` (`str_slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_comunicacao` */

DROP TABLE IF EXISTS `tab_comunicacao`;

CREATE TABLE `tab_comunicacao` (
  `int_comunicacao_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `str_edition_slug` varchar(100) NOT NULL,
  `str_metodo` varchar(50) NOT NULL,
  `str_status_alvo` varchar(100) NOT NULL,
  `str_tipo_comunicacao` varchar(50) DEFAULT NULL,
  `str_mensagem` text NOT NULL,
  `dt_criado_em` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `str_enviado_por_gestor` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`int_comunicacao_id_pk`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_comunidade_tradicional` */

DROP TABLE IF EXISTS `tab_comunidade_tradicional`;

CREATE TABLE `tab_comunidade_tradicional` (
  `int_comunidade_tradicional_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `str_slug` varchar(100) NOT NULL,
  `str_nome` varchar(100) NOT NULL,
  `str_outro_descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`int_comunidade_tradicional_id_pk`),
  UNIQUE KEY `tab_comunidade_tradicional_str_slug_key` (`str_slug`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_constantes` */

DROP TABLE IF EXISTS `tab_constantes`;

CREATE TABLE `tab_constantes` (
  `int_constante_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `str_contante_nome` varchar(50) NOT NULL,
  `int_contante_valor` float NOT NULL,
  `dt_atualizacao` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`int_constante_id_pk`),
  KEY `tab_constantes_str_contante_nome_dt_atualizacao_idx` (`str_contante_nome`,`dt_atualizacao`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_contribuicao_renda_familiar` */

DROP TABLE IF EXISTS `tab_contribuicao_renda_familiar`;

CREATE TABLE `tab_contribuicao_renda_familiar` (
  `int_contribuicao_renda_familiar_id_pk` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `str_slug` varchar(100) DEFAULT NULL,
  `str_nome` varchar(200) NOT NULL,
  PRIMARY KEY (`int_contribuicao_renda_familiar_id_pk`),
  UNIQUE KEY `tab_contribuicao_renda_familiar_str_slug_key` (`str_slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_controle_financeiro` */

DROP TABLE IF EXISTS `tab_controle_financeiro`;

CREATE TABLE `tab_controle_financeiro` (
  `int_controle_financeiro_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `str_slug` varchar(100) NOT NULL,
  `str_nome` varchar(100) NOT NULL,
  PRIMARY KEY (`int_controle_financeiro_id_pk`),
  UNIQUE KEY `tab_controle_financeiro_str_slug_key` (`str_slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_cor` */

DROP TABLE IF EXISTS `tab_cor`;

CREATE TABLE `tab_cor` (
  `int_tab_cor_id_pk` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `str_slug` varchar(100) DEFAULT NULL,
  `str_nome` varchar(100) NOT NULL,
  PRIMARY KEY (`int_tab_cor_id_pk`),
  UNIQUE KEY `tab_cor_str_slug_key` (`str_slug`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_disparo_whatsapp` */

DROP TABLE IF EXISTS `tab_disparo_whatsapp`;

CREATE TABLE `tab_disparo_whatsapp` (
  `int_disparo_whatsapp_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `str_gupshup_message_id` varchar(100) DEFAULT NULL,
  `str_gupshup_gs_id` varchar(100) DEFAULT NULL,
  `str_template_id` varchar(100) DEFAULT NULL,
  `str_template_nome` varchar(255) DEFAULT NULL,
  `json_parametros_template` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`json_parametros_template`)),
  `str_texto_livre` text DEFAULT NULL,
  `str_telefone_destino` varchar(20) NOT NULL,
  `int_usuario_id_fk` int(11) DEFAULT NULL,
  `int_usuario_edicao_id_fk` int(11) DEFAULT NULL,
  `str_fluxo` varchar(80) NOT NULL,
  `str_edicao_document_id` varchar(36) DEFAULT NULL,
  `str_edicao_slug` varchar(100) DEFAULT NULL,
  `int_entrevista_id_fk` int(11) DEFAULT NULL,
  `int_comunicacao_id_fk` int(11) DEFAULT NULL,
  `str_disparado_por_tipo` varchar(20) NOT NULL,
  `str_disparado_por_gestor` varchar(36) DEFAULT NULL,
  `int_disparado_por_usuario_fk` int(11) DEFAULT NULL,
  `str_status_envio` varchar(30) NOT NULL DEFAULT 'pendente',
  `bl_requer_resposta` tinyint(1) NOT NULL DEFAULT 0,
  `str_erro_envio` text DEFAULT NULL,
  `json_resposta_envio` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`json_resposta_envio`)),
  `dt_disparado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `dt_entregue_em` timestamp NULL DEFAULT NULL,
  `dt_lida_em` timestamp NULL DEFAULT NULL,
  `dt_resposta_recebida_em` timestamp NULL DEFAULT NULL,
  `dt_atualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`int_disparo_whatsapp_id_pk`),
  KEY `tab_disparo_whatsapp_gupshup_msg_idx` (`str_gupshup_message_id`),
  KEY `tab_disparo_whatsapp_gupshup_gs_idx` (`str_gupshup_gs_id`),
  KEY `tab_disparo_whatsapp_usuario_edicao_idx` (`int_usuario_edicao_id_fk`),
  KEY `tab_disparo_whatsapp_fluxo_status_idx` (`str_fluxo`,`str_status_envio`),
  KEY `tab_disparo_whatsapp_entrevista_idx` (`int_entrevista_id_fk`),
  KEY `tab_disparo_whatsapp_comunicacao_idx` (`int_comunicacao_id_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_disparo_whatsapp_evento` */

DROP TABLE IF EXISTS `tab_disparo_whatsapp_evento`;

CREATE TABLE `tab_disparo_whatsapp_evento` (
  `int_disparo_whatsapp_evento_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `int_disparo_whatsapp_id_fk` int(11) NOT NULL,
  `str_tipo_evento` varchar(40) NOT NULL,
  `json_payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`json_payload`)),
  `dt_recebido_em` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`int_disparo_whatsapp_evento_id_pk`),
  KEY `tab_disparo_whatsapp_evento_disparo_idx` (`int_disparo_whatsapp_id_fk`),
  CONSTRAINT `tab_disparo_whatsapp_evento_disparo_fk` FOREIGN KEY (`int_disparo_whatsapp_id_fk`) REFERENCES `tab_disparo_whatsapp` (`int_disparo_whatsapp_id_pk`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_empreendimento` */

DROP TABLE IF EXISTS `tab_empreendimento`;

CREATE TABLE `tab_empreendimento` (
  `int_empreendimento_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `str_cnpj_hash` varchar(64) DEFAULT NULL,
  `str_cnpj_mascarado` varchar(20) DEFAULT NULL,
  `str_nome` varchar(255) NOT NULL,
  `int_setor_id_fk` int(11) DEFAULT NULL,
  `int_ramo_atuacao_id_fk` int(10) unsigned DEFAULT NULL,
  `int_formalizacao_id_fk` int(11) DEFAULT NULL,
  `str_tipo_negocio_outro` varchar(255) DEFAULT NULL,
  `str_sobre_negocio` text DEFAULT NULL,
  `int_tempo_negocio_id_fk` int(11) DEFAULT NULL,
  `int_local_atividade_id_fk` int(11) DEFAULT NULL,
  `str_local_atividade_outro` varchar(255) DEFAULT NULL,
  `dt_criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `dt_atualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`int_empreendimento_id_pk`),
  UNIQUE KEY `tab_empreendimento_str_cnpj_hash_key` (`str_cnpj_hash`),
  KEY `tab_empreendimento_setor_idx` (`int_setor_id_fk`),
  KEY `tab_empreendimento_ramo_idx` (`int_ramo_atuacao_id_fk`),
  KEY `tab_empreendimento_formalizacao_idx` (`int_formalizacao_id_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=440 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_entrevista` */

DROP TABLE IF EXISTS `tab_entrevista`;

CREATE TABLE `tab_entrevista` (
  `int_entrevista_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `str_nome` varchar(255) NOT NULL,
  `dt_data` datetime NOT NULL,
  `str_hora` varchar(10) NOT NULL,
  `str_local` varchar(255) NOT NULL,
  `str_formato` varchar(50) NOT NULL,
  `int_capacidade` int(10) unsigned NOT NULL,
  `str_relato` text DEFAULT NULL,
  `str_cms_edicao_document_id` varchar(36) NOT NULL,
  `dt_criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `dt_atualizado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `str_criado_por_gestor` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`int_entrevista_id_pk`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_escolaridade` */

DROP TABLE IF EXISTS `tab_escolaridade`;

CREATE TABLE `tab_escolaridade` (
  `int_escolaridade_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `str_slug` varchar(100) DEFAULT NULL,
  `str_nome` varchar(100) NOT NULL,
  `str_descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`int_escolaridade_id_pk`),
  UNIQUE KEY `tab_escolaridade_str_slug_key` (`str_slug`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_estado_civil` */

DROP TABLE IF EXISTS `tab_estado_civil`;

CREATE TABLE `tab_estado_civil` (
  `int_estado_civil_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `str_slug` varchar(100) NOT NULL,
  `str_nome` varchar(100) NOT NULL,
  PRIMARY KEY (`int_estado_civil_id_pk`),
  UNIQUE KEY `tab_estado_civil_str_slug_key` (`str_slug`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_faturamento` */

DROP TABLE IF EXISTS `tab_faturamento`;

CREATE TABLE `tab_faturamento` (
  `int_faturamento_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `str_slug` varchar(100) DEFAULT NULL,
  `str_nome` varchar(50) NOT NULL,
  `int_intervalo_minimo` decimal(10,2) NOT NULL,
  `int_intervalo_maximo` decimal(10,2) NOT NULL,
  `str_descritivo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`int_faturamento_id_pk`),
  UNIQUE KEY `tab_faturamento_str_slug_key` (`str_slug`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_fonte_renda` */

DROP TABLE IF EXISTS `tab_fonte_renda`;

CREATE TABLE `tab_fonte_renda` (
  `int_fonte_renda_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `str_slug` varchar(100) DEFAULT NULL,
  `str_nome` varchar(255) NOT NULL,
  PRIMARY KEY (`int_fonte_renda_id_pk`),
  UNIQUE KEY `tab_fonte_renda_str_slug_key` (`str_slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_formalizacao` */

DROP TABLE IF EXISTS `tab_formalizacao`;

CREATE TABLE `tab_formalizacao` (
  `int_formalizacao_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `str_slug` varchar(100) DEFAULT NULL,
  `str_nome` varchar(255) NOT NULL,
  `dt_criado_em` datetime DEFAULT current_timestamp(),
  `dt_atualizado_em` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`int_formalizacao_id_pk`),
  UNIQUE KEY `tab_formalizacao_str_slug_key` (`str_slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_genero` */

DROP TABLE IF EXISTS `tab_genero`;

CREATE TABLE `tab_genero` (
  `int_genero_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `str_slug` varchar(100) DEFAULT NULL,
  `str_descricao` varchar(100) NOT NULL,
  `bl_ativo` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`int_genero_id_pk`),
  UNIQUE KEY `tab_genero_str_slug_key` (`str_slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_gestor_auditoria` */

DROP TABLE IF EXISTS `tab_gestor_auditoria`;

CREATE TABLE `tab_gestor_auditoria` (
  `int_gestor_auditoria_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `str_gestor` varchar(36) NOT NULL,
  `str_nome_gestor` varchar(255) DEFAULT NULL,
  `str_email_gestor` varchar(255) DEFAULT NULL,
  `str_acao` varchar(100) NOT NULL,
  `str_tipo_entidade` varchar(50) NOT NULL,
  `str_id_entidade` varchar(36) DEFAULT NULL,
  `str_id_edicao` varchar(36) DEFAULT NULL,
  `json_antes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`json_antes`)),
  `json_depois` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`json_depois`)),
  `json_meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`json_meta`)),
  `dt_criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`int_gestor_auditoria_id_pk`),
  KEY `tab_gestor_auditoria_edicao_idx` (`str_id_edicao`,`dt_criado_em`),
  KEY `tab_gestor_auditoria_gestor_idx` (`str_gestor`,`dt_criado_em`),
  KEY `tab_gestor_auditoria_acao_idx` (`str_acao`,`dt_criado_em`),
  KEY `tab_gestor_auditoria_entidade_idx` (`str_tipo_entidade`,`str_id_entidade`)
) ENGINE=InnoDB AUTO_INCREMENT=537 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_gestor_login` */

DROP TABLE IF EXISTS `tab_gestor_login`;

CREATE TABLE `tab_gestor_login` (
  `str_cms_colaborador_document_id` varchar(36) NOT NULL,
  `str_codigo` varchar(255) NOT NULL,
  `dt_valido_ate` datetime NOT NULL DEFAULT (current_timestamp() + interval 1 hour),
  `dt_usado` date DEFAULT NULL,
  `str_refresh_token` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`str_cms_colaborador_document_id`,`str_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_inscricao` */

DROP TABLE IF EXISTS `tab_inscricao`;

CREATE TABLE `tab_inscricao` (
  `int_inscricao_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `int_usuario_edicao_id_fk` int(11) NOT NULL,
  `int_acesso_internet_id_fk` int(11) DEFAULT NULL,
  `bl_tem_whatsapp` tinyint(1) DEFAULT NULL,
  `dt_criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `dt_atualizado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `int_como_ficou_sabendo_id_fk` int(11) DEFAULT NULL,
  `str_como_ficou_sabendo_outro` text DEFAULT NULL,
  `bl_participou_processo_seletivo_icm` tinyint(1) DEFAULT NULL,
  `str_participou_processo_seletivo_detalhe` text DEFAULT NULL,
  `str_participou_processo_seletivo_completou_desistiu` text DEFAULT NULL,
  `str_participou_processo_seletivo_motivo_desistencia` text DEFAULT NULL,
  PRIMARY KEY (`int_inscricao_id_pk`),
  UNIQUE KEY `tab_inscricao_int_usuario_edicao_id_fk_key` (`int_usuario_edicao_id_fk`),
  KEY `tab_inscricao_int_usuario_edicao_id_fk_idx` (`int_usuario_edicao_id_fk`),
  KEY `tab_inscricao_acesso_internet_idx` (`int_acesso_internet_id_fk`),
  KEY `tab_inscricao_como_ficou_sabendo_idx` (`int_como_ficou_sabendo_id_fk`),
  CONSTRAINT `tab_inscricao_como_ficou_sabendo_fkey` FOREIGN KEY (`int_como_ficou_sabendo_id_fk`) REFERENCES `tab_como_ficou_sabendo` (`int_como_ficou_sabendo_id_pk`),
  CONSTRAINT `tab_inscricao_int_usuario_edicao_id_fk_fkey` FOREIGN KEY (`int_usuario_edicao_id_fk`) REFERENCES `tab_usuario_edicao` (`int_usuario_edicao_id_pk`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=455 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_inscricao_resposta_alternativa` */

DROP TABLE IF EXISTS `tab_inscricao_resposta_alternativa`;

CREATE TABLE `tab_inscricao_resposta_alternativa` (
  `int_inscricao_resposta_alternativa_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `int_inscricao_resposta_formulario_id_fk` int(11) NOT NULL,
  `str_cms_alternativa_cmp_id` varchar(36) NOT NULL,
  `str_resposta_texto` varchar(500) NOT NULL,
  `dt_criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`int_inscricao_resposta_alternativa_id_pk`),
  KEY `tab_inscricao_resposta_alternativa_resposta_idx` (`int_inscricao_resposta_formulario_id_fk`),
  KEY `tab_inscricao_resposta_alternativa_cms_alt_cmp_idx` (`str_cms_alternativa_cmp_id`),
  CONSTRAINT `tab_inscricao_resposta_alternativa_int_inscricao_resposta_f_fkey` FOREIGN KEY (`int_inscricao_resposta_formulario_id_fk`) REFERENCES `tab_inscricao_resposta_formulario` (`int_inscricao_resposta_formulario_id_pk`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_inscricao_resposta_formulario` */

DROP TABLE IF EXISTS `tab_inscricao_resposta_formulario`;

CREATE TABLE `tab_inscricao_resposta_formulario` (
  `int_inscricao_resposta_formulario_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `int_inscricao_id_fk` int(11) NOT NULL,
  `str_cms_formulario_document_id` varchar(36) DEFAULT NULL,
  `str_cms_questao_cmp_id` varchar(36) NOT NULL,
  `str_cms_task_cmp_id` varchar(36) NOT NULL,
  `str_cms_resposta_cmp_id` varchar(36) DEFAULT NULL,
  `str_campo_chave` varchar(100) NOT NULL,
  `str_tipo_resposta` varchar(50) NOT NULL,
  `str_resposta_texto` text DEFAULT NULL,
  `dt_criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`int_inscricao_resposta_formulario_id_pk`),
  UNIQUE KEY `tab_inscricao_resposta_formulario_uq` (`int_inscricao_id_fk`,`str_campo_chave`),
  KEY `tab_inscricao_resposta_formulario_inscricao_idx` (`int_inscricao_id_fk`),
  KEY `tab_inscricao_resposta_formulario_cms_form_doc_idx` (`str_cms_formulario_document_id`),
  KEY `tab_inscricao_resposta_formulario_cms_questao_cmp_idx` (`str_cms_questao_cmp_id`),
  KEY `tab_inscricao_resposta_formulario_cms_task_cmp_idx` (`str_cms_task_cmp_id`),
  CONSTRAINT `tab_inscricao_resposta_formulario_int_inscricao_id_fk_fkey` FOREIGN KEY (`int_inscricao_id_fk`) REFERENCES `tab_inscricao` (`int_inscricao_id_pk`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_local_atividade` */

DROP TABLE IF EXISTS `tab_local_atividade`;

CREATE TABLE `tab_local_atividade` (
  `int_local_atividade_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `str_slug` varchar(100) NOT NULL,
  `str_nome` varchar(100) NOT NULL,
  `str_outro_descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`int_local_atividade_id_pk`),
  UNIQUE KEY `tab_local_atividade_str_slug_key` (`str_slug`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_mantem_renda_negocio` */

DROP TABLE IF EXISTS `tab_mantem_renda_negocio`;

CREATE TABLE `tab_mantem_renda_negocio` (
  `int_mantem_renda_negocio_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `str_slug` varchar(100) DEFAULT NULL,
  `str_nome` varchar(250) NOT NULL,
  PRIMARY KEY (`int_mantem_renda_negocio_id_pk`),
  UNIQUE KEY `tab_mantem_renda_negocio_str_slug_key` (`str_slug`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_nacionalidade` */

DROP TABLE IF EXISTS `tab_nacionalidade`;

CREATE TABLE `tab_nacionalidade` (
  `int_nacionalidade_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `str_slug` varchar(100) DEFAULT NULL,
  `str_nome` varchar(255) DEFAULT NULL,
  `int_nacionalidade_pk` int(11) DEFAULT NULL,
  PRIMARY KEY (`int_nacionalidade_id_pk`),
  UNIQUE KEY `tab_nacionalidade_str_slug_key` (`str_slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_orientacao_sexual` */

DROP TABLE IF EXISTS `tab_orientacao_sexual`;

CREATE TABLE `tab_orientacao_sexual` (
  `int_orientacao_sexual_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `str_slug` varchar(100) NOT NULL,
  `str_nome` varchar(100) NOT NULL,
  `bl_ativo` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`int_orientacao_sexual_id_pk`),
  UNIQUE KEY `tab_orientacao_sexual_str_slug_key` (`str_slug`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_pcd` */

DROP TABLE IF EXISTS `tab_pcd`;

CREATE TABLE `tab_pcd` (
  `int_pcd_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `str_slug` varchar(100) DEFAULT NULL,
  `str_descricao` varchar(100) NOT NULL,
  `bl_ativo` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`int_pcd_id_pk`),
  UNIQUE KEY `tab_pcd_str_slug_key` (`str_slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_pre_inscricao` */

DROP TABLE IF EXISTS `tab_pre_inscricao`;

CREATE TABLE `tab_pre_inscricao` (
  `int_pre_inscricao_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `str_uuid` varchar(36) NOT NULL,
  `str_program_slug` varchar(255) NOT NULL,
  `str_edition_slug` varchar(255) NOT NULL,
  `str_apelido` varchar(255) NOT NULL,
  `str_email` varchar(255) NOT NULL,
  `str_telefone` varchar(20) NOT NULL,
  `bl_aceite_cookies` tinyint(1) NOT NULL,
  `bl_aceite_notificacao_whatsapp` tinyint(1) NOT NULL,
  `bl_ciencia_dados` tinyint(1) NOT NULL,
  `bl_aceite_termos` tinyint(1) NOT NULL,
  `bl_aceite_regulamento` tinyint(1) NOT NULL,
  `bl_cadastrado` tinyint(1) NOT NULL DEFAULT 0,
  `int_usuario_id_fk` int(11) DEFAULT NULL,
  `str_dispositivo_registro` text DEFAULT NULL,
  `str_ip_registro` varchar(45) DEFAULT NULL,
  `dt_criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `dt_atualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`int_pre_inscricao_id_pk`),
  UNIQUE KEY `tab_pre_inscricao_str_uuid_key` (`str_uuid`),
  UNIQUE KEY `tab_pre_inscricao_program_edition_email_key` (`str_program_slug`,`str_edition_slug`,`str_email`),
  UNIQUE KEY `tab_pre_inscricao_program_edition_phone_key` (`str_program_slug`,`str_edition_slug`,`str_telefone`),
  KEY `tab_pre_inscricao_usuario_idx` (`int_usuario_id_fk`),
  CONSTRAINT `tab_pre_inscricao_usuario_fkey` FOREIGN KEY (`int_usuario_id_fk`) REFERENCES `tab_usuario` (`int_usuario_id_pk`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_ramo_atuacao` */

DROP TABLE IF EXISTS `tab_ramo_atuacao`;

CREATE TABLE `tab_ramo_atuacao` (
  `int_ramo_atuacao_id_pk` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `str_slug` varchar(100) DEFAULT NULL,
  `str_nome` varchar(200) NOT NULL,
  `str_outro_descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`int_ramo_atuacao_id_pk`),
  UNIQUE KEY `tab_ramo_atuacao_str_slug_key` (`str_slug`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_rede_social` */

DROP TABLE IF EXISTS `tab_rede_social`;

CREATE TABLE `tab_rede_social` (
  `int_rede_social_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `str_slug` varchar(100) NOT NULL,
  `str_nome` varchar(100) NOT NULL,
  PRIMARY KEY (`int_rede_social_id_pk`),
  UNIQUE KEY `tab_rede_social_str_slug_key` (`str_slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_reinvestimento_lucro` */

DROP TABLE IF EXISTS `tab_reinvestimento_lucro`;

CREATE TABLE `tab_reinvestimento_lucro` (
  `int_reinvestimento_lucro_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `str_slug` varchar(100) NOT NULL,
  `str_nome` varchar(100) NOT NULL,
  PRIMARY KEY (`int_reinvestimento_lucro_id_pk`),
  UNIQUE KEY `tab_reinvestimento_lucro_str_slug_key` (`str_slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_renda` */

DROP TABLE IF EXISTS `tab_renda`;

CREATE TABLE `tab_renda` (
  `int_renda_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `str_slug` varchar(100) DEFAULT NULL,
  `str_nome` varchar(50) NOT NULL,
  `int_intervalo_minimo` decimal(10,2) NOT NULL,
  `int_intervalo_maximo` decimal(10,2) NOT NULL,
  `str_descritivo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`int_renda_id_pk`),
  UNIQUE KEY `tab_renda_str_slug_key` (`str_slug`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_salario_minimo` */

DROP TABLE IF EXISTS `tab_salario_minimo`;

CREATE TABLE `tab_salario_minimo` (
  `int_salario_minimo_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `str_nome` varchar(255) NOT NULL,
  `str_valor` varchar(50) NOT NULL,
  `dt_criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `dt_atualizado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`int_salario_minimo_id_pk`),
  UNIQUE KEY `tab_salario_minimo_str_nome_key` (`str_nome`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_setor` */

DROP TABLE IF EXISTS `tab_setor`;

CREATE TABLE `tab_setor` (
  `int_setor_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `str_slug` varchar(100) DEFAULT NULL,
  `str_nome` varchar(255) NOT NULL,
  PRIMARY KEY (`int_setor_id_pk`),
  UNIQUE KEY `tab_setor_str_slug_key` (`str_slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_tempo_negocio` */

DROP TABLE IF EXISTS `tab_tempo_negocio`;

CREATE TABLE `tab_tempo_negocio` (
  `int_tempo_negocio_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `str_slug` varchar(100) NOT NULL,
  `str_nome` varchar(100) NOT NULL,
  PRIMARY KEY (`int_tempo_negocio_id_pk`),
  UNIQUE KEY `tab_tempo_negocio_str_slug_key` (`str_slug`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_turma_atividade_extra` */

DROP TABLE IF EXISTS `tab_turma_atividade_extra`;

CREATE TABLE `tab_turma_atividade_extra` (
  `str_atividade_extra_id` varchar(36) NOT NULL,
  `str_cms_edicao_document_id` varchar(36) NOT NULL,
  `str_cms_turma_document_id` varchar(36) NOT NULL,
  `str_cms_modulo_document_id` varchar(36) NOT NULL,
  `str_titulo` varchar(500) NOT NULL,
  `str_descricao` text DEFAULT NULL,
  `dt_data` date NOT NULL,
  `str_hora` varchar(10) NOT NULL,
  `str_local` varchar(500) NOT NULL DEFAULT '',
  `str_natureza` varchar(20) NOT NULL,
  `str_link` varchar(1000) DEFAULT NULL,
  `str_criado_por_gestor` varchar(36) DEFAULT NULL,
  `dt_criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`str_atividade_extra_id`),
  KEY `tab_turma_atividade_extra_turma_idx` (`str_cms_turma_document_id`),
  KEY `tab_turma_atividade_extra_modulo_idx` (`str_cms_modulo_document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_turma_atividade_liberacao` */

DROP TABLE IF EXISTS `tab_turma_atividade_liberacao`;

CREATE TABLE `tab_turma_atividade_liberacao` (
  `int_liberacao_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `str_cms_edicao_document_id` varchar(36) NOT NULL,
  `str_cms_turma_document_id` varchar(36) NOT NULL,
  `int_cms_modulo_cmp_id` int(10) unsigned DEFAULT NULL,
  `str_atividade_extra_id` varchar(36) DEFAULT NULL,
  `str_component_type` varchar(100) DEFAULT NULL,
  `str_activity_key` varchar(36) DEFAULT NULL,
  `str_titulo` varchar(500) NOT NULL,
  `str_tipo` varchar(100) NOT NULL,
  `dt_data` date NOT NULL,
  `str_hora` varchar(10) NOT NULL,
  `str_local` varchar(500) NOT NULL DEFAULT '',
  `str_natureza` varchar(20) DEFAULT NULL,
  `str_link` varchar(1000) DEFAULT NULL,
  `str_replay` varchar(1000) DEFAULT NULL,
  `bl_cancelada` tinyint(1) NOT NULL DEFAULT 0,
  `bl_chamada_registrada` tinyint(1) NOT NULL DEFAULT 0,
  `str_liberado_por_gestor` varchar(36) DEFAULT NULL,
  `dt_liberado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `str_chamada_registrada_por_gestor` varchar(36) DEFAULT NULL,
  `dt_chamada_registrada_em` timestamp NULL DEFAULT NULL,
  `dt_atualizado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`int_liberacao_id_pk`),
  UNIQUE KEY `tab_turma_atividade_liberacao_uq_extra` (`str_cms_turma_document_id`,`str_atividade_extra_id`),
  UNIQUE KEY `tab_turma_atividade_liberacao_uq_cms` (`str_cms_turma_document_id`,`str_activity_key`),
  KEY `tab_turma_atividade_liberacao_edicao_idx` (`str_cms_edicao_document_id`),
  KEY `tab_turma_atividade_liberacao_turma_idx` (`str_cms_turma_document_id`),
  KEY `tab_turma_atividade_liberacao_extra_fk` (`str_atividade_extra_id`),
  KEY `tab_turma_atividade_liberacao_activity_key_idx` (`str_activity_key`),
  CONSTRAINT `tab_turma_atividade_liberacao_extra_fk` FOREIGN KEY (`str_atividade_extra_id`) REFERENCES `tab_turma_atividade_extra` (`str_atividade_extra_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_turma_atividade_presenca` */

DROP TABLE IF EXISTS `tab_turma_atividade_presenca`;

CREATE TABLE `tab_turma_atividade_presenca` (
  `int_presenca_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `int_liberacao_id_fk` int(11) NOT NULL,
  `int_usuario_edicao_id_fk` int(11) NOT NULL,
  `bl_presente` tinyint(1) NOT NULL DEFAULT 1,
  `str_registrada_por_gestor` varchar(36) DEFAULT NULL,
  `dt_registrada_em` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`int_presenca_id_pk`),
  UNIQUE KEY `tab_turma_atividade_presenca_uq` (`int_liberacao_id_fk`,`int_usuario_edicao_id_fk`),
  KEY `tab_turma_atividade_presenca_usuario_edicao_idx` (`int_usuario_edicao_id_fk`),
  CONSTRAINT `tab_turma_atividade_presenca_liberacao_fk` FOREIGN KEY (`int_liberacao_id_fk`) REFERENCES `tab_turma_atividade_liberacao` (`int_liberacao_id_pk`) ON DELETE CASCADE,
  CONSTRAINT `tab_turma_atividade_presenca_usuario_edicao_fk` FOREIGN KEY (`int_usuario_edicao_id_fk`) REFERENCES `tab_usuario_edicao` (`int_usuario_edicao_id_pk`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_turma_visita_tecnica` */

DROP TABLE IF EXISTS `tab_turma_visita_tecnica`;

CREATE TABLE `tab_turma_visita_tecnica` (
  `int_visita_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `str_cms_edicao_document_id` varchar(36) NOT NULL,
  `str_cms_turma_document_id` varchar(36) NOT NULL,
  `int_usuario_edicao_id_fk` int(11) NOT NULL,
  `int_cms_modulo_cmp_id` int(10) unsigned DEFAULT NULL,
  `str_activity_key` varchar(36) DEFAULT NULL,
  `dt_data` date NOT NULL,
  `str_hora` varchar(10) NOT NULL,
  `str_endereco` varchar(500) NOT NULL,
  `str_agendado_por_gestor` varchar(36) DEFAULT NULL,
  `dt_agendado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `dt_atualizado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`int_visita_id_pk`),
  UNIQUE KEY `tab_turma_visita_tecnica_uq` (`int_usuario_edicao_id_fk`),
  KEY `tab_turma_visita_tecnica_edicao_idx` (`str_cms_edicao_document_id`),
  KEY `tab_turma_visita_tecnica_turma_idx` (`str_cms_turma_document_id`),
  KEY `tab_turma_visita_tecnica_activity_key_idx` (`str_activity_key`),
  CONSTRAINT `tab_turma_visita_tecnica_usuario_edicao_fk` FOREIGN KEY (`int_usuario_edicao_id_fk`) REFERENCES `tab_usuario_edicao` (`int_usuario_edicao_id_pk`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_uso_bancario` */

DROP TABLE IF EXISTS `tab_uso_bancario`;

CREATE TABLE `tab_uso_bancario` (
  `int_uso_bancario_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `str_slug` varchar(100) DEFAULT NULL,
  `str_nome` varchar(100) NOT NULL,
  PRIMARY KEY (`int_uso_bancario_id_pk`),
  UNIQUE KEY `tab_uso_bancario_str_slug_key` (`str_slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_usuario` */

DROP TABLE IF EXISTS `tab_usuario`;

CREATE TABLE `tab_usuario` (
  `int_usuario_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `str_nome` varchar(255) DEFAULT NULL,
  `str_apelido` varchar(100) DEFAULT NULL,
  `dt_data_nascimento` date DEFAULT NULL,
  `str_documento` varchar(100) DEFAULT NULL,
  `str_cpf_hash` varchar(64) DEFAULT NULL,
  `bl_tem_cpf` tinyint(1) DEFAULT NULL,
  `dt_criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `dt_atualizado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`int_usuario_id_pk`),
  UNIQUE KEY `tab_usuario_str_cpf_hash_key` (`str_cpf_hash`)
) ENGINE=InnoDB AUTO_INCREMENT=471 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_usuario_atividade` */

DROP TABLE IF EXISTS `tab_usuario_atividade`;

CREATE TABLE `tab_usuario_atividade` (
  `int_usuario_atividade_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `int_usuario_id_fk` int(11) NOT NULL,
  `int_usuario_edicao_id_fk` int(11) NOT NULL,
  `int_usuario_modulo_id_fk` int(11) DEFAULT NULL,
  `str_program_slug` varchar(100) NOT NULL,
  `str_edition_slug` varchar(100) NOT NULL,
  `int_cms_programa_id` int(10) unsigned DEFAULT NULL,
  `str_cms_programa_document_id` varchar(36) DEFAULT NULL,
  `int_cms_edicao_id` int(10) unsigned DEFAULT NULL,
  `str_cms_edicao_document_id` varchar(36) DEFAULT NULL,
  `int_cms_unidade_id` int(10) unsigned DEFAULT NULL,
  `str_cms_unidade_document_id` varchar(36) DEFAULT NULL,
  `int_cms_turma_id` int(10) unsigned DEFAULT NULL,
  `str_cms_turma_document_id` varchar(36) DEFAULT NULL,
  `int_cms_modulo_id` int(10) unsigned NOT NULL,
  `str_cms_modulo_document_id` varchar(36) DEFAULT NULL,
  `str_cms_modulo_slug` varchar(100) DEFAULT NULL,
  `int_cms_modulo_cmp_id` int(10) unsigned NOT NULL,
  `int_cms_atividade_cmp_id` int(10) unsigned DEFAULT NULL,
  `str_tipo_atividade` varchar(100) NOT NULL,
  `str_atividade_titulo` varchar(500) DEFAULT NULL,
  `int_ordem_atividade` int(10) unsigned DEFAULT NULL,
  `str_activity_key` varchar(36) NOT NULL,
  `str_status` varchar(50) NOT NULL DEFAULT 'pending',
  `bl_concluido` tinyint(1) DEFAULT NULL,
  `dt_visualizado` datetime DEFAULT NULL,
  `dt_iniciado_em` datetime DEFAULT NULL,
  `dt_conclusao` datetime DEFAULT NULL,
  `json_resposta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`json_resposta`)),
  `str_resposta_aberta` text DEFAULT NULL,
  `int_opcao_resposta_id` int(10) unsigned DEFAULT NULL,
  `bl_correta` tinyint(1) DEFAULT NULL,
  `dec_pontuacao` decimal(10,2) DEFAULT NULL,
  `int_tentativas` int(10) unsigned NOT NULL DEFAULT 0,
  `str_dispositivo` varchar(500) DEFAULT NULL,
  `dt_criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `dt_atualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `json_meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`json_meta`)),
  PRIMARY KEY (`int_usuario_atividade_id_pk`),
  UNIQUE KEY `tab_usuario_atividade_uq` (`int_usuario_id_fk`,`int_usuario_edicao_id_fk`,`int_cms_modulo_id`,`str_activity_key`),
  KEY `tab_usuario_atividade_usuario_idx` (`int_usuario_id_fk`),
  KEY `tab_usuario_atividade_usuario_edicao_idx` (`int_usuario_edicao_id_fk`),
  KEY `tab_usuario_atividade_usuario_modulo_idx` (`int_usuario_modulo_id_fk`),
  KEY `tab_usuario_atividade_program_edition_idx` (`str_program_slug`,`str_edition_slug`),
  KEY `tab_usuario_atividade_cms_modulo_idx` (`int_cms_modulo_id`),
  KEY `tab_usuario_atividade_cms_modulo_cmp_idx` (`int_cms_modulo_cmp_id`),
  KEY `tab_usuario_atividade_cms_turma_idx` (`int_cms_turma_id`),
  KEY `tab_usuario_atividade_tipo_idx` (`str_tipo_atividade`),
  KEY `tab_usuario_atividade_status_idx` (`str_status`),
  KEY `tab_usuario_atividade_conclusao_idx` (`dt_conclusao`),
  KEY `tab_usuario_atividade_visualizado_idx` (`dt_visualizado`),
  KEY `tab_usuario_atividade_activity_key_idx` (`str_activity_key`),
  CONSTRAINT `tab_usuario_atividade_usuario_edicao_fkey` FOREIGN KEY (`int_usuario_edicao_id_fk`) REFERENCES `tab_usuario_edicao` (`int_usuario_edicao_id_pk`) ON DELETE CASCADE,
  CONSTRAINT `tab_usuario_atividade_usuario_fkey` FOREIGN KEY (`int_usuario_id_fk`) REFERENCES `tab_usuario` (`int_usuario_id_pk`) ON DELETE CASCADE,
  CONSTRAINT `tab_usuario_atividade_usuario_modulo_fkey` FOREIGN KEY (`int_usuario_modulo_id_fk`) REFERENCES `tab_usuario_modulo` (`int_usuario_modulo_id_pk`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_usuario_comunicacao` */

DROP TABLE IF EXISTS `tab_usuario_comunicacao`;

CREATE TABLE `tab_usuario_comunicacao` (
  `int_usuario_comunicacao_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `int_comunicacao_id_fk` int(11) NOT NULL,
  `int_usuario_id_fk` int(11) NOT NULL,
  `int_usuario_edicao_id_fk` int(11) DEFAULT NULL,
  `int_disparo_whatsapp_id_fk` int(11) DEFAULT NULL,
  `str_status` varchar(50) NOT NULL,
  `str_mensagem` text DEFAULT NULL,
  `dt_enviado_em` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `str_enviado_por_gestor` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`int_usuario_comunicacao_id_pk`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_usuario_demografico` */

DROP TABLE IF EXISTS `tab_usuario_demografico`;

CREATE TABLE `tab_usuario_demografico` (
  `int_usuario_demografico_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `int_tab_usuario_id_fk` int(11) NOT NULL,
  `str_cep` varchar(20) DEFAULT NULL,
  `str_logradouro` varchar(255) DEFAULT NULL,
  `str_numero` varchar(20) DEFAULT NULL,
  `str_complemento` varchar(255) DEFAULT NULL,
  `str_referencia` varchar(255) DEFAULT NULL,
  `str_cidade` varchar(100) DEFAULT NULL,
  `str_bairro` varchar(100) DEFAULT NULL,
  `str_estado` varchar(50) DEFAULT NULL,
  `int_genero_id_fk` int(11) DEFAULT NULL,
  `int_estado_civil_id_fk` int(11) DEFAULT NULL,
  `int_tab_escolaridade_id_fk` int(11) DEFAULT NULL,
  `int_tab_cor_id_fk` int(11) DEFAULT NULL,
  `int_comunidade_tradicional_id_fk` int(11) DEFAULT NULL,
  `str_comunidade_outro` varchar(255) DEFAULT NULL,
  `int_pcd_id_fk` int(11) DEFAULT NULL,
  `str_pcd_detalhe` varchar(255) DEFAULT NULL,
  `int_orientacao_sexual_id_fk` int(11) DEFAULT NULL,
  `str_orientacao_sexual_outro` varchar(255) DEFAULT NULL,
  `int_tamanho_domicilio` int(10) unsigned DEFAULT NULL,
  `int_quantidade_pessoas_sustentadas` int(10) unsigned DEFAULT NULL,
  `int_quantidade_filhos` int(10) unsigned DEFAULT NULL,
  `str_idades_filhos` varchar(255) DEFAULT NULL,
  `dt_criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_ativo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`int_usuario_demografico_id_pk`),
  KEY `tab_usuario_demografico_int_tab_usuario_id_fk_idx` (`int_tab_usuario_id_fk`),
  KEY `tab_usuario_demografico_int_comunidade_tradicional_id_fk_idx` (`int_comunidade_tradicional_id_fk`),
  KEY `tab_usuario_demografico_int_pcd_id_fk_idx` (`int_pcd_id_fk`),
  KEY `tab_usuario_demografico_int_orientacao_sexual_id_fk_idx` (`int_orientacao_sexual_id_fk`),
  CONSTRAINT `tab_usuario_demografico_int_tab_usuario_id_fk_fkey` FOREIGN KEY (`int_tab_usuario_id_fk`) REFERENCES `tab_usuario` (`int_usuario_id_pk`)
) ENGINE=InnoDB AUTO_INCREMENT=459 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_usuario_edicao` */

DROP TABLE IF EXISTS `tab_usuario_edicao`;

CREATE TABLE `tab_usuario_edicao` (
  `int_usuario_edicao_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `int_tab_usuario_id_fk` int(11) NOT NULL,
  `str_program_slug` varchar(100) NOT NULL,
  `str_edition_slug` varchar(100) NOT NULL,
  `str_cms_programa_document_id` varchar(36) DEFAULT NULL,
  `str_cms_edicao_document_id` varchar(36) DEFAULT NULL,
  `str_cms_unidade_document_id` varchar(36) DEFAULT NULL,
  `bl_presencial` tinyint(1) DEFAULT NULL,
  `bl_disponibilidade_presencial` tinyint(1) DEFAULT NULL,
  `str_periodo_slug` varchar(100) DEFAULT NULL,
  `str_uuid` varchar(36) NOT NULL,
  `str_status` varchar(50) NOT NULL DEFAULT 'pending',
  `dt_confirmado_em` datetime DEFAULT NULL,
  `dt_criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `dt_atualizado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `str_status_alterado_por_gestor` varchar(36) DEFAULT NULL,
  `dt_status_alterado_por_gestor_em` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`int_usuario_edicao_id_pk`),
  UNIQUE KEY `tab_usuario_edicao_str_uuid_key` (`str_uuid`),
  KEY `tab_usuario_edicao_int_tab_usuario_id_fk_idx` (`int_tab_usuario_id_fk`),
  KEY `tab_usuario_edicao_str_program_slug_str_edition_slug_idx` (`str_program_slug`,`str_edition_slug`),
  KEY `tab_usuario_edicao_cms_programa_doc_idx` (`str_cms_programa_document_id`),
  KEY `tab_usuario_edicao_cms_edicao_doc_idx` (`str_cms_edicao_document_id`),
  KEY `tab_usuario_edicao_cms_unidade_doc_idx` (`str_cms_unidade_document_id`),
  CONSTRAINT `tab_usuario_edicao_int_tab_usuario_id_fk_fkey` FOREIGN KEY (`int_tab_usuario_id_fk`) REFERENCES `tab_usuario` (`int_usuario_id_pk`)
) ENGINE=InnoDB AUTO_INCREMENT=461 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_usuario_empreendimento` */

DROP TABLE IF EXISTS `tab_usuario_empreendimento`;

CREATE TABLE `tab_usuario_empreendimento` (
  `int_usuario_empreendimento_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `int_usuario_id_fk` int(11) NOT NULL,
  `int_empreendimento_id_fk` int(11) NOT NULL,
  `int_usuario_edicao_id_fk` int(11) DEFAULT NULL,
  `bl_tem_negocio` tinyint(1) DEFAULT NULL,
  `bl_principal` tinyint(1) NOT NULL DEFAULT 1,
  `int_faturamento_negocio_id_fk` int(11) DEFAULT NULL,
  `int_mantem_renda_negocio_id_fk` int(11) DEFAULT NULL,
  `int_controle_financeiro_id_fk` int(11) DEFAULT NULL,
  `int_reinvestimento_lucro_id_fk` int(11) DEFAULT NULL,
  `dt_criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`int_usuario_empreendimento_id_pk`),
  UNIQUE KEY `tab_usuario_empreendimento_edicao_key` (`int_usuario_edicao_id_fk`),
  KEY `tab_usuario_empreendimento_usuario_idx` (`int_usuario_id_fk`),
  KEY `tab_usuario_empreendimento_empreendimento_idx` (`int_empreendimento_id_fk`),
  CONSTRAINT `tab_usuario_empreendimento_edicao_fkey` FOREIGN KEY (`int_usuario_edicao_id_fk`) REFERENCES `tab_usuario_edicao` (`int_usuario_edicao_id_pk`) ON DELETE CASCADE,
  CONSTRAINT `tab_usuario_empreendimento_empreendimento_fkey` FOREIGN KEY (`int_empreendimento_id_fk`) REFERENCES `tab_empreendimento` (`int_empreendimento_id_pk`),
  CONSTRAINT `tab_usuario_empreendimento_usuario_fkey` FOREIGN KEY (`int_usuario_id_fk`) REFERENCES `tab_usuario` (`int_usuario_id_pk`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=442 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_usuario_entrevista` */

DROP TABLE IF EXISTS `tab_usuario_entrevista`;

CREATE TABLE `tab_usuario_entrevista` (
  `int_usuario_entrevista_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `int_entrevista_id_fk` int(11) NOT NULL,
  `int_usuario_edicao_id_fk` int(11) NOT NULL,
  `str_resultado` varchar(20) NOT NULL DEFAULT 'agendada',
  `bl_convite_enviado` tinyint(1) NOT NULL DEFAULT 0,
  `dt_convite_enviado_em` timestamp NULL DEFAULT NULL,
  `str_canal_convite` varchar(20) DEFAULT NULL,
  `int_disparo_convite_id_fk` int(11) DEFAULT NULL,
  `bl_compareceu` tinyint(1) DEFAULT NULL,
  `str_presenca_registrada_por_gestor` varchar(36) DEFAULT NULL,
  `dt_presenca_registrada_em` timestamp NULL DEFAULT NULL,
  `str_decisao` varchar(20) DEFAULT NULL,
  `str_motivo_decisao` varchar(20) DEFAULT NULL,
  `str_decisao_por_gestor` varchar(36) DEFAULT NULL,
  `dt_decisao_em` timestamp NULL DEFAULT NULL,
  `dt_criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `dt_atualizado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `str_criado_por_gestor` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`int_usuario_entrevista_id_pk`),
  UNIQUE KEY `tab_usuario_entrevista_uq` (`int_entrevista_id_fk`,`int_usuario_edicao_id_fk`),
  KEY `tab_usuario_entrevista_entrevista_idx` (`int_entrevista_id_fk`),
  KEY `tab_usuario_entrevista_usuario_edicao_idx` (`int_usuario_edicao_id_fk`),
  KEY `tab_usuario_entrevista_disparo_convite_idx` (`int_disparo_convite_id_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_usuario_financeiro` */

DROP TABLE IF EXISTS `tab_usuario_financeiro`;

CREATE TABLE `tab_usuario_financeiro` (
  `int_usuario_financeiro_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `int_tab_usuario_id_fk` int(11) NOT NULL,
  `int_tab_uso_bancario_id_fk` int(11) DEFAULT NULL,
  `int_tab_fonte_renda_id_fk` int(11) DEFAULT NULL,
  `int_renda_familiar_id_fk` int(11) DEFAULT NULL,
  `dec_renda_pessoal` decimal(10,2) DEFAULT NULL,
  `int_tab_contribuicao_renda_familiar_id_fk` int(10) unsigned DEFAULT NULL,
  `bl_cargo_publico` tinyint(1) DEFAULT NULL,
  `dt_criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_ativo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`int_usuario_financeiro_id_pk`),
  KEY `tab_usuario_financeiro_int_tab_usuario_id_fk_idx` (`int_tab_usuario_id_fk`),
  KEY `tab_usuario_financeiro_int_tab_uso_bancario_id_fk_idx` (`int_tab_uso_bancario_id_fk`),
  KEY `tab_usuario_financeiro_int_tab_contribuicao_renda_familiar_i_idx` (`int_tab_contribuicao_renda_familiar_id_fk`),
  KEY `tab_usuario_financeiro_int_tab_fonte_renda_id_fk_fkey` (`int_tab_fonte_renda_id_fk`),
  KEY `tab_usuario_financeiro_int_renda_familiar_id_fk_fkey` (`int_renda_familiar_id_fk`),
  CONSTRAINT `tab_usuario_financeiro_int_renda_familiar_id_fk_fkey` FOREIGN KEY (`int_renda_familiar_id_fk`) REFERENCES `tab_renda` (`int_renda_id_pk`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `tab_usuario_financeiro_int_tab_contribuicao_renda_familiar__fkey` FOREIGN KEY (`int_tab_contribuicao_renda_familiar_id_fk`) REFERENCES `tab_contribuicao_renda_familiar` (`int_contribuicao_renda_familiar_id_pk`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `tab_usuario_financeiro_int_tab_fonte_renda_id_fk_fkey` FOREIGN KEY (`int_tab_fonte_renda_id_fk`) REFERENCES `tab_fonte_renda` (`int_fonte_renda_id_pk`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `tab_usuario_financeiro_int_tab_uso_bancario_id_fk_fkey` FOREIGN KEY (`int_tab_uso_bancario_id_fk`) REFERENCES `tab_uso_bancario` (`int_uso_bancario_id_pk`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `tab_usuario_financeiro_int_tab_usuario_id_fk_fkey` FOREIGN KEY (`int_tab_usuario_id_fk`) REFERENCES `tab_usuario` (`int_usuario_id_pk`)
) ENGINE=InnoDB AUTO_INCREMENT=459 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_usuario_identidade` */

DROP TABLE IF EXISTS `tab_usuario_identidade`;

CREATE TABLE `tab_usuario_identidade` (
  `int_usuario_identidade_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `int_tab_usuario_id_fk` int(11) NOT NULL,
  `str_email` varchar(255) DEFAULT NULL,
  `str_telefone` varchar(20) DEFAULT NULL,
  `dt_criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_ativo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`int_usuario_identidade_id_pk`),
  KEY `tab_usuario_identidade_int_tab_usuario_id_fk_idx` (`int_tab_usuario_id_fk`),
  CONSTRAINT `tab_usuario_identidade_int_tab_usuario_id_fk_fkey` FOREIGN KEY (`int_tab_usuario_id_fk`) REFERENCES `tab_usuario` (`int_usuario_id_pk`)
) ENGINE=InnoDB AUTO_INCREMENT=460 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_usuario_lgpd` */

DROP TABLE IF EXISTS `tab_usuario_lgpd`;

CREATE TABLE `tab_usuario_lgpd` (
  `int_usuario_lgpd_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `int_tab_usuario_id_fk` int(11) NOT NULL,
  `bl_aceite_cookies` tinyint(1) DEFAULT NULL,
  `bl_aceite_notificacao_whatsapp` tinyint(1) DEFAULT NULL,
  `bl_aceite_termos` tinyint(1) DEFAULT NULL,
  `bl_aceite_regulamento` tinyint(1) DEFAULT NULL,
  `bl_ciencia_dados` tinyint(1) DEFAULT NULL,
  `bl_ciencia_dados_final` tinyint(1) DEFAULT NULL,
  `bl_aceite_dados_sensiveis` tinyint(1) DEFAULT NULL,
  `bl_aceite_midia` tinyint(1) DEFAULT NULL,
  `bl_aceite_marketing` tinyint(1) DEFAULT NULL,
  `dt_criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_ativo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`int_usuario_lgpd_id_pk`),
  KEY `tab_usuario_lgpd_int_tab_usuario_id_fk_idx` (`int_tab_usuario_id_fk`),
  CONSTRAINT `tab_usuario_lgpd_int_tab_usuario_id_fk_fkey` FOREIGN KEY (`int_tab_usuario_id_fk`) REFERENCES `tab_usuario` (`int_usuario_id_pk`)
) ENGINE=InnoDB AUTO_INCREMENT=458 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_usuario_modulo` */

DROP TABLE IF EXISTS `tab_usuario_modulo`;

CREATE TABLE `tab_usuario_modulo` (
  `int_usuario_modulo_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `int_usuario_id_fk` int(11) NOT NULL,
  `int_usuario_edicao_id_fk` int(11) NOT NULL,
  `str_program_slug` varchar(100) NOT NULL,
  `str_edition_slug` varchar(100) NOT NULL,
  `int_cms_programa_id` int(10) unsigned DEFAULT NULL,
  `str_cms_programa_document_id` varchar(36) DEFAULT NULL,
  `int_cms_edicao_id` int(10) unsigned DEFAULT NULL,
  `str_cms_edicao_document_id` varchar(36) DEFAULT NULL,
  `int_cms_unidade_id` int(10) unsigned DEFAULT NULL,
  `str_cms_unidade_document_id` varchar(36) DEFAULT NULL,
  `int_cms_turma_id` int(10) unsigned DEFAULT NULL,
  `str_cms_turma_document_id` varchar(36) DEFAULT NULL,
  `int_cms_modulo_id` int(10) unsigned NOT NULL,
  `str_cms_modulo_document_id` varchar(36) DEFAULT NULL,
  `str_cms_modulo_slug` varchar(100) DEFAULT NULL,
  `str_modulo_nome` varchar(255) DEFAULT NULL,
  `int_modulo_versao` int(10) unsigned DEFAULT NULL,
  `str_metodo_aplicacao` varchar(50) DEFAULT NULL,
  `int_ordem_modulo` int(10) unsigned DEFAULT NULL,
  `str_status` varchar(50) NOT NULL DEFAULT 'not_started',
  `bl_concluido` tinyint(1) NOT NULL DEFAULT 0,
  `int_percentual_conclusao` int(10) unsigned DEFAULT NULL,
  `int_atividades_total` int(10) unsigned DEFAULT NULL,
  `int_atividades_concluidas` int(10) unsigned DEFAULT NULL,
  `dt_primeiro_acesso` datetime DEFAULT NULL,
  `dt_iniciado_em` datetime DEFAULT NULL,
  `dt_conclusao` datetime DEFAULT NULL,
  `str_dispositivo` varchar(500) DEFAULT NULL,
  `dt_criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `dt_atualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `json_meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`json_meta`)),
  PRIMARY KEY (`int_usuario_modulo_id_pk`),
  UNIQUE KEY `tab_usuario_modulo_uq` (`int_usuario_id_fk`,`int_usuario_edicao_id_fk`,`int_cms_modulo_id`),
  KEY `tab_usuario_modulo_usuario_idx` (`int_usuario_id_fk`),
  KEY `tab_usuario_modulo_usuario_edicao_idx` (`int_usuario_edicao_id_fk`),
  KEY `tab_usuario_modulo_program_edition_idx` (`str_program_slug`,`str_edition_slug`),
  KEY `tab_usuario_modulo_cms_modulo_idx` (`int_cms_modulo_id`),
  KEY `tab_usuario_modulo_cms_modulo_slug_idx` (`str_cms_modulo_slug`),
  KEY `tab_usuario_modulo_cms_turma_idx` (`int_cms_turma_id`),
  KEY `tab_usuario_modulo_status_idx` (`str_status`),
  KEY `tab_usuario_modulo_conclusao_idx` (`dt_conclusao`),
  CONSTRAINT `tab_usuario_modulo_usuario_edicao_fkey` FOREIGN KEY (`int_usuario_edicao_id_fk`) REFERENCES `tab_usuario_edicao` (`int_usuario_edicao_id_pk`) ON DELETE CASCADE,
  CONSTRAINT `tab_usuario_modulo_usuario_fkey` FOREIGN KEY (`int_usuario_id_fk`) REFERENCES `tab_usuario` (`int_usuario_id_pk`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_usuario_origem` */

DROP TABLE IF EXISTS `tab_usuario_origem`;

CREATE TABLE `tab_usuario_origem` (
  `int_usuario_origem_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `int_tab_usuario_id_fk` int(11) NOT NULL,
  `dt_criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `int_tab_origem_id_fk` int(11) DEFAULT NULL,
  `str_dominio` varchar(255) DEFAULT NULL,
  `str_pathname` varchar(500) DEFAULT NULL,
  `json_query_params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`json_query_params`)),
  `str_utm_source` varchar(255) DEFAULT NULL,
  `str_utm_medium` varchar(255) DEFAULT NULL,
  `str_utm_campaign` varchar(255) DEFAULT NULL,
  `str_dispositivo` text DEFAULT NULL,
  `str_ip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`int_usuario_origem_id_pk`),
  KEY `tab_usuario_origem_int_tab_usuario_id_fk_idx` (`int_tab_usuario_id_fk`),
  KEY `tab_usuario_origem_int_tab_origem_id_fk_idx` (`int_tab_origem_id_fk`),
  CONSTRAINT `tab_usuario_origem_int_tab_usuario_id_fk_fkey` FOREIGN KEY (`int_tab_usuario_id_fk`) REFERENCES `tab_usuario` (`int_usuario_id_pk`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=454 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_usuario_rede_social` */

DROP TABLE IF EXISTS `tab_usuario_rede_social`;

CREATE TABLE `tab_usuario_rede_social` (
  `int_usuario_rede_social_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `int_usuario_id_fk` int(11) NOT NULL,
  `int_rede_social_id_fk` int(11) NOT NULL,
  `str_detalhe` varchar(255) DEFAULT NULL,
  `dt_criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`int_usuario_rede_social_id_pk`),
  UNIQUE KEY `tab_usuario_rede_social_uq` (`int_usuario_id_fk`,`int_rede_social_id_fk`),
  KEY `tab_usuario_rede_social_usuario_idx` (`int_usuario_id_fk`),
  KEY `tab_usuario_rede_social_rede_idx` (`int_rede_social_id_fk`),
  CONSTRAINT `tab_usuario_rede_social_rede_fkey` FOREIGN KEY (`int_rede_social_id_fk`) REFERENCES `tab_rede_social` (`int_rede_social_id_pk`),
  CONSTRAINT `tab_usuario_rede_social_usuario_fkey` FOREIGN KEY (`int_usuario_id_fk`) REFERENCES `tab_usuario` (`int_usuario_id_pk`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=603 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_usuario_turma` */

DROP TABLE IF EXISTS `tab_usuario_turma`;

CREATE TABLE `tab_usuario_turma` (
  `int_usuario_turma_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `int_usuario_edicao_id_fk` int(11) NOT NULL,
  `int_cms_turma_id` int(10) unsigned DEFAULT NULL,
  `str_cms_turma_document_id` varchar(36) NOT NULL,
  `str_cms_edicao_document_id` varchar(36) NOT NULL,
  `str_alocado_por_gestor` varchar(36) DEFAULT NULL,
  `dt_alocado_por_gestor_em` timestamp NULL DEFAULT NULL,
  `dt_criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `dt_atualizado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`int_usuario_turma_id_pk`),
  UNIQUE KEY `tab_usuario_turma_usuario_edicao_uq` (`int_usuario_edicao_id_fk`),
  KEY `tab_usuario_turma_cms_turma_doc_idx` (`str_cms_turma_document_id`),
  KEY `tab_usuario_turma_cms_edicao_doc_idx` (`str_cms_edicao_document_id`),
  CONSTRAINT `tab_usuario_turma_usuario_edicao_fk` FOREIGN KEY (`int_usuario_edicao_id_fk`) REFERENCES `tab_usuario_edicao` (`int_usuario_edicao_id_pk`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tab_usuario_verification_code` */

DROP TABLE IF EXISTS `tab_usuario_verification_code`;

CREATE TABLE `tab_usuario_verification_code` (
  `int_usuario_verification_code_id_pk` int(11) NOT NULL AUTO_INCREMENT,
  `int_usuario_id_fk` int(11) NOT NULL,
  `str_code` varchar(4) NOT NULL,
  `str_tipo` varchar(50) NOT NULL,
  `dt_expiracao` timestamp NOT NULL,
  `bl_usado` tinyint(1) NOT NULL DEFAULT 0,
  `dt_usado` timestamp NULL DEFAULT NULL,
  `dt_criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`int_usuario_verification_code_id_pk`),
  KEY `tab_usuario_verification_code_usuario_idx` (`int_usuario_id_fk`),
  KEY `tab_usuario_verification_code_lookup_idx` (`int_usuario_id_fk`,`str_code`,`str_tipo`,`bl_usado`,`dt_expiracao`),
  CONSTRAINT `tab_usuario_verification_code_usuario_fkey` FOREIGN KEY (`int_usuario_id_fk`) REFERENCES `tab_usuario` (`int_usuario_id_pk`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
