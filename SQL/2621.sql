select pd.name from products as pd 
inner join providers as pv 
on pd.id_providers = pv.id 
where(pd.amount between 10 and 20) and left(pv.name,1) = 'P'