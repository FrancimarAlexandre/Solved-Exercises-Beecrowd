SELECT
    b.departamento AS "Nome Departamento",
    COUNT(a.nome) AS "Numero de Empregados",
    ROUND(AVG(a."Salario Bruto" - b."Total Desconto"), 2) AS "Media Salarial",
    MAX(a."Salario Bruto" - b."Total Desconto") AS "Maior Salario",
    MIN(a."Salario Bruto" - b."Total Desconto") AS "Menor Salario"
FROM
    (
        SELECT
            c.nome,
            SUM(COALESCE(v.valor, 0)) AS "Salario Bruto"
        FROM emp_venc AS ev
        LEFT JOIN vencimento AS v
            ON v.cod_venc = ev.cod_venc
        RIGHT JOIN empregado AS c
            ON ev.matr = c.matr
        GROUP BY c.nome
    ) AS a
LEFT JOIN
    (
        SELECT
            d.nome AS departamento,
            c.nome,
            SUM(COALESCE(de.valor, 0)) AS "Total Desconto"
        FROM emp_desc AS ed
        LEFT JOIN desconto AS de
            ON ed.cod_desc = de.cod_desc
        RIGHT JOIN empregado AS c
            ON ed.matr = c.matr
        LEFT JOIN departamento AS d
            ON c.lotacao = d.cod_dep
        GROUP BY c.nome, departamento
    ) AS b
    ON a.nome = b.nome
GROUP BY b.departamento
ORDER BY "Media Salarial" DESC;
