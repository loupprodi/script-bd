--SQL
--DDL (create | alter | drop)
use master 
create database ControleVeiculo
use ControleVeiculo

create table veiculo
(
-- nome_campo tipo regra
cod_veiculo int identity(1,1) primary key,
placa varchar(8) not null, 
modelo varchar (50) null, 
ano int not null,
cor varchar (50)
)
go
create table manutencao
(
	cod_manutencao int identity(1,1) primary key,
	servico varchar (max) not null,
	valor numeric (10,2) not null,
	cod_veiculo int references veiculo(cod_veiculo)
)
go
create table tipo_carga
(
	cod_tipo_carga int identity(1,1) primary key,
	descricao varchar(500) not null
)
go 
create table motorista
(
	cod_motorista int identity(1,1) primary key,
	nome varchar(100) not null
)
go 
create table viagem 
(
	cod_viagem int identity (1,1) primary key,
	rua_destino varchar(100),
	numero_destino varchar(10),
	bairro_destino varchar(100),
	cep_destino varchar(10),
	cidade_destino varchar(100),
	estado_destino varchar(50),
	rua_origem varchar(100),
	bairro_origem varchar(100),
	cep_origem varchar(10),
	cidade_origem varchar(100),
	estado_origem varchar(50),
	numero_origem varchar(10),
	data_saida datetime not null,
	data_retorno datetime null, 
	cod_tipo_carga int references tipo_carga(cod_tipo_carga),
	cod_motorista int references motorista(cod_motorista),
	cod_veiculo int references veiculo(cod_veiculo)
)

------------------------- versão 2.0 do sistema do joão (Veículos)
go
alter table viagem drop FK__viagem__cod_tipo__5535A963
go
drop table tipo_carga
go
alter table viagem drop column cod_tipo_carga
go

create table pessoa 
(
	cod_pessoa int identity (1,1) primary key,
	nome varchar(150) not null
)
go

create table carga
(
	cod_carga int identity (1,1) primary key,
	descricao varchar (1000) not null
)
go
create table pessoa_viagem
(
	cod_pessoa int not null references pessoa(cod_pessoa),
	cod_viagem int not null references viagem(cod_viagem),
	data datetime, 
	primary key (cod_pessoa, cod_viagem)
	)
	go
	drop table carga_viagem
	create table carga_viagem
	(
	cod_carga int not null references carga(cod_carga),
	cod_viagem int not null references viagem(cod_viagem),
	quantidade int not null
	)
	go
	create table carga_viagem
	(
	cod_carga int not null references carga(cod_carga),
	cod_viagem int not null references viagem(cod_viagem),
	quantidade int not null,
	primary key (cod_carga, cod_viagem)
	)
	--joão precisa que o campo nome de motorista tenha 150 caracteres
	alter table motorista alter column nome varchar(150) not null

-- alterar campos: numero_origem e numero_destino de viagem para 
-- campo tipo inteiro obrigatório
alter table viagem alter column numero_origem int not null
alter table viagem alter column numero_destino int not null

----inserir a coluna CPF ma table motorista
alter table motorista add cpf varchar(15) null

--excluir a coluna cor da tabela de veiculo
alter table veiculo drop column cor 