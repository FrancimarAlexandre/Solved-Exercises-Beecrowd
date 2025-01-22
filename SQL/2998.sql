SELECT
    A.NAME,
    A.INVESTMENT,
    B.MONTH_OF_PAYBACK,
    A.RETURN

FROM
    (SELECT
        B.NAME,
        B.INVESTMENT,
        A.MONTH,
        (A.RET - B.INVESTMENT) AS RETURN
    FROM
        (SELECT
            CLIENT_ID,
            MONTH,
            SUM(PROFIT) OVER(PARTITION BY CLIENT_ID ORDER BY MONTH) AS RET
        FROM OPERATIONS 
        GROUP BY CLIENT_ID, MONTH, PROFIT
        ORDER BY MONTH) AS A
    LEFT JOIN CLIENTS AS B
        ON A.CLIENT_ID = B.ID) AS A
INNER JOIN
    (SELECT
        A.NAME,
        MIN(A.MONTH) AS MONTH_OF_PAYBACK
    FROM
        (SELECT
            B.NAME,
            B.INVESTMENT,
            A.MONTH,
            (A.RET - B.INVESTMENT) AS RETURN
        FROM
            (SELECT
                CLIENT_ID,
                MONTH,
                SUM(PROFIT) OVER(PARTITION BY CLIENT_ID ORDER BY MONTH) AS RET
            FROM OPERATIONS 
            GROUP BY CLIENT_ID, MONTH, PROFIT
            ORDER BY MONTH) AS A
        LEFT JOIN CLIENTS AS B
            ON A.CLIENT_ID = B.ID) AS A
    WHERE A.RETURN >= 0 
    GROUP BY A.NAME) AS B
ON A.NAME = B.NAME AND A.MONTH = B.MONTH_OF_PAYBACK

ORDER BY A.RETURN DESC;
