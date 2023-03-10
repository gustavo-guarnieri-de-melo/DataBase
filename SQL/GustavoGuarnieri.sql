aula03 - 01.03.2023

Ainda trabalhando com a estrutura das tabelas 

DDL

Create- Ok 

Alterando ou corrigindo uma estrutura
alterar table nome_tabela 
op��es
ass colummn 	- nova coluna
add contraint 	- nova regra
modify 		- modifica tipo ou tamanho de uma coluna
drop column 	- elima uma coluna
droop contraint 	- elimina uma regra

create table tb_teste
(codigo number(2),
nome number(10));

incluindo uma nova coluna

alter table tb_teste add dt_nasc date

incluindo uma coluna com regra

alter table tb_teste ass cep char(8) not null

incluindo a pk na coluna codigo 

alter table tb_teste add constraint pk_cod primary key (codigo)
modificando apenas o tipo de dados
alter table tb_teste modify nome varchar (10)
modificando apenas o tipo da coluna
alter table tb_teste modify nome varchar (50)
modificando tipo e tamanho ao mesmo tempo
alter table tb_teste modify nome number(10)
eliminando uma regra 
alter table tb_teste drop constraint
eliminando uma regra
alter table tb_teste drop contraint
desc tb_teste
desc user_contrants
select constranit_name from user_constrants where table_name= 'TB_TESTE'
eliminando uma coluna
alter table tb_teste drop column nome
desc tb_teste

renomeando uma coluna
alter table tb_teste rename column codigo to cod_cliente

alter table tb_teste rename constraint sys_c003509498 to fiap

desc tb_teste

eliminando uma tabela 
drop table nome_tabela
drop table tb_teste 


select * from produto 


create table tb_teste1
(codigo number(1) primary key)
create table tb_teste2
(codigo number(1) references tb_teste1)
insert into tb_teste1 values(1)
insert into tb_teste2 values(1)
drop table tb_teste1
drop table tb_teste1 cascade constraints
uso de cascade permite aliminar o relacionamento e depois dropar a tabela

Atualiza dados

Update

operadores: Aritmeticos: + - * / ()
            relacionais: > >= < < == != ou<>
            logicos: and or not
            
update nome_tabela set nome_coluna = novo_valor

update nome_tabela set nome_coluna = novo_valor
where condi��o

create table produto_tb 
(cod_prod number(4) constraint prod_cod_pk primary key, 
unidade varchar2(3),descricao varchar2(20),val_unit number(10,2))

 

insert into produto_tb values ('25','KG','Queijo','0.97');
insert into produto_tb values ('31','BAR','Chocolate','0.87');
insert into produto_tb values ('78','L','Vinho','2.00');
insert into produto_tb values ('22','M','Linho','0.11');
insert into produto_tb values ('30','SAC','Acucar','0.30');
insert into produto_tb values ('53','M','Linha','1.80');
insert into produto_tb values ('13','G','Ouro','6.18');
insert into produto_tb values ('45','M','Madeira','0.25');
insert into produto_tb values ('87','M','Cano','1.97');
insert into produto_tb values ('77','M','Papel','1.05');
commit;

selet from * produto_tb

atualizar em 15% o pre�o dos produtos de codigo maior que 30.
atualizar o nome do produto queijo para queijo de minas.
para os produtos A�ucar, madeira e Linha zerar o seu pre�o.




