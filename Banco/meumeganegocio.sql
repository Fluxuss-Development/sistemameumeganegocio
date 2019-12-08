create table empresario
(
	empcod int primary key auto_increment,
	empnome varchar(100),
	empsenha varchar(100),
	empativo  boolean default 1,
	empfuncionario boolean default 1
);

create table clientes
(
    clicod int PRIMARY KEY AUTO_INCREMENT,
    clinome varchar(100),
    clifone varchar(20),
    cliendereco varchar(100),
    clicpf varchar(50),
    cliativo boolean DEFAULT 1
);

create table categorias
(
    catecod int PRIMARY KEY auto_increment,
    catenome varchar(100),
    catedescricao varchar(200),
    cateativo boolean default 1
);

CREATE TABLE subcategoria
(
    subcatcod int PRIMARY KEY AUTO_INCREMENT,
    subcatnome varchar(100),
    subcatdescricao varchar(200),
    catid int,
	subcatativa boolean default 1,
    CONSTRAINT iddacategoria FOREIGN KEY(catid) REFERENCES categorias(catecod)
);

create table produtos
(
    prodcod int PRIMARY KEY AUTO_INCREMENT,
    prodnome varchar(100),
    prodvalor double,
    prodquantidade int,
	proimagurloudir varchar(200),
    prodlucro double,
    prodativo boolean DEFAULT 1,
    prodsubcategoria int,
    CONSTRAINT iddasubcategoria FOREIGN KEY(prodsubcategoria) REFERENCES subcategoria(subcatcod)
);

create table caixas
(
	caicod int primary key auto_increment,
	caiemp int,
	caivlrabert double,
	caivlrfech double,
	caiaberto timestamp DEFAULT CURRENT_TIMESTAMP,
	caifech varchar(100),
	CONSTRAINT codigodoempresaris FOREIGN KEY(caiemp) REFERENCES empresario(empcod)
);

create table tiposdepagamentos
(
   tipoid int PRIMARY KEY AUTO_INCREMENT,
   tiponome varchar(100)
);


create table vendas
(
	vencod int PRIMARY KEY AUTO_INCREMENT,
    vendataven timestamp DEFAULT CURRENT_TIMESTAMP,
    ventotal double,
    vendesconto double,
    venclicod int,
    vencaicod int,
    venempcod int,
    CONSTRAINT codigodocliente1 FOREIGN KEY(venclicod) REFERENCES clientes(clicod),
    CONSTRAINT codigoitensven FOREIGN KEY(vencaicod) REFERENCES caixas(caicod),
    CONSTRAINT codigodoempresario1 FOREIGN KEY(venempcod) REFERENCES empresario(empcod)
);


create table pagamentos
(
    pagid int PRIMARY KEY AUTO_INCREMENT,
    pagcodven int,
    pagvlr double,
    tipopag int,
    CONSTRAINT fk_codigodavenda FOREIGN KEY(pagcodven) REFERENCES vendas(vencod),
    CONSTRAINT fk_codigotipog FOREIGN KEY(tipopag) REFERENCES tiposdepagamentos(tipoid)
);


create TABLE itensdevenda
(
    itencod int PRIMARY KEY AUTO_INCREMENT,
    itecodprod int,
    itevalunit double,
   	itequant int,
    itevalortotal double,
	itenvenda int,
    CONSTRAINT codigodoproduto FOREIGN KEY(itecodprod) REFERENCES produtos(prodcod),
	CONSTRAINT codigodavenda FOREIGN KEY(itenvenda) REFERENCES vendas(vencod)
);


create table logalteracoes
(
    logcod int PRIMARY KEY AUTO_INCREMENT,
    logdataehora timestamp DEFAULT CURRENT_TIMESTAMP,
    logcomentario varchar(150),
    codemp int,
    CONSTRAINT fk_codigoempresario FOREIGN KEY(codemp) REFERENCES empresario(empcod)
);

create table fornecedores
(
    forcod int PRIMARY KEY AUTO_INCREMENT,
    fornome varchar(100),
    forendereco varchar(200),
    fortelefone varchar(50),
    forcelular varchar(50),
    forcomentarios varchar(200)
);




create VIEW exibedetalhesvendas
AS
select vencod, venclicod, venempcod, vencaicod, vendataven, ventotal, vendesconto, clinome, empnome  from vendas, clientes, empresario where venclicod = clicod and venempcod = empcod