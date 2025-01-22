SELECT
    A.departamento,
    B.divisao,
    A.media
FROM
    (
        SELECT
            A.departamento,
            MAX(A.media) AS media
        FROM
            (
                SELECT
                    B.departamento,
                    B.divisao,
                    ROUND(AVG(A."Salario Bruto" - B."Total Desconto"), 2) AS media
                FROM
                    (
                        SELECT
                            C.nome,
                            SUM(COALESCE(B.valor, 0)) AS "Salario Bruto"
                        FROM
                            emp_venc AS A
                        LEFT JOIN
                            vencimento AS B ON B.cod_venc = A.cod_venc
                        RIGHT JOIN
                            empregado AS C ON A.matr = C.matr
                        GROUP BY
                            C.nome
                    ) AS A
                LEFT JOIN
                    (
                        SELECT
                            E.nome AS divisao,
                            D.nome AS departamento,
                            C.nome,
                            SUM(COALESCE(B.valor, 0)) AS "Total Desconto"
                        FROM
                            emp_desc AS A
                        LEFT JOIN
                            desconto AS B ON A.cod_desc = B.cod_desc
                        RIGHT JOIN
                            empregado AS C ON A.matr = C.matr
                        LEFT JOIN
                            departamento AS D ON C.lotacao = D.cod_dep
                        LEFT JOIN
                            divisao AS E ON C.lotacao_div = E.cod_divisao
                        GROUP BY
                            C.nome, departamento, divisao
                    ) AS B
                ON
                    A.nome = B.nome
                GROUP BY
                    B.divisao, B.departamento
                ORDER BY
                    media DESC
            ) AS A
        GROUP BY
            A.departamento
        ORDER BY
            media DESC
    ) AS A
INNER JOIN
    (
        SELECT
            B.departamento,
            B.divisao,
            ROUND(AVG(A."Salario Bruto" - B."Total Desconto"), 2) AS media
        FROM
            (
                SELECT
                    C.nome,
                    SUM(COALESCE(B.valor, 0)) AS "Salario Bruto"
                FROM
                    emp_venc AS A
                LEFT JOIN
                    vencimento AS B ON B.cod_venc = A.cod_venc
                RIGHT JOIN
                    empregado AS C ON A.matr = C.matr
                GROUP BY
                    C.nome
            ) AS A
        LEFT JOIN
            (
                SELECT
                    E.nome AS divisao,
                    D.nome AS departamento,
                    C.nome,
                    SUM(COALESCE(B.valor, 0)) AS "Total Desconto"
                FROM
                    emp_desc AS A
                LEFT JOIN
                    desconto AS B ON A.cod_desc = B.cod_desc
                RIGHT JOIN
                    empregado AS C ON A.matr = C.matr
                LEFT JOIN
                    departamento AS D ON C.lotacao = D.cod_dep
                LEFT JOIN
                    divisao AS E ON C.lotacao_div = E.cod_divisao
                GROUP BY
                    C.nome, departamento, divisao
            ) AS B
        ON
            A.nome = B.nome
        GROUP BY
            B.divisao, B.departamento
        ORDER BY
            media DESC
    ) AS B
ON
    A.media = B.media;
