create database db_academia_fitflow;

use db_academia_fitflow;

create table planos(
	id INT auto_increment primary key,
	nome varchar(50) not null,
	valor_mensal decimal (5,2) not null,
	duracao_meses tinyint not null
);

create tables alunos(
	id INT auto_increment primary key,
	v_nome varchar(100) not null,
	cpf char(11) unique not null,
	data_nascimento date,
	email varchar(100),
	peso decimal(5,2),
	altura decimal(3,2),
	id_planos INT,
	constraint FK_ALUNO_PLANO foreign key (id_plano)
	references planos(id);
);

create table instrutores (
	id INT auto_increment primary key,
	v_nome varchar(100) not null,
	especialidade varchar(50),
	data_contratacao DATE
);

create table treinos(
	id INT auto_increment primary key,
	id_aluno INT not null,
	id_instrutor INT not null,
	data_criacao DATE not null,
	objetivo varchar(100),
	constraint fk_treino_aluno foreign key(id_aluno),
	references alunos(id),
	constraint fk_treino_instrutor foreing key(id_instrutor),
	references instrutores(id)
);