/*
https://www.hackerrank.com/challenges/challenges/problem
*/

SELECT c.hacker_id, h.name, COUNT(c.challenge_id) AS c_count
FROM hackers AS h
INNER JOIN challenges AS c
ON h.hacker_id = c.hacker_id
GROUP BY c.hacker_id, h.name
HAVING c_count = (SELECT MAX(cc1.cnt)
                  FROM (
                        SELECT COUNT(hacker_id) AS cnt
                        FROM challenges
                        GROUP BY hacker_id
                        ORDER BY hacker_id) AS cc1)
OR c_count IN (SELECT cc2.cnt
               FROM (SELECT COUNT(*) AS cnt
                    FROM challenges
                    GROUP BY hacker_id) AS cc2
               GROUP BY cc2.cnt
               HAVING COUNT(cc2.cnt) = 1)
ORDER BY c_count DESC, c.hacker_id
;
