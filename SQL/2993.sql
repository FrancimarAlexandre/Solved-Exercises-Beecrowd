select count(value_table) as most_frequent_value
from value_table
group by value_table 
order by value_table desc

limit 1