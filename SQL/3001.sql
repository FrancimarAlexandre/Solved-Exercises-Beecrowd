select p.name as type,
case
    when type = 'A' then 20.0
    when type = 'B' then 70.0
    when type = 'C' then 530.5
end as price

from products as p

order by p.type, p.id desc