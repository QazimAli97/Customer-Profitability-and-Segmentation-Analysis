select * from Product
select * from Sales
select * from Customer

--1)
select * from Customer c
inner join Sales s
on c.Customer_ID = s.Customer_ID
inner join Product p
on s.Product_ID = p.Product_ID

--2)

select Customer_ID,sum(sales)[Total sales],sum(Profit)[Total Profit], count(order_id)[Order count]
from sales
group by Customer_ID

--3)
select Customer_Name,sum(profit)[Total Profit],
rank() over(order by sum(profit)desc) [Rank]
from Sales s
inner join Customer c
on s.Customer_ID = c.Customer_ID
group by  Customer_Name
order by [Total Profit] desc

