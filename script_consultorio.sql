use master
create database Consultorio
Go
use Consultorio

create table exame
(
	cod_exame int identity (1,1) primary key,
	nome varchar(20) null
)
Go
create table paciente
(
	cod_paciente int identity (1,1) primary key,
	nome varchar(50) null,
	telefone varchar(10) null,
	cpf varchar(15) null,
	rg varchar(12) null
	)
	Go
	alter table exame add resultado varchar (max)
	drop table exame
	create table exame
	(
		cod_exame int identity (1,1) primary key,
		nome varchar(max) null,
		resultado varchar(max) null,
		cod_paciente int references paciente(cod_paciente)
		)
		Go
		create table especialidade
		(
			cod_especialidade int identity (1,1) primary key,
			nome varchar (150) null
			)
			go
			create table medico
			(
			CRM int identity (1,1) primary key,
			nome varchar(50) null,
			telefone varchar(10) null,
			cpf varchar(15) null,
			rg varchar(12) null,
			email varchar(50) null,
			cod_especilidade int references especialidade(cod_especialidade)
			)
			go
			create table consulta
			(
				cod_consulta int identity (1,1) primary key,
				data_hora datetime null,
				cod_paciente int references paciente(cod_paciente),
				CRM int references medico(CRM)
			)
			Go

			alter table paciente add ano_nascimento int not null 
			alter table paciente add constraint ch_ano check (ano_nascimento >= 1990)
			alter table consulta add constraint df_data default getdate()-1 for data_hora
			alter table exame add constraint res check (resultado = 'Positivo' or resultado= 'Negativo')
			alter table medico add constraint un_tel unique(telefone)
			alter table medico add idade int not null
			alter table medico add constraint ch_idade check (idade >=18)
			alter table especialidade add constraint ch_esp check (nome= 'cardiologista' 
													or nome= 'pediatra' or nome= 'ortopedista')