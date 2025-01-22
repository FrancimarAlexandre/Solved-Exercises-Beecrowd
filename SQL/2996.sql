select p.year, us.name as sander,ur.name as receiver

from packages as p

left join users as us 
on p.id_user_sender = us.id 
left join users as ur 
on p.id_user_receiver = ur.id

where (upper(us.address) <> 'TAIWAN' and upper(ur.address) <> 'TAIWAN') and (upper(p.color) = 'BLUE' or year = 2015)

order by p.year desc