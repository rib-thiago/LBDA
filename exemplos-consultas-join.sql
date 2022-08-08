/*

Crie um banco de dados para um pequeno mini mundo, contendo tabelas relacionadas e registros de exemplo. Em seguida, elabore e escreva as strings SQL de consultas para as seguintes variações de JOINs:

- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL JOIN (simular utilizando UNION, conforme exemplo nos slides)

Enviar as instruções de definição do banco de dados, inserção dos registros e perguntas (comentadas) e SQLs de consulta.
*/

create database if not exists Comunismo;
use Comunismo;

create table Lider (
id int auto_increment,
nome varchar (30),
pais varchar(30),
dataNascimento date,
dataFalecimento date,
id_revolucao int,

primary key (id),
foreign key (id_revolucao) references Revolucoes (id)
);

create table Obras (
 id int auto_increment,
 nome varchar(200),
 dataPublicacao year,
 id_autor int,
 
 primary key (id),
 foreign key (id_autor) references Lider (id)
);

create table Revolucoes (

id int auto_increment,
nome varchar(30),
dataInicio date,

primary key (id)
);

/*
Inserção dos Registros
*/

insert into Revolucoes (nome, dataInicio) values
('Revolução Russa de Outubro', '1917-11-07'),
('Revolução Chinesa', '1949-10-01'),
('Revolução Vietnamita', '1975-04-30'),
('Revolução Cubana', '1959-01-01'),
('Revolução Corena', '1959-09-09'); 

insert into Lider (nome, pais, dataNascimento, dataFalecimento, id_revolucao) values
('Vladimir Ilyich Lenin', 'URSS', '1870-04-22', '1294-01-21', 1),
('Josef Vissariónovitch Stalin', 'URSS', '1878-12-18', '1953-03-05', 1),
('Mao Zedong', 'China', '1893-12-26', '1976-09-09', 2),
('Zhou Enlai', 'China', '1898-03-05', '1976-01-08', 2),
('Ho Chi Minh', 'Vietnã', '1890-03-19', '1969-09-02', 3),
('Võ Nguyên Giáp', 'Vietnã', '1911-08-25', '2013-10-04', 3),
('Fidel Castro', 'Cuba', '1926-08-13', '2016-11-25', 4),
('Kim Il-Sung', 'Coréia Popular', '1912-04-15', '1994-07-08', 5),
('Kim Jong-Il', 'Coréia Popular', '1942-02-16', '2011-12-17', 5);

insert into Obras (nome, dataPublicacao, id_autor) values
('Que Fazer? Problemas Candentes do Nosso Movimento', '1902', 1),
('O Socialismo e a Guerra. A atitude do POSDR em relação à guerra', '1915', 1),
('Imperialismo, Fase Superior do Capitalismo', '1916', 1),
('O Estado e a Revolução', '1917', 1),
('Sobre os Fundamentos do Leninismo', '1924', 2),
('Trotskismo ou Leninismo?', '1924', 2),
('Problemas Economicos do Socialismo', '1952', 2),
('Sobre a Contradição', '1937', 3),
('Sobre a Guerra Prolongada', '1938', 3),
('Servir o Povo', '1944', 3),
('Armamento das Massas Revolucionárias. Edificação do Exército do Povo', '1964', 6),
('Algumas Considerações sobre a Questão Colonial', '1922', 5),
('O Socialismo é uma Ciência', '1994', 9),
('Sobre a Ideia Juche', '1982', 9);


/*
Consultas (com perguntas comentadas)
*/

/*
INNER JOIN

Retorne o nome dos líders com obras cadastradas
*/

select distinct Lider.nome from Obras
inner join Lider on Lider.id = Obras.id_autor;


/*
LEFT JOIN

Retorne os nomes das obras cadastradas e seus autores:

*/

select Lider.nome, Obras.nome from Lider
left join Obras on Obras.id_autor = Lider.id
where Obras.nome is not null;


/*
RIGHT JOIN

Retorne os lideres de cada Revolução

*/

select Lider.nome, Revolucoes.nome, Revolucoes.dataInicio from Lider
right join Revolucoes on Revolucoes.id = Lider.id_revolucao;

/*
FULL JOIN

Retorne todos os lideres que não possuem obras publicadas;

*/

select distinct Lider.nome from Obras
left join Lider on Lider.id = Obras.id_autor
where Obras.nome is null
union all
select distinct Lider.nome from Obras
right join Lider on Lider.id = Obras.id_autor
where Obras.nome is null;
