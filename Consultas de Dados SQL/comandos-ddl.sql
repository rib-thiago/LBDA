CREATE DATABASE Projeto;
USE Projeto;

CREATE TABLE Alunos (
matricula INT AUTO_INCREMENT,
nome VARCHAR (80),
rua VARCHAR (100),
numero 	VARCHAR(6),
cep VARCHAR(9),
cidade VARCHAR(30),

PRIMARY KEY (matricula)
);

CREATE TABLE Telefone_Aluno (
matricula_aluno INT,
telefone VARCHAR(20),

PRIMARY KEY (matricula_aluno),
FOREIGN KEY (matricula_aluno) REFERENCES Alunos (matricula)
);

CREATE TABLE Cursos(
cod_curso INT,
nome VARCHAR(80),

PRIMARY KEY (Cod_Curso)
);

CREATE TABLE Disciplinas (
codigo INT,
nome VARCHAR(20),
carga_horario INT,
cod_curso INT,

PRIMARY KEY (codigo),
FOREIGN KEY (codigo) REFERENCES Cursos (cod_curso)
);

CREATE TABLE Professores (
cod_prof INT,
nome VARCHAR(80),
endereco VARCHAR(100),
cidade VARCHAR(30),

PRIMARY KEY (cod_prof)
);

CREATE TABLE Turma (
codigo INT,
cod_turma INT,
cod_prof INT,
ano INT,
periodo VARCHAR(10),

PRIMARY KEY (cod_turma),
FOREIGN KEY (codigo) REFERENCES Disciplinas (codigo),
FOREIGN KEY (cod_prof) REFERENCES Professores (cod_prof)
);

CREATE TABLE Historico (
codigo INT,
matricula INT,
cod_turma INT,
cod_prof INT,
ano INT,
frequencia INT,
nota INT,

PRIMARY KEY (codigo, matricula, cod_turma, cod_prof),
FOREIGN KEY (codigo) REFERENCES Disciplinas (codigo),
FOREIGN KEY (matricula) REFERENCES Alunos (matricula),
FOREIGN KEY (cod_turma) REFERENCES Turma (cod_turma),
FOREIGN KEY (cod_prof) REFERENCES Professores (cod_prof)
);




SET FOREIGN_KEY_CHECKS = 0;
ALTER TABLE Alunos MODIFY COLUMN matricula INT auto_increment;
SET FOREIGN_KEY_CHECKS = 1;

