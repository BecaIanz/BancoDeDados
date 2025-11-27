create database cinema;
use cinema;

create table tb_nacionalidade(
	id_nacionalidade int primary key auto_increment,
    nacionalidade varchar(45) not null
);

create table tb_estudio(
	id_estudio int primary key auto_increment,
    nome_estudio varchar(45) not null,
    proprietario varchar(45) not null,
    faturamento_ano_anterior decimal(10,2) not null,
    data_fundacao date not null    
);

create table tb_filme(
	id_filme int primary key auto_increment,
    meses int not null,
    nome_filme varchar(45) not null,
    ano_lancamento year not null,
    custo_total decimal(10,2) not null,
    fk_estudio int not null,
    constraint fk_estudio
    foreign key (fk_estudio)
    references tb_estudio(id_estudio)
    on delete restrict
    on update restrict
);

create table tb_ator(
	id_ator int primary key auto_increment,
    nome_ator varchar(45) not null,
	data_nasc int not null,
    sexo varchar(45) not null,
    fk_nacionalidade int not null,
    constraint fk_nacionalidade
    foreign key (fk_nacionalidade)
    references tb_nacionalidade(id_nacionalidade)
    on delete restrict
    on update restrict
);

create table tb_elenco(
	id_elenco int primary key auto_increment,
    pagamento decimal(10,2) not null,
    personagem varchar(45) not null,
    fk_ator int not null,
    fk_filme int not null,
    constraint fk_filme
		foreign key (fk_filme)
		references tb_filme(id_filme)
		on delete restrict
		on update restrict,
	constraint fk_ator
		foreign key (fk_ator)
        references tb_ator(id_ator)
        on delete restrict
        on update restrict
);

show tables;