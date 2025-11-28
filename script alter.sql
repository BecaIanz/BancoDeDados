create database empresaSA;

use empresaSA;

show tables;

alter table tb_empregado 
	add column salario decimal(10,2) not null,
    add column cargo varchar(50) not null;

alter table tb_departamento modify column 
	nome_departamento varchar(100) not null;
    
alter table tb_projeto add column
	status_projeto varchar(20) not null;
    
alter table tb_empregado_projeto add column 
	carga_horaria decimal(5,2) not null;
    
alter table tb_empregado 
    add column situacao_empregado tinyint(1) not null;
    
alter table tb_projeto modify column 
	cod_projeto bigint not null auto_increment;
    
alter table tb_empregado_projeto drop foreign key fk_projeto;

alter table tb_empregado_projeto modify column fk_projeto bigint;

alter table tb_empregado_projeto add constraint 
	foreign key (fk_projeto)
    references tb_projeto(cod_projeto)
    on update cascade;