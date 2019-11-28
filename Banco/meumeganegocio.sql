-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24-Nov-2019 às 15:21
-- Versão do servidor: 10.4.6-MariaDB
-- versão do PHP: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `meumeganegocio`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `caixas`
--

CREATE TABLE `caixas` (
  `caicod` int(11) NOT NULL,
  `caiemp` int(11) DEFAULT NULL,
  `caivlrabert` double DEFAULT NULL,
  `caivlrfech` double DEFAULT NULL,
  `caiaberto` timestamp NOT NULL DEFAULT current_timestamp(),
  `caifech` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `catecod` int(11) NOT NULL,
  `catenome` varchar(100) DEFAULT NULL,
  `catedescricao` varchar(200) DEFAULT NULL,
  `cateativo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`catecod`, `catenome`, `catedescricao`, `cateativo`) VALUES
(1, 'ALIMENTOS', 'PRODUTOS ALIMENTICIOS', 1),
(2, 'ELETRONICOS', 'PRODUTOS TECNOLOGICOS ELETRONICOS', 1),
(3, 'ELETRODOMESTICOS', 'PRODUTOS ELETRONICOS PARA RESIDENCIA', 1),
(4, 'FERRAMENTAS MECANICAS', 'CHAVES DE FENDAS AUTO PEÇAS', 1),
(5, 'INFANTIL', 'PRODUTOS VOLTADOS PARA CRIANÇAS', 1),
(6, 'ESTILO', 'PERFUMES, COSMETICOS', 1),
(7, 'JOGOS', 'JOGOS PARA CONSOLES EM GERAL', 1),
(8, 'PERIFERICOS', 'MOUSE, TECLADO, FONES ETC', 1),
(9, 'LIMPEZA', 'PRODUTOS VOLTADOS PARA LIMPEZA DOMESTICA', 1),
(10, 'BEBIDAS', 'DRINKS EM GERAL', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `clicod` int(11) NOT NULL,
  `clinome` varchar(100) DEFAULT NULL,
  `clifone` varchar(20) DEFAULT NULL,
  `cliendereco` varchar(100) DEFAULT NULL,
  `clicpf` varchar(50) DEFAULT NULL,
  `cliativo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`clicod`, `clinome`, `clifone`, `cliendereco`, `clicpf`, `cliativo`) VALUES
(1, 'ANDREIA ELISA GOMES', '14996309705', 'PRAÇA MARIA CONCEIÇÃO DE OLIVEIRA', '68089938078', 1),
(2, 'RYAN DANILO ASSUNÇÃO', '14981243330', 'TRAVESSA DO CONTRATO, FAZENDA GRANDE DO RETIRO', '37977241013', 1),
(3, 'OSVALDO CÉSAR ROBERTO MONTEIRO', '14981937473', 'RUA PRIMAVERA', '77118241067', 1),
(4, 'LUAN CARLOS APARÍCIO', '14993318527', 'RUA GOLFO DE SIRTE', '71819712044', 1),
(5, 'MALU CLÁUDIA PINTO', '14995544912', 'RUA DOUTOR CÂNDIDO ALMEIDA ATAYDE', '15817748002', 1),
(6, 'MARTIN GIOVANNI ELIAS PINTO', '14989817813', 'TRAVESSA SERVIDÃO', '87682378042', 1),
(7, 'SOPHIE ANDREIA COSTA', '14994356795', 'VILA DOIS DE FEVEREIRO', '08093532021', 1),
(8, 'ALINE VALENTINA REZENDE', '14985432663', 'RUA EFRATA', '08554253000', 1),
(9, 'MARIAH FABIANA ROCHA', '14994807040', 'ALAMEDA BATISTA', '06274972099', 1),
(10, 'PIETRA MAYA ARAÚJO', '14981792107', 'QUADRA 307 NORTE ALAMEDA 16', '86914317097', 1),
(11, 'CATARINA MARIANA SARAH ROCHA', '14993310806', 'AVENIDA CORBELIA', '05301437046', 1),
(12, 'ANDREIA DANIELA DA MATA', '14989172401', 'RUA SÃO JOSÉ I', '81566715032', 1),
(13, 'MARTIN DANIEL PEREIRA', '14998419825', 'RUA FELICIANO SODRÉ', '23571445058', 1),
(14, 'LIZ NAIR ALVES', '14997760849', 'RUA CUNHA MATOS', '35696781055', 1),
(15, 'MATHEUS VITOR DA ROSA', '14984735107', 'CONJUNTO CONJUNTO 05', '42951942044', 1),
(16, 'JOAO SILVA', '14997456213', 'RUA DAS AMENDUAS', '52336510090', 1),
(17, 'PEDRO DANIEL', '14998563214', 'RUA DA FELICIDADE', '01225973031', 1),
(18, 'MARIA DOS SANTOS', '14997452315', 'RUA DA TRISTEZA', '03743492075', 1),
(19, 'MAICON FERREIRA', '14993214567', 'RUA DO MEIO', '15890964011', 1),
(20, 'ERNESTO DA SILVA', '14991235647', 'RUA DO TETO', '36987723028', 1),
(21, 'REGINA MARRIEN', '14992456185', 'RUA DO CALIPEIRO', '36150749045', 1),
(22, 'MARTA PEREIRA', '14996524174', 'RUA DA MARIONETE', '11612942016', 1),
(23, 'JOANA PINTO', '14997415287', 'RUA NAO INTERESSA', '74451288088', 1),
(24, 'FREDERICO ALVES', '14996324155', 'RUA DO DELPHI', '95260795075', 1),
(25, 'PEDRO ALVES', '14995147526', 'RUA DO DIA', '16095602050', 1),
(26, 'ADRIANO SILVA', '14997463215', 'RUA DOS CARRAPATOS', '96462483067', 1),
(27, 'ZULEIDE MARANHO', '14996325141', 'RUA DA ZUZU', '43040087061', 1),
(28, 'RICARDAO FREITAS', '14998562314', 'RUA DOS CARROS', '71034899040', 1),
(29, 'JENNIFER DA SILVA', '14995623145', 'RUA DO CENTRO', '75642458086', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `empresario`
--

CREATE TABLE `empresario` (
  `empcod` int(11) NOT NULL,
  `empnome` varchar(100) DEFAULT NULL,
  `empsenha` varchar(100) DEFAULT NULL,
  `empativo` tinyint(1) DEFAULT 1,
  `empfuncionario` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `exibedetalhesvendas`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `exibedetalhesvendas` (
`vencod` int(11)
,`venclicod` int(11)
,`venempcod` int(11)
,`vencaicod` int(11)
,`vendataven` timestamp
,`ventotal` double
,`vendesconto` double
,`clinome` varchar(100)
,`empnome` varchar(100)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedores`
--

CREATE TABLE `fornecedores` (
  `forcod` int(11) NOT NULL,
  `fornome` varchar(100) DEFAULT NULL,
  `forendereco` varchar(200) DEFAULT NULL,
  `fortelefone` varchar(50) DEFAULT NULL,
  `forcelular` varchar(50) DEFAULT NULL,
  `forcomentarios` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `fornecedores`
--

INSERT INTO `fornecedores` (`forcod`, `fornome`, `forendereco`, `fortelefone`, `forcelular`, `forcomentarios`) VALUES
(1, 'SACARIA DAMASCO', 'R. CELESTINO LOPES BAHIA, 877 - VILA SAO LUIZ, OURINHOS - SP, 19911-205', '(14)3326-4473', '(14)3326-4473', 'FORNECEDOR DE PRODUTOS EM GERAL'),
(2, 'BLUE BOM ALIMENTOS', 'AV. UNSAKU ITO, 280 - DISTRITO INDUSTRIAL DR. HELIO SILVA, OURINHOS - SP, 19908-180', '(14) 3322-3525', '(14) 3322-3525', 'FORNECEDOR DE ALIMENTOS EM GERAL');

-- --------------------------------------------------------

--
-- Estrutura da tabela `itensdevenda`
--

CREATE TABLE `itensdevenda` (
  `itencod` int(11) NOT NULL,
  `itecodprod` int(11) DEFAULT NULL,
  `itevalunit` double DEFAULT NULL,
  `itequant` int(11) DEFAULT NULL,
  `itevalortotal` double DEFAULT NULL,
  `itenvenda` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `logalteracoes`
--

CREATE TABLE `logalteracoes` (
  `logcod` int(11) NOT NULL,
  `logdataehora` timestamp NOT NULL DEFAULT current_timestamp(),
  `logcomentario` varchar(150) DEFAULT NULL,
  `codemp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamentos`
--

CREATE TABLE `pagamentos` (
  `pagid` int(11) NOT NULL,
  `pagcodven` int(11) DEFAULT NULL,
  `pagvlr` double DEFAULT NULL,
  `tipopag` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `prodcod` int(11) NOT NULL,
  `prodnome` varchar(100) DEFAULT NULL,
  `prodvalor` double DEFAULT NULL,
  `prodquantidade` int(11) DEFAULT NULL,
  `proimagurloudir` varchar(200) DEFAULT NULL,
  `prodlucro` double DEFAULT NULL,
  `prodativo` tinyint(1) DEFAULT 1,
  `prodsubcategoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`prodcod`, `prodnome`, `prodvalor`, `prodquantidade`, `proimagurloudir`, `prodlucro`, `prodativo`, `prodsubcategoria`) VALUES
(1, 'ALFACE', 1.25, 20, NULL, 6, 1, 1),
(2, 'ABACAXI', 4.38, 50, NULL, 6, 1, 1),
(3, 'ABACAXI AMERICANO', 5.63, 100, NULL, 6, 1, 1),
(4, 'DORITOS', 3.72, 1000, NULL, 6, 1, 2),
(5, 'BISNAGUINHAS', 7.88, 1000, NULL, 5, 1, 2),
(6, 'BANDEJA DE OVO CAIPIRA', 11.13, 20, NULL, 6, 1, 1),
(7, 'TODDY', 7.38, 500, NULL, 6, 1, 2),
(8, 'COCA-COLA', 3.13, 200, NULL, 6, 1, 15),
(9, 'IPHONE 7', 2.027, 4, NULL, 5, 1, 3),
(10, 'MOTO G7', 1.408, 5, NULL, 12, 1, 3),
(11, 'IPAD', 4, 2, NULL, 18, 1, 3),
(12, 'SOFÁ', 750, 100, NULL, 6, 1, 4),
(13, 'COLCHÃO COM CAMA', 1.204, 20, NULL, 4, 1, 4),
(14, 'ELM327 - OBDII', 7.89, 1000, NULL, 6, 1, 5),
(15, 'PARA-BRISA', 18.75, 1000, NULL, 6, 1, 5),
(16, 'SUPER BRANCA - FARÓL', 2.08, 500, NULL, 12, 1, 5),
(17, 'CONJUNTO DE CHAVES DE FENDA', 245.9, 50, NULL, 39, 1, 6),
(18, 'FURADEIRA', 101.69, 100, NULL, 40, 1, 6),
(19, 'MARTELO', 6.25, 50, NULL, 26, 1, 6),
(20, 'BONECO DO MAXSTEEL', 25.97, 10, NULL, 9, 1, 7),
(21, 'CARRINHO DA HOTWHEELS', 7.33, 1000, NULL, 13, 1, 7),
(22, 'CAMISA DUDALINA', 112.5, 50, NULL, 6, 1, 8),
(23, 'CAMISA POLO', 62.5, 50, NULL, 6, 1, 8),
(24, 'CALÇA BRS', 25, 100, NULL, 6, 1, 8),
(25, 'HALO 5', 62.5, 10, NULL, 6, 1, 9),
(26, 'GTA V', 50, 1000, NULL, 6, 1, 9),
(27, 'RED DEAD REDEMPTION 2', 131.58, 1000, NULL, 11, 1, 10),
(28, 'DELPHI RIO LICENÇA', 7.812, 10, NULL, 14, 1, 10),
(29, 'ORACLE PREMIUM', 1.315, 50, NULL, 6, 1, 10),
(30, 'NERO', 7.04, 2, NULL, 11, 1, 10),
(31, 'DELL INPIRE I7', 6.578, 5, NULL, 7, 1, 11),
(32, 'SAMSUNG DUAL CORE', 394.74, 50, NULL, 7, 1, 11),
(33, 'ROCKETZ RAPTOR', 3.75, 10, NULL, 6, 1, 11),
(34, 'RAZER CRACKING', 375, 50, NULL, 6, 1, 12),
(35, 'MOUSE BENQ', 333.33, 500, NULL, 16, 1, 12),
(36, 'CANDURA ÁGUA SANITÁRIA', 18.75, 5000, NULL, 6, 1, 13),
(37, 'VEJA', 8.75, 1000, NULL, 6, 1, 13),
(38, '51', 14.29, 200, NULL, 18, 1, 14),
(39, 'BRAHMA', 39.06, 1000, NULL, 14, 1, 14),
(40, 'SPRITE', 6.25, 1000, NULL, 6, 1, 15),
(41, 'KUAT', 4.36, 1000, NULL, 7, 1, 15);

-- --------------------------------------------------------

--
-- Estrutura da tabela `subcategoria`
--

CREATE TABLE `subcategoria` (
  `subcatcod` int(11) NOT NULL,
  `subcatnome` varchar(100) DEFAULT NULL,
  `subcatdescricao` varchar(200) DEFAULT NULL,
  `catid` int(11) DEFAULT NULL,
  `subcatativa` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `subcategoria`
--

INSERT INTO `subcategoria` (`subcatcod`, `subcatnome`, `subcatdescricao`, `catid`, `subcatativa`) VALUES
(1, 'ORGANICOS', 'PRODUTOS SAUDÁVEIS', 1, 1),
(2, 'NÃO ORGANICOS', 'PRODUTO INDUSTRIAL', 1, 1),
(3, 'TÉCNOLOGICOS', 'PRODUTOS ARTIFICIAIS', 2, 1),
(4, 'DOMÉSTICOS', 'PRODUTOS DOMÉSTICOS', 3, 1),
(5, 'AUTOMÓTIVOS', 'PRODUTOS PARA AUTOPEÇAS', 4, 1),
(6, 'FERRAMENTAS', 'FERRAMENTAS EM GERAL', 4, 1),
(7, 'BRINQUEDOS', 'BRINQUEDOS EM GERAL', 5, 1),
(8, 'ROUPAS', 'ROUPAS EM GERAL', 6, 1),
(9, 'MÍDIA FÍSICA', 'PRODUTO FÍSICO', 7, 1),
(10, 'MÍDIA DÍGITAL', 'PRODUTO DÍGITAL', 7, 1),
(11, 'COMPUTADORES E NOTEBOOKS', 'PRODUTO DÍGITAL', 8, 1),
(12, 'FONES E HEADSETS', 'PRODUTO DÍGITAL', 8, 1),
(13, 'HIGIENÊ', 'HIGIENÊ DOMÉSTICA', 9, 1),
(14, 'ALCOÓLICOS', 'BEBIDAS ALCOÓLICAS', 10, 1),
(15, 'NÃO ALCOÓLICOS', 'BEBIDAS NÃO ALCOÓLICAS', 10, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tiposdepagamentos`
--

CREATE TABLE `tiposdepagamentos` (
  `tipoid` int(11) NOT NULL,
  `tiponome` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tiposdepagamentos`
--

INSERT INTO `tiposdepagamentos` (`tipoid`, `tiponome`) VALUES
(1, 'CARTÃO DE CRÉDITO'),
(2, 'BOLETO BANCÁRIO'),
(3, 'CARTÃO DE DÉBITO'),
(4, 'PAGAMENTOS DIGITAIS'),
(5, 'TRANSFERÊNCIA BANCÁRIA'),
(6, 'DINHEIRO'),
(7, 'CHEQUES'),
(8, 'CRIPTOMOEDAS');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

CREATE TABLE `vendas` (
  `vencod` int(11) NOT NULL,
  `vendataven` timestamp NOT NULL DEFAULT current_timestamp(),
  `ventotal` double DEFAULT NULL,
  `vendesconto` double DEFAULT NULL,
  `venclicod` int(11) DEFAULT NULL,
  `vencaicod` int(11) DEFAULT NULL,
  `venempcod` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para vista `exibedetalhesvendas`
--
DROP TABLE IF EXISTS `exibedetalhesvendas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `exibedetalhesvendas`  AS  select `vendas`.`vencod` AS `vencod`,`vendas`.`venclicod` AS `venclicod`,`vendas`.`venempcod` AS `venempcod`,`vendas`.`vencaicod` AS `vencaicod`,`vendas`.`vendataven` AS `vendataven`,`vendas`.`ventotal` AS `ventotal`,`vendas`.`vendesconto` AS `vendesconto`,`clientes`.`clinome` AS `clinome`,`empresario`.`empnome` AS `empnome` from ((`vendas` join `clientes`) join `empresario`) where `vendas`.`venclicod` = `clientes`.`clicod` and `vendas`.`venempcod` = `empresario`.`empcod` ;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `caixas`
--
ALTER TABLE `caixas`
  ADD PRIMARY KEY (`caicod`),
  ADD KEY `codigodoempresaris` (`caiemp`);

--
-- Índices para tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`catecod`);

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`clicod`);

--
-- Índices para tabela `empresario`
--
ALTER TABLE `empresario`
  ADD PRIMARY KEY (`empcod`);

--
-- Índices para tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD PRIMARY KEY (`forcod`);

--
-- Índices para tabela `itensdevenda`
--
ALTER TABLE `itensdevenda`
  ADD PRIMARY KEY (`itencod`),
  ADD KEY `codigodoproduto` (`itecodprod`),
  ADD KEY `codigodavenda` (`itenvenda`);

--
-- Índices para tabela `logalteracoes`
--
ALTER TABLE `logalteracoes`
  ADD PRIMARY KEY (`logcod`),
  ADD KEY `fk_codigoempresario` (`codemp`);

--
-- Índices para tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD PRIMARY KEY (`pagid`),
  ADD KEY `fk_codigodavenda` (`pagcodven`),
  ADD KEY `fk_codigotipog` (`tipopag`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`prodcod`),
  ADD KEY `iddasubcategoria` (`prodsubcategoria`);

--
-- Índices para tabela `subcategoria`
--
ALTER TABLE `subcategoria`
  ADD PRIMARY KEY (`subcatcod`),
  ADD KEY `iddacategoria` (`catid`);

--
-- Índices para tabela `tiposdepagamentos`
--
ALTER TABLE `tiposdepagamentos`
  ADD PRIMARY KEY (`tipoid`);

--
-- Índices para tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`vencod`),
  ADD KEY `codigodocliente1` (`venclicod`),
  ADD KEY `codigoitensven` (`vencaicod`),
  ADD KEY `codigodoempresario1` (`venempcod`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `caixas`
--
ALTER TABLE `caixas`
  MODIFY `caicod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `catecod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `clicod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de tabela `empresario`
--
ALTER TABLE `empresario`
  MODIFY `empcod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  MODIFY `forcod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `itensdevenda`
--
ALTER TABLE `itensdevenda`
  MODIFY `itencod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `logalteracoes`
--
ALTER TABLE `logalteracoes`
  MODIFY `logcod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  MODIFY `pagid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `prodcod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de tabela `subcategoria`
--
ALTER TABLE `subcategoria`
  MODIFY `subcatcod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `tiposdepagamentos`
--
ALTER TABLE `tiposdepagamentos`
  MODIFY `tipoid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `vencod` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `caixas`
--
ALTER TABLE `caixas`
  ADD CONSTRAINT `codigodoempresaris` FOREIGN KEY (`caiemp`) REFERENCES `empresario` (`empcod`);

--
-- Limitadores para a tabela `itensdevenda`
--
ALTER TABLE `itensdevenda`
  ADD CONSTRAINT `codigodavenda` FOREIGN KEY (`itenvenda`) REFERENCES `vendas` (`vencod`),
  ADD CONSTRAINT `codigodoproduto` FOREIGN KEY (`itecodprod`) REFERENCES `produtos` (`prodcod`);

--
-- Limitadores para a tabela `logalteracoes`
--
ALTER TABLE `logalteracoes`
  ADD CONSTRAINT `fk_codigoempresario` FOREIGN KEY (`codemp`) REFERENCES `empresario` (`empcod`);

--
-- Limitadores para a tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD CONSTRAINT `fk_codigodavenda` FOREIGN KEY (`pagcodven`) REFERENCES `vendas` (`vencod`),
  ADD CONSTRAINT `fk_codigotipog` FOREIGN KEY (`tipopag`) REFERENCES `tiposdepagamentos` (`tipoid`);

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `iddasubcategoria` FOREIGN KEY (`prodsubcategoria`) REFERENCES `subcategoria` (`subcatcod`);

--
-- Limitadores para a tabela `subcategoria`
--
ALTER TABLE `subcategoria`
  ADD CONSTRAINT `iddacategoria` FOREIGN KEY (`catid`) REFERENCES `categorias` (`catecod`);

--
-- Limitadores para a tabela `vendas`
--
ALTER TABLE `vendas`
  ADD CONSTRAINT `codigodocliente1` FOREIGN KEY (`venclicod`) REFERENCES `clientes` (`clicod`),
  ADD CONSTRAINT `codigodoempresario1` FOREIGN KEY (`venempcod`) REFERENCES `empresario` (`empcod`),
  ADD CONSTRAINT `codigoitensven` FOREIGN KEY (`vencaicod`) REFERENCES `caixas` (`caicod`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
