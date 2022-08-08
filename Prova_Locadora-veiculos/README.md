# Laboratório de Banco de Dados
#### _Avaliação Final - Locadora de Veículos


###### Orientações:

- Leia o problema atentamente e responda às questões enviando o código SQL utilizado para a resolução
- Identifique corretamente no arquivo SQL a que resposta o respectivo código se refere

### Contextualização do Problema

Uma locadora de automóveis contratou os serviços de um desenvovledor de banco de dados para criar e implementar o modelo de dados para o
seu negócio. A empresa é composta de várias filiais que ofertam a locação dos veículos. Os carros locados pela firma possuem modelos e
características que permitem clássificá-los em grupos. Estes grupos determinam os valores das diárias, sendo que a empresa trabalha com
quilometragem livre. Exemplos: o grupo econômico inclui os modelos Argo, Uno, Onix, motor 1.0, sem ar-condicionado; grupo sedan automático, 
inclui os modelos Versa, HB20 e Cronos, motor 1.6, com ar-condicionado e câmbio automático.

De um determinado modelo, a locadora pode possuir vários carros, e desaja-se saber várias informações sobre cada veículo, como:
placa, número do chassi, RENAVAM, ano de fabricação, potência do motor, cor, número de portas e equipamentos (ar-condicionado, 
direação hidráulica, airbag, rádio, entre outros). Além disso, deseja-se saber em que filial um veículo está lotado no momento.

O período mínimo para locação é de 1 diária (24 horas) e o máximo 30 diárias. O valor da diária a ser efetivamente praticada será dado
pelo valor na data da reserva. No ato da locação, um veículo do grupo escolhido será alocado e sua quilometragem atual deverá ser 
registrada.

Para conduzir o veículo, o cliente deverá apresentar a CNH válida, caso o cliente não preencha o perfil exigido, poderá indicar um
condutor habilitado. Em qualquer caso, o cliente pode nomear até 4 (quatro) motoristas adicionais. Todos os motoristas devem possuir
uma CNH válida e seu registro inserido no banco de dados.

Na devolução do veículo, deve-se registrar a data, hora e quilometragem. Neste momento a locação deverá ser paga e o valor total
armazenado. Os pagamentos podem ser realizados em dinheiro, cartão de débito ou crédito.


### Modelo Entidade-Relacionamento 

![](https://i.imgur.com/t0JzezO.png)


### Modelo Lógico

![](https://i.imgur.com/gsdGHLu.png)

### Atividades

1) Descreva o SQL que defina a criação do banco de dados, tabelas e relações conforme os diagramas
apresentados. (Valor: 2,5)

2) Adicione pelo menos 5 registros em cada uma das tabelas, criando uma relação entre os dados para
execução das consultas a seguir. Nos campos de data inserir datas entre 01/05/2022 e 31/05/2022.
(Valor: 1,5)

3) Exibir a lista de Modelos de Veículos por Grupo de Veículos, ordene os resultados por Grupo de Veículos e
Modelo (Valor: 0,5)

4) Exibir a forma de pagamento mais utilizada nas locações (Valor: 0,5)

5) Exiba a quantidade de Veículos por Grupo de Veículos (Valor: 1,0)

6) Exiba o total de faturamento das locações de veículos entre os dias 07/05/2022 e 21/05/2022 (Valor: 1,0)

7) Pesquisar os veículos que estejam lotados (estacionados) na filial de Recife/PE. Exiba os veículos
organizados por Ano de Fabricação e Placa, exibindo os campos Ano de Fabricação, Placa, Motor e
Número de Portas (Valor: 1,0)

8) Pesquisar os clientes que solicitaram reservas de veículos do grupo Sedan Automático entre os dias
01/05/2022 e 15/05/2022. (Valor: 1,0)

9) Exibir a lista de locações, exibindo o nome do cliente e as datas de retirada e devolução pretendidas que
estejam ativas, ou seja que não tenham data de devolução preenchidas (Valor: 1,0)
