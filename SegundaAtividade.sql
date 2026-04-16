CREATE DATABASE livro;

use livro;

CREATE TABLE candidatos (
`nome` varchar(255) not null,
`email` varchar(255) unique,
`Dnascimento` date,
`maioridade` boolean default true
);

ALTER TABLE candidatos ADD idade int;

CREATE TABLE livro (
`autor` varchar(255),
`nome` varchar(255) unique,
`ano_publicacão` year not null default 2026,
`editora` boolean default true
);

insert into candidatos (nome, email, Dnascimento, maioridade, idade) values ('Samuel', 'samuel@gmail.com', '2003-09-08', true, 23);
INSERT INTO candidatos (nome, email, Dnascimento, maioridade, idade) 
VALUES ('Ana', 'ana@gmail.com', '2005-04-12', TRUE, 20);
INSERT INTO candidatos (nome, email, Dnascimento, maioridade, idade) 
VALUES ('Carlos', 'carlos@gmail.com', '1998-11-30', TRUE, 27);
INSERT INTO candidatos (nome, email, Dnascimento, maioridade, idade) 
VALUES ('Juliana', 'juliana@gmail.com', '2010-06-25', FALSE, 15);
INSERT INTO candidatos (nome, email, Dnascimento, maioridade, idade) 
VALUES ('Bruno', 'bruno@gmail.com', '2007-01-18', TRUE, 19);

select * from candidatos;
insert into livro (autor, nome, ano_publicacão, editora) values ('Steve Kloves', 'Harry Potter e a Pedra Filosofal', 2001 , true);
select * from livro;
  