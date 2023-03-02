DROP DATABASE IF EXISTS dbii;
CREATE DATABASE dbii;
USE dbii;

CREATE TABLE estado (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL UNIQUE,
	sigla CHAR(2) NOT NULL UNIQUE
);

CREATE TABLE cidade (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL,
	estado_id INT NOT NULL REFERENCES estado (id)
);

CREATE TABLE aluno (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL,
	ra INT NOT NULL UNIQUE,
	cidade_id INT NOT NULL REFERENCES cidade (id)
);

CREATE TABLE disciplina (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL,
	descricao VARCHAR(350) NOT NULL,
	codigo CHAR(8) NOT NULL UNIQUE
);

CREATE TABLE aluno_disciplina (
	aluno_id INT NOT NULL REFERENCES aluno (id),
	disciplina_id INT NOT NULL REFERENCES disciplina (id)
);

INSERT INTO estado (nome, sigla) VALUES ('Paraná', 'PR');
INSERT INTO estado (nome, sigla) VALUES ('Santa Catarina', 'SC');
INSERT INTO estado (nome, sigla) VALUES ('Rio Grande do Sul', 'RS');
INSERT INTO estado (nome, sigla) VALUES ('São Paulo', 'SP');
INSERT INTO estado (nome, sigla) VALUES ('Mato Grosso', 'MT');
INSERT INTO estado (nome, sigla) VALUES ('Rondônia', 'RO');
	
INSERT INTO cidade (nome, estado_id) VALUES ('Paranavaí', 1);
INSERT INTO cidade (nome, estado_id) VALUES ('Maringá', 1);
INSERT INTO cidade (nome, estado_id) VALUES ('Curitiba', 1);
INSERT INTO cidade (nome, estado_id) VALUES ('Alto Paraná', 1);
INSERT INTO cidade (nome, estado_id) VALUES ('Porto Velho', 6);

INSERT INTO aluno (nome, ra, cidade_id) VALUES ('Iago Gonçalves de Meira', 20220009931, 1);
INSERT INTO aluno (nome, ra, cidade_id) VALUES ('Rafael Sanches Silva', 20228543987, 4);
INSERT INTO aluno (nome, ra, cidade_id) VALUES ('Renato Augusto Platz', 20228743687, 6);