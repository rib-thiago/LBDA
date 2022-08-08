/*Consulta de dados SQL
Crie uma base de dados com as tabelas a seguir:

Alunos (Matricula, Nome, Rua, Numero, Cep, Cidade) 

Telefone Aluno (Matricula_Aluno, Telefone)
Matricula_Aluno Referencia Alunos

Disciplinas (Codigo, Nome, Carga_Horaria, Cod_Curso)
Cod_Curso Referencia Cursos

Cursos (Cod_Curso, Nome)

Professores (Cod_Prof, Nome, Endereço, Cidade)

Turma (Codigo, Cod_Turma, Cod_Prof, Ano, Periodo)
Codigo Referencia Disciplinas
Cod_Prof Referencia Professores

Histórico (Codigo, Matricula, Cod_Turma, Cod_Prof, Ano, Frequência, Nota)
Codigo Referencia Disciplinas
Matricula Referencia Alunos
Cod_Turma, Referencia Turma
Cod_Prof Referencia Professores


Faça a leitura de TODAS as questões antes de começar a
responder.

1 - Adicione 5 registros em cada uma das tabelas; (0,5)

2 - Adicione uma nova tabela a base de dados que contenha
pelo menos 3 colunas. Adicione 5 registros a essa tabela (0,5)

3 - Altere a tabela criada no exercício 2 de maneira a incluir
uma nova coluna que possua o tipo DATA; (0,5)

4 - Atualize a Carga horária de todas as disciplinas com um
aumento de 10%. (0,5)

5 - Pesquise por todos os alunos com nota inferior a 6 que
realizaram a disciplina BANCO DE DADOS durante os anos de
2017 a 2021. (Obs. Acrescentar registros no exercício 1 que
atenda a este requisito). (1,0)

6 - Pesquise por todas as disciplinas que o aluno “RA187258”
cursou (Obs. Acrescentar registros no exercício 1 que atenda a
este requisito). (1,0)

7- Pesquise por todas as disciplinas de cada curso. Ordene o
resultado por nome do curso em ordem crescente e pelo nome
da disciplina em ordem decrescente. (1,0)

8 - Pesquise a quantidade de disciplina que cada curso possui.
Informe o nome do curso seguido pela Quantidade. Utilize
Alias para renomear a coluna com a quantidade de disciplinas.
(1,0)

9 - Informe o nome de todos os professores que lecionaram
em turmas no ano de 2020. (1,0)

10 - Identifique a quantidade de alunos que reprovaram por
frequência (<75%) em cada disciplina. Agrupe o resultado por
nome da disciplina. (1,0)

11 - Selecione a nota e o nome dos alunos que tiveram a
maior nota na disciplina de Banco de Dados (Obs. Seu
comando deve identificar qual é a maior nota). (1,0)

12 - Crie um comando utilizando LEFT JOIN (Obs. Acrescentar
registros no exercício 1 que atenda a este requisito). (1,0)
*/
