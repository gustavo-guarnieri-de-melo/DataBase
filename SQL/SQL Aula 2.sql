Exercício Locadora

 

create table CATEGORIA (Codcateg number(4) primary key,
Descricao varchar(50) not null);

 

create table Filme (CodFilme number(4)primary key,
Titulo varchar(70)not null,
codcat references categoria);

 

create table DVD (NumDVD number(4)primary key,
codfilme references filme,
Tipo char(1));

 

create table Cliente (CodCli number(4)primary key,
Prenome varchar(50) not null, Sobrenome varchar(50),
Endereco varchar(70),Telefone varchar(20));

 

create table aluga (cd_clie references cliente,
                    cd_dvd references dvd,
                    data_ret date, 
                    data_dev date,
                    cd_aluga number(4) primary key);
                    
                    
create table Ator (Codator number(4) primary key,
Nome_popular varchar(50)not null,
Nome_artistico varchar(50),
Datanasc date);

 


create table estrela(cdator references ator,
codfilme references filme);