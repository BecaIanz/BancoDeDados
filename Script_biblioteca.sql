create database biblioteca;
use biblioteca;

create table tb_genero(
	id_genero int primary key auto_increment,
    nome_genero varchar(50) not null    
);

create table tb_membro(
	id_membro int primary key auto_increment,
    nome varchar(100) not null,
    email varchar(100) not null,
    data_cadastro date not null
);

create table tb_livro(
	id_livro int primary key auto_increment,
    titulo varchar(100) not null,
    autor varchar(100) not null,
    ano_publicacao int not null,
	estoque int not null,
    fk_genero int not null,
    constraint fk_genero
    foreign key (fk_genero)
    references tb_genero(id_genero)
    on delete restrict
    on update restrict
);

create table tb_emprestimo(
	id_emprestimo int primary key auto_increment,
    data_emprestimo date not null,
    data_devolucao date,
    fk_livro int not null,
    fk_membro int not null,
    constraint fk_livro
		foreign key (fk_livro)
		references tb_livro(id_livro)
		on delete restrict
        on update restrict,
	constraint fk_membro
		foreign key (fk_membro)
        references tb_membro(id_membro)
        on delete restrict
        on update restrict
);

show tables;