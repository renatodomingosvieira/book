-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29-Maio-2021 às 23:36
-- Versão do servidor: 10.4.17-MariaDB
-- versão do PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `instante`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_autores`
--

CREATE TABLE `tb_autores` (
  `id` int(11) NOT NULL,
  `autor` varchar(55) NOT NULL,
  `nacionalidade` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_autores`
--

INSERT INTO `tb_autores` (`id`, `autor`, `nacionalidade`) VALUES
(1, 'Machado de Assis', 'Brasileiro'),
(2, 'Augusto Cury', 'Brasileiro'),
(4, 'Hal Elrod', 'Americano'),
(5, 'Paulo Coelho', 'Brasileiro');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_livros`
--

CREATE TABLE `tb_livros` (
  `id` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `autor1` varchar(100) NOT NULL,
  `autor2` varchar(100) NOT NULL,
  `editora` varchar(100) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `ano` int(20) NOT NULL,
  `ISBN` bigint(155) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_livros`
--

INSERT INTO `tb_livros` (`id`, `titulo`, `autor1`, `autor2`, `editora`, `categoria`, `ano`, `ISBN`) VALUES
(3, 'Dom Casmurro', 'Machado de Assis', '', 'Livraria Garnier ', 'Romance', 1899, 9780195103083),
(4, 'O Milagre da Manhã', 'Hal Elrod', '', 'BestSeller', 'Autoajuda', 2016, 978),
(5, 'O Alquimista', 'Paulo Coelho', '', 'Sextante', 'Literatura Nacional', 1988, 9788575427583),
(6, 'O Vendedor de Sonhos', 'Augusto Cury', '', ' Editora Planeta', 'Literatura Nacional', 2009, 9781439195727),
(7, 'teste', 'eu', 'ele', 'nos', 'chora', 2021, 1231231231231),
(8, 'teste2', 'Renato', 'Coradini', 'FMp', 'comedia', 2021, 1231231231);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb_autores`
--
ALTER TABLE `tb_autores`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_livros`
--
ALTER TABLE `tb_livros`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_autores`
--
ALTER TABLE `tb_autores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `tb_livros`
--
ALTER TABLE `tb_livros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
