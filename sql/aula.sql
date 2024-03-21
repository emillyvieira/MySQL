CREATE DATABASE exercicio1;
USE exercicio1;

CREATE TABLE clientes(
	cpf 			BIGINT 				PRIMARY KEY,
	rg 				VARCHAR(11) 		UNIQUE NOT NULL,
	nome 			VARCHAR(20) 		NOT NULL,
	endereco 		VARCHAR(20) 		NOT NULL,
	cidade 			VARCHAR(20) 		NOT NULL DEFAULT 'Caraguatatuba',
	uf 				CHAR(2) 			NOT NULL,
	telefone 		BIGINT 				NOT NULL,
	sexo 			CHAR,
	nascimento 		DATE				NOT NULL,
	salario 		DECIMAL(10,2)
);

CREATE TABLE produtos (
    numero      BIGINT              PRIMARY KEY,
    nome        VARCHAR(50)         NOT NULL,
    descricao   VARCHAR(100)        NOT NULL,
    preco       DECIMAL(20,2)       NOT NULL,
    peso        DECIMAL(10,2),
    dimensoes   DECIMAL(10,2),
    validade    DATE                NOT NULL
);

CREATE TABLE vendedores(
	registro		BIGINT 			 	PRIMARY KEY,
	cpf 			BIGINT				UNIQUE NOT NULL,
	nome 			VARCHAR(20) 		NOT NULL,
	telefone 		BIGINT 				NOT NULL,
	sexo 			CHAR				NOT NULL,
	nascimento 		DATE				NOT NULL,
	salario 		DECIMAL(10,2)		NOT NULL,	
    comissao		DECIMAL(10,2)		NOT NULL
);

CREATE TABLE compras(
	codigo			INT 			 	PRIMARY KEY auto_increment,
	cpf 			BIGINT				NOT NULL,
	numero 			BIGINT 				NOT NULL,
	registro		BIGINT 			 	NOT NULL,
	c_data			DATE				NOT NULL,
	c_hora 			TIME		 		NOT NULL,
	c_status 		VARCHAR(20)			NOT NULL,
	quantidade		DECIMAL(10,2)		NOT NULL,
    CONSTRAINT FK_CLIENTES_CPF FOREIGN KEY (cpf) REFERENCES clientes(cpf),
	CONSTRAINT FK_VENDEDORES_REG FOREIGN KEY (registro) REFERENCES vendedores(registro),
	CONSTRAINT FK_PRODUTOS_NUMERO FOREIGN KEY (numero) REFERENCES produtos(numero)
);

CREATE TABLE dependentes(
	nome 		VARCHAR(50),
	nascimento 	DATE,
	cpf 		BIGINT,
	CONSTRAINT FK_CLIENTEDEPENDENTE_CPF FOREIGN KEY (cpf) REFERENCES clientes(cpf) ON UPDATE CASCADE
);

INSERT INTO clientes 
VALUES(12312312312, '606036315', 'eu', 'rua A', 'caragua', 'sp', 123, 'f', '1990-01-01', 2000);

SELECT * FROM clientes;

INSERT INTO dependentes
VALUES('creusa', '2000-12-12', 12312312312);

UPDATE clientes
SET nascimento = '1999-06-25'
WHERE cpf = 12312312312;

UPDATE clientes
SET salario = 5000
WHERE cpf = 12312312312;

INSERT INTO clientes (cpf, rg, nome, endereco, uf, telefone, nascimento)
VALUES(45254145214, '653256325', 'ela', 'rua B', 'sp', 321, '1990-10-01');

UPDATE clientes
SET cpf = 1
WHERE cpf = 12312312312;

UPDATE clientes
SET salario = 4000;

DELETE
FROM clientes
WHERE nascimento > '2000-12-30';

SELECT * 
FROM vendedores

show tables;
drop table dependentes;
describe compras;
show create table clientes;

create database lojaads;

