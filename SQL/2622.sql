select c.name from customers as c 
inner join legal_person as lp 
on c.id = lp.id_customers