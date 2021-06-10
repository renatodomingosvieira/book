-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Jun-2021 às 13:26
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
-- Banco de dados: `mydb`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_autores`
--

CREATE TABLE `tb_autores` (
  `id_autor` int(11) NOT NULL,
  `nome_autor` varchar(250) NOT NULL,
  `tb_nacionalidade_id_nacionalidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_autores`
--

INSERT INTO `tb_autores` (`id_autor`, `nome_autor`, `tb_nacionalidade_id_nacionalidade`) VALUES
(1, 'Machado de Assis', 2),
(2, 'Hal Elrod', 1),
(5, 'Jorge Luis Borges', 5),
(6, 'George S. Clason', 1),
(7, 'Jhoni Inacio', 2),
(8, 'Jessica Couto', 3),
(9, 'Coradine da Silva Sauro', 3),
(10, 'Autor de teste', 4),
(11, 'Leandro', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_categorias`
--

CREATE TABLE `tb_categorias` (
  `id_categoria` int(11) NOT NULL,
  `nome` varchar(250) NOT NULL,
  `codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_categorias`
--

INSERT INTO `tb_categorias` (`id_categoria`, `nome`, `codigo`) VALUES
(1, 'Autoajuda', 1000),
(2, 'Romance', 1001),
(3, 'Literatura estrangeira', 1002),
(4, 'Administração', 1003),
(5, 'Literatura Nacional', 1004),
(6, 'Programação', 1005),
(7, 'HQs e Mangás', 1006);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_livros`
--

CREATE TABLE `tb_livros` (
  `id_livro` int(11) NOT NULL,
  `titulo` varchar(250) NOT NULL,
  `editora` varchar(250) NOT NULL,
  `ano` int(11) NOT NULL,
  `ISBN` bigint(20) NOT NULL,
  `tb_categorias_id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_livros`
--

INSERT INTO `tb_livros` (`id_livro`, `titulo`, `editora`, `ano`, `ISBN`, `tb_categorias_id_categoria`) VALUES
(2, 'teste teste', 'Sextante 21', 2016, 1231231231231212, 1),
(10, 'teste teste', 'teste teste', 2021, 154584848, 2),
(11, 'teste teste aodkas', 'sadsadasdsa', 12332, 21312321312312, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_livros_has_tb_autores`
--

CREATE TABLE `tb_livros_has_tb_autores` (
  `id_livro` int(11) NOT NULL,
  `id_autor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_livros_has_tb_autores`
--

INSERT INTO `tb_livros_has_tb_autores` (`id_livro`, `id_autor`) VALUES
(2, 2),
(10, 11),
(11, 1),
(11, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_nacionalidade`
--

CREATE TABLE `tb_nacionalidade` (
  `id_nacionalidade` int(11) NOT NULL,
  `pais` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_nacionalidade`
--

INSERT INTO `tb_nacionalidade` (`id_nacionalidade`, `pais`) VALUES
(5, 'Argentina'),
(2, 'Brasil'),
(3, 'Canada'),
(1, 'Estados Unidos'),
(4, 'Inglaterra');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb_autores`
--
ALTER TABLE `tb_autores`
  ADD PRIMARY KEY (`id_autor`),
  ADD KEY `fk_tb_autores_tb_nacionalidade1_idx` (`tb_nacionalidade_id_nacionalidade`);

--
-- Índices para tabela `tb_categorias`
--
ALTER TABLE `tb_categorias`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `codigo_UNIQUE` (`codigo`);

--
-- Índices para tabela `tb_livros`
--
ALTER TABLE `tb_livros`
  ADD PRIMARY KEY (`id_livro`),
  ADD KEY `fk_tb_livros_tb_categorias1_idx` (`tb_categorias_id_categoria`);

--
-- Índices para tabela `tb_livros_has_tb_autores`
--
ALTER TABLE `tb_livros_has_tb_autores`
  ADD PRIMARY KEY (`id_livro`,`id_autor`),
  ADD KEY `fk_tb_livros_has_tb_autores_tb_autores1_idx` (`id_autor`),
  ADD KEY `fk_tb_livros_has_tb_autores_tb_livros_idx` (`id_livro`);

--
-- Índices para tabela `tb_nacionalidade`
--
ALTER TABLE `tb_nacionalidade`
  ADD PRIMARY KEY (`id_nacionalidade`),
  ADD UNIQUE KEY `pais_UNIQUE` (`pais`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_autores`
--
ALTER TABLE `tb_autores`
  MODIFY `id_autor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `tb_categorias`
--
ALTER TABLE `tb_categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `tb_livros`
--
ALTER TABLE `tb_livros`
  MODIFY `id_livro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `tb_nacionalidade`
--
ALTER TABLE `tb_nacionalidade`
  MODIFY `id_nacionalidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tb_autores`
--
ALTER TABLE `tb_autores`
  ADD CONSTRAINT `fk_tb_autores_tb_nacionalidade1` FOREIGN KEY (`tb_nacionalidade_id_nacionalidade`) REFERENCES `tb_nacionalidade` (`id_nacionalidade`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_livros`
--
ALTER TABLE `tb_livros`
  ADD CONSTRAINT `fk_tb_livros_tb_categorias1` FOREIGN KEY (`tb_categorias_id_categoria`) REFERENCES `tb_categorias` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_livros_has_tb_autores`
--
ALTER TABLE `tb_livros_has_tb_autores`
  ADD CONSTRAINT `fk_tb_livros_has_tb_autores_tb_autores1` FOREIGN KEY (`id_autor`) REFERENCES `tb_autores` (`id_autor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tb_livros_has_tb_autores_tb_livros` FOREIGN KEY (`id_livro`) REFERENCES `tb_livros` (`id_livro`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
