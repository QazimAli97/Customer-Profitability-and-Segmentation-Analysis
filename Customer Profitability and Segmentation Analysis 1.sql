select * from Product
select * from Sales
select * from Customer


with cte as (
	select Customer_Name,
	sum(Profit)[Total Profit], 
	rank() over(order by sum(Profit) desc) [Rank],
	NTILE(3) OVER(ORDER BY SUM(profit) DESC) AS Profit_Tier_Rank

	from Customer c
	inner join Sales s
	on c.Customer_ID = s.Customer_ID
	inner join Product p
	on s.Product_ID = p.Product_ID
	group by s.Customer_ID,Customer_Name
	)
select * ,
	case Profit_Tier_Rank
	when 1 then 'Platinum'
	when 2 then 'Gold'
	when 3 then 'Silver'
	End as Classification

from cte
order by Rank;



