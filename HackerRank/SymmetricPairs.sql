/*
https://www.hackerrank.com/challenges/symmetric-pairs/problem
*/

-- Crea la tabla functions
CREATE TABLE functions
    (x INT,
    y INT);
INSERT INTO functions
VALUES (20, 20),
       (20, 20),
       (20, 21),
       (23, 22),
       (22, 23),
       (21, 20);

-- Consulta para obtener las parejas x, y que cumplen que x1 = y2 e y1 = x2. Ordenadas por x ascendente y donde x1 <= y1.
SELECT DISTINCT f1.x, f1.y
FROM functions AS f1
INNER JOIN functions AS f2
ON f1.x = f2.y
    AND f1.y = f2.x
GROUP BY f1.x, f1.y
HAVING COUNT(f1.x) > 1 OR f1.x <= f1.y
ORDER BY f1.x
;
