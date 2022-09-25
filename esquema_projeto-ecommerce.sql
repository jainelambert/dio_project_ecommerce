-- Criaçao do banco de dados para o cenario de e-commerce

create database ecommerce;
drop database ecommerce;

use ecommerce;

-- criar a tabela cliente
create table clients (
	idClient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    Address varchar(55),
    constraint unique_cpf_client unique (cpf)
);

alter table clients
add column Address varchar(55);

drop table product;

-- criar a tabela produto Pname, Classification_Kids, Category, Avaliacao, Size 
create table product (
	idProduct int auto_increment primary key,
    Pname varchar(45),
    Classification_Kids bool,
    Category enum('Eletrônicos', 'Vestuário', 'Livros', 'Brinquedos', 'Alimentos', 'Calçados', 'Móveis'),
    Avaliacao float default 0,
    Size varchar(10)
);

alter table product
drop column size ;

desc product;

-- criar a tabela pedido 
create table orders (
	idOrders int auto_increment primary key,
    idOrdersClient int,
    orderStatus enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
    orderDescription varchar(255),
    sendValue float default 10,
    paymentCash bool default false,
    constraint fk_orders_client foreign key(idOrdersClient) references clients(idClient)
);

-- para ser continuado no desafio: termine de implementar a tabela e crie a conexão com as tabelas necessárias
create table payments(
	idClient int,
    id_payment int,
    type_payment enum('Boleto', 'Pix', 'Cartão de debito', 'Cartão de crédito', 'Dois cartões'),
    limiteAvailable float,
    primary key(idClient, id_payment)
);

-- criar tabela estoque
create table productStorage (
	idProdStorage int auto_increment primary key,
    storegeLocation varchar(255),
    quantity int default 0
);

-- criar tabela Fornecedor socialName, CNPJ,  contact
create table supplier(
   idSupplier int auto_increment primary key,
   socialName varchar(255) not null,
   CNPJ char(15),
   contact char(11) not null,
   constraint unique_supplier unique(CNPJ)
);

-- criar tabela vendedor socialName, Abstname,  CNPJ, CPF,  location, contact

create table seller (
	idSeller int auto_increment not null primary key,
    socialName varchar(255) not null,
    Abstname varchar(255),
    CNPJ char(15),
    CPF char(9),
    location varchar(255),
    contact char(11) not null,
    constraint unique_seller_cnpj unique(CNPJ),
    constraint unique_seller_cpf unique(CPF)
);

-- idPseller, idProduct,  Quantity
Create table productSeller(
	idPseller int,
    idProduct int,
    Quantity int default 1,
    primary key (idPseller, idProduct),
    constraint fk_productSeller foreign key (idPseller) references seller(idSeller),
    constraint fk_product_product foreign key (idProduct) references product(idProduct)
);

-- idProduct, idOrders,  poQuantity, poStatus
Create table productOrder(
	idProduct int,
    idOrders int,
    poQuantity int default 1,
    poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key (idProduct, idOrders),
    constraint fk_product foreign key (idProduct) references product(idProduct),
    constraint fk_order foreign key (idOrders) references orders(idOrders)
    
);

-- idProduct, idProdStorage, location
Create table StoregeLocation(
	idProduct int,
    idProdStorage int,
    location varchar(255),
    primary key (idProduct, idProdStorage),
    constraint fk_productStorage foreign key (idProduct) references product(idProduct),
    constraint fk_ProdStorage foreign key (idProdStorage) references productStorage(idProdStorage)
    
);

-- idProduct, idSupplier,  quantity
create table productSupplier(
	idProduct int,
    idSupplier int,
    quantity int not null,
    primary key (idProduct, idSupplier),
    constraint fk_productSupplier foreign key (idProduct) references product(idProduct),
    constraint fk_ProdSup foreign key (idSupplier) references supplier(idSupplier)
);

show tables;