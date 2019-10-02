-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 02/10/2019 às 17:58
-- Versão do servidor: 5.7.27-0ubuntu0.18.04.1
-- Versão do PHP: 7.2.19-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `inscricaopos`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `AtividadeCronograma`
--

CREATE TABLE `AtividadeCronograma` (
  `id` bigint(20) NOT NULL,
  `atividade` varchar(255) DEFAULT NULL,
  `periodo` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `AtividadeCronograma`
--

INSERT INTO `AtividadeCronograma` (`id`, `atividade`, `periodo`, `status`) VALUES
(1, 'Elaboração do Edital', '02/01/19 - 29/03/19', 'OK'),
(2, 'Aprovação do Edital (Reitoria)', '01/04/19 - 31/05/19', 'OK'),
(3, 'Divulgação do Edital', '04/06/19 - 14/06/19', 'OK'),
(4, 'Período de Inscrições', '17/06/19 - 19/07/19', 'OK'),
(5, 'Período de Avaliação dos Candidatos (comissão de seleção)', '18/06/19 - 19/07/19', 'Em Andamento'),
(6, 'Divulgação do Resultado Preliminar', '31/07/19', NULL),
(7, 'Interposição de Recurso', '02/08/19', NULL),
(8, 'Divulgação do Resultado Final', '14/08/19', NULL),
(9, 'Matrícula dos(as) Aprovados(as)', '19/08/19 - 21/08/19', NULL),
(10, 'Divulgação dos(as) Reclassificados(as)', '23/08/19', NULL),
(11, 'Matrícula dos(as) Reclassificados(as)', '27/08/19 - 28/08/19', NULL),
(12, 'Aula Inaugural e início das aulas', '01/10/19', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `atividade_cronograma_id_seq`
--

CREATE TABLE `atividade_cronograma_id_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `atividade_cronograma_id_seq`
--

INSERT INTO `atividade_cronograma_id_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Avaliacao`
--

CREATE TABLE `Avaliacao` (
  `id` bigint(20) NOT NULL,
  `aprovada` bit(1) DEFAULT NULL,
  `dataAvaliacao` datetime DEFAULT NULL,
  `documentacaoCompleta` bit(1) DEFAULT NULL,
  `expProfPontuacaoItem` double DEFAULT NULL,
  `expProfPontuacaoTotal` double DEFAULT NULL,
  `expProfTotalMesesAreaComp` double DEFAULT NULL,
  `expProfTotalMesesOutras` double DEFAULT NULL,
  `gradPontuacaoItem` double DEFAULT NULL,
  `gradPontuacaoTotal` double DEFAULT NULL,
  `gradQtdCursosComputacao` int(11) DEFAULT NULL,
  `gradQtdCursosOutros` int(11) DEFAULT NULL,
  `historicoFatorCargaHoraria` double DEFAULT NULL,
  `historicoMediaGeral` double DEFAULT NULL,
  `historicoPontuacaoItem` double DEFAULT NULL,
  `historicoPontuacaoTotal` double DEFAULT NULL,
  `notaFinal` double DEFAULT NULL,
  `observacoes` varchar(255) DEFAULT NULL,
  `prodCientificaPontuacaoItem` double DEFAULT NULL,
  `prodCientificaPontuacaoTotal` double DEFAULT NULL,
  `qtdAtigosComputacao` int(11) DEFAULT NULL,
  `qtdAtigosOutras` int(11) DEFAULT NULL,
  `quantidadeVinculosEmpregaticios` int(11) DEFAULT NULL,
  `tipoVaga` varchar(255) DEFAULT NULL,
  `avaliador_id` bigint(20) DEFAULT NULL,
  `inscricao_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `Avaliacao`
--

INSERT INTO `Avaliacao` (`id`, `aprovada`, `dataAvaliacao`, `documentacaoCompleta`, `expProfPontuacaoItem`, `expProfPontuacaoTotal`, `expProfTotalMesesAreaComp`, `expProfTotalMesesOutras`, `gradPontuacaoItem`, `gradPontuacaoTotal`, `gradQtdCursosComputacao`, `gradQtdCursosOutros`, `historicoFatorCargaHoraria`, `historicoMediaGeral`, `historicoPontuacaoItem`, `historicoPontuacaoTotal`, `notaFinal`, `observacoes`, `prodCientificaPontuacaoItem`, `prodCientificaPontuacaoTotal`, `qtdAtigosComputacao`, `qtdAtigosOutras`, `quantidadeVinculosEmpregaticios`, `tipoVaga`, `avaliador_id`, `inscricao_id`) VALUES
(1, b'1', '2019-07-10 16:09:48', b'1', NULL, NULL, NULL, NULL, 3, 3, 1, 0, 1, 7.4, 7.4, 7.4, 6.08, '', 0, 0, 0, 0, 0, 'VCG', 3, 70),
(2, b'1', '2019-07-10 16:17:07', b'1', 1.12, 1.12, 0.56, 0, 3, 3, 1, 0, 0.85, 7.98, 6.78, 6.78, 5.98, 'Certificados não aceitos para comprovação de experiência profissional como monitor de informática', NULL, NULL, NULL, NULL, 2, 'VCG', 3, 69),
(3, b'0', '2019-07-10 16:25:00', b'1', NULL, NULL, NULL, NULL, 3, 3, 1, NULL, 0.85, 9.78, 8.31, 8.31, 8.22, '', 5, 5, 1, NULL, 0, 'VCG', 3, 68),
(4, b'1', '2019-07-10 16:27:31', b'1', NULL, NULL, NULL, NULL, 3, 3, 1, NULL, 0.85, 9.78, 8.31, 8.31, 8.22, 'Histórico sem Confere com o original.', 5, 5, 1, NULL, 0, 'VCG', 3, 68),
(5, b'1', '2019-07-10 16:30:34', b'1', NULL, NULL, NULL, NULL, 3, 3, 1, NULL, 0.85, 9, 7.65, 7.65, 7.76, 'Histórico sem o confere com original', 5, 5, 1, NULL, 0, 'VCG', 3, 67),
(6, b'1', '2019-07-10 16:33:56', b'1', 10, 19.7, 9.85, 0, NULL, NULL, NULL, NULL, 1, 6.77, 6.77, 6.77, 9.24, '', 5, 5, 1, 0, 1, 'PPI', 3, 72),
(7, b'1', '2019-07-10 17:14:02', b'1', 10, 27.64, 13.82, 0, 3, 3, 1, NULL, 1, 7.9, 7.9, 7.9, 9.43, '', 0, 0, 0, 0, 1, 'VCG', 3, 1),
(8, b'1', '2019-07-10 18:12:14', b'1', 10, 13.98, 0, 13.98, 3, 3, 1, NULL, 1, 8.07, 8.07, 8.07, 11.05, '', 5, 5, 1, NULL, 3, 'VCG', 3, 2),
(9, b'1', '2019-07-10 18:19:47', b'1', 10, 11.08, 0, 11.08, 3, 3, 1, NULL, 0, NULL, 0, 0, 3.9, 'Não trouxe histórico escolar', 0, 0, 0, NULL, 4, 'VCG', 3, 3),
(10, b'0', '2019-07-10 18:22:24', b'1', NULL, NULL, NULL, NULL, 3, 3, 1, NULL, 1, 7.29, 7.29, 7.29, 6, '', 0, 0, 0, NULL, 0, 'VCG', 3, 3),
(11, b'1', '2019-07-10 18:25:47', b'1', 5.36, 5.36, 2.28, 0.8, 3, 3, 1, NULL, 1, 7.29, 7.29, 7.29, 7.61, '', 0, 0, 0, NULL, 4, 'VCG', 3, 4),
(12, b'1', '2019-07-10 18:52:48', b'1', NULL, NULL, NULL, NULL, 1, 1, 0, 1, 0.85, 6.82, 5.8, 5.8, 4.36, 'Curso de design gráfico, não considerei um curso de tecnologia', NULL, NULL, NULL, NULL, 0, 'VCG', 3, 5),
(13, b'1', '2019-07-10 18:58:04', b'1', 5.6, 5.6, 2.8, 0, 1, 1, 0, 1, 1, 7.5, 7.5, 7.5, 7.23, '', NULL, NULL, NULL, NULL, 1, 'PPI', 3, 6),
(14, b'1', '2019-07-10 19:04:27', b'1', 8.1, 8.1, 4.05, 0, 3, 3, 1, NULL, 0.85, 8, 6.8, 6.8, 8.09, '', NULL, NULL, NULL, NULL, 3, 'VCG', 3, 7),
(15, b'1', '2019-07-10 19:11:28', b'1', 8.37, 8.37, 4.11, 0.15, 3, 3, 1, NULL, 0.85, 7.31, 6.21, 6.21, 7.76, 'Nada com carimbo de confere com o original', NULL, NULL, NULL, NULL, 3, 'VCG', 3, 8),
(16, b'0', '2019-07-10 19:15:39', b'1', NULL, NULL, NULL, NULL, 3, 3, 1, NULL, 1, 7, 7, 7, 7.3, '', 5, 5, 1, NULL, 0, 'VCG', 3, 9),
(17, b'1', '2019-07-10 19:20:06', b'1', 2.03, 2.03, 0.93, 0.17, 3, 3, 1, NULL, 1, 7.75, 7.75, 7.75, 8.43, '', 5, 5, 1, NULL, 2, 'VCG', 3, 9),
(18, b'1', '2019-07-10 19:30:04', b'1', 1.32, 1.32, 0.66, 0, 3, 3, 1, NULL, 1, 8.07, 8.07, 8.07, 6.95, '', NULL, NULL, NULL, NULL, 1, 'VCG', 3, 10),
(19, b'1', '2019-07-10 19:35:05', b'1', 8.28, 8.28, 3.17, 1.94, 3, 3, 1, NULL, 1, 8.23, 8.23, 8.23, 9.14, '', NULL, NULL, NULL, NULL, 3, 'VCG', 3, 11),
(20, b'1', '2019-07-10 19:39:02', b'1', 6.72, 6.72, 0.04, 6.64, 3, 3, 1, NULL, 1, 6.32, 6.32, 6.32, 7.34, '', NULL, NULL, NULL, NULL, 3, 'VCG', 3, 12),
(21, b'1', '2019-07-10 19:42:07', b'1', 1.46, 1.46, 0.73, 0, 3, 3, 1, NULL, 1, 6.15, 6.15, 6.15, 5.64, '', NULL, NULL, NULL, NULL, 2, 'VCG', 3, 13),
(22, b'1', '2019-07-12 16:14:46', b'1', 10, 26.3, 13.15, 0, 3, 3, 1, NULL, 0.85, 7.49, 6.37, 6.37, 8.36, '', NULL, NULL, NULL, NULL, 1, 'VCG', 3, 24),
(24, b'1', '2019-07-12 16:20:18', b'1', 1.93, 1.93, 0, 1.93, 3, 3, 1, NULL, 0, NULL, 0, 0, 1.48, 'O histórico não possui a média geral', 0, 0, 0, 0, 0, 'VCG', 3, 25),
(25, b'1', '2019-07-12 18:33:34', b'1', 5.16, 5.16, 1.35, 2.46, 3, 3, 1, 0, 0.85, 7.94, 6.75, 6.75, 7.17, '', NULL, NULL, NULL, NULL, 5, 'VCG', 2, 34),
(26, b'1', '2019-07-12 18:58:32', b'1', 1.97, 1.97, 0, 1.97, 1, 1, NULL, 1, 0.85, 8.1, 6.88, 6.88, 5.71, '', NULL, NULL, NULL, NULL, 1, 'VCG', 2, 35),
(28, b'1', '2019-07-12 19:15:39', b'1', 10, 13.64, 6.82, 0, 3, 3, 1, NULL, 0, NULL, 0, 0, 3.9, 'Histórico sem coeficiente geral de rendimento', NULL, NULL, NULL, NULL, 0, 'VCG', 2, 36),
(29, b'1', '2019-07-12 19:26:58', b'1', 10, 12.52, 6.26, 0, 3, 3, 1, NULL, 1, 8.04, 8.04, 8.04, 9.53, '', NULL, NULL, NULL, NULL, 3, 'VCG', 2, 37),
(30, b'1', '2019-07-12 19:38:18', b'1', 2.94, 2.94, 0, 2.94, 3, 3, 1, NULL, 0, NULL, NULL, NULL, 1.78, 'Não entregou o histórico', NULL, NULL, NULL, NULL, 1, 'VCG', 2, 38),
(31, b'1', '2019-07-12 19:52:51', b'1', 2.5, 2.5, 1.25, 0, 3, 3, 1, NULL, 1, 7.33, 7.33, 7.33, 9.78, '', 10, 20, 4, NULL, 2, 'VCG', 2, 39),
(32, b'0', '2019-07-13 13:30:35', b'1', 3.54, 3.54, 1.77, 0, 3, 3, 1, 0, 0, NULL, NULL, NULL, 1.96, 'Os documentos não estão com Carimbo de CONFERE COM ORIGINAL. A cópia do histórico não está com a primeira página onde deveria constar o nome da candidata.', 0, 0, 0, 0, 1, 'VCG', 7, 44),
(33, b'0', '2019-07-13 13:48:27', b'1', NULL, NULL, NULL, NULL, 3, 3, 1, NULL, 0, NULL, NULL, NULL, 3.9, 'Está sem Carimbo de CONFERE', 10, 10, 2, NULL, 0, 'VCG', 7, 45),
(34, b'1', '2019-07-13 13:53:12', b'1', 3.88, 3.88, 1.94, 0, 3, 3, 1, NULL, 0.85, 7.54, 6.41, 6.41, 9.55, '', 10, 10, 2, NULL, 2, 'VCG', 7, 45),
(35, b'1', '2019-07-13 14:01:01', b'1', 10, 20.76, 10.38, 0, 3, 3, 1, NULL, 1, 5.77, 5.77, 5.77, 7.94, '', NULL, NULL, NULL, NULL, 2, 'VCG', 7, 47),
(36, b'1', '2019-07-13 14:11:27', b'1', 2.78, 2.78, 1.39, 0, 1, 1, 0, 1, 1, 7, 7, 7, 6.03, 'Faltando o CARIMBO DE CONFERE', NULL, NULL, NULL, NULL, 1, 'VCG', 7, 46),
(37, b'0', '2019-07-13 15:53:43', b'1', 2.34, 2.34, 1.17, 0, 3, 3, 1, NULL, 0.85, 7.13, 6.06, 6.06, 5.84, '', NULL, NULL, NULL, NULL, 1, 'VCG', 7, 48),
(38, b'1', '2019-07-13 16:11:33', b'1', 8.67, 8.67, 3.68, 1.31, 3, 3, 1, NULL, 0.85, 7.13, 6.06, 6.06, 7.74, '', NULL, NULL, NULL, NULL, 3, 'VCG', 7, 48),
(39, b'1', '2019-07-13 16:18:35', b'1', NULL, NULL, NULL, NULL, 3, 3, 1, NULL, 1, 7.53, 7.53, 7.53, 6.17, '', NULL, NULL, NULL, NULL, 0, 'VCG', 7, 49),
(40, b'1', '2019-07-13 16:29:11', b'1', 10, 12.55, 2.08, 8.39, 3, 3, 1, NULL, 1, 5.86, 5.86, 5.86, 8, '', NULL, NULL, NULL, NULL, 10, 'VCG', 7, 50),
(41, b'1', '2019-07-13 17:11:26', b'1', 10, 13.78, 6.89, 0, 3, 3, 1, NULL, 0.85, 6.4, 5.44, 5.44, 7.71, '', NULL, NULL, NULL, NULL, 6, 'VCG', 7, 51),
(42, b'0', '2019-07-13 17:22:22', b'1', 10, 10.63, 0, 10.63, 3, 3, 1, NULL, 1, NULL, 0, 0, 3.9, '', NULL, NULL, NULL, NULL, 2, 'VCG', 7, 53),
(43, b'1', '2019-07-13 17:28:08', b'1', 6.82, 6.82, 3.41, 0, 3, 3, 1, NULL, 1, 7.24, 7.24, 7.24, 8.01, '', NULL, NULL, NULL, NULL, 3, 'VCG', 7, 52),
(44, b'1', '2019-07-16 20:34:58', b'1', 4.46, 4.46, 1.77, 0.92, 2, 2, 1, -1, 1, 8.42, 8.42, 8.42, 7.83, 'Está sem Carimbo de Confere com Original', 0, 0, 0, NULL, 2, 'VCG', 7, 44),
(45, b'1', '2019-07-16 23:53:34', b'1', 7.49, 7.49, 0, 7.49, 1, 1, NULL, 1, 1, 7.64, 7.64, 7.64, 9.09, '', 4, 4, NULL, 2, 3, 'VCG', 2, 40),
(48, b'0', '2019-07-17 00:02:37', b'1', 0, 0, 0, 0, 3, 3, 1, NULL, 0.85, 5.13, 4.36, 4.36, 3.95, '', NULL, NULL, NULL, NULL, 0, 'VCG', 2, 41),
(49, b'1', '2019-07-17 00:04:11', b'1', 7.44, 7.44, 3.72, 0, 3, 3, 1, NULL, 0.85, 5.13, 4.36, 4.36, 6.18, '', NULL, NULL, NULL, NULL, 2, 'VCG', 2, 41),
(50, b'1', '2019-07-17 16:35:17', b'1', 10, 13.49, 0, 13.49, 3, 3, 1, NULL, 0.85, 8.35, 7.1, 7.1, 8.87, '', 0, 0, 0, NULL, 6, 'VCG', 3, 71),
(51, b'0', '2019-07-17 19:03:49', b'1', 0.84, 0.84, 0, 0.84, 2, 2, NULL, 2, 1, 9.04, 9.04, 9.04, 10.18, '', 10, 10, NULL, 5, 1, 'VCG', 2, 42),
(52, b'1', '2019-07-18 21:05:34', b'1', NULL, NULL, NULL, NULL, 1, 1, NULL, 1, 1, 8.11, 8.11, 8.11, 5.98, '', NULL, NULL, NULL, NULL, 0, 'VCG', 2, 43),
(53, b'1', '2019-07-19 19:22:43', b'1', 0.84, 0.84, 0, 0.84, 2, 2, NULL, 2, 1, 9.04, 9.04, 9.04, 7.18, '', NULL, NULL, NULL, NULL, 1, 'VCG', 2, 42),
(54, b'1', '2019-07-22 12:33:18', b'1', 10, 20.46, 0, 20.46, 1, 1, NULL, 1, 1, 6.934, 6.93, 6.93, 8.15, '', 0, 0, 0, 0, 7, 'VCG', 10, 14),
(55, b'1', '2019-07-22 12:43:14', b'1', NULL, NULL, NULL, NULL, 3, 3, 1, NULL, 0.85, 5.98, 5.08, 5.08, 4.46, '', 0, 0, 0, 0, 0, 'VCG', 10, 15),
(56, b'1', '2019-07-22 13:09:46', b'1', NULL, NULL, NULL, NULL, 3, 3, 1, NULL, 0.85, 6.99, 5.94, 5.94, 8.06, 'Diploma sem o carimbo de confere. Conta de luz sem carimbo de confere.', 10, 10, 2, NULL, 0, 'VCG', 10, 16),
(57, b'1', '2019-07-22 13:16:34', b'1', 10, 11.08, 2.54, 6, 3, 3, 1, NULL, 1, 6.48, 6.48, 6.48, 8.44, '', NULL, NULL, NULL, NULL, 4, 'VCG', 12, 63),
(58, b'1', '2019-07-22 13:17:15', b'1', 8.04, 8.04, 4.02, 0, 3, 3, 1, NULL, 0.85, 8, 6.8, 6.8, 8.07, '', 0, 0, 0, 0, 2, 'VCG', 10, 17),
(59, b'0', '2019-07-22 13:20:30', b'0', NULL, NULL, NULL, NULL, 3, 3, 1, NULL, 1, 6.94, 6.94, 6.94, 5.76, 'Sem diploma. Documentos sem carimbo de confere', NULL, NULL, NULL, NULL, 0, 'VCG', 10, 18),
(60, b'0', '2019-07-22 13:31:01', b'0', 6.32, 6.32, 1.65, 3.02, 3, 3, 1, NULL, 1, 6.94, 6.94, 6.94, 7.65, 'Não há diploma na documentação. Documentos estão sem confere.', NULL, NULL, NULL, NULL, 8, 'VCG', 10, 18),
(62, b'1', '2019-07-22 13:31:24', b'1', 10, 30.04, 15.02, 0, 1, 1, 0, 1, 1, NULL, 0, 0, 3.3, '', 0, 0, 0, 0, 0, 'VCG', 12, 62),
(63, b'1', '2019-07-22 13:43:34', b'1', 10, 27.78, 13.72, 0.34, 3, 3, 1, NULL, 0, NULL, NULL, NULL, 3.9, '', NULL, NULL, NULL, NULL, 5, 'VCG', 12, 61),
(65, b'1', '2019-07-22 13:53:21', b'1', 4.68, 4.68, 2.34, 0, 3, 3, 1, NULL, 0.85, 7.6, 6.46, 6.46, 6.83, '', NULL, NULL, NULL, NULL, 0, 'VCG', 12, 60),
(66, b'1', '2019-07-22 14:07:21', b'1', 10, 11.84, 5.92, 0, 3, 3, 1, NULL, 1, 6.99, 6.99, 6.99, 8.79, '', NULL, NULL, NULL, NULL, 4, 'PPI', 12, 59),
(67, b'0', '2019-07-22 14:11:51', b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 'Não entrega da cópia do diploma da graduação ou da declaração de conclusão de curso', NULL, NULL, NULL, NULL, 0, 'VCG', 12, 58),
(68, b'1', '2019-07-22 14:24:46', b'1', 10, 27.2, 13.6, 0, 3, 3, 1, NULL, 0.85, 7, 5.95, 5.95, 8.07, '', NULL, NULL, NULL, NULL, 8, 'VCG', 12, 57),
(69, b'1', '2019-07-22 14:28:14', b'1', 10, 29.99, 0, 29.99, 3, 3, 1, NULL, 0.85, 7.67, 6.52, 6.52, 8.46, '', NULL, NULL, NULL, NULL, 1, 'PPI', 10, 19),
(71, b'1', '2019-07-22 14:29:38', b'1', 1, 1, 0.5, 0, 3, 3, 1, NULL, 0, NULL, NULL, NULL, 1.2, '', NULL, NULL, NULL, NULL, 0, 'VCG', 12, 56),
(72, b'0', '2019-07-22 14:32:03', b'1', 1.18, 1.18, 0, 1.18, 3, 3, 1, NULL, 1, 8.49, 8.49, 8.49, 7.2, '', NULL, NULL, NULL, NULL, 2, 'VCG', 10, 20),
(73, b'1', '2019-07-22 14:34:15', b'1', 0.67, 0.67, 0, 0.67, 2, 2, NULL, 2, 1, 7.26, 7.26, 7.26, 5.88, '', NULL, NULL, NULL, NULL, 1, 'VCG', 12, 55),
(74, b'1', '2019-07-22 14:34:39', b'1', 4.52, 4.52, 1.67, 1.18, 3, 3, 1, NULL, 1, 8.49, 8.49, 8.49, 8.2, '', NULL, NULL, NULL, NULL, 3, 'VCG', 10, 20),
(75, b'1', '2019-07-22 14:39:40', b'1', NULL, NULL, NULL, NULL, 3, 4, 1, 1, 0.85, 7.96, 6.77, 6.77, 5.64, 'Listou atuação profissional no curriculum lattes, mas não apresentou carteira de trabalho ou outro documento comprovando o tempo de atuação', NULL, NULL, NULL, NULL, 0, 'VCG', 10, 21),
(76, b'1', '2019-07-22 14:45:05', b'1', 10, 10.29, 4.15, 1.99, 3, 3, 1, NULL, 0.85, 7.99, 6.79, 6.79, 8.65, '', NULL, NULL, NULL, NULL, 6, 'PPI', 10, 22),
(77, b'1', '2019-07-22 14:49:38', b'1', 1.73, 1.73, 0, 1.73, 3, 4, 1, 1, 0.85, 8.8, 7.48, 7.48, 6.65, '', NULL, NULL, NULL, NULL, 1, 'PPI', 10, 23),
(78, b'1', '2019-07-22 14:51:01', b'1', 10, 12.28, 6.14, 0, 3, 3, 1, NULL, 0.85, 7.8, 6.63, 6.63, 11.54, '', 10, 10, 2, NULL, 9, 'VCG', 12, 54),
(79, b'1', '2019-07-22 18:06:45', b'1', 4.26, 4.26, 1.63, 1, 3, 3, 1, NULL, 0.85, 7.72, 6.56, 6.56, 6.77, '', NULL, NULL, NULL, NULL, 4, 'VCG', 11, 26),
(80, b'1', '2019-07-22 18:55:47', b'1', 2.7, 2.7, 0, 2.7, 3, 3, 1, NULL, 0.85, 8.19, 6.96, 6.96, 8.38, '', 6, 6, NULL, 3, 2, 'VCG', 11, 27),
(81, b'1', '2019-07-22 19:13:38', b'1', 9.34, 9.34, 4.67, 0, 3, 3, 1, NULL, 1, 7.69, 7.69, 7.69, 9.08, '', NULL, NULL, NULL, NULL, 4, 'VCG', 11, 28),
(82, b'1', '2019-07-22 19:27:43', b'1', 8.52, 8.52, 4.26, 0, 3, 3, 1, NULL, 1, 7.5, 7.5, 7.5, 8.71, '', NULL, NULL, NULL, NULL, 2, 'VCG', 11, 29),
(83, b'1', '2019-07-22 19:45:08', b'1', 5.08, 5.08, 2.54, 0, 3, 3, 1, NULL, 0.85, 8.31, 7.06, 7.06, 7.37, '', NULL, NULL, NULL, NULL, 2, 'VCG', 11, 30),
(84, b'0', '2019-07-22 20:05:41', b'0', 2.68, 2.68, 1.34, 0, 3, 3, 1, NULL, 0, NULL, NULL, NULL, 1.7, 'Não possui Histórico Escolar do curso de graduação.\r\nO CPF não possui carimbo de confere com original, contudo não sei dizer se foi por falha do conferinte, visto que há instruções no documento para atestar sua validade.', NULL, NULL, NULL, NULL, 1, 'VCG', 11, 31),
(85, b'1', '2019-07-22 20:31:06', b'1', 6.25, 6.25, 0, 6.25, 1, 1, 0, 1, 1, 7.47, 7.47, 7.47, 7.4, '', NULL, NULL, NULL, NULL, 7, 'PPI', 11, 32),
(86, b'1', '2019-07-22 20:50:04', b'1', 10, 16.87, 0, 16.87, 1, 1, NULL, 1, 0.85, 7.69, 6.54, 6.54, 9.08, '', 4, 4, NULL, 2, 5, 'VCG', 11, 33),
(87, b'1', '2019-07-23 03:24:07', b'1', 7.6, 7.6, 3.8, 0, 3, 3, 1, 0, 0.85, 7.08, 6.02, 6.02, 7.39, '', 0, 0, 0, 0, 1, 'VCG', 5, 64),
(88, b'0', '2019-07-23 04:05:45', b'1', 10, 19.52, 9.55, 0.42, 3, 3, 1, NULL, 0.85, 8.03, 6.83, 6.83, 8.68, '', 0, 0, 0, NULL, 6, 'VCG', 5, 65),
(89, b'1', '2019-07-23 04:17:01', b'1', 10, 20.02, 10.01, 0, 3, 3, 1, 0, 0.85, 8.03, 6.83, 6.83, 8.68, '', 0, 0, 0, 0, 6, 'VCG', 5, 65),
(90, b'1', '2019-07-23 04:29:34', b'1', 10, 13.34, 3.01, 7.32, 3, 3, 1, 0, 0.85, 7.47, 6.35, 6.35, 8.34, '', 0, 0, 0, 0, 5, 'PPI', 5, 66),
(91, b'0', '2019-07-23 04:38:22', b'1', 5.46, 5.46, 2.73, 0, 3, 3, 1, 0, 1, 7.45, 7.45, 7.45, 7.75, '', 0, 0, 0, 0, 4, 'VCG', 5, 73),
(92, b'1', '2019-07-23 04:46:32', b'1', NULL, NULL, NULL, NULL, 3, 3, 1, 0, 0.85, 7.11, 6.04, 6.04, 5.13, '', 0, 0, 0, 0, 0, 'VCG', 5, 74),
(93, b'0', '2019-07-23 04:59:18', b'0', 10, 18.8, 9.4, 0, 0, 0, 0, NULL, 0, NULL, NULL, NULL, 3, '', NULL, NULL, NULL, NULL, 1, 'VCG', 5, 75),
(94, b'1', '2019-07-23 05:05:45', b'1', 10, 22.24, 11.12, 0, 3, 3, 1, 0, 0.85, 7.61, 6.47, 6.47, 8.43, '', 0, 0, 0, 0, 2, 'VCG', 5, 76),
(95, b'1', '2019-07-23 05:16:58', b'1', 3.87, 3.87, 0, 3.87, 1, 1, 0, 1, 1, 7.83, 7.83, 7.83, 6.94, '', 0, 0, 0, 0, 2, 'VCG', 5, 77),
(96, b'0', '2019-07-23 05:22:20', b'1', NULL, NULL, NULL, NULL, 1, 1, 0, 1, 1, 8.18, 8.18, 8.18, 6.03, '', 0, 0, 0, 0, 0, 'VCG', 5, 78),
(97, b'1', '2019-07-23 05:31:48', b'1', 7.43, 7.43, 0, 7.43, 3, 3, 1, 0, 1, 7.5, 7.5, 7.5, 8.38, '', 0, 0, 0, 0, 4, 'VCG', 5, 79),
(98, b'0', '2019-07-23 16:11:26', b'1', NULL, NULL, NULL, NULL, 3, 3, 1, NULL, 0, NULL, NULL, NULL, 0.9, '', NULL, NULL, NULL, NULL, 0, 'VCG', 3, 94),
(99, b'1', '2019-07-23 16:12:43', b'1', NULL, NULL, NULL, NULL, 3, 3, 1, NULL, 0, NULL, NULL, NULL, 0.9, 'Histórico não possui coeficiente geral', NULL, NULL, NULL, NULL, 0, 'VCG', 3, 94),
(100, b'1', '2019-07-23 16:16:20', b'1', NULL, NULL, NULL, NULL, 3, 3, 1, NULL, 1, 7.25, 7.25, 7.25, 5.97, '', NULL, NULL, NULL, NULL, 0, 'VCG', 3, 95),
(101, b'1', '2019-07-23 16:19:29', b'1', NULL, NULL, NULL, NULL, 3, 3, 1, NULL, 0, NULL, NULL, NULL, 0.9, 'Histórico sem o original e sem coeficiente geral.', NULL, NULL, NULL, NULL, 0, 'PPI', 3, 96),
(102, b'0', '2019-07-23 16:25:23', b'1', 4.64, 4.64, 2.32, 0, NULL, NULL, NULL, NULL, 0.85, 7.56, 6.43, 6.43, 5.89, 'Terminou o curso, porém falta colar grau conforme veio descrito na declaração', NULL, NULL, NULL, NULL, 2, 'PPI', 3, 97),
(104, b'1', '2019-07-23 16:41:39', b'1', 1.94, 1.94, 0.97, 0, 3, 3, 1, NULL, 1, 7.8, 7.8, 7.8, 6.94, 'Coeficiente de Rendimento escolar ', 0, 0, 0, NULL, 0, 'VCG', 3, 98),
(105, b'0', '2019-07-23 16:43:38', b'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 'não possui o histórico escolar', NULL, NULL, NULL, NULL, 0, 'VCG', 3, 99),
(106, b'1', '2019-07-23 16:44:02', b'1', NULL, NULL, NULL, NULL, 3, 3, 1, NULL, 0, 0, 0, 0, 0.9, '', NULL, NULL, NULL, NULL, 0, 'VCG', 3, 99),
(107, b'1', '2019-07-23 17:03:34', b'1', NULL, NULL, NULL, NULL, 3, 3, 1, NULL, 1, 7.2, 7.2, 7.2, 5.94, 'Experiência profissional sem data de início e fim', NULL, NULL, NULL, NULL, 0, 'VCG', 3, 100),
(108, b'1', '2019-07-23 17:09:41', b'1', 10, 12.44, 6.22, 0, 3, 3, 1, NULL, 0, 0, 0, 0, 3.9, 'Histórico sem o coeficiente de rendimento', NULL, NULL, NULL, NULL, 1, 'VCG', 3, 101),
(110, b'1', '2019-07-23 17:15:49', b'1', 10, 13.28, 6.64, 0, 3, 3, 1, NULL, 0.85, 8.21, 6.98, 6.98, 8.79, '', NULL, NULL, NULL, NULL, 0, 'VCG', 3, 102),
(111, b'1', '2019-07-23 17:18:55', b'1', NULL, NULL, NULL, NULL, 3, 3, 1, NULL, 1, 7.45, 7.45, 7.45, 6.12, '', NULL, NULL, NULL, NULL, 0, 'VCG', 3, 103),
(112, b'0', '2019-07-23 17:29:35', b'1', 6.71, 6.71, 2.94, 0.83, 3, 3, 1, NULL, 0.85, 7.47, 6.35, 6.35, 7.36, '', NULL, NULL, NULL, NULL, 4, 'VCG', 3, 104),
(113, b'1', '2019-07-23 19:43:42', b'1', 5.46, 5.46, 2.73, 0, 3, 3, 1, NULL, 1, 7.45, 7.45, 7.45, 7.75, '', 0, 0, 0, NULL, 4, 'PPI', 5, 73),
(114, b'1', '2019-07-23 19:55:17', b'1', 10, 18.86, 9.43, 0, 2, 2, NULL, 2, 1, 8.1, 8.1, 8.1, 9.27, '', NULL, NULL, NULL, NULL, 1, 'VCG', 5, 75),
(115, b'1', '2019-07-23 20:11:11', b'1', 2.58, 2.58, 0, 2.58, 1, 1, NULL, 1, 1, 8.18, 8.18, 8.18, 6.8, '', NULL, NULL, NULL, NULL, 1, 'VCG', 5, 78),
(116, b'0', '2019-07-24 21:23:42', b'1', 10, 26.72, 13.36, 0, 3, 3, 1, NULL, 0.85, 0, 0, 0, 3.9, '', NULL, NULL, NULL, NULL, 2, 'VCG', 1, 80),
(117, b'1', '2019-07-24 21:34:14', b'1', 10, 25.7, 12.85, 0, 3, 3, 1, NULL, 0.85, 7.44, 6.32, 6.32, 8.32, '', NULL, NULL, NULL, NULL, 4, 'VCG', 1, 81),
(118, b'0', '2019-07-24 23:28:19', b'1', 10, 15.68, 7.84, 0, 3, 3, 1, NULL, 0.85, 0, 0, 0, 3.9, '', NULL, NULL, NULL, NULL, 2, 'PPI', 1, 83),
(119, b'1', '2019-07-25 00:14:12', b'1', 7.52, 7.52, 3.76, 0, 3, 3, 1, NULL, 1, 7.7, 7.7, 7.7, 8.55, '', NULL, NULL, NULL, NULL, 1, 'VCG', 1, 84),
(120, b'0', '2019-07-25 00:33:32', b'1', 2.04, 2.04, 1.02, 0, 3, 3, 1, NULL, 0.85, 7.71, 6.55, 6.55, 6.1, '', NULL, NULL, NULL, NULL, 2, 'VCG', 1, 82),
(121, b'1', '2019-07-25 00:39:20', b'1', 2.04, 2.04, 1.02, 0, 3, 3, 1, NULL, 0.85, 7.71, 6.55, 6.55, 6.1, 'Apesar do candidato ter concluído as pendências da graduação dele, conforme descrito na declaração da IES, ele estranhamente ainda não colou grau.', NULL, NULL, NULL, NULL, 2, 'VCG', 1, 82),
(122, b'1', '2019-07-25 00:44:24', b'1', 10, 15.68, 7.84, 0, 3, 3, 1, NULL, 0.85, 0, 0, 0, 3.9, 'Não consta no histórico escolar o coeficiente de rendimento do candidato, levando nota zero nesse item no processo de avaliação.', NULL, NULL, NULL, NULL, 2, 'PPI', 1, 83),
(123, b'1', '2019-07-25 00:55:16', b'1', 10, 26.72, 13.36, 0, 3, 3, 1, NULL, 0.85, 0, 0, 0, 3.9, 'Não consta no histórico escolar o coeficiente de rendimento da candidata.', NULL, NULL, NULL, NULL, 2, 'VCG', 1, 80),
(124, b'1', '2019-07-26 03:00:51', b'1', 2.79, 2.79, 0.89, 1.01, 3, 3, 1, NULL, 0.85, 9.01, 7.66, 7.66, 7.1, '', NULL, NULL, NULL, NULL, 2, 'VCG', 1, 93),
(125, b'1', '2019-07-26 03:11:00', b'1', 10, 14.45, 2.74, 8.97, 3, 3, 1, NULL, 0.85, 7.16, 6.09, 6.09, 8.16, '', NULL, NULL, NULL, NULL, 3, 'VCG', 1, 92),
(126, b'1', '2019-07-26 17:09:43', b'1', 4.56, 4.56, 2.28, 0, 3, 3, 1, NULL, 0.85, 7.56, 6.43, 6.43, 6.77, '', NULL, NULL, NULL, NULL, 2, 'VCG', 3, 97),
(127, b'1', '2019-07-27 00:42:19', b'1', 3.87, 3.87, 0, 3.87, 3, 3, 1, NULL, 1, 6.84, 6.84, 6.84, 6.85, '', NULL, NULL, NULL, NULL, 2, 'VCG', 1, 91),
(128, b'1', '2019-07-27 00:52:59', b'1', 10, 18.3, 9.15, 0, 1, 1, NULL, 1, 1, 7.27, 7.27, 7.27, 8.39, '', NULL, NULL, NULL, NULL, 7, 'PPI', 1, 90),
(129, b'1', '2019-07-27 01:05:55', b'1', 10, 18.16, 9.08, 0, 3, 3, 1, NULL, 0.85, 7.39, 6.28, 6.28, 8.3, '', NULL, NULL, NULL, NULL, 6, 'VCG', 1, 89),
(130, b'1', '2019-07-27 01:16:06', b'1', 10, 10.98, 5.49, 0, 3, 3, 1, NULL, 0.85, 8.22, 6.99, 6.99, 11.79, '', 10, 10, 2, NULL, 1, 'VCG', 1, 88),
(131, b'1', '2019-07-27 01:26:45', b'1', 3.4, 3.4, 1.7, 0, 3, 3, 1, NULL, 1, 5.35, 5.35, 5.35, 5.67, '', NULL, NULL, NULL, NULL, 2, 'VCG', 1, 87),
(132, b'1', '2019-07-27 01:36:57', b'1', 4.94, 4.94, 2.47, 0, 3, 3, 1, NULL, 1, 5.63, 5.63, 5.63, 6.32, '', NULL, NULL, NULL, NULL, 5, 'VCG', 1, 86),
(133, b'1', '2019-07-27 01:43:15', b'1', 10, 17.7, 8.85, 0, 3, 3, 1, NULL, 0.85, 7.3, 6.21, 6.21, 8.25, '', NULL, NULL, NULL, NULL, 3, 'VCG', 1, 85),
(134, b'1', '2019-07-31 17:11:30', b'0', 6.4, 6.4, 1.69, 3.02, 0, 0, 0, NULL, 1, 6.94, 6.94, 6.94, 6.78, '', NULL, NULL, NULL, NULL, 9, 'VCG', 3, 18),
(135, b'1', '2019-07-31 17:15:59', b'0', 5.94, 5.94, 0, 5.94, 0, 0, 0, NULL, 1, 8.53, 8.53, 8.53, 7.75, 'não veio o diploma ou declaração de conclusão de curso.', NULL, NULL, NULL, NULL, 2, 'VCG', 3, 58),
(136, b'0', '2019-08-09 21:07:51', b'1', 7.6, 7.6, 3.8, 0, 3, 3, 1, NULL, 0.85, 7.08, 6.02, 6.02, 7.39, '', NULL, NULL, NULL, NULL, 1, 'VCG', 3, 64),
(137, b'1', '2019-08-09 21:35:42', b'1', 2.68, 2.68, 1.34, 0, 3, 3, 1, NULL, 0, NULL, NULL, NULL, 1.7, '', NULL, NULL, NULL, NULL, 1, 'VCG', 3, 31),
(138, b'1', '2019-08-13 16:34:04', b'1', 10, 11.68, 5.84, 0, 3, 3, 1, NULL, 0.85, 7.47, 6.35, 6.35, 8.34, '', NULL, NULL, NULL, NULL, 6, 'VCG', 3, 104),
(140, b'1', '2019-08-13 19:41:23', b'1', 10, 10.63, 0, 10.63, 3, 3, 1, NULL, 1, 8.1, 8.1, 8.1, 9.57, '', NULL, NULL, NULL, NULL, 0, 'VCG', 3, 53);

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacao_id_seq`
--

CREATE TABLE `avaliacao_id_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `avaliacao_id_seq`
--

INSERT INTO `avaliacao_id_seq` (`next_val`) VALUES
(141);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Avaliacao_VinculoEmpregaticio`
--

CREATE TABLE `Avaliacao_VinculoEmpregaticio` (
  `Avaliacao_id` bigint(20) NOT NULL,
  `empregos_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `Avaliacao_VinculoEmpregaticio`
--

INSERT INTO `Avaliacao_VinculoEmpregaticio` (`Avaliacao_id`, `empregos_id`) VALUES
(2, 1),
(2, 2),
(6, 3),
(7, 4),
(8, 5),
(8, 6),
(8, 7),
(9, 8),
(9, 9),
(9, 10),
(9, 11),
(11, 12),
(11, 13),
(11, 14),
(11, 15),
(13, 16),
(14, 17),
(14, 18),
(14, 19),
(15, 20),
(15, 21),
(15, 22),
(17, 23),
(17, 24),
(18, 25),
(19, 26),
(19, 27),
(19, 28),
(20, 29),
(20, 30),
(20, 31),
(21, 32),
(21, 33),
(22, 34),
(25, 35),
(25, 36),
(25, 37),
(25, 38),
(25, 39),
(26, 40),
(29, 41),
(29, 42),
(29, 43),
(30, 44),
(31, 45),
(31, 46),
(32, 47),
(34, 48),
(34, 49),
(35, 50),
(35, 51),
(36, 52),
(37, 53),
(38, 54),
(38, 55),
(38, 56),
(40, 57),
(40, 58),
(40, 59),
(40, 60),
(40, 61),
(40, 62),
(40, 63),
(40, 64),
(40, 65),
(40, 66),
(41, 67),
(41, 68),
(41, 69),
(41, 70),
(41, 71),
(41, 72),
(42, 73),
(42, 74),
(43, 75),
(43, 76),
(43, 77),
(44, 78),
(44, 79),
(45, 80),
(45, 81),
(45, 82),
(49, 83),
(49, 84),
(50, 85),
(50, 86),
(50, 87),
(50, 88),
(50, 89),
(50, 90),
(51, 91),
(53, 92),
(54, 93),
(54, 94),
(54, 95),
(54, 96),
(54, 97),
(54, 98),
(54, 99),
(57, 100),
(57, 101),
(57, 102),
(57, 103),
(58, 104),
(58, 105),
(60, 106),
(60, 107),
(60, 108),
(60, 109),
(60, 110),
(60, 111),
(60, 112),
(60, 113),
(63, 114),
(63, 115),
(63, 116),
(63, 117),
(63, 118),
(66, 119),
(66, 120),
(66, 121),
(66, 122),
(68, 123),
(68, 124),
(68, 125),
(68, 126),
(68, 127),
(68, 128),
(68, 129),
(68, 130),
(69, 131),
(72, 132),
(72, 133),
(73, 134),
(74, 135),
(74, 136),
(74, 137),
(76, 138),
(76, 139),
(76, 140),
(76, 141),
(76, 142),
(76, 143),
(77, 144),
(78, 145),
(78, 146),
(78, 147),
(78, 148),
(78, 149),
(78, 150),
(78, 151),
(78, 152),
(78, 153),
(79, 154),
(79, 155),
(79, 156),
(79, 157),
(80, 158),
(80, 159),
(81, 160),
(81, 161),
(81, 162),
(81, 163),
(82, 164),
(82, 165),
(83, 166),
(83, 167),
(84, 168),
(85, 169),
(85, 170),
(85, 171),
(85, 172),
(85, 173),
(85, 174),
(85, 175),
(86, 176),
(86, 177),
(86, 178),
(86, 179),
(86, 180),
(87, 181),
(88, 182),
(88, 183),
(88, 184),
(88, 185),
(88, 186),
(88, 187),
(89, 188),
(89, 189),
(89, 190),
(89, 191),
(89, 192),
(89, 193),
(90, 194),
(90, 195),
(90, 196),
(90, 197),
(90, 198),
(91, 199),
(91, 200),
(91, 201),
(91, 202),
(93, 203),
(94, 204),
(94, 205),
(95, 206),
(95, 207),
(97, 208),
(97, 209),
(97, 210),
(97, 211),
(102, 212),
(102, 213),
(108, 214),
(112, 215),
(112, 216),
(112, 217),
(112, 218),
(113, 219),
(113, 220),
(113, 221),
(113, 222),
(114, 223),
(115, 224),
(116, 225),
(116, 226),
(117, 227),
(117, 228),
(117, 229),
(117, 230),
(118, 231),
(118, 232),
(119, 233),
(120, 234),
(120, 235),
(121, 236),
(121, 237),
(122, 238),
(122, 239),
(123, 240),
(123, 241),
(124, 242),
(124, 243),
(125, 244),
(125, 245),
(125, 246),
(126, 247),
(126, 248),
(127, 249),
(127, 250),
(128, 251),
(128, 252),
(128, 253),
(128, 254),
(128, 255),
(128, 256),
(128, 257),
(129, 258),
(129, 259),
(129, 260),
(129, 261),
(129, 262),
(129, 263),
(130, 264),
(131, 265),
(131, 266),
(132, 267),
(132, 268),
(132, 269),
(132, 270),
(132, 271),
(133, 272),
(133, 273),
(133, 274),
(134, 275),
(134, 276),
(134, 277),
(134, 278),
(134, 279),
(134, 280),
(134, 281),
(134, 282),
(134, 283),
(135, 284),
(135, 285),
(136, 286),
(137, 287),
(138, 288),
(138, 289),
(138, 290),
(138, 291),
(138, 292),
(138, 293);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Candidato`
--

CREATE TABLE `Candidato` (
  `id` bigint(20) NOT NULL,
  `cpf` varchar(255) DEFAULT NULL,
  `dataNascimento` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `foneCelular` varchar(255) DEFAULT NULL,
  `foneResidencial` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `sexo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `Candidato`
--

INSERT INTO `Candidato` (`id`, `cpf`, `dataNascimento`, `email`, `foneCelular`, `foneResidencial`, `nome`, `sexo`) VALUES
(1, '032.449.004-61', '1979-08-30 00:00:01', 'albertorlima@gmail.com', '(81) 9 9653.6304', '', 'ALBERTO RAMOS DELIMA', 'Masculino'),
(2, '043.448.024-03', '1984-02-27 00:00:01', 'thiagosilvajesus@gmail.com', '(81) 9 8672.1771', '', 'THIAGO JOSÉ DA SLVA', 'Masculino'),
(3, '014.042.524-10', '1987-04-09 00:00:01', 'eng.rfa.rafael@gmail.com', '(81) 9 8306.1004', '', 'RAFAEL FELIPE DE ARAUJO', 'Masculino'),
(4, '091.924.584-67', '1993-01-22 00:00:00', 'paulagoncalo16@gmail.com', '(81) 9 9733.6185', '', 'PAULA GONÇALO DA SILVA', 'Feminino'),
(5, '105.242.424-45', '1996-02-10 00:00:01', 'pedro.nauta@hotmail.com', '(81) 9 9714.8988', '', 'PEDRO PAULO IZIDIO DA SILVA', 'Masculino'),
(6, '036.346.854-41', '1980-01-30 00:00:01', 'alan.augustostee@gmail.com', '(81) 9 8726.9187', '', 'ALAN AUGUSTO DA SILVA', 'Masculino'),
(7, '096.803.124-29', '1992-03-19 00:00:00', 'marcelomlopes2@gmail.com', '(81) 9 9525.3601', '(81) 3438.3481', 'MARCELO DE MORAES LOPES FILHO', NULL),
(8, '112.815.204-54', '1995-05-26 00:00:00', 'victorrocha.ti@gmail.com', '(81) 9 9627.9042', '(81) 3302.4526', 'VICTOR CORDEIRO DA ROCHA', 'Masculino'),
(9, '103.723.394-84', '1992-07-14 00:00:00', 'gtgn@ecomp.poli.br', '(83) 9 9956.4633', '', 'geraldo torres galindo neto', 'Masculino'),
(10, '092.019.254-84', '1995-03-30 00:00:00', 'ennald@live.com', '(81) 9 9796.7315', '', 'ennald iverton pereira da silva', 'Masculino'),
(11, '015.321.054-01', '1990-10-28 00:00:01', 'pricardo.ti@gmail.com', '(81) 9 9823.1803', '', 'PAULO RICARDO GONÇALVES DOS SANTOS', 'Masculino'),
(12, '090.800.164-97', '1990-11-29 00:00:01', 'alan.dias.pe@gmail.com', '(81) 9 9716.9575', '(81) 3037.2111', 'ALAN LAURENTINO DIAS DA SILVA', 'Masculino'),
(13, '059.289.384-70', '1983-05-17 00:00:01', 'petrusclavio@gmail.com', '(81) 9 9721.2854', '', 'PETRUS CLAVIO CELESTINO DE SOUZA', 'Masculino'),
(14, '920.994.914-53', '1974-05-19 00:00:00', 'apqfigueiredo7@gmail.com', '(81) 9 9954.9774', '(81) 3439.1951', 'ANA PAULA QUEIROZ DE FIGUEIREDO', 'Feminino'),
(15, '105.280.624-41', '1993-01-13 00:00:00', 'claudiobernardo.ti@gmail.com', '(81) 9 9390.1543', '', 'CLAUDIO BERNARDO DA SILVA JUNIOR', 'Masculino'),
(16, '078.459.324-85', '1992-03-23 00:00:01', 'iago.silva@ufersa.edu.br', '(81) 9 9590.9029', '', 'IAGO SINESIO FERRIS DA SILVA', 'Masculino'),
(17, '079.324.504-46', '1990-02-04 00:00:00', 'arthur.franca1@yahoo.com.br', '(81) 9 8865.4192', '', 'ARTHUR FRANÇA DA SILVA', 'Masculino'),
(18, '097.255.664-83', '1993-04-23 00:00:01', 'brunorafaelja@gmail.com', '(81) 9 9915.7852', '', 'BRUNO RAFAEL JESUS ALVES', 'Masculino'),
(19, '417.241.004-91', '1965-07-10 00:00:01', 'hortenciofilho2012@hotmail.com', '(81) 9 8373.7995', '', 'JOAO HORTENCIO CRUZ FILHO', 'Masculino'),
(20, '081.698.897-74', '1995-05-18 00:00:01', 'walteann3@gmail.com', '(81) 9 8342.6525', '', 'WALTEANN COSTA DA SILVA', 'Masculino'),
(21, '100.852.014-48', '1994-08-05 00:00:01', 'rafaela.araujo1954@gmail.com', '(81) 9 9597.5368', '(81) 3476.2005', 'RAFAELA BATISTA DE ARAUJO', 'Masculino'),
(22, '067.157.074-99', '1986-01-30 00:00:00', 'lucasassuncaog@gmail.com', '(81) 9 8491.1972', '(81) 3377.7572', 'LUCAS ASSUNÇÃO GOMES', 'Masculino'),
(23, '080.651.074-94', '1990-08-11 00:00:01', 'anicelysantos@gmail.com', '(81) 9 9175.4565', '', 'ANICELY MARIA CARLOS DOS SANTOS', 'Feminino'),
(24, '339.600.894-49', '1962-02-07 00:00:00', 'saintclairramos@hotmail.com', '(81) 9 9637.1092', '', 'SAINT-CLAIR DOS SANTOS RAMOS FILHO', 'Masculino'),
(25, '047.109.714-47', '1984-05-10 00:00:01', 'leandrosantos2006@gmail.com', '(81) 9 9422.3216', '', 'LEANDRO FRANCISCO DOS SANTO', 'Masculino'),
(26, '014.157.744-47', '1997-04-24 00:00:01', 'paulo.victorcavalcante@hotmail.com', '(81) 9 9498.9838', '(81) 3535.4117', 'Paulo Victor Cavalcante Costa', 'Masculino'),
(27, '069.434.564-40', '1989-04-30 00:00:01', 'bmtest@gmail.com', '(81) 9 9695.7009', '(81) 3377.2570', 'BRUNO MACHADO TRAJANO', 'Masculino'),
(28, '059.011.834-01', '1983-11-29 00:00:01', 'ctralberto@gmail.com', '(81) 9 9818.6762', '', 'ALBERTO GOMES DA SILVA', 'Masculino'),
(29, '038.521.454-57', '1981-02-05 00:00:01', 'gilbertofeitosa@gmail.com', '(81) 9 8888.5834', '', 'GILBERTO ALVES FEITOSA JUNIOR', 'Masculino'),
(30, '103.344.314-09', '1995-01-19 00:00:01', 'brunofelixmbarbosa@gmail.com', '(81) 9 9578.2171', '(81) 3080.2472', 'BRUNO FELIX DE MENDONÇA BARBOSA', 'Masculino'),
(31, '103.131.444-00', '1993-11-23 00:00:00', 'bernardo.ellton@gmail.com', '(81) 9 9768.8900', '(81) 3251.7489', 'ELLTON BERNARDO DE OLIVEIRA', 'Masculino'),
(32, '060.550.144-08', '1986-10-23 00:00:01', 'rlrecife@gmail.com', '(81) 9 9679.3844', '', 'RODOLFO LIMA DOS ANJOS', 'Masculino'),
(33, '009.072.954-44', '1982-04-20 00:00:00', 'glaudston.antunes@gmail.com', '(81) 9 9512.3088', '(81) 3472.0107', 'GLAUDSTON ANTUNES MOTA MONTEIRO DE BARROS', 'Masculino'),
(34, '051.908.134-01', '1978-10-25 00:00:01', 'diegomn@gmail.com', '(81) 9 8854.8975', '', 'witalo diego matias nunes', 'Masculino'),
(35, '052.559.384-59', '1983-06-29 00:00:00', 'janaviana83@gmail.com', '(81) 9 9630.6845', '', 'JANAYNA CONSTATINA VIANA', 'Feminino'),
(36, '034.792.594-48', '1978-10-03 00:00:01', 'ppphenrique@gmail.com', '(81) 9 9701.4215', '', 'PAULO HENRIQUE BARBOSA DE LIMA', 'Masculino'),
(37, '089.514.104-39', '1993-12-14 00:00:01', 'alissoncahu@gmail.com', '(81) 9 8648.1030', '(81) 3481.0441', 'ALISSON CAHU BARBOSA', 'Masculino'),
(38, '859.783.371-89', '1980-02-10 00:00:01', 'elisangelayres@hotmail.com', '(81) 9 9866.9751', '', 'ELISANGELA AYRES DE LIMA', 'Feminino'),
(39, '086.837.384-26', '1990-10-22 00:00:00', 's.rafaelbarbosa@gmail.com', '(81) 9 9283.5782', '(81) 3053.5762', 'rafael santos barbosa', 'Masculino'),
(40, '014.386.484-05', '1989-01-31 00:00:00', 'menezesphelipe@gmail.com', '(81) 9 9644.0571', '(81) 3255.2283', 'PHELIPE RAFAEL ALVES DE MENEZES', 'Masculino'),
(41, '088.196.384-44', '1992-01-02 00:00:00', 'erisonbcs@gmail.com', '(81) 9 9785.8696', '(81) 3525.0717', 'ERISSON BATISTA DA CUNHA SILVA', 'Masculino'),
(42, '095.145.664-40', '1991-05-06 00:00:00', 'pablinho_serra@hotmail.com', '(81) 9 9132.3375', '(81) 3462.9413', 'PABLO VINICIUS D\'OLIVEIRA MENEZES', 'Masculino'),
(43, '093.392.414-36', '1998-02-05 00:00:00', 'thiago.brito@cpqam.fiocruz.br', '(81) 9 8734.8490', '(81) 2123.7830', 'THIAGO HENRIQUE DA SILVA BRITO', 'Masculino'),
(44, '085.993.014-97', '1990-03-18 00:00:01', 'ALINENASCIMENTO.GI@GMAIL.COM', '(81) 9 9703.6131', '(81) 3326.8167', 'ALINE SANTANA DO NASCIMENTO PEREIRA', 'Masculino'),
(45, '070.079.344-55', '1992-07-22 00:00:01', 'wagner.bitencourt@hotmail.com', '(81) 9 9693.4126', '', 'WAGNER BITENCOURT ALVES', 'Masculino'),
(46, '076.119.344-81', '1990-05-12 00:00:01', 'dominique.santosferreira@gmail.com', '(81) 9 9568.7586', '', 'DOMINIQUE SANTOS FERREIRA', 'Feminino'),
(47, '050.681.104-26', '1985-03-29 00:00:00', 'SILVANA.LILIAN@OUTLOOK.COM', '(81) 9 9729.8872', '', 'SILVANA LILIAN RAMALHO DA SILVA', 'Feminino'),
(48, '707.068.214-08', '1998-07-18 00:00:01', 'yurri11@hotmail.com', '(81) 9 9988.8302', '', 'thallys yuri oliveira santiago', 'Masculino'),
(49, '053.378.684-38', '1992-05-16 00:00:01', 'filipeepifanio1991@gmail.com', '(81) 9 9614.5404', '', 'FILIPE EPIFANIO DE OLIVEIRA', 'Masculino'),
(50, '053.624.884-22', '1986-04-17 00:00:01', 'pablosotero@hotmail.com', '(81) 9 8851.7454', '(81) 3040.7454', 'pablo fernando viana sotero', 'Masculino'),
(51, '059.435.174-05', '1986-01-16 00:00:01', 'diegodasilvasoares@gmail.com', '(81) 9 9253.4595', '(81) 3034.3147', 'DIEGO DA SILVA SOARES', 'Masculino'),
(52, '098.596.644-04', '1994-06-13 00:00:01', 'LUCASATRN@GMAIL.COM', '(81) 9 9669.8120', '', 'lucas pedro de paula', 'Masculino'),
(53, '034.569.524-06', '1982-09-28 00:00:00', 'samuelffn@gmail.com', '(81) 9 8803.5319', '(81) 3471.8770', 'SAMUEL FRANCISCO DE FRANÇA NETO', 'Masculino'),
(54, '092.088.641-21', '1994-08-12 00:00:00', 'gisomarjr1994@gmail.com', '(81) 9 8245.5892', '', 'GISOMAR  DA SILVA JUNIOR', 'Masculino'),
(55, '104.686.424-63', '1993-09-21 00:00:01', 'deyse_kerolly@hotmail.com', '(81) 9 8301.9847', '', 'DEYSE KEROLLY DUARET TEODOZIO', 'Feminino'),
(56, '085.595.464-93', '1989-08-08 00:00:01', 'ingridgti08@hotmail.com', '(81) 9 9940.9322', '', 'INGRID CAVALCANTI DA SILVA', 'Feminino'),
(57, '070.054.427-50', '1975-09-25 00:00:01', 'seixas.carlo@gmail.com', '(81) 9 9791.7580', '(81) 3314.5108', 'CARLO ROBERTO FERREIRA SEIXAS', 'Masculino'),
(58, '088.053.764-77', '1989-08-01 00:00:01', 'elvis.tavares@gmail.com', '(81) 9 8233.4594', '(91) 3446.5560', 'ELVIS CATRO TAVARES DA SILVA', 'Masculino'),
(59, '091.863.584-56', '1994-01-28 00:00:01', 'aylmabenicio@hotmail.com', '(81) 9 8823.9542', '', 'AYLMA BENICIO DA SILVA', 'Feminino'),
(60, '085.229.004-77', '1995-08-31 00:00:01', 'EMANUEL_LIMMA@LIVE.COM', '(81) 9 9749.5314', '', 'emanuel enoque de lima silva', 'Masculino'),
(61, '039.024.574-73', '1981-05-15 00:00:01', 'rubez@hotmail.com', '(81) 9 9641.5343', '(81) 3434.3130', 'RUDRIGO ARAUJO BEZERRA', 'Masculino'),
(62, '900.066.904-91', '1976-09-10 00:00:00', 'josimarsajunior@gmail.com', '(81) 9 8133.6333', '(81) 3474.6595', 'JOSIMAR SERAFEN DE ALBUQUERQUE JUNIOR', 'Masculino'),
(63, '078.103.134-60', '1991-01-31 00:00:01', 'j.rennan@outlook.com', '(81) 9 8607.8483', '', 'JHONATHAN RENNAN DA SILVA', 'Masculino'),
(64, '765.662.344-20', '1986-12-23 00:00:00', 'e1000enio@gmail.com', '(81) 9 8188.4456', '(81) 9864.4456', 'ENIO SERGIO COELHO RODRIGUES', 'Masculino'),
(65, '082.311.454-60', '1989-04-06 00:00:01', 'ludenivson@yahoo.com.br', '(81) 9 9403.0219', '', 'ludenivson victor hugo soares', 'Masculino'),
(66, '046.330.314-81', '1983-01-29 00:00:00', 'solva.igorf@gmail.com', '(81) 9 8885.1622', '(81) 3267.7962', 'IGOR FELIPE DA SILVA', 'Masculino'),
(67, '072.290.823-74', '1997-11-17 00:00:01', 'carloswilliamylourenco@gmail.com', '(81) 9 9688.1402', '', 'CARLOS WILLIAMY LOURENÇO ANDRADE', 'Masculino'),
(68, '035.919.683-74', '1989-04-30 00:00:01', 'karlos.1914.so@gmail.com', '(81) 9 9627.6167', '', 'Katyeudo Karlos de Sousa Oliveira', 'Masculino'),
(69, '089.608.584-80', '1992-09-13 00:00:00', 'igorcabrobo@hotmail.com', '(87) 9 9662.5297', '', 'Igor Gomes de Oliveira', 'Masculino'),
(70, '056.903.444-27', '1992-11-20 00:00:01', 'tmartiiins@gmail.com', '(87) 9 9662.3699', '', 'Thiago Martins Silva', 'Masculino'),
(71, '013.916.024-80', '1986-11-14 00:00:00', 'jorge0302@gmail.com', '(81) 9 8645.2028', '', 'Jorge Batista Alves dos Santos', 'Masculino'),
(72, '037.979.094-70', '1981-10-10 00:00:01', 'iurisiga@gmail.com', '(81) 9 9830.5709', '', 'Iuri Diniz Silva', 'Masculino'),
(73, '044.293.444-00', '1982-11-02 00:00:01', 'flavio@afixo.com.br', '(81) 9 9832.6224', '(81) 3094.1018', 'FLÁVIO SILVA BRANDÃO', 'Masculino'),
(74, '081.502.244-16', '1990-03-05 00:00:01', 'murilo.dauro@gmail.com', '(87) 9 9656.9868', '', 'MURILO DAURO DE ANDRADE REBOUÇAS', 'Masculino'),
(75, '030.362.124-93', '1979-12-23 00:00:00', 'hilton_av@hotmail.com', '(81) 9 8829.9942', '', 'HILTON DE AQUINO VIANA', 'Masculino'),
(76, '012.510.344-11', '1983-05-01 00:00:00', 'samuelvicente1@hotmail.com', '(81) 9 8471.8618', '(81) 3132.1347', 'samuel vicente dos santos', 'Masculino'),
(77, '099.381.154-03', '1995-03-17 00:00:00', 'suelencaroline17@hotmail.com', '(81) 9 9374.1429', '', 'Suelen Carolina Silva Oliveira', 'Feminino'),
(78, '921.749.494-15', '1977-10-09 00:00:00', 'alcyns@yahoo.com.br', '(81) 9 8897.1019', '(81) 3379.6255', 'Alcione Nunes da Silva', 'Feminino'),
(79, '080.884.924-75', '1988-07-02 00:00:01', 'adrianohat@gmail.com', '(81) 9 8240.5220', '', 'Adriano Felix Soares', 'Masculino'),
(80, '272.595.248-47', '1977-03-30 00:00:01', 'ANA.ACASSIANO@GMAIL.COM', '(81) 9 9727.3874', '(81) 3033.3581', 'ANA PAULA CASSIANO ALVES DA SILVA', 'Feminino'),
(81, '012.958.794-09', '1983-06-26 00:00:01', 'JAIRL.SANTOS@GMAIL.COM', '(81) 9 9145.5310', '(81) 3345.4581', 'JAIR LUIZ DOS SANTOS', NULL),
(82, '108.228.274-09', '1996-09-17 00:00:00', 'FELIPECAVALCANTI033@GMAIL.COM', '(81) 9 9742.6332', '', 'LUIZ FELIPE CAVALCANTI CORNELLI', 'Masculino'),
(83, '071.041.954-67', '1988-12-12 00:00:00', 'RAPHAELCOEL@GMAIL.COM', '(81) 9 9525.1620', '', 'RAPHAEL COELHO BRASILEIRO DA SILVA', 'Masculino'),
(84, '091.025.104-56', '1994-09-27 00:00:01', 'JMTEUSPS@OUTLOOK.COM', '(81) 9 8118.6358', '(81) 3019.5230', 'JOÃO MATEUS PALMEIRA DA SILVA FERREIRA', 'Masculino'),
(85, '054.805.594-78', '1984-07-25 00:00:01', 'BATISTA_ANDERSON@HOTMAIL.COM', '(81) 9 8855.5398', '', 'ANDERSON BATISTA SANTOS DA SILVA', 'Masculino'),
(86, '085.349.294-83', '1991-04-12 00:00:00', 'ROMULOSLV@ICLOUD.COM', '(81) 9 9639.2867', '', 'ROMULO FERREIRA DA SILVA', 'Masculino'),
(87, '042.839.934-76', '1981-04-25 00:00:00', 'kellyvieira09@hotmail.com', '(81) 9 9126.9105', '(81) 9686.4676', 'KELLY CRISTIANE VIEIRA DA SILVA', 'Feminino'),
(88, '086.961.854-71', '1991-06-20 00:00:01', 'richardsonbruno@gmail.com', '(81) 9 9481.7507', '(81) 3326.6409', 'Richardson Bruno da Silva Andrade', 'Masculino'),
(89, '048.977.194-70', '1982-10-20 00:00:00', 'facn@cin.upfe.br', '(81) 9 8510.1447', '(81) 3125.3523', 'Francisco de Assis Callou Neto', 'Masculino'),
(90, '035.739.204-38', '1979-11-08 00:00:01', 'eronys@gmail.com', '', '', 'Eronys Robson Feitosa dos Santos', 'Masculino'),
(91, '013.788.084-79', '1986-02-24 00:00:01', 'gu.grsv@gmail.com', '(81) 9 9207.6233', '', 'Gustavo Rogério da Silva Barbosa', 'Masculino'),
(92, '076.734.144-90', '1988-07-03 00:00:01', 'gustavopesantos@yahoo.com.br', '(81) 9 8695.0718', '', 'Gustavo Pereira dos Santos', 'Masculino'),
(93, '107.147.184-83', '1994-08-28 00:00:00', 'arildocesar@gmail.com', '(81) 9 9859.2155', '', 'Aryldo César de Castro Fragoso', 'Masculino'),
(94, '074.101.104-22', '1984-12-10 00:00:00', 'angelmetal@uol.com.br', '(81) 9 9216.5492', '', 'Angelo Anderson de Souza Ferreira', 'Masculino'),
(95, '027.779.804-38', '1979-03-24 00:00:00', 'elinunes2009@gmail.com', '(81) 9 9800.1184', '', 'Elivaneide Nicolau de Melo', 'Feminino'),
(96, '042.928.564-78', '1981-09-16 00:00:01', 'jurandy.ds@gmail.com', '(81) 9 8716.0980', '', 'Jurandy dos Santos Júnior', 'Masculino'),
(97, '113.588.644-03', '1997-08-01 00:00:00', 'humbertompn97@gmail.com', '(81) 9 9669.3871', '', 'Humberto Mendes de Paula Neto', 'Masculino'),
(98, '102.853.884-79', '1994-10-27 00:00:00', 'marcosniv@gmail.com', '(81) 9 9158.7142', '', 'Marcos Vinícios da Silva Arcanjo', 'Masculino'),
(99, '038.894.274-64', '1980-05-26 00:00:00', 'rubronegro2008@hotmail.com', '', '(81) 9885.1982', 'Ornyr Pereira dos Santos', 'Masculino'),
(100, '074.013.094-32', '1989-07-10 00:00:00', 'samyrsiqueira@hotmail.com', '(21) 9 9161.6367', '', 'Samyr Saturnino Silva Siqueira', 'Masculino'),
(101, '051.378.094-70', '1989-12-12 00:00:00', 'ghanobre@gmail.com', '(81) 9 9758.5933', '', 'Gustavo Henrique Albuquerque Nobre', 'Masculino'),
(102, '066.963.744-37', '1991-07-13 00:00:01', 'andrecostaa@gmail.com', '(81) 9 9698.0687', '', 'André Luis Alves da Costa', 'Masculino'),
(103, '039.416.034-77', '1982-12-10 00:00:00', 'gilvalene@gmail.com', '(81) 9 8808.7181', '', 'Gilvalene Inacio de Oliveira', 'Feminino'),
(104, '079.190.054-18', '1990-12-24 00:00:00', 'elton.gilo@outlook.com', '(81) 9 8554.6230', '', 'Elton José de Oliveira Giló', 'Masculino');

-- --------------------------------------------------------

--
-- Estrutura para tabela `candidato_id_seq`
--

CREATE TABLE `candidato_id_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `candidato_id_seq`
--

INSERT INTO `candidato_id_seq` (`next_val`) VALUES
(105);

-- --------------------------------------------------------

--
-- Estrutura para tabela `EntidadeNegocio`
--

CREATE TABLE `EntidadeNegocio` (
  `id` int(11) NOT NULL,
  `habilitado` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `hibernate_sequences`
--

CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) NOT NULL,
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Inscricao`
--

CREATE TABLE `Inscricao` (
  `id` bigint(20) NOT NULL,
  `avaliadorAlocado` varchar(255) DEFAULT NULL,
  `classificacao` int(11) DEFAULT NULL,
  `cursoEscolhido` varchar(255) DEFAULT NULL,
  `dataInscricao` datetime DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `qtdAvaliacoes` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `candidato_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `Inscricao`
--

INSERT INTO `Inscricao` (`id`, `avaliadorAlocado`, `classificacao`, `cursoEscolhido`, `dataInscricao`, `numero`, `qtdAvaliacoes`, `status`, `candidato_id`) VALUES
(1, 'Nilson Junior', NULL, 'Gestao', '2019-06-18 20:22:20', 137, 1, 'Aprovada', 1),
(2, 'Nilson Junior', NULL, 'Gestao', '2019-06-19 20:48:22', 138, 1, 'Aprovada', 2),
(3, 'Nilson Junior', NULL, 'Gestao', '2019-06-25 19:32:08', 139, 2, 'Aprovada', 3),
(4, 'Nilson Junior', NULL, 'Inovacao', '2019-06-25 22:23:22', 140, 1, 'Aprovada', 4),
(5, 'Nilson Junior', NULL, 'Inovacao', '2019-06-26 17:18:21', 141, 1, 'Aprovada', 5),
(6, 'Nilson Junior', NULL, 'Gestao', '2019-06-27 18:46:09', 142, 1, 'Aprovada', 6),
(7, 'Nilson Junior', NULL, 'Inovacao', '2019-06-27 20:34:55', 143, 1, 'Aprovada', 7),
(8, 'Nilson Junior', NULL, 'Gestao', '2019-06-27 22:09:12', 144, 1, 'Aprovada', 8),
(9, 'Nilson Junior', NULL, 'Gestao', '2019-06-28 19:17:13', 145, 2, 'Aprovada', 9),
(10, 'Nilson Junior', NULL, 'Gestao', '2019-06-28 22:12:31', 146, 1, 'Aprovada', 10),
(11, 'Nilson Junior', NULL, 'Inovacao', '2019-07-01 19:24:20', 147, 1, 'Aprovada', 11),
(12, 'Nilson Junior', NULL, 'Gestao', '2019-07-01 21:03:16', 148, 1, 'Aprovada', 12),
(13, 'Nilson Junior', NULL, 'Inovacao', '2019-07-01 21:18:25', 149, 1, 'Aprovada', 13),
(14, 'Bruno Gentilini D’Ambrosio', NULL, 'Gestao', '2019-07-02 17:15:45', 150, 1, 'Aprovada', 14),
(15, 'Bruno Gentilini D’Ambrosio', NULL, 'Inovacao', '2019-07-02 18:10:38', 151, 1, 'Aprovada', 15),
(16, 'Bruno Gentilini D’Ambrosio', NULL, 'Inovacao', '2019-07-02 19:13:33', 152, 1, 'Aprovada', 16),
(17, 'Bruno Gentilini D’Ambrosio', NULL, 'Gestao', '2019-07-02 19:23:10', 153, 1, 'Aprovada', 17),
(18, 'Bruno Gentilini D’Ambrosio', NULL, 'Inovacao', '2019-07-02 20:37:47', 154, 3, 'Aprovada', 18),
(19, 'Bruno Gentilini D’Ambrosio', NULL, 'Gestao', '2019-07-02 21:51:18', 155, 1, 'Aprovada', 19),
(20, 'Bruno Gentilini D’Ambrosio', NULL, 'Inovacao', '2019-07-02 22:10:19', 156, 2, 'Aprovada', 20),
(21, 'Bruno Gentilini D’Ambrosio', NULL, 'Gestao', '2019-07-02 22:22:10', 157, 1, 'Aprovada', 21),
(22, 'Bruno Gentilini D’Ambrosio', NULL, 'Gestao', '2019-07-02 22:30:13', 158, 1, 'Aprovada', 22),
(23, 'Bruno Gentilini D’Ambrosio', NULL, 'Inovacao', '2019-07-03 17:45:01', 159, 1, 'Aprovada', 23),
(24, 'Nilson Junior', NULL, 'Inovacao', '2019-07-03 18:06:27', 160, 1, 'Aprovada', 24),
(25, 'Nilson Junior', NULL, 'Inovacao', '2019-07-03 19:09:22', 161, 1, 'Aprovada', 25),
(26, 'Diego Cesar Florêncio de Queiroz', NULL, 'Inovacao', '2019-07-03 20:51:58', 162, 1, 'Aprovada', 26),
(27, 'Diego Cesar Florêncio de Queiroz', NULL, 'Inovacao', '2019-07-03 22:01:43', 163, 1, 'Aprovada', 27),
(28, 'Diego Cesar Florêncio de Queiroz', NULL, 'Inovacao', '2019-07-03 22:09:06', 164, 1, 'Aprovada', 28),
(29, 'Diego Cesar Florêncio de Queiroz', NULL, 'Inovacao', '2019-07-03 22:15:43', 165, 1, 'Aprovada', 29),
(30, 'Diego Cesar Florêncio de Queiroz', NULL, 'Inovacao', '2019-07-03 22:22:34', 166, 1, 'Aprovada', 30),
(31, 'Diego Cesar Florêncio de Queiroz', NULL, 'Inovacao', '2019-07-03 22:36:19', 167, 2, 'Aprovada', 31),
(32, 'Diego Cesar Florêncio de Queiroz', NULL, 'Gestao', '2019-07-03 22:49:44', 168, 1, 'Aprovada', 32),
(33, 'Diego Cesar Florêncio de Queiroz', NULL, 'Gestao', '2019-07-04 17:47:29', 169, 1, 'Aprovada', 33),
(34, 'Francisco Nascimento', NULL, 'Gestao', '2019-07-04 18:25:26', 170, 1, 'Aprovada', 34),
(35, 'Francisco Nascimento', NULL, 'Inovacao', '2019-07-04 18:35:01', 171, 1, 'Aprovada', 35),
(36, 'Francisco Nascimento', NULL, 'Gestao', '2019-07-04 18:42:55', 172, 1, 'Aprovada', 36),
(37, 'Francisco Nascimento', NULL, 'Inovacao', '2019-07-04 19:13:30', 173, 1, 'Aprovada', 37),
(38, 'Francisco Nascimento', NULL, 'Inovacao', '2019-07-04 19:24:07', 174, 1, 'Aprovada', 38),
(39, 'Francisco Nascimento', NULL, 'Gestao', '2019-07-04 19:53:17', 175, 1, 'Aprovada', 39),
(40, 'Francisco Nascimento', NULL, 'Inovacao', '2019-07-04 20:01:40', 176, 1, 'Aprovada', 40),
(41, 'Francisco Nascimento', NULL, 'Inovacao', '2019-07-04 20:29:24', 177, 2, 'Aprovada', 41),
(42, 'Francisco Nascimento', NULL, 'Gestao', '2019-07-04 20:37:38', 178, 2, 'Aprovada', 42),
(43, 'Francisco Nascimento', NULL, 'Inovacao', '2019-07-04 20:42:55', 179, 1, 'Aprovada', 43),
(44, 'Havana Alves', NULL, 'Inovacao', '2019-07-04 20:47:38', 180, 2, 'Aprovada', 44),
(45, 'Havana Alves', NULL, 'Inovacao', '2019-07-04 21:20:56', 181, 2, 'Aprovada', 45),
(46, 'Havana Alves', NULL, 'Inovacao', '2019-07-04 21:25:28', 182, 1, 'Aprovada', 46),
(47, 'Havana Alves', NULL, 'Gestao', '2019-07-04 21:30:10', 183, 1, 'Aprovada', 47),
(48, 'Havana Alves', NULL, 'Gestao', '2019-07-04 22:12:21', 184, 2, 'Aprovada', 48),
(49, 'Havana Alves', NULL, 'Inovacao', '2019-07-04 22:27:06', 185, 1, 'Aprovada', 49),
(50, 'Havana Alves', NULL, 'Gestao', '2019-07-04 22:34:59', 186, 1, 'Aprovada', 50),
(51, 'Havana Alves', NULL, 'Gestao', '2019-07-04 22:38:05', 187, 1, 'Aprovada', 51),
(52, 'Havana Alves', NULL, 'Gestao', '2019-07-04 22:55:05', 188, 1, 'Aprovada', 52),
(53, 'Havana Alves', NULL, 'Inovacao', '2019-07-04 23:01:55', 189, 2, 'Aprovada', 53),
(54, 'Josino Rodrigues', NULL, 'Inovacao', '2019-07-04 23:07:03', 190, 1, 'Aprovada', 54),
(55, 'Josino Rodrigues', NULL, 'Inovacao', '2019-07-04 23:19:02', 191, 1, 'Aprovada', 55),
(56, 'Josino Rodrigues', NULL, 'Inovacao', '2019-07-04 23:26:32', 192, 1, 'Aprovada', 56),
(57, 'Josino Rodrigues', NULL, 'Gestao', '2019-07-04 23:59:14', 193, 1, 'Aprovada', 57),
(58, 'Josino Rodrigues', NULL, 'Inovacao', '2019-07-05 17:18:18', 194, 2, 'Aprovada', 58),
(59, 'Josino Rodrigues', NULL, 'Gestao', '2019-07-05 18:12:09', 195, 1, 'Aprovada', 59),
(60, 'Josino Rodrigues', NULL, 'Gestao', '2019-07-05 20:11:31', 196, 1, 'Aprovada', 60),
(61, 'Josino Rodrigues', NULL, 'Gestao', '2019-07-05 20:55:15', 197, 1, 'Aprovada', 61),
(62, 'Josino Rodrigues', NULL, 'Gestao', '2019-07-05 22:11:25', 198, 1, 'Aprovada', 62),
(63, 'Josino Rodrigues', NULL, 'Gestao', '2019-07-05 22:18:42', 199, 1, 'Aprovada', 63),
(64, 'Adriano Carvalho', NULL, 'Gestao', '2019-07-05 22:22:26', 200, 2, 'Aprovada', 64),
(65, 'Adriano Carvalho', NULL, 'Gestao', '2019-07-05 22:26:41', 201, 2, 'Aprovada', 65),
(66, 'Adriano Carvalho', NULL, 'Gestao', '2019-07-05 22:52:53', 202, 1, 'Aprovada', 66),
(67, 'Nilson Junior', NULL, 'Gestao', '2019-07-08 20:16:24', 203, 1, 'Aprovada', 67),
(68, 'Nilson Junior', NULL, 'Gestao', '2019-07-08 20:21:54', 204, 2, 'Aprovada', 68),
(69, 'Nilson Junior', NULL, 'Gestao', '2019-07-08 20:25:21', 205, 1, 'Aprovada', 69),
(70, 'Nilson Junior', NULL, 'Gestao', '2019-07-08 20:27:52', 206, 1, 'Aprovada', 70),
(71, 'Nilson Junior', NULL, 'Inovacao', '2019-07-08 23:17:05', 207, 1, 'Aprovada', 71),
(72, 'Nilson Junior', NULL, 'Gestao', '2019-07-09 22:39:25', 208, 1, 'Aprovada', 72),
(73, 'Adriano Carvalho', NULL, 'Inovacao', '2019-07-10 18:41:56', 209, 2, 'Aprovada', 73),
(74, 'Adriano Carvalho', NULL, 'Gestao', '2019-07-10 18:48:46', 210, 1, 'Aprovada', 74),
(75, 'Adriano Carvalho', NULL, 'Gestao', '2019-07-11 22:28:27', 211, 2, 'Aprovada', 75),
(76, 'Adriano Carvalho', NULL, 'Gestao', '2019-07-11 22:44:08', 212, 1, 'Aprovada', 76),
(77, 'Adriano Carvalho', NULL, 'Gestao', '2019-07-16 20:34:57', 213, 1, 'Aprovada', 77),
(78, 'Adriano Carvalho', NULL, 'Gestao', '2019-07-17 20:08:10', 214, 2, 'Aprovada', 78),
(79, 'Adriano Carvalho', NULL, 'Gestao', '2019-07-17 23:05:31', 215, 1, 'Aprovada', 79),
(80, 'Roberto Alencar', NULL, 'Inovacao', '2019-07-18 20:19:43', 216, 2, 'Aprovada', 80),
(81, 'Roberto Alencar', NULL, 'Gestao', '2019-07-18 20:50:38', 217, 1, 'Aprovada', 81),
(82, 'Roberto Alencar', NULL, 'Gestao', '2019-07-18 22:48:09', 218, 2, 'Aprovada', 82),
(83, 'Roberto Alencar', NULL, 'Inovacao', '2019-07-18 23:03:17', 219, 2, 'Aprovada', 83),
(84, 'Roberto Alencar', NULL, 'Gestao', '2019-07-18 23:05:56', 220, 1, 'Aprovada', 84),
(85, 'Roberto Alencar', NULL, 'Gestao', '2019-07-18 23:07:57', 221, 1, 'Aprovada', 85),
(86, 'Roberto Alencar', NULL, 'Inovacao', '2019-07-18 23:09:45', 222, 1, 'Aprovada', 86),
(87, 'Roberto Alencar', NULL, 'Inovacao', '2019-07-19 17:39:10', 223, 1, 'Aprovada', 87),
(88, 'Roberto Alencar', NULL, 'Gestao', '2019-07-19 18:11:35', 224, 1, 'Aprovada', 88),
(89, 'Roberto Alencar', NULL, 'Gestao', '2019-07-19 18:48:12', 225, 1, 'Aprovada', 89),
(90, 'Roberto Alencar', NULL, 'Inovacao', '2019-07-19 19:06:40', 226, 1, 'Aprovada', 90),
(91, 'Roberto Alencar', NULL, 'Inovacao', '2019-07-19 20:12:55', 227, 1, 'Aprovada', 91),
(92, 'Roberto Alencar', NULL, 'Gestao', '2019-07-19 20:33:26', 228, 1, 'Aprovada', 92),
(93, 'Roberto Alencar', NULL, 'Inovacao', '2019-07-19 20:39:41', 229, 1, 'Aprovada', 93),
(94, 'Nilson Junior', NULL, 'Inovacao', '2019-07-19 21:06:23', 230, 2, 'Aprovada', 94),
(95, 'Nilson Junior', NULL, 'Gestao', '2019-07-19 21:22:18', 231, 1, 'Aprovada', 95),
(96, 'Nilson Junior', NULL, 'Gestao', '2019-07-19 21:39:41', 232, 1, 'Aprovada', 96),
(97, 'Nilson Junior', NULL, 'Inovacao', '2019-07-19 21:48:05', 233, 2, 'Aprovada', 97),
(98, 'Nilson Junior', NULL, 'Inovacao', '2019-07-19 21:53:21', 234, 1, 'Aprovada', 98),
(99, 'Nilson Junior', NULL, 'Inovacao', '2019-07-19 21:59:41', 235, 2, 'Aprovada', 99),
(100, 'Nilson Junior', NULL, 'Gestao', '2019-07-19 22:08:01', 236, 1, 'Aprovada', 100),
(101, 'Nilson Junior', NULL, 'Inovacao', '2019-07-19 22:12:33', 237, 1, 'Aprovada', 101),
(102, 'Nilson Junior', NULL, 'Inovacao', '2019-07-19 22:30:05', 238, 1, 'Aprovada', 102),
(103, 'Nilson Junior', NULL, 'Gestao', '2019-07-19 23:01:45', 239, 1, 'Aprovada', 103),
(104, 'Nilson Junior', NULL, 'Gestao', '2019-07-19 23:08:18', 240, 2, 'Aprovada', 104);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Inscricao_Avaliacao`
--

CREATE TABLE `Inscricao_Avaliacao` (
  `Inscricao_id` bigint(20) NOT NULL,
  `avaliacoes_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `inscricao_id_seq`
--

CREATE TABLE `inscricao_id_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `inscricao_id_seq`
--

INSERT INTO `inscricao_id_seq` (`next_val`) VALUES
(105);

-- --------------------------------------------------------

--
-- Estrutura para tabela `TipoUsuario`
--

CREATE TABLE `TipoUsuario` (
  `id` bigint(20) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `TipoUsuario`
--

INSERT INTO `TipoUsuario` (`id`, `descricao`) VALUES
(1, 'Administrador'),
(2, 'Avaliador'),
(3, 'Operador');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_usuario_id_seq`
--

CREATE TABLE `tipo_usuario_id_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `tipo_usuario_id_seq`
--

INSERT INTO `tipo_usuario_id_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Usuario`
--

CREATE TABLE `Usuario` (
  `id` bigint(20) NOT NULL,
  `avaliacoesRealizadas` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fone` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `siape` varchar(255) DEFAULT NULL,
  `tipo_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `Usuario`
--

INSERT INTO `Usuario` (`id`, `avaliacoesRealizadas`, `email`, `fone`, `nome`, `senha`, `siape`, `tipo_id`) VALUES
(1, 0, 'roberto.alencar@jaboatao.ifpe.edu.br', '(81) 9 8888.0582', 'Roberto Alencar', 'D848B2074208844BA29F5E10A54DCE74', '2168887', 1),
(2, 0, 'francisco.junior@jaboatao.ifpe.edu.br', '', 'Francisco Nascimento', '2EF441232DC6C337915D90BCA2DC4977', '2248410', 2),
(3, 0, 'nilson.junior@jaboatao.ifpe.edu.br', '', 'Nilson Junior', '13F51BD2C399A1B87DFF368950585DB5', '1829625', 1),
(4, 0, '', '', 'Edson Souza Pereira de Brito', '3E6C4D948AFE4134336D03066CF35724', '1649897', 3),
(5, 0, 'adriano.carvalho@jaboatao.ifpe.edu.br', '', 'Adriano Carvalho', 'EF7FAF6A8B0124B7D407C56E46FFE593', '1212833', 2),
(6, 0, '', '', 'Luciano Cabral', '7AA764EDC1096A25F574BD4699C499A5', '1726427', 2),
(7, 0, '', '', 'Havana Alves', '369F8C877F8A1ADA13D3D2550C514A98', '2248329', 2),
(9, 0, '', '', 'Fabrícia Pontes Costa', 'CDEB03F3A2B5AC1555A3866725E0AF89', '1304728', 3),
(10, 0, 'bruno.dambrosio@jaboatao.ifpe.edu.br', '', 'Bruno Gentilini D’Ambrosio', '3CF83782BCF33035F19B5F109C3AD121', '01502677466', 2),
(11, 0, 'diego.cesar@jaboatao.ifpe.edu.br', '', 'Diego Cesar Florêncio de Queiroz', '85CA6A2DEC50B6A248841B43F27EF015', '05669174402', 2),
(12, 0, '', '', 'Josino Rodrigues', '4E3D9990E3074538D554FF374B1DA2E3', '00755042352', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_id_seq`
--

CREATE TABLE `usuario_id_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `usuario_id_seq`
--

INSERT INTO `usuario_id_seq` (`next_val`) VALUES
(13);

-- --------------------------------------------------------

--
-- Estrutura para tabela `VinculoEmpregaticio`
--

CREATE TABLE `VinculoEmpregaticio` (
  `id` bigint(20) NOT NULL,
  `areaCargo` varchar(255) DEFAULT NULL,
  `dataFim` datetime DEFAULT NULL,
  `dataInicio` datetime DEFAULT NULL,
  `totalMeses` double DEFAULT NULL,
  `avaliacao_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `VinculoEmpregaticio`
--

INSERT INTO `VinculoEmpregaticio` (`id`, `areaCargo`, `dataFim`, `dataInicio`, `totalMeses`, `avaliacao_id`) VALUES
(1, 'computacao', NULL, NULL, 1.63, 2),
(2, 'computacao', NULL, NULL, 5.13, 2),
(3, 'computacao', NULL, NULL, 118.17, 6),
(4, 'computacao', NULL, NULL, 165.8, 7),
(5, 'outras', NULL, NULL, 118.17, 8),
(6, 'outras', NULL, NULL, 41.77, 8),
(7, 'outras', NULL, NULL, 7.87, 8),
(8, 'outras', NULL, NULL, 6.87, 9),
(9, 'outras', NULL, NULL, 90.07, 9),
(10, 'outras', NULL, NULL, 7.87, 9),
(11, 'outras', NULL, NULL, 28.1, 9),
(12, 'outras', NULL, NULL, 9.63, 11),
(13, 'computacao', NULL, NULL, 12.73, 11),
(14, 'computacao', NULL, NULL, 10.5, 11),
(15, 'computacao', NULL, NULL, 4.17, 11),
(16, 'computacao', NULL, NULL, 33.63, 13),
(17, 'computacao', NULL, NULL, 14.97, 14),
(18, 'computacao', NULL, NULL, 3.97, 14),
(19, 'computacao', NULL, NULL, 29.63, 14),
(20, 'outras', NULL, NULL, 1.83, 15),
(21, 'computacao', NULL, NULL, 5.73, 15),
(22, 'computacao', NULL, NULL, 43.63, 15),
(23, 'computacao', NULL, NULL, 11.13, 17),
(24, 'outras', NULL, NULL, 2.03, 17),
(25, 'computacao', NULL, NULL, 7.9, 18),
(26, 'outras', NULL, NULL, 23.27, 19),
(27, 'computacao', NULL, NULL, 13.13, 19),
(28, 'computacao', NULL, NULL, 24.87, 19),
(29, 'outras', NULL, NULL, 15.8, 20),
(30, 'outras', NULL, NULL, 63.83, 20),
(31, 'computacao', NULL, NULL, 0.47, 20),
(32, 'computacao', NULL, NULL, 2, 21),
(33, 'computacao', NULL, NULL, 6.77, 21),
(34, 'computacao', NULL, NULL, 157.8, 22),
(35, 'outras', NULL, NULL, 17.8, 25),
(36, 'computacao', NULL, NULL, 1.73, 25),
(37, 'computacao', NULL, NULL, 1.23, 25),
(38, 'computacao', NULL, NULL, 13.2, 25),
(39, 'outras', NULL, NULL, 11.67, 25),
(40, 'outras', NULL, NULL, 23.6, 26),
(41, 'computacao', NULL, NULL, 36.17, 29),
(42, 'computacao', NULL, NULL, 20.87, 29),
(43, 'computacao', NULL, NULL, 18.07, 29),
(44, 'outras', NULL, NULL, 35.33, 30),
(45, 'computacao', NULL, NULL, 0.83, 31),
(46, 'computacao', NULL, NULL, 14.13, 31),
(47, 'computacao', NULL, NULL, 21.23, 32),
(48, 'computacao', NULL, NULL, 3.87, 34),
(49, 'computacao', NULL, NULL, 19.37, 34),
(50, 'computacao', NULL, NULL, 57.6, 35),
(51, 'computacao', NULL, NULL, 66.97, 35),
(52, 'computacao', NULL, NULL, 16.7, 36),
(53, 'computacao', NULL, NULL, 14.07, 37),
(54, 'computacao', NULL, NULL, 14.07, 38),
(55, 'computacao', NULL, NULL, 30.1, 38),
(56, 'outras', NULL, NULL, 15.77, 38),
(57, 'outras', NULL, NULL, 12.73, 40),
(58, 'outras', NULL, NULL, 9.07, 40),
(59, 'outras', NULL, NULL, 39.63, 40),
(60, 'computacao', NULL, NULL, 0.67, 40),
(61, 'computacao', NULL, NULL, 2.5, 40),
(62, 'computacao', NULL, NULL, 12.93, 40),
(63, 'outras', NULL, NULL, 37.17, 40),
(64, 'outras', NULL, NULL, 2.07, 40),
(65, 'computacao', NULL, NULL, 7.57, 40),
(66, 'computacao', NULL, NULL, 1.33, 40),
(67, 'computacao', NULL, NULL, 29.73, 41),
(68, 'computacao', NULL, NULL, 1.47, 41),
(69, 'computacao', NULL, NULL, 42.67, 41),
(70, 'computacao', NULL, NULL, 1.4, 41),
(71, 'computacao', NULL, NULL, 5.97, 41),
(72, 'computacao', NULL, NULL, 1.4, 41),
(73, 'outras', NULL, NULL, 9.63, 42),
(74, 'outras', NULL, NULL, 117.93, 42),
(75, 'computacao', NULL, NULL, 10.07, 43),
(76, 'computacao', NULL, NULL, 11.3, 43),
(77, 'computacao', NULL, NULL, 19.57, 43),
(78, 'computacao', NULL, NULL, 21.23, 44),
(79, 'outras', NULL, NULL, 11.07, 44),
(80, 'outras', NULL, NULL, 41.17, 45),
(81, 'outras', NULL, NULL, 25.2, 45),
(82, 'outras', NULL, NULL, 23.47, 45),
(83, 'computacao', NULL, NULL, 20.2, 49),
(84, 'computacao', NULL, NULL, 24.4, 49),
(85, 'outras', NULL, NULL, 29.83, 50),
(86, 'outras', NULL, NULL, 54.13, 50),
(87, 'outras', NULL, NULL, 11.4, 50),
(88, 'outras', NULL, NULL, -0.13, 50),
(89, 'outras', NULL, NULL, 62.4, 50),
(90, 'outras', NULL, NULL, 4.27, 50),
(91, 'outras', NULL, NULL, 10.1, 51),
(92, 'outras', NULL, NULL, 10.1, 53),
(93, 'outras', NULL, NULL, 3.03, 54),
(94, 'outras', NULL, NULL, 32.63, 54),
(95, 'outras', NULL, NULL, 32.73, 54),
(96, 'outras', NULL, NULL, 19.73, 54),
(97, 'outras', NULL, NULL, 9.1, 54),
(98, 'outras', NULL, NULL, 127.63, 54),
(99, 'outras', NULL, NULL, 20.7, 54),
(100, 'outras', NULL, NULL, 16.3, 57),
(101, 'outras', NULL, NULL, 29.13, 57),
(102, 'outras', NULL, NULL, 26.57, 57),
(103, 'computacao', NULL, NULL, 30.5, 57),
(104, 'computacao', NULL, NULL, 7.2, 58),
(105, 'computacao', NULL, NULL, 41.07, 58),
(106, 'outras', NULL, NULL, 9.83, 60),
(107, 'outras', NULL, NULL, 10.57, 60),
(108, 'outras', NULL, NULL, 15.9, 60),
(109, 'computacao', NULL, NULL, 2.9, 60),
(110, 'computacao', NULL, NULL, 6.3, 60),
(111, 'computacao', NULL, NULL, 0.5, 60),
(112, 'computacao', NULL, NULL, 7.73, 60),
(113, 'computacao', NULL, NULL, 2.33, 60),
(114, 'computacao', NULL, NULL, 13.93, 63),
(115, 'computacao', NULL, NULL, 6.87, 63),
(116, 'outras', NULL, NULL, 4.1, 63),
(117, 'computacao', NULL, NULL, 31.33, 63),
(118, 'computacao', NULL, NULL, 112.5, 63),
(119, 'computacao', NULL, NULL, 17.93, 66),
(120, 'computacao', NULL, NULL, 19.97, 66),
(121, 'computacao', NULL, NULL, 8.83, 66),
(122, 'computacao', NULL, NULL, 24.3, 66),
(123, 'computacao', NULL, NULL, 18.77, 68),
(124, 'computacao', NULL, NULL, 30.63, 68),
(125, 'computacao', NULL, NULL, 12.17, 68),
(126, 'computacao', NULL, NULL, 29.37, 68),
(127, 'computacao', NULL, NULL, 8.13, 68),
(128, 'computacao', NULL, NULL, 32.5, 68),
(129, 'computacao', NULL, NULL, 11.67, 68),
(130, 'computacao', NULL, NULL, 19.97, 68),
(131, 'outras', NULL, NULL, 359.83, 69),
(132, 'outras', NULL, NULL, 12.77, 72),
(133, 'outras', NULL, NULL, 1.43, 72),
(134, 'outras', NULL, NULL, 8.07, 73),
(135, 'outras', NULL, NULL, 12.77, 74),
(136, 'outras', NULL, NULL, 1.43, 74),
(137, 'computacao', NULL, NULL, 20.07, 74),
(138, 'outras', NULL, NULL, 10.2, 76),
(139, 'outras', NULL, NULL, 9.17, 76),
(140, 'outras', NULL, NULL, 4.57, 76),
(141, 'computacao', NULL, NULL, 22.63, 76),
(142, 'computacao', NULL, NULL, 2.63, 76),
(143, 'computacao', NULL, NULL, 24.5, 76),
(144, 'outras', NULL, NULL, 20.77, 77),
(145, 'computacao', NULL, NULL, 11.7, 78),
(146, 'computacao', NULL, NULL, 4.03, 78),
(147, 'computacao', NULL, NULL, 4.03, 78),
(148, 'computacao', NULL, NULL, 4.03, 78),
(149, 'computacao', NULL, NULL, 4.03, 78),
(150, 'computacao', NULL, NULL, 12.1, 78),
(151, 'computacao', NULL, NULL, 10.33, 78),
(152, 'computacao', NULL, NULL, 8.37, 78),
(153, 'computacao', NULL, NULL, 15.07, 78),
(154, 'computacao', NULL, NULL, 7.5, 79),
(155, 'outras', NULL, NULL, 12, 79),
(156, 'computacao', NULL, NULL, 8.87, 79),
(157, 'computacao', NULL, NULL, 3.23, 79),
(158, 'outras', NULL, NULL, 7.77, 80),
(159, 'outras', NULL, NULL, 24.63, 80),
(160, 'computacao', NULL, NULL, 7.07, 81),
(161, 'computacao', NULL, NULL, 10.43, 81),
(162, 'computacao', NULL, NULL, 23.5, 81),
(163, 'computacao', NULL, NULL, 15.07, 81),
(164, 'computacao', NULL, NULL, 42, 82),
(165, 'computacao', NULL, NULL, 9.07, 82),
(166, 'computacao', NULL, NULL, 11.17, 83),
(167, 'computacao', NULL, NULL, 19.37, 83),
(168, 'computacao', NULL, NULL, 16.1, 84),
(169, 'outras', NULL, NULL, 7.13, 85),
(170, 'outras', NULL, NULL, 12.6, 85),
(171, 'outras', NULL, NULL, 24.33, 85),
(172, 'outras', NULL, NULL, 4.87, 85),
(173, 'outras', NULL, NULL, 16.8, 85),
(174, 'outras', NULL, NULL, 4.4, 85),
(175, 'outras', NULL, NULL, 4.87, 85),
(176, 'outras', NULL, NULL, 8.33, 86),
(177, 'outras', NULL, NULL, 45.5, 86),
(178, 'outras', NULL, NULL, 65.43, 86),
(179, 'outras', NULL, NULL, 34.9, 86),
(180, 'outras', NULL, NULL, 48.23, 86),
(181, 'computacao', NULL, NULL, 45.63, 87),
(182, 'computacao', NULL, NULL, 28.23, 88),
(183, 'computacao', NULL, NULL, 6.93, 88),
(184, 'outras', NULL, NULL, 5.07, 88),
(185, 'computacao', NULL, NULL, 45.63, 88),
(186, 'computacao', NULL, NULL, 26.63, 88),
(187, 'computacao', NULL, NULL, 7.13, 88),
(188, 'computacao', NULL, NULL, 28.23, 89),
(189, 'computacao', NULL, NULL, 6.93, 89),
(190, 'computacao', NULL, NULL, 5.07, 89),
(191, 'computacao', NULL, NULL, 46.17, 89),
(192, 'computacao', NULL, NULL, 26.63, 89),
(193, 'computacao', NULL, NULL, 7.13, 89),
(194, 'outras', NULL, NULL, 10.33, 90),
(195, 'outras', NULL, NULL, 0.8, 90),
(196, 'outras', NULL, NULL, 76.73, 90),
(197, 'computacao', NULL, NULL, 29.1, 90),
(198, 'computacao', NULL, NULL, 7, 90),
(199, 'computacao', NULL, NULL, 10.27, 91),
(200, 'computacao', NULL, NULL, 7.83, 91),
(201, 'computacao', NULL, NULL, 7.6, 91),
(202, 'computacao', NULL, NULL, 7.1, 91),
(203, 'computacao', NULL, NULL, 112.8, 93),
(204, 'computacao', NULL, NULL, 11.23, 94),
(205, 'computacao', NULL, NULL, 122.17, 94),
(206, 'outras', NULL, NULL, 34.27, 95),
(207, 'outras', NULL, NULL, 12.13, 95),
(208, 'outras', NULL, NULL, 15.3, 97),
(209, 'outras', NULL, NULL, 8.13, 97),
(210, 'outras', NULL, NULL, 31.73, 97),
(211, 'outras', NULL, NULL, 33.97, 97),
(212, 'computacao', NULL, NULL, 7, 102),
(213, 'computacao', NULL, NULL, 20.83, 102),
(214, 'computacao', NULL, NULL, 74.6, 108),
(215, 'outras', NULL, NULL, 6.93, 112),
(216, 'outras', NULL, NULL, 2.97, 112),
(217, 'computacao', NULL, NULL, 31.2, 112),
(218, 'computacao', NULL, NULL, 4.1, 112),
(219, 'computacao', NULL, NULL, 8.23, 113),
(220, 'computacao', NULL, NULL, 9.87, 113),
(221, 'computacao', NULL, NULL, 7.6, 113),
(222, 'computacao', NULL, NULL, 7.1, 113),
(223, 'computacao', NULL, NULL, 113.17, 114),
(224, 'outras', NULL, NULL, 30.93, 115),
(225, 'computacao', NULL, NULL, 31.5, 116),
(226, 'computacao', NULL, NULL, 128.83, 116),
(227, 'computacao', NULL, NULL, 37.57, 117),
(228, 'computacao', NULL, NULL, 9.6, 117),
(229, 'computacao', NULL, NULL, 18, 117),
(230, 'computacao', NULL, NULL, 89.07, 117),
(231, 'computacao', NULL, NULL, 29.77, 118),
(232, 'computacao', NULL, NULL, 64.3, 118),
(233, 'computacao', NULL, NULL, 45.17, 119),
(234, 'computacao', NULL, NULL, 11.1, 120),
(235, 'computacao', NULL, NULL, 1.13, 120),
(236, 'computacao', NULL, NULL, 11.1, 121),
(237, 'computacao', NULL, NULL, 1.13, 121),
(238, 'computacao', NULL, NULL, 29.77, 122),
(239, 'computacao', NULL, NULL, 64.3, 122),
(240, 'computacao', NULL, NULL, 31.5, 123),
(241, 'computacao', NULL, NULL, 128.83, 123),
(242, 'outras', NULL, NULL, 12.17, 124),
(243, 'computacao', NULL, NULL, 10.67, 124),
(244, 'computacao', NULL, NULL, 26.8, 125),
(245, 'computacao', NULL, NULL, 6.1, 125),
(246, 'outras', NULL, NULL, 107.67, 125),
(247, 'computacao', NULL, NULL, 6.53, 126),
(248, 'computacao', NULL, NULL, 20.83, 126),
(249, 'outras', NULL, NULL, 43.4, 127),
(250, 'outras', NULL, NULL, 3.03, 127),
(251, 'computacao', NULL, NULL, 2.97, 128),
(252, 'computacao', NULL, NULL, 16.23, 128),
(253, 'computacao', NULL, NULL, 9.07, 128),
(254, 'computacao', NULL, NULL, 35.77, 128),
(255, 'computacao', NULL, NULL, 12.03, 128),
(256, 'computacao', NULL, NULL, 3.4, 128),
(257, 'computacao', NULL, NULL, 30.33, 128),
(258, 'computacao', NULL, NULL, 10.13, 129),
(259, 'computacao', NULL, NULL, 2.7, 129),
(260, 'computacao', NULL, NULL, 11.17, 129),
(261, 'computacao', NULL, NULL, 4.03, 129),
(262, 'computacao', NULL, NULL, 2.97, 129),
(263, 'computacao', NULL, NULL, 77.93, 129),
(264, 'computacao', NULL, NULL, 65.93, 130),
(265, 'computacao', NULL, NULL, 10.17, 131),
(266, 'computacao', NULL, NULL, 10.17, 131),
(267, 'computacao', NULL, NULL, 7.33, 132),
(268, 'computacao', NULL, NULL, 1.83, 132),
(269, 'computacao', NULL, NULL, 10.6, 132),
(270, 'computacao', NULL, NULL, 6.1, 132),
(271, 'computacao', NULL, NULL, 3.77, 132),
(272, 'computacao', NULL, NULL, 13.33, 133),
(273, 'computacao', NULL, NULL, 29.43, 133),
(274, 'computacao', NULL, NULL, 63.43, 133),
(275, 'outras', NULL, NULL, 9.83, 134),
(276, 'outras', NULL, NULL, 10.57, 134),
(277, 'outras', NULL, NULL, 15.9, 134),
(278, 'computacao', NULL, NULL, 2.9, 134),
(279, 'computacao', NULL, NULL, 6.3, 134),
(280, 'computacao', NULL, NULL, 0.5, 134),
(281, 'computacao', NULL, NULL, 0.5, 134),
(282, 'computacao', NULL, NULL, 7.73, 134),
(283, 'computacao', NULL, NULL, 2.33, 134),
(284, 'outras', NULL, NULL, 20.37, 135),
(285, 'outras', NULL, NULL, 50.87, 135),
(286, 'computacao', NULL, NULL, 45.63, 136),
(287, 'computacao', NULL, NULL, 16.1, 137),
(288, 'computacao', NULL, NULL, 5, 138),
(289, 'computacao', NULL, NULL, 2.97, 138),
(290, 'computacao', NULL, NULL, 2.97, 138),
(291, 'computacao', NULL, NULL, 10.17, 138),
(292, 'computacao', NULL, NULL, 42.93, 138),
(293, 'computacao', NULL, NULL, 6.1, 138);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Vinculo_empregaticio_id_seq`
--

CREATE TABLE `Vinculo_empregaticio_id_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `Vinculo_empregaticio_id_seq`
--

INSERT INTO `Vinculo_empregaticio_id_seq` (`next_val`) VALUES
(294);

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `AtividadeCronograma`
--
ALTER TABLE `AtividadeCronograma`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `Avaliacao`
--
ALTER TABLE `Avaliacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKmkjd2kv0hn0x9yejj5npfdbf` (`avaliador_id`),
  ADD KEY `FK57ehk7q26udstuoawpen90yvr` (`inscricao_id`);

--
-- Índices de tabela `Avaliacao_VinculoEmpregaticio`
--
ALTER TABLE `Avaliacao_VinculoEmpregaticio`
  ADD UNIQUE KEY `UK_3ike469sc7v3auq1pfl2rtt4a` (`empregos_id`),
  ADD KEY `FKi07iucvtwc0plgfhiry2t6vrl` (`Avaliacao_id`);

--
-- Índices de tabela `Candidato`
--
ALTER TABLE `Candidato`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `EntidadeNegocio`
--
ALTER TABLE `EntidadeNegocio`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `hibernate_sequences`
--
ALTER TABLE `hibernate_sequences`
  ADD PRIMARY KEY (`sequence_name`);

--
-- Índices de tabela `Inscricao`
--
ALTER TABLE `Inscricao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKjvis2mu7bgu32ytmwsbe8h0fx` (`candidato_id`);

--
-- Índices de tabela `Inscricao_Avaliacao`
--
ALTER TABLE `Inscricao_Avaliacao`
  ADD UNIQUE KEY `UK_8o9bowgcchluqdrmp3gx2nqg9` (`avaliacoes_id`),
  ADD KEY `FKg9u4xjhxws7prnp21patvpiah` (`Inscricao_id`);

--
-- Índices de tabela `TipoUsuario`
--
ALTER TABLE `TipoUsuario`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK6di12go3ri7kcw1yh9h0bkwxw` (`tipo_id`);

--
-- Índices de tabela `VinculoEmpregaticio`
--
ALTER TABLE `VinculoEmpregaticio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK9bqeli28g276stmyi1dalbrgx` (`avaliacao_id`);

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `Avaliacao`
--
ALTER TABLE `Avaliacao`
  ADD CONSTRAINT `FK57ehk7q26udstuoawpen90yvr` FOREIGN KEY (`inscricao_id`) REFERENCES `Inscricao` (`id`),
  ADD CONSTRAINT `FKmkjd2kv0hn0x9yejj5npfdbf` FOREIGN KEY (`avaliador_id`) REFERENCES `Usuario` (`id`);

--
-- Restrições para tabelas `Avaliacao_VinculoEmpregaticio`
--
ALTER TABLE `Avaliacao_VinculoEmpregaticio`
  ADD CONSTRAINT `FKi07iucvtwc0plgfhiry2t6vrl` FOREIGN KEY (`Avaliacao_id`) REFERENCES `Avaliacao` (`id`),
  ADD CONSTRAINT `FKlvde0vqfdprrvkll9n67mlkwi` FOREIGN KEY (`empregos_id`) REFERENCES `VinculoEmpregaticio` (`id`);

--
-- Restrições para tabelas `Inscricao`
--
ALTER TABLE `Inscricao`
  ADD CONSTRAINT `FKjvis2mu7bgu32ytmwsbe8h0fx` FOREIGN KEY (`candidato_id`) REFERENCES `Candidato` (`id`);

--
-- Restrições para tabelas `Inscricao_Avaliacao`
--
ALTER TABLE `Inscricao_Avaliacao`
  ADD CONSTRAINT `FKg9u4xjhxws7prnp21patvpiah` FOREIGN KEY (`Inscricao_id`) REFERENCES `Inscricao` (`id`),
  ADD CONSTRAINT `FKqxse9xd0tjo2iqku1tsos9dor` FOREIGN KEY (`avaliacoes_id`) REFERENCES `Avaliacao` (`id`);

--
-- Restrições para tabelas `Usuario`
--
ALTER TABLE `Usuario`
  ADD CONSTRAINT `FK6di12go3ri7kcw1yh9h0bkwxw` FOREIGN KEY (`tipo_id`) REFERENCES `TipoUsuario` (`id`);

--
-- Restrições para tabelas `VinculoEmpregaticio`
--
ALTER TABLE `VinculoEmpregaticio`
  ADD CONSTRAINT `FK9bqeli28g276stmyi1dalbrgx` FOREIGN KEY (`avaliacao_id`) REFERENCES `Avaliacao` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
