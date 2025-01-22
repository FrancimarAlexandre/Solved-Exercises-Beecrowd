select e.cpf,e.enome,d.dnome
from empregados as e 
left join departamentos as d 
on e.dnumero = d.dnumero 
left join trabalha as t 
on e.cpf = t.cpf_emp
left join projetos as p 
on t.pnumero = p.pnumero

where p.pnumero is null

order by e.cpf