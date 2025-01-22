SELECT 
    name, 
    COUNT(name) AS matches,
    SUM(victories) AS victories,
    SUM(defeats) AS defeats,
    SUM(draws) AS draws,
    SUM(victories) * 3 + SUM(draws) AS score
FROM (
    SELECT 
        t2.name AS name, 
        m.team_1_goals, 
        m.team_2_goals,
        CASE
            WHEN m.team_1_goals < m.team_2_goals THEN 1
            ELSE 0
        END AS victories,
        CASE
            WHEN m.team_1_goals > m.team_2_goals THEN 1
            ELSE 0
        END AS defeats,
        CASE
            WHEN m.team_1_goals = m.team_2_goals THEN 1
            ELSE 0
        END AS draws
    FROM matches AS m
    LEFT JOIN teams AS t1 ON m.team_1 = t1.id
    LEFT JOIN teams AS t2 ON m.team_2 = t2.id

    UNION ALL

    SELECT 
        t1.name AS name, 
        m.team_1_goals, 
        m.team_2_goals,
        CASE
            WHEN m.team_1_goals > m.team_2_goals THEN 1
            ELSE 0
        END AS victories,
        CASE
            WHEN m.team_1_goals < m.team_2_goals THEN 1
            ELSE 0
        END AS defeats,
        CASE
            WHEN m.team_1_goals = m.team_2_goals THEN 1
            ELSE 0
        END AS draws
    FROM matches AS m
    LEFT JOIN teams AS t1 ON m.team_1 = t1.id
    LEFT JOIN teams AS t2 ON m.team_2 = t2.id
) AS tab
GROUP BY name
ORDER BY score DESC;
