-- INSERÇÃO DE DADOS E QUERIES

insert into clients (Fname, Minit, Lname, CPF, Address)
values('Maria', 'M', 'Silva', '12346789', 'Rua Silva de Prata 29, Carangola - Cidade das Flores'),
	  ('Matheus', 'O', 'Pimentel', '987654321', 'Rua Alemeda 289, Centro - Cidade das Flores'),
      ('Ricardo', 'F', 'Silva', '45678913', 'Avenida Alemeda Vinha, Centro - Cidade das Flores'),
      ('Julia', 'S', 'França', '789123456', 'Rua Laranjeiras 861, Centro - Cidade das Flores'),
      ('Roberta', 'G', 'Assis', '98745631', 'Avenida Koller 19, Centro - Cidade das Flores'),
      ('Isabela', 'M', 'Cruz', '654789123', 'Rua Alemeda das Flores 28, Centro - Cidade das Flores');
      
insert into product (Pname, Classification_Kids, Category, Avaliacao)
values ('Fone de ouvido', false, 'Eletrônicos', 4),
		('Barbie Elsa', true, 'Brinquedos',  3),
        ('Body Carters', true, 'Vestuário', 5),
        ('Microfone Vedo -  Youtuber', false, 'Eletrônicos', 4),
        ('O Hobbit - J.R.R Tolkien', false, 'Livros', 5);
        
select * from clients;
select * from product;
select * from orders;

delete from orders where idOrdersClient in (1, 2, 3, 4);

insert into orders (idOrdersClient, orderStatus, orderDescription, sendValue, paymentCash)
			values ('1', default, 'Compra via aplicativo', null, 1),
				   ('2', default, 'Compra via aplicativo', 50, 0),
                   ('3', 'Confirmado', null , null, 1),
                   ('4', default, 'Compra via web site', 150, 0);
				
                   
insert into orders (idOrdersClient, orderStatus, orderDescription, sendValue, paymentCash)
			values ('2', default, 'Compra via aplicativo', null, 1);
				   

insert into productOrder (idProduct, idOrders,  poQuantity, poStatus)
			values (1, 1, 2, null),
                   (2, 2, 1, null),
                   (3, 3, 1, null);
                   
insert into productStorage (storegeLocation, quantity)
            values ('Rio de Janeiro', 1000),
                   ('Rio de Janeiro', 500),
                   ('São Paulo', 10),
                   ('São Paulo', 100),
                   ('São Paulo', 10),
                   ('Brasília', 60);
                   
insert into StoregeLocation (idProduct, idProdStorage, location)
            values (1, 2, 'RJ'),
                   (2, 6, 'GO');
                   
insert into StoregeLocation (idProduct, idProdStorage, location)
            values (3, 3, 'SP'),
                   (4, 4, 'SP');
                   
insert into supplier (socialName, CNPJ,  contact)
			values ('Almeida e filhos', 123456789123456, '21985474'),
				   ('Eletrônicos Silva', 854519649143457, '21985484'),
                   ('Eletrônicos Valma', 934567893934695, '21975474');
                   
insert into supplier (socialName, CNPJ,  contact)
			values ('Tech eletronics', 123456789456321, 219946287);
				   
                   
 insert into productSupplier (idProduct, idSupplier,  quantity) 
			values (1, 2, 500),
                   (2, 1, 200),
                   (4, 2, 600),
                   (3, 1, 500),
                   (1, 3, 500);
                   
insert into seller (socialName, Abstname, CNPJ, CPF, location, contact)
            values ('Tech eletronics', null, 123456789456321, null, 'Rio de Janeiro', 219946287),
                   ('Botique Durgas', null, null, 123456783, 'Rio de Janeiro', 219567895),
                   ('Kids Worls', null, 456789123654485, null, 'São Paulo', 1198657484);

select * from seller;
select * from product;
select * from productSeller;

insert into productSeller (idPseller, idProduct,  Quantity)
			values(1, 1, 80),
                  (2, 3, 10);


select  count(*) from clients;

select * from clients as c, orders as o 
where c.idClient = idOrdersClient;

select concat(Fname, ' ', Lname) as Client, idOrders as Orders, orderStatus 
from clients as c, orders as o 
where c.idClient = idOrdersClient;

select concat(Fname, ' ', Lname) as Client, idOrders as Orders, orderStatus 
from clients as c, orders as o 
where c.idClient = idOrdersClient
order by Client;

select * from clients
left outer join orders on idClient = idOrdersClient;

select * from orders;
select * from productOrder;

-- Recuperar quantos pedidos foram realizados pelos clientes
select c.idClient, Fname, count(*) from clients as c
inner join orders as o on c.idClient = o.idOrdersClient
inner join productOrder as pd on pd.idProduct = o.idOrders
group by idClient;
                   