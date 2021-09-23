/*
https://www.hackerrank.com/challenges/interviews/problem
*/

-- Tabla contests
CREATE TABLE contests (contest_id INT, 
                       hacker_id INT, 
                       name VARCHAR(200));
INSERT INTO contests (contest_id, hacker_id, name) 
VALUES (66406, 17973, 'Rose');
INSERT INTO contests (contest_id, hacker_id, name) 
VALUES (66556, 79153, 'Angela');
INSERT INTO contests (contest_id, hacker_id, name) 
VALUES (94828, 80275, 'Frank');

-- Tabla colleges
CREATE TABLE colleges(college_id INT, 
                      contest_id INT );
INSERT INTO colleges (college_id, contest_id) 
VALUES (11219, 66406);
INSERT INTO colleges (college_id, contest_id)
VALUES (32473, 66556); 
INSERT INTO colleges (college_id, contest_id)
VALUES (56685, 94828);

-- Tabla challenges
CREATE TABLE challenges (challenge_id INT, 
                         college_id INT );
INSERT INTO challenges (challenge_id, college_id) 
VALUES (18765, 11219); 
INSERT INTO challenges (challenge_id, college_id)
VALUES (47127, 11219);
INSERT INTO challenges (challenge_id, college_id) 
VALUES (60292, 32473); 
INSERT INTO challenges (challenge_id, college_id) 
VALUES (72974, 56685);

-- Tabla view_stats
CREATE TABLE view_stats (challenge_id INT,
                         total_views INT, 
                         total_unique_views INT );
INSERT INTO view_stats (challenge_id, total_views, total_unique_views) 
VALUES (47127, 26, 19); 
INSERT INTO view_stats (challenge_id, total_views, total_unique_views) 
VALUES (47127, 15, 14);
INSERT INTO view_stats (challenge_id, total_views, total_unique_views) 
VALUES (18765, 43, 10); 
INSERT INTO view_stats (challenge_id, total_views, total_unique_views) 
VALUES (18765, 72, 13); 
INSERT INTO view_stats (challenge_id, total_views, total_unique_views) 
VALUES (75516, 35, 17); 
INSERT INTO view_stats (challenge_id, total_views, total_unique_views) 
VALUES (60292, 11, 10); 
INSERT INTO view_stats (challenge_id, total_views, total_unique_views) 
VALUES (72974, 41, 15);
INSERT INTO view_stats (challenge_id, total_views, total_unique_views) 
VALUES (75516, 75, 11);

-- Tabla submission_stats
CREATE TABLE submission_stats (challenge_id INT, 
                               total_submissions INT, 
                               total_accepted_submissions INT );
INSERT INTO submission_stats (challenge_id, total_submissions, total_accepted_submissions) 
VALUES (75516, 34, 12); 
INSERT INTO submission_stats (challenge_id, total_submissions, total_accepted_submissions)
VALUES (47127, 27, 10);
INSERT INTO submission_stats (challenge_id, total_submissions, total_accepted_submissions)
VALUES (47127, 56, 18);
INSERT INTO submission_stats (challenge_id, total_submissions, total_accepted_submissions)
VALUES (75516, 74, 12); 
INSERT INTO submission_stats (challenge_id, total_submissions, total_accepted_submissions)
VALUES (75516, 83, 8);
INSERT INTO submission_stats (challenge_id, total_submissions, total_accepted_submissions)
VALUES (72974, 68, 24); 
INSERT INTO submission_stats (challenge_id, total_submissions, total_accepted_submissions)
VALUES (72974, 82, 14);
INSERT INTO submission_stats (challenge_id, total_submissions, total_accepted_submissions)
VALUES (47127, 28, 11);
       
-- Consulta para obtener el ID del contest, del hacker y su nombre, la suma de total_submissions, total_accepted_submissions, total_views y total_unique_views
-- para cada contest ordenado por el ID del contest, y excluyendo cuando la suma de las 4 sumas es 0.
SELECT c.contest_id, c.hacker_id, c.name, SUM(total_submissions), SUM(total_accepted_submissions), SUM(total_views), SUM(total_unique_views)
FROM contests AS c 
INNER JOIN colleges AS c1 
ON c.contest_id = c1.contest_id 
INNER JOIN challenges AS c2 
ON  c1.college_id = c2.college_id 
LEFT JOIN (SELECT challenge_id, SUM(total_views) AS total_views, SUM(total_unique_views) AS total_unique_views
		       FROM view_stats 
		       GROUP BY challenge_id) AS vs 
ON c2.challenge_id = vs.challenge_id 
LEFT JOIN (SELECT challenge_id, SUM(total_submissions) AS total_submissions, SUM(total_accepted_submissions) AS total_accepted_submissions 
           FROM submission_stats 
           GROUP BY challenge_id) AS ss 
ON c2.challenge_id = ss.challenge_id
GROUP BY c.contest_id, c.hacker_id, c.name
HAVING SUM(total_submissions)!=0 
OR SUM(total_accepted_submissions)!=0 
OR SUM(total_views)!=0 
OR SUM(total_unique_views)!=0
ORDER BY c.contest_id;
