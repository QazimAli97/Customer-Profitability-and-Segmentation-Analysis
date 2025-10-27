select * from Product
select * from Sales
select * from Customer


with cte as (
	select s.Customer_ID,Customer_Name,sum(sales)[Total sales],
	sum(Profit)[Total Profit], 
	count(distinct order_id)[Order count]

	from Customer c
	inner join Sales s
	on c.Customer_ID = s.Customer_ID
	inner join Product p
	on s.Product_ID = p.Product_ID
	group by s.Customer_ID,Customer_Name
	)
select * ,
	rank() over(order by [Total Profit] desc) [Rank],case 
	when [Total Profit]<= 500 then 'Silver'
	when [Total Profit] <= 2500 then 'Gold'
	else 'Platinum'
	end as Classification

from cte

