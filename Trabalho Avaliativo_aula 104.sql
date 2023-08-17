CREATE DATABASE senai_bp;

USE senai_bp;

CREATE TABLE cursos (
cod_curso INT,
nome_curso VARCHAR (100),
PRIMARY KEY(cod_curso)

);

CREATE TABLE alunos (
cod_aluno INT,
nome VARCHAR(45),
sobrenome VARCHAR(45),
data_nascimento DATE,
cod_curso INT,
PRIMARY KEY (cod_aluno),
FOREIGN KEY (cod_curso)
REFERENCES cursos(cod_curso)

);

select * from cursos;
select * from alunos where cod_aluno = 1100;

drop table alunos;

INSERT INTO cursos values('101','Introdução ao Desenvolvimento de Projetos');
INSERT INTO cursos values ('102', 'Inglês Técnico Aplicado ao Desenvolvimento de Sistemas');
INSERT INTO cursos values ('103', 'Higiene do Alimento:Microbiologia de Alimentos');
INSERT INTO cursos values ('104', 'Ferramentas Digitais de Gestão');
INSERT INTO cursos values ('105', 'Introdução a IOT para manutenção Industrial');
INSERT INTO cursos values ('106', 'Introdução à Industria 4.0');
INSERT INTO cursos values ('107', 'Administrador de Bancos de Dados');

INSERT INTO alunos values
( '1100', 'Sarah', 'Maria', '2006-01-26', '107');

-- Consulte os alunos que nasceram depois
-- de 1998 ordenado pela data de nascimento
select *
from alunos
where (data_nascimento) > '1998-01-01'
order by data_nascimento;

-- contagem dos alunos que são
-- menores de idade 
select count(*) as alunos_menores_idade
from alunos
where year(data_nascimento) >2005;

-- contagem de cursos existentes
select count(*) as quantidade_cursos
from cursos;

-- quantidade de alunos por curso 
select c.nome_curso,count(a.cod_curso) as quantidade_alunos
from cursos c
inner join alunos a on c.cod_curso=a.cod_curso
group by c.nome_curso;

-- nome completo somente dos alunos
-- que são estão matriculados no curso 106(Introdução à Industria 4.0)
select concat(a.nome,' ',a.sobrenome) as nome_completo
from alunos a
inner join cursos c on a.cod_curso=c.cod_curso
where c.cod_curso=106;

select * from cursos ;
select * from alunos;







