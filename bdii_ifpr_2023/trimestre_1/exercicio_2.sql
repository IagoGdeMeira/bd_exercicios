CREATE DATABASE dbii;
USE dbii;

CREATE TABLE clientes (
	id_cliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    whatsapp VARCHAR(255) NOT NULL
);

CREATE TABLE servicos (
	id_servico INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_servico VARCHAR(255) NOT NULL,
    valor_servico DECIMAL NOT NULL
);

CREATE TABLE servico_por_cliente (
	id_servico_cliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_cliente INT NOT NULL REFERENCES clientes (id_cliente),
    id_servico INT NOT NULL REFERENCES servicos (id_servico)
);

