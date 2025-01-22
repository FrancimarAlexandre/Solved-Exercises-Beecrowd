select pd.name,pv.name,c.name from products as pd
inner join providers as pv 
on pd.id_providers = pv.id 
inner join categories as c
on pd.id_categories = c.id
where pv.name = 'Sansul SA' and c.name = 'Imported'