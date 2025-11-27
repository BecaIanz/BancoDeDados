create database supermercado;
use supermercado;

create table vendas(
	id_venda int primary key auto_increment,
    data_venda date not null
);

create table tb_categoria(
	id_categoria int primary key auto_increment,
    nome_categoria varchar(45) not null
);

create table produtos(
	id_produtos int primary key auto_increment,
    nome varchar(100) not null,
    preco decimal(10,2) not null,
    fk_categoria int,
    constraint fk_categoria
    foreign key (fk_categoria)
    references tb_categoria(id_categoria)
    on delete restrict
    on update restrict
);

create table itens_vendas(
	id_item int primary key auto_increment,
    quantidade int,
    fk_venda int,
    fk_produto int,
    constraint fk_venda
    foreign key (fk_venda)
    references vendas(id_venda)
    on delete restrict
    on update restrict,
    constraint fk_produto
    foreign key (fk_produto)
    references produtos(id_produtos)
    on delete restrict
    on update restrict
);

show tables;
