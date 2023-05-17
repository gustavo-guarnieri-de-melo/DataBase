----Criando tabelas----

CREATE TABLE Automovel (
Codigo number(4) PRIMARY KEY,
Fabricante varchar2(20),
Modelo varchar2(10),
Ano number(4),
Pais varchar2(15),
Preco_tabela number(8,2)
);

CREATE TABLE Revendedora (
Cnpj varchar2(14) PRIMARY KEY,
Nome varchar2(20),
Proprietario varchar2(20),
Cidade varchar2(15),
uf char(2)
);

CREATE TABLE Consumidor (
Identidade number(4) PRIMARY KEY,
Nome varchar2(20),
Sobrenome varchar2(10)
);

CREATE TABLE Negocio (
AnoAuto number(4),
Data date,
Preco number(8,2),
Comprador number(4),
Revenda varchar2(14),
CodAuto number(4),
FOREIGN KEY(Comprador) REFERENCES Consumidor (Identidade),
FOREIGN KEY(Revenda) REFERENCES Revendedora (cnpj),
FOREIGN KEY(CodAuto) REFERENCES Automovel (Codigo)
);

CREATE TABLE Garagem (
AnoAuto number(4),
Quantidade number(4),
cnpjRevenda varchar2(14),
CodAuto number(4),
FOREIGN KEY(cnpjRevenda) REFERENCES Revendedora (cnpj),
FOREIGN KEY(CodAuto) REFERENCES Automovel (Codigo)
);

----inserindo dados----
insert into automovel values (10,'Honda','Civic',2008,'Japao','45000');
insert into automovel values (20,'Honda','Fit',2005,'Japao','25500');
insert into automovel values (30,'Pegeout','306',2006,'Franca','35780');
insert into automovel values (40,'Citroen','Xantia',2000,'Franca','8500');
insert into automovel values (50,'Volkswagem','Fusca',2011,'Alemanha','35000');
insert into automovel values (60,'Volkswagem','Voyage',2010,'Alemanha',27899);


insert into revendedora values ('1111111','Automodelo','Ronaldo','São Paulo','SP');
insert into revendedora values ('2222222','Best Cars','Francisco','Rio de Janeiro','RJ');
insert into revendedora values ('3333333','Roma Veículos','Joana','Bahia','BA');
insert into revendedora values ('4444444','Já Era Autos','Marcel','São Paulo','SP');
insert into consumidor values (1,'Carlos','Andrade');
insert into consumidor values (2,'Simone','Freitas');
insert into consumidor values (3,'Gilmar','Silva');
insert into consumidor values (4,'Rosana','Gonçalves');


insert into negocio values (2005,'03/MAY/2010',26700,1,'1111111',20)
insert into negocio values (2010,'01/JAN/2011',35000,2,'3333333',60)
insert into negocio values (2000,'13/JUL/2010',7000,1,'2222222',40)
insert into negocio values (2006,'22/DEC/2010',30000,3,'4444444',30)
insert into negocio values (2011,'10/JUN/2011',35500,4,'2222222',50)
insert into negocio values (2005,'04/SEP/2009',26000,3,'2222222',20)


insert into garagem values (2005,3,1111111,20);
insert into garagem values (2000,1,2222222,40);
insert into garagem values (2011,7,2222222,50);
insert into garagem values (2005,6,2222222,20);
insert into garagem values (2010,1,3333333,60);
insert into garagem values (2006,4,4444444,30);

commit;

----Exercicios----
EX1 
select count(distinct Fabricante) as NumeroFabricantes from Automovel;

EX2
select r.Nome as Revendedora
from Revendedora r
join Negocio n on r.Cnpj = n.Revenda join Automovel a on n.CodAuto = a.Codigo where a.Modelo = 'Xantia';


EX3
select r.Nome as Revendedor, r.Cidade
from Revendedora r
left join Negocio n on r.Cnpj = n.Revenda
left join Automovel a on n.CodAuto = a.Codigo
where a.Pais <> 'Franca' or a.Pais is null;

EX4
select max(Preco_tabela) as MaiorPreco, min(Preco_tabela) as MenorPreco
from Automovel;

EX5
select Fabricante, Modelo, Preco_tabela, (Preco_tabela * 1.1) as Preco_tabela_aumentado
from Automovel;

EX6
select c.Nome as Consumidor, count(n.CodAuto) as QuantidadeCarrosComprados
from Consumidor c
left join Negocio n on c.Identidade = n.Comprador
group by c.Nome;

EX7
select * from Automovel
where Pais in ('Italia', 'Japao')
order by Codigo asc, Ano asc, Preco_tabela asc;

EX8
select * from Automovel
where Preco_tabela = (select max(Preco_tabela) from Automovel);

EX9
select sum((n.Preco * 0.1)) as Lucro
from Negocio n
join Revendedora r on n.Revenda = r.Cnpj
where r.Nome = 'Automodelo';

EX10
select * from Consumidor;


