SELECT 
    b.departamento,
    b.divisao,
    ROUND(AVG(a."Salario Bruto" - b."Total Desconto"), 2) AS media,
    MAX(a."Salario Bruto" - b."Total Desconto") AS maior
FROM 
    (
        SELECT 
            e.nome,
            SUM(COALESCE(v.valor, 0)) AS "Salario Bruto"
        FROM emp_venc AS ev
        LEFT JOIN vencimento AS v
            ON v.cod_venc = ev.cod_venc
        RIGHT JOIN empregado AS e
            ON ev.matr = e.matr
        GROUP BY e.nome
    ) AS a
LEFT JOIN 
    (
        SELECT 
            d.nome AS divisao,
            dp.nome AS departamento,
            e.nome,
            SUM(COALESCE(de.valor, 0)) AS "Total Desconto"
        FROM emp_desc AS ed
        LEFT JOIN desconto AS de
            ON ed.cod_desc = de.cod_desc
        RIGHT JOIN empregado AS e
            ON ed.matr = e.matr 
        LEFT JOIN departamento AS dp
            ON e.lotacao = dp.cod_dep
        LEFT JOIN divisao AS d
            ON e.lotacao_div = d.cod_divisao 
        GROUP BY e.nome, dp.nome, d.nome
    ) AS b
ON a.nome = b.nome 

GROUP BY b.divisao, b.departamento

ORDER BY media DESC;
