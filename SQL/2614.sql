select c.name,r.rentals_date from customers as c
inner join rentals as r
on c.id = r.id_customers
where cast(r.rentals_date as varchar) like '2016-09-%'