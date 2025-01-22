select lr.name,round((lr.omega * 1.618),3) as fator_n
from life_registry as lr 
inner join dimensions as d 
on lr.dimensions_id = d.id 
where lr.name like 'Richard%' and (d.name = 'C875' or d.name = 'C774')
order by lr.omega