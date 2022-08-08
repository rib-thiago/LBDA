/*
1 - Descreva o SQL que defina a criação do banco de dados, tabelas e relações
conforme os diagramas apresentados.
*/

create database Locadora_Veiculos;
use Locadora_Veiculos;
drop database Locadora_Veiculos;

create table Clientes (
Cpf char(11),
Nome varchar(50) not null,
Telefone varchar(20) not null,

primary key (Cpf)
);

create table GruposVeiculos (
ID int auto_increment,
Nome varchar(30) not null,
ValorDiaria decimal(7,2) not null,

primary key (ID)
);

create table ModelosVeiculos (
ID int auto_increment,
GruposVeiculos_ID int,
Fabricante varchar(30),
Modelos varchar(30),

primary key (ID),
foreign key (GruposVeiculos_ID) references GruposVeiculos (ID)
);

create table Filiais (
ID int auto_increment, 
Nome varchar(30) not null,
Cidade varchar(50) not null,
Estado char(2) not null,

primary key (ID)
);

create table Veiculos (
Placa char(7),
ModelosVeiculos_ID int,
Filiais_ID int,
NumeroChassi varchar(20) not null,
Renavam varchar(20) not null,
AnoFabricacao year not null,
PotenciaMotor varchar(5) not null,
Cor varchar(20),
NumeroPortas int,
Equipamentos text,

primary key (Placa),
foreign key (ModelosVeiculos_ID) references ModelosVeiculos (ID),
foreign key (Filiais_ID) references Filiais (ID)
);

create table Reservas (
ID int auto_increment,
Clientes_Cpf char(11),
Filiais_ID_retirada int,
Filiais_ID_devolucao int,
GruposVeiculos_ID int,
DataRetiradaPretendida datetime not null,
DataDevolucaoPretendida datetime not null,

primary key (ID),
foreign key (Clientes_Cpf) references Clientes (Cpf),
foreign key (Filiais_ID_retirada) references Filiais (ID),
foreign key (Filiais_ID_devolucao) references Filiais (ID),
foreign key (GruposVeiculos_ID) references GruposVeiculos (ID)
);

create table Locacoes (
Reservas_ID int,
Veiculos_Placa char(7),
ValorTotal decimal (9,2) not null,
QtdeDias int not null,
FormaPagamento varchar(20),
DataRetirada datetime not null,
DataDevolucao datetime,
ValorDiaria decimal (9,2) not null,

primary key (Reservas_ID),
foreign key (Reservas_ID) references Reservas (ID),
foreign key (Veiculos_Placa) references Veiculos (Placa)
);

create table Condutores (
Locacoes_Reservas_ID int,
Clientes_Cpf char(11),
Nome varchar(50) not null,
CNH varchar(20) not null,

primary key (Locacoes_Reservas_ID, Clientes_Cpf),
foreign key (Locacoes_Reservas_ID) references Locacoes (Reservas_ID),
foreign key (Clientes_Cpf) references Clientes (Cpf)
);

/*
2- Adicione pelo menos 5 registros em cada uma das tabelas, criando uma relação entre 
os dados para execução das consultas a seguir. 
Nos campos de data inserir datas entre 01/05/2022 e 31/05/2022. 
*/

insert into Filiais (Nome, Cidade, Estado) values
("Filial 01", "Sao Paulo", "SP"),
("Filial 02", "Ribeirao Preto", "SP"),
("Filial 03", "Rio de Janeiro", "RJ"),
("Filial 04", "Belo Horizonte", "MG"),
("Filial 05", "Porto Alegre", "RS");

insert into Clientes values
("92969388804", "Edgar Shubin", "11 61448498"),
("99997687094", "Eric Isayev", "11 27019287"),
("32416426907", "Mazin Tayyib Ba", "21 30855536"),
("14718688264", "Marcos Pinto Barros", "21 48979776"),
("98772463767", "Luiza Almeida Oliveira", "31 21687057");

insert into GruposVeiculos (Nome, ValorDiaria) values
("Grupo Econônimco", 1000.00),
("Grupo Sedan", 1500.00),
("Grupo SUV", 2000.00),
("Grupo Executivo", 2500.00),
("Grupo Trilha", 3000.00);

insert into ModelosVeiculos (GruposVeiculos_ID, Fabricante, Modelos) values
(1, "Fiat", "Uno"),
(2, "Nissan", "Versa"),
(3, "Kia", "Sportage"),
(4, "BMW", "X7"),
(5, "Land Rover", "Defender");

insert into Veiculos values
('TBR1307',1, 1,'7418523691',9632145871,'2005','150','Vermelho',4,''),
('TBR1302',2, 1,'7418523691',9632145872,'2015','250','Chumbo',4,'Ar'),
('TBR1303',3, 2,'7418523693',9632145873,'2013','350','Branco',4,''),
('TBR1304',4, 3,'7418523694',9632145874,'2014','350','Preto',4,''),
('TBR1305',5, 3,'7418523695',9632145875,'2006','400','Prata',4,''),
('TBR1306',1, 5,'7418523695',9632145875,'2006','150','Branco',4,''),
('TBR1301',2, 5,'7418523695',9632145875,'2010','50','Prata',4,'');

insert into Reservas (Clientes_Cpf, Filiais_ID_retirada, Filiais_ID_devolucao, GruposVeiculos_ID, 
DataRetiradaPretendida,DataDevolucaoPretendida) values 
('92969388804', 1, 1, 1,'2022-05-01 11:50:50.000','2022-05-09 15:50:15.000'),
('99997687094', 1, 1, 2,'2022-05-02 12:50:50.000','2022-05-05 15:50:15.000'),
('32416426907', 2, 2, 3,'2022-05-03 13:50:50.000','2022-05-10 15:50:15.000'),
('14718688264', 3, 3, 5,'2022-05-04 14:50:50.000','2022-05-12 15:50:15.000'),
('92969388804', 3, 3, 4,'2022-05-05 15:50:50.000','2022-05-07 15:50:15.000'),
('92969388804', 5, 5, 2,'2022-05-06 16:50:50.000','2022-05-12 15:50:15.000');

insert into Locacoes (Reservas_ID, Veiculos_Placa, ValorTotal, QtdeDias, FormaPagamento,
DataRetirada, ValorDiaria) values
(1, 'TBR1307', 8000.00, 8, "Credito", '2022-05-01 11:50:50.000', 1000.00),
(2, 'TBR1302', 4500.00, 3, "Credito", '2022-05-02 12:50:50.000', 1500.00),
(3, 'TBR1303', 14000.00, 7, "Débito", '2022-05-03 13:50:50.000', 2000.00),
(4, 'TBR1305', 24000.00, 8, "Crédito", '2022-05-04 14:50:50.000', 3000.00),
(5, 'TBR1304', 5000.00, 2, "Dinheiro", '2022-05-05 15:50:50.000', 2500.00), 
(6, 'TBR1301', 9000.00, 6, "Crédito", '2022-05-06 16:50:50.000', 1500.00);

insert into Condutores values
(1,'92969388804', 'Thiago Ribeiro','1234578901'),
(2,'99997687094', 'Manoel Rodrigues','1234578902'),
(3,'32416426907', 'Cabral de Menezes','1234578903'),
(4,'14718688264', 'José Guedes','12345789014'),
(5,'92969388804', 'Cristina Maria','1234578905'),
(6,'99997687094', 'Frederico Angelo','1234578905');

/*
3 - Exibir a lista de Modelos de Veículos por Grupo de Veículos, ordene os resultados 
por Grupo de Veículos e Modelo
*/

select ModelosVeiculos.Modelos, GruposVeiculos.Nome
from ModelosVeiculos
inner join GruposVeiculos on GruposVeiculos.ID = ModelosVeiculos.GruposVeiculos_ID
order by GruposVeiculos.Nome, ModelosVeiculos.Modelos;

/*
4 - Exibir a forma de pagamento mais utilizada nas locações
*/

select  FormaPagamento, count(FormaPagamento) as maisUsada 
from Locacoes 
group by FormaPagamento
order by maisUsada desc
limit 1;

/*
5 - Exiba a quantidade de Veículos por Grupo de Veículos
*/

select GruposVeiculos.Nome, count(Veiculos.Placa) as QuantidadeVeiculos 
from Veiculos
inner join ModelosVeiculos 
on Veiculos.ModelosVeiculos_ID = ModelosVeiculos.ID 
inner join GruposVeiculos
on ModelosVeiculos.GruposVeiculos_ID = GruposVeiculos.ID
group by GruposVeiculos.Nome;

/*
6 - Exiba o total de faturamento das locações de veículos entre os dias 07/05/2022 e 21/05/2022
*/

update Locacoes set DataRetirada = '2022-05-05'where Reservas_ID = 6; 

select sum(ValorTotal) as TotalFaturamento 
from Locacoes 
where DataRetirada >= '2022-05-07' and DataRetirada <= '2022-05-21';

/*
7 - Pesquisar os veículos que estejam lotados (estacionados) na filial de Recife/PE. 
Exiba os veículos organizados por Ano de Fabricação e Placa, exibindo os campos 
Ano de Fabricação, Placa, Motor e Número de Portas 
*/

update Filiais set Cidade = "Recife", Estado = "PE" where ID = 5; 

select AnoFabricacao, Placa, PotenciaMotor,NumeroPortas 
FROM Veiculos 
inner join Filiais
on Filiais.ID = Veiculos.Filiais_ID
where Filiais.Cidade = 'Recife'
and Filiais.Estado = 'PE'
order by AnoFabricacao, Placa;

/*
8 - Pesquisar os clientes que solicitaram reservas de veículos do grupo Sedan Automático 
entre os dias 01/05/2022 e 15/05/2022.
*/

update GruposVeiculos set Nome = "Grupo Sedan Automatico" where Nome = "Grupo Sedan"; 

 select Clientes.Nome, Clientes.Cpf, GruposVeiculos.Nome
 from Clientes 
 inner join Reservas 
 on Reservas.Clientes_Cpf = Clientes.Cpf
 inner join GruposVeiculos
 on Reservas.GruposVeiculos_ID = GruposVeiculos.ID
 where Reservas.DataRetiradaPretendida >='2022-05-01' and DataRetiradaPretendida <= '2022-05-15'
 and GruposVeiculos.Nome = 'Sedan Automático';

/*
9 - Exibir a lista de locações, exibindo o nome do cliente e as datas de retirada e 
devolução pretendidas que estejam ativas, ou seja que não tenham data de devolução preenchidas
*/

select Clientes.Nome, Reservas.DataRetiradaPretendida, Reservas.DataDevolucaoPretendida, 
Locacoes.DataRetirada, Locacoes.DataDevolucao
from Clientes 
inner join Reservas 
on Reservas.Clientes_Cpf = Clientes.Cpf
inner join Locacoes
on Locacoes.Reservas_ID = Reservas.ID
where Locacoes.DataDevolucao is null;