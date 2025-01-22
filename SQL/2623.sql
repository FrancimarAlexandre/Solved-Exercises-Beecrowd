select pd.name,c.name from products as pd 
inner join categories as c 
on pd.id_categories = c.id 
where pd.amount > 100 and c.id in (1,2,3,6,9)
order by c.id