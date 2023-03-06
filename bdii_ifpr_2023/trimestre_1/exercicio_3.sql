CREATE DATABASE universidades;
USE universidades;

CREATE TABLE alunos (
	id_aluno INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_aluno VARCHAR(50) NOT NULL,
    endereco_aluno VARCHAR(255) NOT NULL,
    cidade VARCHAR(50) NOT NULL
);

CREATE TABLE disciplinas (
	id_disciplina INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    carga_horaria INT NOT NULL
);

CREATE TABLE professores (
	id_professor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_professor VARCHAR(50) NOT NULL,
	endereco_professor VARCHAR(255) NOT NULL,
    cidade VARCHAR(50) NOT NULL
);

CREATE TABLE turma (
	id_turma INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	disciplina_id INT NOT NULL REFERENCES disciplinas (id_disciplina),
    professor_id INT NOT NULL REFERENCES professores (id_professor),
    horario TIME NOT NULL
);

CREATE TABLE historico (
	aluno_id INT NOT NULL REFERENCES alunos (id_aluno),
    disciplina_id INT NOT NULL REFERENCES disciplinas (id_disciplina),
    professor_id INT NOT NULL REFERENCES professores (id_professor),
    frequencia INT NOT NULL,
    nota DECIMAL(2, 2) NOT NUL
);
