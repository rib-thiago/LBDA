#1 - Adicione 5 registros em cada uma das tabelas; (0,5)
INSERT INTO Alunos VALUES 
("RA187258", "Thiago Bernardes", "Rua Aragão", "763", "02308-001", "São Paulo"),
("RA187259", "Gabreila Ferraz", "Avenida Anibal Correa", "2620", "02304-002", "Baueri"),
("RA187260", "Karoline Keller", "Rua dos Maracujás", "1500", "02312-223", "Osasco"),
("RA187261", "Sueli Ribeiro", "Rua Imbiras", "22A", "02316-008", "Rio de Janeiro"),
("RA187262", "Lucas Piton", "Rua São Jorge", "s/n", "02345-114", "São Paulo");
select * from Alunos;

INSERT INTO telefone_aluno VALUES 
("RA187258","2204-7411"),
("RA187259","2204-7512"),
("RA187260","2204-7613"),
("RA187261","2204-7714"),
("RA187262","2204-7815");
SELECT * FROM telefone_aluno;

INSERT INTO Cursos VALUES 
(1, "Análise e desenvolvimento de sistemas"),
(2, "Engenheria da Computação"),
(3, "Física"),
(4, "Mecatrônica"),
(5, "Química");
SELECT * FROM Cursos;

INSERT INTO Disciplinas VALUES
(1, "Banco de dados", 230, 1),
(2, "Arquitetura de Sistemas", 200, 2),
(3, "Fundamentos Newtonianos", 180, 3),
(4, "Calculo III", 100, 4),
(5, "Química Orgânica", 180, 5),
(6, "Lógica de programação", 200, 1),
(7, "Física Nuclear", 150, 3);
SELECT * FROM Disciplinas;

INSERT INTO Professores VALUES
(1, "Luiz Albano", "Rua 89", "Guarulhos"),
(2, "Felipe Basile", "Rua Amor", "Embu das Artes"),
(3, "Renato Montanher", "Avenida Brasil", "Diadema"),
(4, "Idalise Bagé", "Rua 25 de Março", "Porto Alegra" ),
(5, "André Favaretto", "Rua da perdição", "Mauá" );
SELECT * FROM Professores;

INSERT INTO Turmas VALUES
(1, 1, 1, "2022", "Noite"),
(2, 2, 2, "2020", "Manhã"),
(3, 3, 3, "2022", "Tarde"),
(4, 4, 4, "2020", "Manha"),
(5, 5, 5, "2021", "Noite"),
(6, 6, 1, "2022", "Noite");
SELECT * FROM Turmas;

INSERT INTO Historicos VALUES
(1, 'RA187258', 1, 1, "2016", 100, "7"),
(2, 'RA187259', 2, 2, "2015", 89, "9"),
(3, 'RA187260', 3, 3, "2020", 95, "10"),
(4, 'RA187261', 4, 4, "2018", 72, "5"),
(5, 'RA187262', 5, 5, "2019", 60, "3");
SELECT * FROM Historicos;

/*2 - Adicione uma nova tabela a base de dados que contenha pelo menos 3 colunas. 
Adicione 5 registros a essa tabela (0,5) */
CREATE TABLE funcionarios (
cod INT not null unique auto_increment, 
funcao VARCHAR(25), 
salario float
);

INSERT INTO funcionarios (funcao,salario) VALUES 
("Faxineiro",1600),
("Bibliotecario",2500),
("Seguranca",4000),
("Manutencao",2000),
("Cozinheiro",1600);

SELECT * FROM funcionarios;

#3 - Altere a tabela criada no exercício 2 de maneira a incluir uma nova coluna que possua o tipo DATA; (0,5)
ALTER TABLE funcionarios ADD dataContratacao DATE;

#4 - Atualize a Carga horária de todas as disciplinas com um aumento de 10%. (0,5)
UPDATE Disciplinas SET CargaHoraria = (CargaHoraria * 0.10) + CargaHoraria WHERE codigo;

/*5 - Pesquise por todos os alunos com nota inferior a 6 que realizaram a 
disciplina BANCO DE DADOS durante os anos de 2017 a 2021.
(Obs. Acrescentar registros no exercício 1 que atenda a este requisito). (1,0) */

INSERT INTO Historicos VALUES
(6, "RA187263", 1, 1, "2020", 80, "9"),
(7, "RA187264", 1, 1, "2017", 50, "5"),
(8, "RA187265", 1, 1, "2018", 95, "1"),
(9, "RA187258", 6, 1, "2016", 100, "7");

INSERT INTO Alunos VALUES 
("RA187263", "Abilio Correa", "Rua 98", "123", "12345-61", "Jundiapeba"),
("RA187264", "Matilde Aparecida", "Rua 50", "123", "12342-22", "Mogi das cruzes"),
("RA187265", "Paulo Henrique", "Rua 53", "123", "12340-11", "Carapicuíba");

SELECT a.Matricula, a.Nome, h.Nota, h.Frequencia, h.Ano
FROM Historicos AS h
INNER JOIN Alunos AS a ON a.Matricula = h.Matricula
WHERE h.nota < 6 AND h.Cod_Turma = 1;

/*6 - Pesquise por todas as disciplinas que o aluno “RA187258” cursou 
(Obs. Acrescentar registros no exercício 1 que atenda a este requisito). (1,0) */
/*SELECT * FROM alunos a, disciplinas d
WHERE a.matricula = "RA187258";*/

SELECT d.Nome FROM Historicos AS h
INNER JOIN Alunos AS a ON a.Matricula = h.Matricula
INNER JOIN Turmas AS t ON t.Cod_Turma = h.Cod_Turma
INNER JOIN Disciplinas As d ON d.Codigo = t.Codigo
WHERE a.Matricula = "RA187258";

/*7- Pesquise por todas as disciplinas de cada curso. 
Ordene o resultado por nome do curso em ordem crescente e 
pelo nome da disciplina em ordem decrescente. (1,0)*/

SELECT c.Nome, d.Nome FROM Disciplinas AS d
INNER JOIN Cursos AS c ON c.Codigo = d.Cod_Curso
ORDER BY c.Nome ASC, d.Nome DESC;

/*8 - Pesquise a quantidade de disciplina que cada curso possui. 
Informe o nome do curso seguido pela Quantidade. Utilize
Alias para renomear a coluna com a quantidade de disciplinas. (1,0) */
SELECT c.Nome, COUNT(d.Cod_Curso) FROM Disciplinas AS d
INNER JOIN Cursos AS c ON c.Codigo = d.Cod_Curso
GROUP BY c.Nome;

#9 - Informe o nome de todos os professores que lecionaram em turmas no ano de 2020. (1,0)
SELECT p.Nome FROM Turmas AS t
INNER JOIN Professores AS p ON p.Cod_Prof = t.Cod_Prof
WHERE Ano = "2020";

/*10 - Identifique a quantidade de alunos que reprovaram por frequência (<75%) em cada disciplina. 
Agrupe o resultado por nome da disciplina. (1,0)*/
SELECT d.Nome, COUNT(a.Nome) FROM Historicos as h
INNER JOIN Alunos AS a ON a.Matricula = h.Matricula
INNER JOIN Turmas AS t ON t.Cod_Turma = h.Cod_Turma
INNER JOIN Disciplinas AS d ON d.Codigo = t.Codigo
WHERE h.Frequencia < 75
GROUP BY d.Nome;

/*11 - Selecione a nota e o nome dos alunos que tiveram a maior nota na disciplina de Banco de Dados 
(Obs. Seu comando deve identificar qual é a maior nota). (1,0) */
SELECT a.Nome, h.Nota FROM Historicos as h
INNER JOIN Alunos AS a ON a.Matricula = h.Matricula
INNER JOIN Turmas AS t ON t.Cod_Turma = h.Cod_Turma
INNER JOIN Disciplinas as d on d.Codigo = t.Codigo
WHERE h.Nota = (SELECT MAX(Nota) FROM Historicos) AND d.Nome = "Banco de dados";


/*12 - Crie um comando utilizando LEFT JOIN 
(Obs. Acrescentar registros no exercício 1 que atenda a este requisito). (1,0) */

SELECT h.*, p.* FROM Professores as p
LEFT JOIN Historicos as h on p.Cod_Prof = h.Cod_Prof;


/* Durante a construção da tabela Alunos eu tinha definido Matricula assim:
Matricula INT auto_increment;

Quando percebi, pelos seus enunciados que, a matrícula tinha um formato varchar,
usei a seguinte instrução para corrigir o erro:

SET FOREIGN_KEY_CHECKS = 0;
ALTER TABLE Alunos MODIFY COLUMN matricula VARCHAR(9);
SET FOREIGN_KEY_CHECKS = 1;
*/
