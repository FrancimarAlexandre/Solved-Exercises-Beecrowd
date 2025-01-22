select  
    case 
        when position < 4 then concat('Podium: ',team)
        else concat('Demoted: ',team)
    end as name
from league
where position < 4 or position > 13