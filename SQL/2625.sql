select concat(left(np.cpf,3),'.',substring(np.cpf,4,3),'.',substring(np.cpf,7,3),'-',right(np.cpf,2)) as cpf
from natural_person as np 
inner join customers as c
on np.id_customers = c.id