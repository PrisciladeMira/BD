CREATE DATABASE Escola;

CREATE TABLE Aluno(
registro int primary key,
nome varchar(155) not null,
dataNascimento DATE
);
CREATE TABLE Professor(
codigo int primary key,
nome varchar(155) not null,
email varchar(270),
titulacao ENUM('grad', 'espec', 'msc', 'dr') CHECK(IN('grad', 'espec', 'msc', 'dr'))
);
CREATE TABLE Disciplina(
id int auto_increment not null primary key,
nome varchar(100) not null,
cargaHoraria TIME CHECK(cargaHoraria>0),
livro VARCHAR(155)
);
CREATE TABLE Turma(
codigo int primary key,
disciplina int,
FOREIGN KEY (disciplina)
REFERENCES Disciplina(id),
sigla varchar(50) UNIQUE,
nAlunos int,
sala varchar(50),
professor int,
FOREIGN KEY (professor)
REFERENCES  Professor(codigo)
);
CREATE TABLE Matricula(
id INT auto_increment not null primary key,
turma int,
FOREIGN KEY(turma)
REFERENCES Turma(codigo),
aluno int,
FOREIGN KEY(aluno)
REFERENCES Aluno(registro),
ano YEAR,
nota decimal(5,2)
);

ALTER TABLE Turma MODIFY COLUMN sigla VACHAR(50) DEFAULT 'CTDS2023-1';


ALTER TABLE Professor 
ADD COLUMN id int,
DROP primary key,
add primary key (id);

ALTER TABLE Professor MODIFY COLUMN id VARCHAR AFTER codigo;

ALTER TABLE Professor RENAME TO tb_professor;

ALTER TABLE Professor CHANGE COLUMN nome nomeProfessor
varchar(155) NOT NULL;

ALTER TABLE Professor DROP nome;

ALTER TABLE Professor ALTER

DROP TABLE Professor;

DROP DATABASE Escola;