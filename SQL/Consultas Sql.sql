--Faturamento Total 
select 
	sum(valortotal) AS 'Faturamento Total'
From Vendas;

--Quantidade VEndida
Select 
	Sum(Quantidade) AS 'Quantidade Vendida'
From Vendas;

--Top 10 Produtos Mais Vendidos 
Select 
	top (10) Produto,
	Sum(ValorTotal) AS 'Valor Total'
from Produtos
inner join Vendas
	on Produtos.ProdutoID = Vendas.ProdutoID
group by Produto
order by Sum(ValorTotal) desc;

--Categorias Quatidade e Faturamento 
SELECT
    p.Categoria,
    SUM(v.Quantidade) AS QuantidadeVendida,
    SUM(v.ValorTotal) AS Faturamento
FROM Produtos p
INNER JOIN Vendas v
    ON p.ProdutoID = v.ProdutoID
GROUP BY p.Categoria
ORDER BY Faturamento DESC;

--Vendedores por Faturamento 
select 
	Nome,
	sum(valorTotal) AS 'Faruramento',
	sum(quantidade) As 'QuantidadeVendida'
from vendedores 
inner Join vendas
	ON vendedores.vendedorid = vendas.vendedorid
Group by nome
order by sum(valorTotal) Desc

--Faturamento Mensal 
SELECT
    YEAR(DataVenda) AS Ano,
    MONTH(DataVenda) AS NumeroMes,
    DATENAME(MONTH, DataVenda) AS NomeMes,
    SUM(ValorTotal) AS Faturamento
FROM Vendas
GROUP BY
    YEAR(DataVenda),
    MONTH(DataVenda),
    DATENAME(MONTH, DataVenda)
ORDER BY
    Ano,
    NumeroMes;

--Top (10) Clientes 
SELECT TOP (10)
    c.Nome,
    SUM(v.ValorTotal) AS TotalComprado
FROM Clientes c
INNER JOIN Vendas v
    ON c.ClienteID = v.ClienteID
GROUP BY c.Nome
ORDER BY TotalComprado DESC;

--Cidade De Sp mais vende e Faturou 
select 
    Cidade,
    sum(quantidade) As 'Quantidade Vendida'
from Clientes
inner Join Vendas
    on Clientes.ClienteID = Vendas.ClienteID
group by Cidade

select 
    Cidade,
    sum(ValorTotal) As 'Faturamento Total'
from Clientes
inner Join Vendas
    on Clientes.ClienteID = Vendas.ClienteID
group by Cidade