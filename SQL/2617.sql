select pd.name,pv.name from products as pd 
inner join providers as pv 
on pd.id_providers = pv.id 
where pv.name = 'Ajax SA'