/*
https://www.hackerrank.com/challenges/contest-leaderboard/problem
*/

CREATE TABLE hackers (
    hacker_id INT,
    name      VARCHAR(50)
);

CREATE TABLE submissions (
    submission_id INT,
    hacker_id     INT,
    challenge_id  INT,
    score         INT
);

INSERT INTO hackers (
    hacker_id,
    name
)
VALUES
    (
        4071,
        'Rose'
    ),
    (
        4806,
        'Angela'
    ),
    (
        26071,
        'Frank'
    ),
    (
        49438,
        'Patrick'
    ),
    (
        74842,
        'Lisa'
    ),
    (
        80305,
        'Kimberly'
    ),
    (
        84072,
        'Bonnie'
    );
 
 INSERT INTO submissions (
    submission_id,
    hacker_id,
    challenge_id,
    score
)
VALUES
    (
        67194,
        74842,
        63132,
        76
    ),
    (
        64479,
        74842,
        19797,
        98
    ),
    (
        40742,
        26071,
        49593,
        20
    ),
    (
        17513,
        4806,
        49593,
        32
    ),
    (
        69846,
        80305,
        19797,
        19
    ),
    (
        41002,
        26071,
        89343,
        36
    ),
    (
        52826,
        49438,
        49593,
        9
    );
    
SELECT h.hacker_id, h.name, SUM(max_score.m_score)
FROM hackers AS h
INNER JOIN (SELECT s.hacker_id, MAX(s.score) AS m_score
            FROM submissions AS s
            GROUP BY s.hacker_id, s.challenge_id
            ) AS max_score
ON h.hacker_id = max_score.hacker_id
GROUP BY h.hacker_id, h.name
HAVING SUM(max_score.m_score) > 0
ORDER BY SUM(max_score.m_score) DESC, h.hacker_id ASC
;
