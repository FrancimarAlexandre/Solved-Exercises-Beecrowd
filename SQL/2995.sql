select max(temperature) as temperature,
count(temperature) as number_of_records

from records 
group by mark 
order by mark