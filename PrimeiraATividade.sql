create database TabelaDoAluno;

USE TabelaDoAluno;

CREATE TABLE alunos (
	`nome` varchar(255),
    `sobrenome` varchar(255),
    `genero` varchar(50), 
    `dataNascimento` date,
    `reforco` varchar(50),
    `turno` varchar(50),
    `curso` varchar(100)
);

ALTER TABLE alunos ADD ID char;

INSERT INTO alunos (nome, idade, turno, curso, reforço) VALUES('Samuel', 23 ,'Noite', 'Tecinfo' , 'Não');
INSERT INTO alunos (nome, idade, turno, curso, reforço) VALUES('Mathueus', 19 , 'Tarde', 'Senai Tech', 'Não');

select * from alunos;

create database lojaCarro;

create table carros (
`nome` varchar(255) not null,
`marca` varchar(255) unique,
`modelo` varchar(255),
`km` int,
`motor` int default 1
);

insert into carros values(null, 'GM', 'Life', 1 , 170 );
insert into carros (nome, marca, modelo, km) values ('Pulse', 'Fiat', 'Drive', 0);

insert into carros values('Uno', 'Fiat', 'Trekking', 20000, 109);



create database 




