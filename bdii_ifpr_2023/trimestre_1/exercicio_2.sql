DROP DATABASE IF EXISTS dbii;
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
    valor_servico DECIMAL(6, 2) NOT NULL
);

CREATE TABLE servico_por_cliente (
	id_servico_cliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_cliente INT NOT NULL REFERENCES clientes (id_cliente),
    id_servico INT NOT NULL REFERENCES servicos (id_servico)
);

INSERT INTO clientes (nome, whatsapp, cpf)
VALUES
('José Bezerra de Farias', '(44)98453-0948', '18562378495'),
('Alice de Morais Silveira', '(41)98452-7821', '94521632845'),
('Lucas Luciano Calheiros', '(15)92153-8942', '45238945123'),
('Paula Ribeiro de Rocha', '(24)95892-0248', '64512374512'),
('Victor Nalute da Silva', '(49)95201-7462', '87412568374');

INSERT INTO servicos (nome_servico, valor_servico, data_servico)
VALUES
('Atualização de dados pessoais', 120.59, '2020-04-28'),
('Aumento de banda larga', 61.86, '2022-11-18'),
('Assinatura de streamings', 46.23, '2019-06-22'),
('Cancelamento de contrato', 31.99, '2021-03-05'),
('Apoio a streamers da Twitch', 12.84, '2023-08-30');

INSERT INTO servico_por_cliente (id_cliente, id_servico)
VALUES
(1, 3),
(2, 5),
(3, 1),
(3, 2),
(5, 4);

SELECT clientes.nome AS 'NOME DO CLIENTE', servicos.nome_servico AS 'SERVIÇO REQUISITADO', servicos.valor_servico AS 'VALOR DO SERVIÇO'
FROM clientes JOIN servico_por_cliente ON clientes.id_cliente = servico_por_cliente.id_cliente
JOIN servicos ON servicos.id_servico = servico_por_cliente.id_servico;

ALTER TABLE clientes
ADD cpf CHAR(11) NOT NULL;

ALTER TABLE servicos
ADD data_servico DATE NOT NULL;

ALTER TABLE servicos
MODIFY COLUMN valor_servico DECIMAL(6, 2) NOT NULL DEFAULT 0.0;

ALTER TABLE clientes
MODIFY COLUMN whatsapp VARCHAR(16) NOT NULL;