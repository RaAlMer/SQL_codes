/*
https://www.hackerrank.com/challenges/sql-projects/problem
*/

--Tabla de proyectos
CREATE TABLE projects
    (task_id INT,
    start_date DATE,
    end_date DATE);
INSERT INTO projects
VALUES (1, '2015-10-01', '2015-10-02'),
       (2, '2015-10-02', '2015-10-03'),
       (3, '2015-10-03', '2015-10-04'),
       (4, '2015-10-13', '2015-10-14'),
       (5, '2015-10-14', '2015-10-15'),
       (6, '2015-10-28', '2015-10-29'),
       (7, '2015-10-30', '2015-10-31');

--Consulta para obtener las fechas de comienzo y fin de los distintos projectos por el número de días que dura cada proyecto en ordén ascendente.
--Si hay dos proyectos con el mismo número de días, estos se ordenan por fecha de comienzo.
SELECT p1.start_date, p2.end_date
FROM projects AS p1 
INNER JOIN projects AS p2
    ON DATEDIFF(p2.end_date, p1.start_date) = 
            (SELECT COUNT(*)
             FROM projects
             WHERE start_date >= p1.start_date
                 AND end_date <= p2.end_date
            )
        AND p1.start_date - 1 NOT IN (SELECT start_date 
                                      FROM projects)
        AND p2.end_date + 1 NOT IN (SELECT end_date 
                                    FROM projects)
ORDER BY DATEDIFF(p2.end_date, p1.start_date), p1.start_date
