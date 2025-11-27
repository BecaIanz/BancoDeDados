create database oficina_pedagogica;
use oficina_pedagogica;

create table tb_nivel(
	id_nivel int primary key auto_increment,
    nome_nivel varchar(30) not null
);

create table tb_oficina(
	id_oficina int primary key auto_increment,
    nome_oficina varchar(60) not null,
    ementa varchar(45)
);

create table tb_nivel_oficina(
	id_nivel_oficina int primary key auto_increment,
    valor decimal(10,2) not null,
    fk_oficina int not null,
    fk_nivel int not null,
    constraint fk_oficina
		foreign key (fk_oficina)
        references tb_oficina(id_oficina)
        on delete restrict
        on update restrict,
	constraint fk_nivel
		foreign key (fk_nivel)
        references tb_nivel(id_nivel)
        on delete restrict
        on update restrict
);

create table tb_aluno(
	id_matricula int primary key auto_increment,
    nome_aluno varchar(45) not null,
    email varchar(40) not null,
    telefone char(14)
);

create table tb_inscricao(
	id_inscricao int primary key auto_increment,
    pago decimal(10,2) not null,
    fk_matricula int not null,
    fk_nivel_oficina int not null,
    constraint fk_matricula
		foreign key (fk_matricula)
        references tb_aluno(id_matricula)
        on delete restrict
        on update restrict,
	constraint fk_nivel_oficina
		foreign key (fk_nivel_oficina)
        references tb_nivel_oficina(id_nivel_oficina)
        on delete restrict
        on update restrict
);

show tables;