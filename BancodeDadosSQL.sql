create database db_academia_fitflow;

use db_academia_fitflow;

create table Planos (
	id INT auto_increment primary key,
	nome varchar(50) not null,
	valor_mensal decimal (10,2) not null,
	duracao_meses tinyint not null
);

create table Alunos (
	id INT auto_increment primary key,
	nome VARCHAR(100) not null,
	cpf char(11) unique not null,
	data_nascimento DATE,
	email varchar(100),
	peso decimal(5,2),
	altura decimal(3,2),
	id_plano INT,
	constraint fk_aluno_plano foreign key (id_plano) references Planos(id)
);

create table instrutores (
	id INT auto_increment primary key,
	nome VARCHAR(100) not null,
	especialidade varchar(50),
	data_contratacao DATE
);

create table treinos(
	id INT auto_increment primary key,
	id_aluno int not null,
	id_instrutor int not null,
	data_criacao date not null,
	objetivo varchar(100),
	constraint fk_treino_aluno foreign key(id_aluno)
	references Alunos(id),
	constraint fk_treino_instrutor foreign key(id_instrutor)
	references instrutores(id)
);

create table exercicios (
	id INT auto_increment primary key,
	nome_exercicio varchar(50) not null,
	equipamento varchar (50)
);

create table itens_treino(
	id_treino int,
	id_exercicio int,
	series tinyint,
	repeticoes tinyint,
	primary key (id_treino, id_exercicio),
	constraint fk_item_treino foreign key(id_treino) references treinos(id),
	constraint fk_item_exercicio foreign key(id_exercicio) references exercicios(id)
);


INSERT INTO planos (nome, valor_mensal, duracao_meses) VALUES 
('Plano Mensal Bronze', 90.00, 1),
('Plano Trimestral Prata', 150.00, 3),
('Plano Semestral Ouro', 250.00, 6),
('Plano Anual Black', 1200.00, 12),
('Plano de Teste', 0.00, 1);

INSERT INTO alunos (nome, cpf, data_nascimento, email, peso, altura, id_plano) VALUES 
('Carlos Silva', '12345678901', '1960-05-15', 'carlos@email.com', 95.50, 1.68, 4),
('Ana Souza', '23456789012', '2009-10-20', 'ana.souza@email.com', 55.00, 1.62, 1),
('Ricardo Oliveira', '34567890123', '1995-03-10', 'ricardo@email.com', 110.00, 1.85, 2),
('Mariana Costa', '45678901234', '1985-08-25', NULL, 62.00, 1.70, 3),
('Pedro Santos', '56789012345', '1965-12-30', 'pedro@email.com', 88.00, 1.75, 4),
('Julia Lima', '56789012365', '2010-01-05', 'julia@email.com', 48.00, 1.55, 1);

INSERT INTO instrutores (nome, especialidade, data_contratacao) VALUES 
('Renato Personal', 'Musculação', '2024-06-01'),
('Fabiana Zen', 'Yoga', '2025-02-15'),
('Marcos Iron', 'Crossfit', '2026-01-10'),
('Cláudia Dance', 'Zumba', '2025-11-20');

INSERT INTO treinos (id_aluno, id_instrutor, data_criacao, objetivo) VALUES 
(1, 1, '2026-04-01', 'Perda de Peso'),
(3, 3, '2026-04-10', 'Hipertrofia'),
(2, 1, '2026-04-12', 'Condicionamento'),
(5, 4, '2025-12-15', 'Fisioterapia');

INSERT INTO exercicios (nome_exercicio, equipamento) VALUES 
('Supino Reto', 'Barra'),
('Supino Inclinado', 'Haltere'),
('Agachamento Hack', 'Máquina'),
('Rosca Direta', 'Halter'),
('Leg Press 45', 'Máquina'),
('Desenvolvimento Articulado', 'Máquina'),
('Remada Curvada', 'Barra');

INSERT INTO itens_treino (id_treino, id_exercicio, series, repeticoes) VALUES 
(1, 1, 3, 12),
(1, 3, 4, 15),
(2, 1, 4, 8),
(2, 7, 3, 10),
(3, 4, 3, 20);
-- selecionar dados
-- order by DATA_NASCIMENTO desc;
--  where ID = 16;
select * from alunos 
where ID = 18 ;
order by DATA_NASCIMENTO asc;

select NOME, EMAIL, PESO, ALTURA from alunos
where PESO > 90 and altura < 1.70;

select * from exercicios 
where equipamento in 'Halter', 'barra';

select * from alunos

select nome, data_nascimento from alunos
where data_nascimento > '2008-01-01' or data_nascimento < '1966-01-01';


select nome, especialidade from instrutores
where especialidade = 'Crossfit' or data_contratacao >= '2026-01-01';

select * from exercicios
where equipamento != 'Máquina';

select * from alunos
where email is not null;

select * from planos;

update PLANOS set NOME = 'Plano Trimestral Bronze'
where id = 5;

select * from alunos;
update alunos set peso = 60
where id = 14;

select * from alunos
where email is not null;

select * from planos;

select nome as "Nome do Aluno",
DATE_FORMAT(data_nascimento, %d/%m/%Y) as "Data de Nascimento" from alunos where peso > 60

select 
	a.nome as 'Nome Aluno',
	p.nome as 'Nome do Plano' from alunos as a inner join Planos as p on a.id_plano = p.id;

select 
	a.instrutor

	select * from exercicios where equipamentos;

select * from instrutores;

update instrutores set nome = Professor;

alter table instrutores rename to Professor;

alter table instrutores rename column nome to Professor; // renomeia a coluna.

alter table alunos rename column peso to Peso_Maximo;

select * from planos 
order by valor_mensal dasc;

select * from alunos
order by data_nascimento asc;

alter table alunos rename column CPFs to Cliente and Documento;

select * from exercicios where equipamento;

select * from instrutores;

alter table instrutores rename to Professor;

alter table instrutores rename column nome to Professor; // renomeia a coluna.

alter table alunos rename column peso to Peso_Maximo;

select * from planos 
order by valor_mensal dasc;

select * from alunos
order by data_nascimento asc;

select alunos as "nome_do_aluno", cpf as "Documento" and "Cliente" from alunos;

select * from treinos;

select DISTINCT nome_equipamento from exercicios;

select n.alunos as aluno p.nome as planos from alunos;

select n.alunos as aluno, p.nome as plano from alunos as a left join planos as p on a.id_plano = p.id_plano;

select n.instrutor, o.treino as itens_treino from exercicios;

select n.alunos as alunos ,p.treino as a inner join itens_treinos as p on a.id_treino = p.objetivo;

select n.exercicos as itens_treino as a inner join treino as p on a.id 2 = itens_treino;

select n.alunos as data_criacao as a inner join treino as p on a.id_treino = p.treino;

select a.nome, e.nome_exercicios, it.repeticoes, e.equipamento from alunos a 
inner join treinos t on a.id = t.id_aluno
inner join itens_treino it on t.id = it.id_treino 
inner join exercicios e on it.id_exercicio = e.id;

-- exemplo sobre resumo planos
create table resumo_planos as 
select p.nome, count (a.id) as total_alunos
from planos p
left join alunos a on p.id = a.id_plano
group by p.nome;

-- criação dinamica
insert into planos (nome, valor_mensal, duracao_meses)
select 'Planos VIP Gold', max(valor_mensal) * 1.5, 12
from planos;

--update com subqueries
update alunos set peso = peso - 1
where id_plano = (select id_plano from planos
where nome = 'Plano Anual Black');
-- delete com subqueries
delete from treinos
where id_instrutor = (select id from instrutores where nome = 'Marcos Iron');


select nome, peso from alunos
where peso > (select AVG(peso) from alunos);

select * from alunos;

-- Tarefa1: Auditoria
create table auditoria_precos as select nome,(select max(valor_mensal) from planos) - valor_mensal as diferenca_plano from planos; 

-- Tarefa2: instrutores
select * from instrutores order by id desc;
-- e aqui atualizando e buscando o instrutor mais recente.
update treinos set id_instrutor = (select max(id) from instrutores) where id_instrutor = 3;
-- aqui removendo o instrutor daquela categoria treinos
delete from instrutores where id = 1;


-- Tarefa3: limpeza
select id from planos where valor_mensal < 50 ;

delete from alunos where id_plano in (select id_plano from planos where valor_mensal < 50);


select lower (nome) from alunos: 
select * from alunos;

select substring(data_nascimento, 1, 4) from alunos;

select nome, ifnull (email, 'Sem Email') from alunos;

create function fn_status_imc(peso decimal(5,2), altura decimal(5,2))
returns varchar (10) 
deterministic 
begin
	
	declare imc decimal(5,2);
	declare classificacao varchar(10);
	set imc = peso / (altura * altura);
	
	if imc < 18.5 then set classificacao = 'Abaixo';
	elseif imc <= 24.9 then set classificacao = 'Medio';
	else set classificacao = 'Sobrepeso';
	end if;  
	return classificacao; 
end

select peso, altura, fn_status_imc(peso, altura) from alunos;

create function fn_perfil_plano (valor_mensal decimal (10,2))
returns varchar (30)
deterministic
begin
	declare categoria varchar(30);
	
	if valor_mensal < 100 then set categoria = 'Economico';
	elseif valor_mensal >= 100 and valor_mensal < 200 then set categoria = 'Padrão';
	else set categoria = 'Premium';
	end if;
	return categoria;
end

select nome, valor_mensal, fn_perfil_plano(valor_mensal) as categoria from planos;

create function fn_fc_alvo (idade INT) returns varchar (50) 
deterministic 
begin
	declare fcm int;
	declare min_zona decimal(5,2);
	declare max_zona decimal (5,2);

	set fcm = 220 - idade;
	set min_zona = fcm * 0.60;
	set max_zona = fcm * 0.70;
	
	return concat ('Min: ', min_zona, ' - Max: ', max_zona);
end

-- Cada questão são exemplos para você estudar melhor.
create function fn_mascara_email (email varchar(100) returns varchar(100) 
deterministic
begin
	declare pos int;

	set pos = instr (email, '@');
	
	return concat (substring (email, 1, 1), '*****', substring(email, pos));
end

create function fn_eh_aniversariante (data_nascimento date) returns tinyint(1) 
deterministic
begin
	if month(data_nascimento) = month(curdate()) and day(data_nascimento) = day(curdate()) then
		return 1;
	else
		return 0;
	end if;
end

create function fn_calcular_preco_verao (valor_mensal) returns decimal (5,2) deterministic
begin
	if valor_mensal > 200 then
		return valor_mensal * 0.90;

	else valor <= 200 then
		return valor_mensal * 0.95;
	
	end if;
end

create function fn_validar_formato_cpf (cpf varchar(20)) returns varchar(10) deterministic
begin
	if length (cpf) = 11 then
		return 'Válido';
	else
		return 'Inválido';
	end if;
end

create function fn_senioridade_instrutor(data_contratacao DATE) returns varchar(20) deterministic
begin
	declare anos int;
	set anos = timestampdiff (year, data_contratacao, curdate());

	if anos < 1 then return 'Instrutor Júnior';
	elseif anos <= 5 then return 'Instrutor Pleno';
	else return 'Instrutor Sênior';
	end if;
end

create function fn_custo_beneficio (valor_mensal decimal(10,2),duracao_meses int) returns varchar(20) deterministic
begin
	if valor_mensal > 150 and duracao_meses < 6 then
		return 'Alto Custo';
	else 
		return 'Ótimo Investimento';
	end if;
end

create function fn_tempo_total (id_treino int) returns varchar(20) deterministic 
begin
	declare total_reps int;
	select sum(repeticoes) into total_reps from itens_treino where id_treino = id_tempo_total;
	return ifnull (total_reps / 20, 0);
end


create trigger trg_padroniza_nome before insert on alunos for each row begin
	set new.nome = upper(new.nome); 
end

create trigger trg_padroniza_valor before update on planos for each row begin
	if new.valor_mensal < 50 then set new.valor_mensal = 50;  
	end if;
end

create table auditoria_precos (
	id int auto_increment primary key,
	id_plano int not null,
	valor_antigo decimal (10,2),
	valor_novo decimal (10,2),
	data_auditoria timestamp default current_timestamp,
	constraint fk_plano_auditoria foreign key (id_plano) references planos (id)
);

create trigger trg_auditoria_preco after update on planos for each row 
begin
	if old.valor_mensal <> new.valor_mensal then insert into auditoria_precos (id_plano, valor_antigo, valor_novo, data_auditoria) 
	values (old.id, old.valor_mensal, new.valor_mensal, now());
end if;
end

select * from planos;

update planos set valor_mensal = 180 where id = 1;

create trigger trg_backup_alunos after delete on alunos for each row
begin 
	insert into backup_alunos (id_aluno, nome, cpf, data_exclusao) values(old.id_aluno, old.nome, old.cpf, now());
end


-- exercicio de trigger de Auditoria
-- faça em casa!!
create trigger trg_treino after insert on treinos for each row
begin
	if 
end

-- Desafios Práticos: Triggers e Automação

create table auditoria_instrutor (
	id_auditoriaIns int auto_increment primary key,
	id_instrutor int not null,
	log_instrutores varchar(30),
	log_data_contratacao date,
	constraint fk_instrutor_auditoria foreign key (id_instrutor) references instrutores (id)
);

create trigger trg_auditoria_instrutores 
after update on instrutores for each row
begin
	if old.especialidade <> new.especialidade and old.nome <> new.nome then
	insert into instrutores(id_auditoriaIns, id_instrutor, log_instrutores)
	values (old.id, old.especialidade, new,especialidade, now());
	end if;
end


