SELECT 
    d.name, 
    ROUND(SUM(((a.hours * 150) * (1 + ws.bonus / 100))), 1) AS salary
FROM 
    attendances AS a
LEFT JOIN 
    work_shifts AS ws 
    ON a.id_work_shift = ws.id
LEFT JOIN 
    doctors AS d 
    ON a.id_doctor = d.id
GROUP BY 
    d.name
ORDER BY 
    salary DESC;
