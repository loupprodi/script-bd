use master

create database ControlePadaria
Go
use ControlePadaria

create table cargo
(
cod_cargo int identity (1,1) primary key,
nome varchar (100) not null
)
go
create table funcionario
(
cod_funcionario int identity (1,1) primary key,
nome varchar (100) not null,
cpf varchar (15) null,
cod_cargo int references cargo(cod_cargo) 
)
go
create table caixa
	(
	cod_caixa int identity (1,1) primary key,
	cod_funcionario int references funcionario(cod_funcionario)
	)
	go
	create table cartao
	(
	cod_cartao int identity (1,1)primary key,
	durabilidade varchar not null
	)
	go
	create table caixa_cartao
	(
	cod_venda int identity (1,1) primary key,
	total numeric (10,2) not null,
	soma numeric (10,2) not null,
	forma_pagamento varchar (10) not null,
	cod_caixa int references caixa(cod_caixa),
	cod_cartao int references cartao(cod_cartao)
	)
	go
	create table produto
	(
	cod_produto int identity (1,1) primary key,
	preço numeric (8,2) not null,
	nome varchar (100) not null,
	quantidade int not null
	)
	go
	create table produto_cartao
	(
	Quantidade int identity (1,1) primary key,
	Cod_cartao int references cartao(Cod_Cartao),
	Cod_Produto int references Produto(Cod_Produto)
)
go
create table fornecedor
	(
	cod_funcionario int identity (1,1) primary key,
	nome varchar(100) not null,
	telefone varchar (10) not null,
	endereço varchar (120) not null
	)
	go
drop table fornecedor
create table fornecedor
	(
	cod_fornecedor int identity (1,1) primary key,
	nome varchar(100) not null,
	telefone varchar (10) not null,
	endereço varchar (120) not null
	)
	go
	create table Produto_Fornecedor
(
	Compra_Produto int identity (1,1) primary key,
	cod_produto int references Produto(Cod_Produto),
	cod_fornecedor int references Fornecedor(cod_fornecedor)
)