/*
https://www.hackerrank.com/challenges/harry-potter-and-wands/problem
*/

SELECT w.id, p.age, w.coins_needed, w.power
FROM wands AS w
INNER JOIN wands_property AS p
ON w.code = p.code
WHERE p.is_evil = 0
GROUP BY p.age, w.power, w.id, w.coins_needed
HAVING w.coins_needed = (SELECT MIN(w1.coins_needed)
                        FROM wands AS w1
                        INNER JOIN wands_property AS p1
                        ON w1.code = p1.code
                        WHERE w1.power = w.power
                            AND p1.age = p.age)
ORDER BY w.power DESC, age DESC
;
