-- clientes
select * from clients;

-- produtos
select * from product;

-- pedidos
select * from orders;

-- relação de pedido e produto
select * from productOrder;

-- fornecedor
select * from supplier;

-- produtos disponibilizados por fornecedor
select * from productSupplier;

-- produtos em estoque 
select * from productStorage;

-- Local de estoque (estados)
select * from StoregeLocation;

-- vendedor
select * from seller;

-- produtos por vendedor
select * from productSeller;

-- Quantos pedidos foram feitos por cada cliente?
select o.idOrders, c.Fname, c.Lname, count(*) as QuantidadePedidos
from orders as o
inner join clients as c
on o.idOrdersClient = c.idClient
group by c.Fname;

-- Quantos produtos são disponibilizados por vendedores?
select sum(quantity) as Quantidade from productSeller as ps
where ps.idProduct = idProduct;

-- Algum vendedor também é fornecedor?
select su.socialName, su.CNPJ, su.contact, se.location
from seller as se
inner join supplier as su
on su.CNPJ = se.CNPJ;

-- Qual a quantidade dos produtos no estoque e em que estoque está o produto?
select p.Pname as Produto, pl.quantity as Quantidade, pl.storegeLocation as Cidade, sl.location as Estado
from product as p
inner join StoregeLocation as sl
on p.idProduct = sl.idProduct
inner join productStorage as pl
on sl.idProdStorage = pl.idProdStorage;

-- Qual o fornecedor do produto e em que estoque ele está armazenado?
select sl.idProduct, s.socialName as Fornecedor, sl.location as Local
from StoregeLocation as sl
inner join productSupplier as pS
on sl.idProduct = ps.idProduct
inner join supplier as s
on s.idSupplier = ps.idSupplier
order by Fornecedor;


-- Relação de nomes dos fornecedores e nomes dos produtos;
select  p.Pname, s.socialName
from productSupplier as ps
inner join Supplier as s
on ps.idSupplier = s.idSupplier
inner join product  as p
on p.idProduct = ps.idProduct;

-- Quantos produtos são disponibilizados por fornecedor?
select s.socialName, count(*) as Products
from productSupplier as ps
inner join Supplier as s
on ps.idSupplier = s.idSupplier
inner join product  as p
on p.idProduct = ps.idProduct
group by s.socialName;

-- Quantos fornecedores disponibilizam mais de 2 produtos?
select s.socialName, count(*) as Products
from productSupplier as ps
inner join Supplier as s
on ps.idSupplier = s.idSupplier
inner join product  as p
on p.idProduct = ps.idProduct
group by s.socialName
having Products >= 2;
