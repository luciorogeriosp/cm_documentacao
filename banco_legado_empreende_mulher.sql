/*
SQLyog Community v13.2.1 (64 bit)
MySQL - 11.8.6-MariaDB-log : Database - db_consulado_sistemalegado
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_consulado_sistemalegado` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci */;

/*Table structure for table `assunto` */

DROP TABLE IF EXISTS `assunto`;

CREATE TABLE `assunto` (
  `id` bigint(20) NOT NULL,
  `atualizacao` date DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `assunto_aud` */

DROP TABLE IF EXISTS `assunto_aud`;

CREATE TABLE `assunto_aud` (
  `id` bigint(20) NOT NULL,
  `rev` int(11) NOT NULL,
  `revtype` smallint(6) DEFAULT NULL,
  `atualizacao` date DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `cidade` */

DROP TABLE IF EXISTS `cidade`;

CREATE TABLE `cidade` (
  `cidadeid` bigint(20) NOT NULL,
  `capital` int(11) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `estadoid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `cidade_aud` */

DROP TABLE IF EXISTS `cidade_aud`;

CREATE TABLE `cidade_aud` (
  `cidadeid` bigint(20) NOT NULL,
  `rev` int(11) NOT NULL,
  `revtype` smallint(6) DEFAULT NULL,
  `capital` int(11) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `estadoid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `colaborador` */

DROP TABLE IF EXISTS `colaborador`;

CREATE TABLE `colaborador` (
  `id` bigint(20) NOT NULL,
  `atualizacao` date DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `admissao` date DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `desligamento` date DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `perfil` varchar(20) DEFAULT NULL,
  `primeiro_acesso` tinyint(1) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL,
  `coordenador_id` bigint(20) DEFAULT NULL,
  `unidade_id` bigint(20) DEFAULT NULL,
  `inativo` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `colaborador_aud` */

DROP TABLE IF EXISTS `colaborador_aud`;

CREATE TABLE `colaborador_aud` (
  `id` bigint(20) NOT NULL,
  `rev` int(11) NOT NULL,
  `revtype` smallint(6) DEFAULT NULL,
  `atualizacao` date DEFAULT NULL,
  `admissao` date DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `desligamento` date DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `perfil` varchar(20) DEFAULT NULL,
  `primeiro_acesso` tinyint(1) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL,
  `coordenador_id` bigint(20) DEFAULT NULL,
  `unidade_id` bigint(20) DEFAULT NULL,
  `senha_cripto` varchar(50) DEFAULT NULL,
  `inativo` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `descontinuidade` */

DROP TABLE IF EXISTS `descontinuidade`;

CREATE TABLE `descontinuidade` (
  `id` bigint(20) NOT NULL,
  `atualizacao` date DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `data_descontinuidade` date DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL,
  `motivodesistencia_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `descontinuidade_aud` */

DROP TABLE IF EXISTS `descontinuidade_aud`;

CREATE TABLE `descontinuidade_aud` (
  `id` bigint(20) NOT NULL,
  `rev` int(11) NOT NULL,
  `revtype` smallint(6) DEFAULT NULL,
  `atualizacao` date DEFAULT NULL,
  `data_descontinuidade` date DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL,
  `motivodesistencia_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `empreendedora` */

DROP TABLE IF EXISTS `empreendedora`;

CREATE TABLE `empreendedora` (
  `id` bigint(20) NOT NULL,
  `atualizacao` date DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `beneficiados_indiretos` int(11) DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `comercial` varchar(15) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `ddd_celular` varchar(2) DEFAULT NULL,
  `ddd_comercial` varchar(2) DEFAULT NULL,
  `ddd_residencial` varchar(2) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cep` varchar(11) DEFAULT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `logradouro` varchar(50) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `pais` varchar(30) DEFAULT NULL,
  `referencia` varchar(50) DEFAULT NULL,
  `escolaridade` varchar(30) DEFAULT NULL,
  `estado_civil` varchar(16) DEFAULT NULL,
  `fim` date DEFAULT NULL,
  `inicio` date DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `quantidade_filhos` int(11) DEFAULT NULL,
  `raca` varchar(16) DEFAULT NULL,
  `residencial` varchar(15) DEFAULT NULL,
  `rg` varchar(20) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL,
  `cidadeid` bigint(20) DEFAULT NULL,
  `cpf_digits` varchar(11) GENERATED ALWAYS AS (replace(replace(replace(ifnull(`cpf`,''),'.',''),'-',''),' ','')) STORED,
  KEY `idx_empreendedora_cpf` (`cpf`),
  KEY `idx_empreendedora_cpf_digits` (`cpf_digits`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `empreendedora_aud` */

DROP TABLE IF EXISTS `empreendedora_aud`;

CREATE TABLE `empreendedora_aud` (
  `id` bigint(20) NOT NULL,
  `rev` int(11) NOT NULL,
  `revtype` smallint(6) DEFAULT NULL,
  `atualizacao` date DEFAULT NULL,
  `beneficiados_indiretos` int(11) DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `comercial` varchar(15) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `ddd_celular` varchar(2) DEFAULT NULL,
  `ddd_comercial` varchar(2) DEFAULT NULL,
  `ddd_residencial` varchar(2) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cep` varchar(11) DEFAULT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `logradouro` varchar(50) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `pais` varchar(30) DEFAULT NULL,
  `referencia` varchar(50) DEFAULT NULL,
  `escolaridade` varchar(30) DEFAULT NULL,
  `estado_civil` varchar(16) DEFAULT NULL,
  `fim` date DEFAULT NULL,
  `inicio` date DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `quantidade_filhos` int(11) DEFAULT NULL,
  `raca` varchar(16) DEFAULT NULL,
  `residencial` varchar(15) DEFAULT NULL,
  `rg` varchar(20) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL,
  `cidadeid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `empreendedora_status` */

DROP TABLE IF EXISTS `empreendedora_status`;

CREATE TABLE `empreendedora_status` (
  `id` bigint(20) NOT NULL,
  `atualizacao` date DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `data_status` date DEFAULT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  `renda_final` decimal(19,2) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL,
  `empreendimento_empreendedora_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `empreendedora_status_aud` */

DROP TABLE IF EXISTS `empreendedora_status_aud`;

CREATE TABLE `empreendedora_status_aud` (
  `id` bigint(20) NOT NULL,
  `rev` int(11) NOT NULL,
  `revtype` smallint(6) DEFAULT NULL,
  `atualizacao` date DEFAULT NULL,
  `data_status` date DEFAULT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  `renda_final` decimal(19,2) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL,
  `empreendimento_empreendedora_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `empreendimento` */

DROP TABLE IF EXISTS `empreendimento`;

CREATE TABLE `empreendimento` (
  `id` bigint(20) NOT NULL,
  `atualizacao` date DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `assessoria` date DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `cnpj` varchar(18) DEFAULT NULL,
  `comercial` varchar(15) DEFAULT NULL,
  `ddd_celular` varchar(2) DEFAULT NULL,
  `ddd_comercial` varchar(2) DEFAULT NULL,
  `ddd_residencial` varchar(2) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cep` varchar(11) DEFAULT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `logradouro` varchar(50) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `pais` varchar(30) DEFAULT NULL,
  `referencia` varchar(50) DEFAULT NULL,
  `mes_ano_assessoria` varchar(7) DEFAULT NULL,
  `mes_ano_processo_seletivo` varchar(7) DEFAULT NULL,
  `nao_possui_parceiro` tinyint(1) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `parceiro_responsavel_empreendimento` varchar(255) DEFAULT NULL,
  `processo_seletivo` date DEFAULT NULL,
  `residencial` varchar(15) DEFAULT NULL,
  `faturamento_final` decimal(19,2) DEFAULT NULL,
  `finalizacao` date DEFAULT NULL,
  `renda_media_final` decimal(19,2) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `status_relatorio` varchar(15) DEFAULT NULL,
  `tipo_assessoria` varchar(20) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL,
  `colaboradoraprovacao_id` bigint(20) DEFAULT NULL,
  `colaborador_responsavel` bigint(20) DEFAULT NULL,
  `descontinuidade_id` bigint(20) DEFAULT NULL,
  `cidadeid` bigint(20) DEFAULT NULL,
  `parceiro_id` bigint(20) DEFAULT NULL,
  `ramo_id` bigint(20) DEFAULT NULL,
  `tipo_finalizacao_assessoria_id` bigint(20) DEFAULT NULL,
  `tipoempreendimento_id` bigint(20) DEFAULT NULL,
  `unidade` bigint(20) DEFAULT NULL,
  KEY `idx_empreendimento_unidade` (`unidade`),
  KEY `idx_empreendimento_tipo` (`tipoempreendimento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `empreendimento_aud` */

DROP TABLE IF EXISTS `empreendimento_aud`;

CREATE TABLE `empreendimento_aud` (
  `id` bigint(20) NOT NULL,
  `rev` int(11) NOT NULL,
  `revtype` smallint(6) DEFAULT NULL,
  `atualizacao` date DEFAULT NULL,
  `assessoria` date DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `cnpj` varchar(18) DEFAULT NULL,
  `comercial` varchar(15) DEFAULT NULL,
  `ddd_celular` varchar(2) DEFAULT NULL,
  `ddd_comercial` varchar(2) DEFAULT NULL,
  `ddd_residencial` varchar(2) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cep` varchar(11) DEFAULT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `logradouro` varchar(50) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `pais` varchar(30) DEFAULT NULL,
  `referencia` varchar(50) DEFAULT NULL,
  `mes_ano_assessoria` varchar(7) DEFAULT NULL,
  `mes_ano_processo_seletivo` varchar(7) DEFAULT NULL,
  `nao_possui_parceiro` tinyint(1) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `parceiro_responsavel_empreendimento` varchar(255) DEFAULT NULL,
  `processo_seletivo` date DEFAULT NULL,
  `residencial` varchar(15) DEFAULT NULL,
  `faturamento_final` decimal(19,2) DEFAULT NULL,
  `finalizacao` date DEFAULT NULL,
  `renda_media_final` decimal(19,2) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `status_relatorio` varchar(15) DEFAULT NULL,
  `tipo_assessoria` varchar(20) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL,
  `colaboradoraprovacao_id` bigint(20) DEFAULT NULL,
  `colaborador_responsavel` bigint(20) DEFAULT NULL,
  `descontinuidade_id` bigint(20) DEFAULT NULL,
  `cidadeid` bigint(20) DEFAULT NULL,
  `parceiro_id` bigint(20) DEFAULT NULL,
  `ramo_id` bigint(20) DEFAULT NULL,
  `tipo_finalizacao_assessoria_id` bigint(20) DEFAULT NULL,
  `tipoempreendimento_id` bigint(20) DEFAULT NULL,
  `unidade` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `empreendimento_colaborador` */

DROP TABLE IF EXISTS `empreendimento_colaborador`;

CREATE TABLE `empreendimento_colaborador` (
  `id` bigint(20) NOT NULL,
  `atualizacao` date DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `fim` date DEFAULT NULL,
  `inicio` date DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL,
  `colaborador_id` bigint(20) NOT NULL,
  `empreendimento_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `empreendimento_colaborador_aud` */

DROP TABLE IF EXISTS `empreendimento_colaborador_aud`;

CREATE TABLE `empreendimento_colaborador_aud` (
  `id` bigint(20) NOT NULL,
  `rev` int(11) NOT NULL,
  `revtype` smallint(6) DEFAULT NULL,
  `atualizacao` date DEFAULT NULL,
  `fim` date DEFAULT NULL,
  `inicio` date DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL,
  `colaborador_id` bigint(20) DEFAULT NULL,
  `empreendimento_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `empreendimento_empreendedora` */

DROP TABLE IF EXISTS `empreendimento_empreendedora`;

CREATE TABLE `empreendimento_empreendedora` (
  `id` bigint(20) NOT NULL,
  `atualizacao` date DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `fim` date DEFAULT NULL,
  `inicio` date DEFAULT NULL,
  `renda_inicial` decimal(19,2) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL,
  `empreendedora_id` bigint(20) NOT NULL,
  `empreendimento_id` bigint(20) NOT NULL,
  KEY `idx_ee_empreendedora_id` (`empreendedora_id`),
  KEY `idx_ee_empreendimento_id` (`empreendimento_id`),
  KEY `idx_ee_empreendedora_empreendimento` (`empreendedora_id`,`empreendimento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `empreendimento_empreendedora_aud` */

DROP TABLE IF EXISTS `empreendimento_empreendedora_aud`;

CREATE TABLE `empreendimento_empreendedora_aud` (
  `id` bigint(20) NOT NULL,
  `rev` int(11) NOT NULL,
  `revtype` smallint(6) DEFAULT NULL,
  `atualizacao` date DEFAULT NULL,
  `fim` date DEFAULT NULL,
  `inicio` date DEFAULT NULL,
  `renda_inicial` decimal(19,2) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL,
  `empreendedora_id` bigint(20) DEFAULT NULL,
  `empreendimento_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `estado` */

DROP TABLE IF EXISTS `estado`;

CREATE TABLE `estado` (
  `estadoid` bigint(20) NOT NULL,
  `sigla` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `estado_aud` */

DROP TABLE IF EXISTS `estado_aud`;

CREATE TABLE `estado_aud` (
  `estadoid` bigint(20) NOT NULL,
  `rev` int(11) NOT NULL,
  `revtype` smallint(6) DEFAULT NULL,
  `sigla` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `faturamento_mensal` */

DROP TABLE IF EXISTS `faturamento_mensal`;

CREATE TABLE `faturamento_mensal` (
  `id` bigint(20) NOT NULL,
  `atualizacao` date DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `data_faturamento` varchar(7) DEFAULT NULL,
  `mes_ano` date DEFAULT NULL,
  `sem_valor` tinyint(1) DEFAULT NULL,
  `status_relatorio` varchar(15) DEFAULT NULL,
  `valor` decimal(19,2) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL,
  `colaboradoraprovacao_id` bigint(20) DEFAULT NULL,
  `empreendimento_id` bigint(20) NOT NULL,
  `justificativa` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `faturamento_mensal_aud` */

DROP TABLE IF EXISTS `faturamento_mensal_aud`;

CREATE TABLE `faturamento_mensal_aud` (
  `id` bigint(20) NOT NULL,
  `rev` int(11) NOT NULL,
  `revtype` smallint(6) DEFAULT NULL,
  `atualizacao` date DEFAULT NULL,
  `data_faturamento` varchar(7) DEFAULT NULL,
  `mes_ano` date DEFAULT NULL,
  `sem_valor` tinyint(1) DEFAULT NULL,
  `status_relatorio` varchar(15) DEFAULT NULL,
  `valor` decimal(19,2) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL,
  `colaboradoraprovacao_id` bigint(20) DEFAULT NULL,
  `empreendimento_id` bigint(20) DEFAULT NULL,
  `justificativa` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `foto` */

DROP TABLE IF EXISTS `foto`;

CREATE TABLE `foto` (
  `id` bigint(20) NOT NULL,
  `atualizacao` date DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `nome_arquivo` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `real_path` varchar(255) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL,
  `relato_mensal_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `foto_aud` */

DROP TABLE IF EXISTS `foto_aud`;

CREATE TABLE `foto_aud` (
  `id` bigint(20) NOT NULL,
  `rev` int(11) NOT NULL,
  `revtype` smallint(6) DEFAULT NULL,
  `atualizacao` date DEFAULT NULL,
  `nome_arquivo` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `real_path` varchar(255) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL,
  `relato_mensal_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `indicadores_empreendedora` */

DROP TABLE IF EXISTS `indicadores_empreendedora`;

CREATE TABLE `indicadores_empreendedora` (
  `id` bigint(20) NOT NULL,
  `atualizacao` date DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `empreendedora_id` bigint(20) DEFAULT NULL,
  `data_questionario` date DEFAULT NULL,
  `periodo` int(11) DEFAULT NULL,
  `categoria_pergunta` int(11) DEFAULT NULL,
  `numero_pergunta` int(11) DEFAULT NULL,
  `valor_resposta` int(11) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL,
  `indicador_gerado` tinyint(1) DEFAULT 0,
  `deleta_indicador` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `indicadores_empreendedora_aud` */

DROP TABLE IF EXISTS `indicadores_empreendedora_aud`;

CREATE TABLE `indicadores_empreendedora_aud` (
  `id` bigint(20) NOT NULL,
  `rev` int(11) NOT NULL,
  `revtype` smallint(6) DEFAULT NULL,
  `atualizacao` date DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `empreendedora_id` bigint(20) DEFAULT NULL,
  `data_questionario` date DEFAULT NULL,
  `periodo` int(11) DEFAULT NULL,
  `categoria_pergunta` int(11) DEFAULT NULL,
  `numero_pergunta` int(11) DEFAULT NULL,
  `valor_resposta` int(11) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL,
  `indicador_gerado` tinyint(1) DEFAULT 0,
  `deleta_indicador` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `investimento_mensal` */

DROP TABLE IF EXISTS `investimento_mensal`;

CREATE TABLE `investimento_mensal` (
  `id` bigint(20) NOT NULL,
  `atualizacao` date DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `data_investimento` varchar(7) DEFAULT NULL,
  `mes_ano` date DEFAULT NULL,
  `sem_valor` tinyint(1) DEFAULT NULL,
  `status_relatorio` varchar(15) DEFAULT NULL,
  `valor` decimal(19,2) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL,
  `colaboradoraprovacao_id` bigint(20) DEFAULT NULL,
  `empreendimento_id` bigint(20) NOT NULL,
  `justificativa` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `investimento_mensal_aud` */

DROP TABLE IF EXISTS `investimento_mensal_aud`;

CREATE TABLE `investimento_mensal_aud` (
  `id` bigint(20) NOT NULL,
  `rev` int(11) NOT NULL,
  `revtype` smallint(6) DEFAULT NULL,
  `atualizacao` date DEFAULT NULL,
  `data_investimento` varchar(7) DEFAULT NULL,
  `mes_ano` date DEFAULT NULL,
  `sem_valor` tinyint(1) DEFAULT NULL,
  `status_relatorio` varchar(15) DEFAULT NULL,
  `valor` decimal(19,2) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL,
  `colaboradoraprovacao_id` bigint(20) DEFAULT NULL,
  `empreendimento_id` bigint(20) DEFAULT NULL,
  `justificativa` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `login_consulado` */

DROP TABLE IF EXISTS `login_consulado`;

CREATE TABLE `login_consulado` (
  `id` bigint(20) NOT NULL,
  `colaborador_id` bigint(20) NOT NULL,
  `login_colaborador` varchar(50) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `inativo` tinyint(1) NOT NULL,
  `atualizacao` datetime DEFAULT NULL,
  `criacao` datetime NOT NULL,
  `senha_temporaria` tinyint(1) DEFAULT NULL,
  `colaborador_atualizacao_id` bigint(20) DEFAULT NULL,
  `colaborador_criacao_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `macro_tema` */

DROP TABLE IF EXISTS `macro_tema`;

CREATE TABLE `macro_tema` (
  `id` bigint(20) NOT NULL,
  `atualizacao` date DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `macro_tema_aud` */

DROP TABLE IF EXISTS `macro_tema_aud`;

CREATE TABLE `macro_tema_aud` (
  `id` bigint(20) NOT NULL,
  `rev` int(11) NOT NULL,
  `revtype` smallint(6) DEFAULT NULL,
  `atualizacao` date DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `mes_bloqueio` */

DROP TABLE IF EXISTS `mes_bloqueio`;

CREATE TABLE `mes_bloqueio` (
  `id` bigint(20) NOT NULL,
  `atualizacao` date DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `mes_ano` varchar(7) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `mes_bloqueio_aud` */

DROP TABLE IF EXISTS `mes_bloqueio_aud`;

CREATE TABLE `mes_bloqueio_aud` (
  `id` bigint(20) NOT NULL,
  `rev` int(11) NOT NULL,
  `revtype` smallint(6) DEFAULT NULL,
  `atualizacao` date DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `mes_ano` varchar(7) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `motivo_desistencia` */

DROP TABLE IF EXISTS `motivo_desistencia`;

CREATE TABLE `motivo_desistencia` (
  `id` bigint(20) NOT NULL,
  `atualizacao` date DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `motivo_desistencia_aud` */

DROP TABLE IF EXISTS `motivo_desistencia_aud`;

CREATE TABLE `motivo_desistencia_aud` (
  `id` bigint(20) NOT NULL,
  `rev` int(11) NOT NULL,
  `revtype` smallint(6) DEFAULT NULL,
  `atualizacao` date DEFAULT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `parametro` */

DROP TABLE IF EXISTS `parametro`;

CREATE TABLE `parametro` (
  `id` bigint(20) NOT NULL,
  `atualizacao` date DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `valor` varchar(50) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `parametro_aud` */

DROP TABLE IF EXISTS `parametro_aud`;

CREATE TABLE `parametro_aud` (
  `id` bigint(20) NOT NULL,
  `rev` int(11) NOT NULL,
  `revtype` smallint(6) DEFAULT NULL,
  `atualizacao` date DEFAULT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `valor` varchar(50) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `parceiro` */

DROP TABLE IF EXISTS `parceiro`;

CREATE TABLE `parceiro` (
  `id` bigint(20) NOT NULL,
  `atualizacao` date DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `cnpj` varchar(18) DEFAULT NULL,
  `comercial` varchar(15) DEFAULT NULL,
  `ddd_celular` varchar(2) DEFAULT NULL,
  `ddd_comercial` varchar(2) DEFAULT NULL,
  `ddd_residencial` varchar(2) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cep` varchar(11) DEFAULT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `logradouro` varchar(50) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `pais` varchar(30) DEFAULT NULL,
  `referencia` varchar(50) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `residencial` varchar(15) DEFAULT NULL,
  `responsavel` varchar(80) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL,
  `cidadeid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `parceiro_aud` */

DROP TABLE IF EXISTS `parceiro_aud`;

CREATE TABLE `parceiro_aud` (
  `id` bigint(20) NOT NULL,
  `rev` int(11) NOT NULL,
  `revtype` smallint(6) DEFAULT NULL,
  `atualizacao` date DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `cnpj` varchar(18) DEFAULT NULL,
  `comercial` varchar(15) DEFAULT NULL,
  `ddd_celular` varchar(2) DEFAULT NULL,
  `ddd_comercial` varchar(2) DEFAULT NULL,
  `ddd_residencial` varchar(2) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cep` varchar(11) DEFAULT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `logradouro` varchar(50) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `pais` varchar(30) DEFAULT NULL,
  `referencia` varchar(50) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `residencial` varchar(15) DEFAULT NULL,
  `responsavel` varchar(80) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL,
  `cidadeid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `plano_acao` */

DROP TABLE IF EXISTS `plano_acao`;

CREATE TABLE `plano_acao` (
  `id` bigint(20) NOT NULL,
  `atualizacao` date DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `empreendimento_id` bigint(20) DEFAULT NULL,
  `data_plano` date DEFAULT NULL,
  `meta` varchar(400) DEFAULT NULL,
  `data_meta` date DEFAULT NULL,
  `planejamento_conclusao` varchar(5000) DEFAULT NULL,
  `responsavel_meta` varchar(100) DEFAULT NULL,
  `meta_concluida` tinyint(1) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `plano_acao_aud` */

DROP TABLE IF EXISTS `plano_acao_aud`;

CREATE TABLE `plano_acao_aud` (
  `id` bigint(20) NOT NULL,
  `rev` int(11) NOT NULL,
  `revtype` smallint(6) DEFAULT NULL,
  `atualizacao` date DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `empreendimento_id` bigint(20) DEFAULT NULL,
  `data_plano` date DEFAULT NULL,
  `meta` varchar(400) DEFAULT NULL,
  `data_meta` date DEFAULT NULL,
  `planejamento_conclusao` varchar(5000) DEFAULT NULL,
  `responsavel_meta` varchar(100) DEFAULT NULL,
  `meta_concluida` tinyint(1) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `poupanca_mensal` */

DROP TABLE IF EXISTS `poupanca_mensal`;

CREATE TABLE `poupanca_mensal` (
  `id` bigint(20) NOT NULL,
  `atualizacao` date DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `data_poupanca` varchar(7) DEFAULT NULL,
  `mes_ano` date DEFAULT NULL,
  `sem_valor` tinyint(1) DEFAULT NULL,
  `status_relatorio` varchar(15) DEFAULT NULL,
  `valor` decimal(19,2) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL,
  `colaboradoraprovacao_id` bigint(20) DEFAULT NULL,
  `empreendimento_id` bigint(20) NOT NULL,
  `justificativa` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `poupanca_mensal_aud` */

DROP TABLE IF EXISTS `poupanca_mensal_aud`;

CREATE TABLE `poupanca_mensal_aud` (
  `id` bigint(20) NOT NULL,
  `rev` int(11) NOT NULL,
  `revtype` smallint(6) DEFAULT NULL,
  `atualizacao` date DEFAULT NULL,
  `data_poupanca` varchar(7) DEFAULT NULL,
  `mes_ano` date DEFAULT NULL,
  `sem_valor` tinyint(1) DEFAULT NULL,
  `status_relatorio` varchar(15) DEFAULT NULL,
  `valor` decimal(19,2) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL,
  `colaboradoraprovacao_id` bigint(20) DEFAULT NULL,
  `empreendimento_id` bigint(20) DEFAULT NULL,
  `justificativa` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `ramo` */

DROP TABLE IF EXISTS `ramo`;

CREATE TABLE `ramo` (
  `id` bigint(20) NOT NULL,
  `atualizacao` date DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `ramo_aud` */

DROP TABLE IF EXISTS `ramo_aud`;

CREATE TABLE `ramo_aud` (
  `id` bigint(20) NOT NULL,
  `rev` int(11) NOT NULL,
  `revtype` smallint(6) DEFAULT NULL,
  `atualizacao` date DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `relato_mensal` */

DROP TABLE IF EXISTS `relato_mensal`;

CREATE TABLE `relato_mensal` (
  `id` bigint(20) NOT NULL,
  `atualizacao` date DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `atividade_desenvolvida` varchar(2000) DEFAULT NULL,
  `data_registro` date DEFAULT NULL,
  `descricao_atividades` mediumtext DEFAULT NULL,
  `mes_ano` varchar(255) DEFAULT NULL,
  `macro_tema` varchar(40) DEFAULT NULL,
  `participantes` varchar(500) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL,
  `empreendimento_id` bigint(20) NOT NULL,
  `macro_tema_id` bigint(20) DEFAULT NULL,
  `tempo_atividade` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `relato_mensal_aud` */

DROP TABLE IF EXISTS `relato_mensal_aud`;

CREATE TABLE `relato_mensal_aud` (
  `id` bigint(20) NOT NULL,
  `rev` int(11) NOT NULL,
  `revtype` smallint(6) DEFAULT NULL,
  `atualizacao` date DEFAULT NULL,
  `atividade_desenvolvida` varchar(2000) DEFAULT NULL,
  `data_registro` date DEFAULT NULL,
  `descricao_atividades` mediumtext DEFAULT NULL,
  `mes_ano` varchar(255) DEFAULT NULL,
  `macro_tema` varchar(40) DEFAULT NULL,
  `participantes` varchar(500) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL,
  `empreendimento_id` bigint(20) DEFAULT NULL,
  `macro_tema_id` bigint(20) DEFAULT NULL,
  `tempo_atividade` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `renda_mensal` */

DROP TABLE IF EXISTS `renda_mensal`;

CREATE TABLE `renda_mensal` (
  `id` bigint(20) NOT NULL,
  `atualizacao` date DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `data_renda` varchar(7) DEFAULT NULL,
  `mes_ano` date DEFAULT NULL,
  `sem_valor` tinyint(1) DEFAULT NULL,
  `status_relatorio` varchar(15) DEFAULT NULL,
  `valor` decimal(19,2) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL,
  `colaboradoraprovacao_id` bigint(20) DEFAULT NULL,
  `empreendimento_id` bigint(20) NOT NULL,
  `justificativa` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `renda_mensal_aud` */

DROP TABLE IF EXISTS `renda_mensal_aud`;

CREATE TABLE `renda_mensal_aud` (
  `id` bigint(20) NOT NULL,
  `rev` int(11) NOT NULL,
  `revtype` smallint(6) DEFAULT NULL,
  `atualizacao` date DEFAULT NULL,
  `data_renda` varchar(7) DEFAULT NULL,
  `mes_ano` date DEFAULT NULL,
  `sem_valor` tinyint(1) DEFAULT NULL,
  `status_relatorio` varchar(15) DEFAULT NULL,
  `valor` decimal(19,2) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL,
  `colaboradoraprovacao_id` bigint(20) DEFAULT NULL,
  `empreendimento_id` bigint(20) DEFAULT NULL,
  `justificativa` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `revinfo` */

DROP TABLE IF EXISTS `revinfo`;

CREATE TABLE `revinfo` (
  `rev` int(11) NOT NULL,
  `revtstmp` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `tipo_empreendimento` */

DROP TABLE IF EXISTS `tipo_empreendimento`;

CREATE TABLE `tipo_empreendimento` (
  `id` bigint(20) NOT NULL,
  `atualizacao` date DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `tipo_empreendimento_aud` */

DROP TABLE IF EXISTS `tipo_empreendimento_aud`;

CREATE TABLE `tipo_empreendimento_aud` (
  `id` bigint(20) NOT NULL,
  `rev` int(11) NOT NULL,
  `revtype` smallint(6) DEFAULT NULL,
  `atualizacao` date DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `tipo_finalizacao_assessoria` */

DROP TABLE IF EXISTS `tipo_finalizacao_assessoria`;

CREATE TABLE `tipo_finalizacao_assessoria` (
  `id` bigint(20) NOT NULL,
  `atualizacao` date DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `tipo_finalizacao_assessoria_aud` */

DROP TABLE IF EXISTS `tipo_finalizacao_assessoria_aud`;

CREATE TABLE `tipo_finalizacao_assessoria_aud` (
  `id` bigint(20) NOT NULL,
  `rev` int(11) NOT NULL,
  `revtype` smallint(6) DEFAULT NULL,
  `atualizacao` date DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `unidade` */

DROP TABLE IF EXISTS `unidade`;

CREATE TABLE `unidade` (
  `id` bigint(20) NOT NULL,
  `atualizacao` date DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cep` varchar(11) DEFAULT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `logradouro` varchar(50) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `pais` varchar(30) DEFAULT NULL,
  `referencia` varchar(50) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL,
  `cidadeid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `unidade_aud` */

DROP TABLE IF EXISTS `unidade_aud`;

CREATE TABLE `unidade_aud` (
  `id` bigint(20) NOT NULL,
  `rev` int(11) NOT NULL,
  `revtype` smallint(6) DEFAULT NULL,
  `atualizacao` date DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cep` varchar(11) DEFAULT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `logradouro` varchar(50) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `pais` varchar(30) DEFAULT NULL,
  `referencia` varchar(50) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `colaboradoratualizacao_id` bigint(20) DEFAULT NULL,
  `cidadeid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Table structure for table `vw_empreendedora_por_cpf` */

DROP TABLE IF EXISTS `vw_empreendedora_por_cpf`;

/*!50001 DROP VIEW IF EXISTS `vw_empreendedora_por_cpf` */;
/*!50001 DROP TABLE IF EXISTS `vw_empreendedora_por_cpf` */;

/*!50001 CREATE TABLE  `vw_empreendedora_por_cpf`(
 `cpf` varchar(14) ,
 `cpf_digits` varchar(11) ,
 `empreendedora_id` bigint(20) ,
 `empreendedora` varchar(100) ,
 `empreendimento_id` bigint(20) ,
 `empreendimento` varchar(255) ,
 `ano` decimal(20,0) ,
 `programa` varchar(20) ,
 `unidade` varchar(50) ,
 `tipo_empreendimento` varchar(50) ,
 `vinculo_inicio` date ,
 `vinculo_fim` date ,
 `vinculo_status` varchar(15) ,
 `empreendimento_status` varchar(15) 
)*/;

/*Table structure for table `financeiro_mensal` */

DROP TABLE IF EXISTS `financeiro_mensal`;

/*!50001 DROP VIEW IF EXISTS `financeiro_mensal` */;
/*!50001 DROP TABLE IF EXISTS `financeiro_mensal` */;

/*!50001 CREATE TABLE  `financeiro_mensal`(
 `id_renda` bigint(20) ,
 `atualizacao` date ,
 `version` int(11) ,
 `colaboradoratualizacao_id` bigint(20) ,
 `empreendimento_id` bigint(20) ,
 `data_renda` varchar(7) ,
 `mes_ano` date ,
 `status_relatorio` varchar(15) ,
 `colaboradoraprovacao_id` bigint(20) ,
 `valor_renda` decimal(19,2) ,
 `justificativa_renda` text ,
 `valor_faturamento` decimal(19,2) ,
 `id_faturamento` bigint(20) ,
 `justificativa_faturamento` text ,
 `valor_investimento` decimal(19,2) ,
 `id_investimento` bigint(20) ,
 `justificativa_investimento` char(1) ,
 `valor_poupanca` decimal(19,2) ,
 `id_poupanca` bigint(20) ,
 `justificativa_poupanca` text 
)*/;

/*View structure for view vw_empreendedora_por_cpf */

/*!50001 DROP TABLE IF EXISTS `vw_empreendedora_por_cpf` */;
/*!50001 DROP VIEW IF EXISTS `vw_empreendedora_por_cpf` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`%` SQL SECURITY DEFINER VIEW `vw_empreendedora_por_cpf` AS select `e`.`cpf` AS `cpf`,`e`.`cpf_digits` AS `cpf_digits`,`e`.`id` AS `empreendedora_id`,`e`.`nome` AS `empreendedora`,`em`.`id` AS `empreendimento_id`,`em`.`nome` AS `empreendimento`,coalesce(year(`em`.`assessoria`),cast(nullif(substring_index(`em`.`mes_ano_assessoria`,'/',-1),'') as unsigned)) AS `ano`,`em`.`tipo_assessoria` AS `programa`,`u`.`nome` AS `unidade`,`te`.`nome` AS `tipo_empreendimento`,`ee`.`inicio` AS `vinculo_inicio`,`ee`.`fim` AS `vinculo_fim`,`ee`.`status` AS `vinculo_status`,`em`.`status` AS `empreendimento_status` from (((((`empreendedora` `e` join `empreendimento_empreendedora` `ee` on(`ee`.`empreendedora_id` = `e`.`id`)) join `empreendimento` `em` on(`em`.`id` = `ee`.`empreendimento_id`)) left join `unidade` `u` on(`u`.`id` = `em`.`unidade`)) left join `tipo_empreendimento` `te` on(`te`.`id` = `em`.`tipoempreendimento_id`)) join (select `e2`.`cpf_digits` AS `cpf_digits`,substring_index(group_concat(`ee2`.`id` order by `ee2`.`status` = 'ATIVO' DESC,`ee2`.`inicio` DESC,`ee2`.`id` DESC separator ','),',',1) + 0 AS `ee_id` from (`empreendedora` `e2` join `empreendimento_empreendedora` `ee2` on(`ee2`.`empreendedora_id` = `e2`.`id`)) where `e2`.`cpf_digits` is not null and `e2`.`cpf_digits` <> '' group by `e2`.`cpf_digits`) `pick` on(`pick`.`cpf_digits` = `e`.`cpf_digits` and `pick`.`ee_id` = `ee`.`id`)) */;

/*View structure for view financeiro_mensal */

/*!50001 DROP TABLE IF EXISTS `financeiro_mensal` */;
/*!50001 DROP VIEW IF EXISTS `financeiro_mensal` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`%` SQL SECURITY DEFINER VIEW `financeiro_mensal` AS select `renda_mensal`.`id` AS `id_renda`,`renda_mensal`.`atualizacao` AS `atualizacao`,`renda_mensal`.`version` AS `version`,`renda_mensal`.`colaboradoratualizacao_id` AS `colaboradoratualizacao_id`,`renda_mensal`.`empreendimento_id` AS `empreendimento_id`,`renda_mensal`.`data_renda` AS `data_renda`,`renda_mensal`.`mes_ano` AS `mes_ano`,`renda_mensal`.`status_relatorio` AS `status_relatorio`,`renda_mensal`.`colaboradoraprovacao_id` AS `colaboradoraprovacao_id`,`renda_mensal`.`valor` AS `valor_renda`,`renda_mensal`.`justificativa` AS `justificativa_renda`,`faturamento_mensal`.`valor` AS `valor_faturamento`,`faturamento_mensal`.`id` AS `id_faturamento`,`faturamento_mensal`.`justificativa` AS `justificativa_faturamento`,`investimento_mensal`.`valor` AS `valor_investimento`,`investimento_mensal`.`id` AS `id_investimento`,`investimento_mensal`.`justificativa` AS `justificativa_investimento`,`poupanca_mensal`.`valor` AS `valor_poupanca`,`poupanca_mensal`.`id` AS `id_poupanca`,`poupanca_mensal`.`justificativa` AS `justificativa_poupanca` from (((`renda_mensal` join `faturamento_mensal` on(`renda_mensal`.`data_renda` = `faturamento_mensal`.`data_faturamento` and `renda_mensal`.`empreendimento_id` = `faturamento_mensal`.`empreendimento_id`)) left join `investimento_mensal` on(`renda_mensal`.`data_renda` = `investimento_mensal`.`data_investimento` and `renda_mensal`.`empreendimento_id` = `investimento_mensal`.`empreendimento_id`)) left join `poupanca_mensal` on(`renda_mensal`.`data_renda` = `poupanca_mensal`.`data_poupanca` and `renda_mensal`.`empreendimento_id` = `poupanca_mensal`.`empreendimento_id`)) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
