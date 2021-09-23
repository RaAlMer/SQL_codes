/*
https://www.hackerrank.com/challenges/15-days-of-learning-sql/problem
*/

-- Tabla donde se encuentran las tareas enviadas por los hackers
CREATE TABLE submissions (submission_date date, submission_id integer, hacker_id integer, score integer);
INSERT INTO "submissions" VALUES('2016-03-01',8494,20703,0);
INSERT INTO "submissions" VALUES('2016-03-01',22403,53473,15);
INSERT INTO "submissions" VALUES('2016-03-01',23965,79722,60);
INSERT INTO "submissions" VALUES('2016-03-01',30173,36396,70);
INSERT INTO "submissions" VALUES('2016-03-02',34928,20703,0);
INSERT INTO "submissions" VALUES('2016-03-02',38740,15758,60);
INSERT INTO "submissions" VALUES('2016-03-02',42769,79722,60);
INSERT INTO "submissions" VALUES('2016-03-02',44364,79722,60);
INSERT INTO "submissions" VALUES('2016-03-03',45440,20703,0);
INSERT INTO "submissions" VALUES('2016-03-03',49050,36396,70);
INSERT INTO "submissions" VALUES('2016-03-03',50273,79722,5);
INSERT INTO "submissions" VALUES('2016-03-04',50344,20703,0);
INSERT INTO "submissions" VALUES('2016-03-04',51360,44065,90);
INSERT INTO "submissions" VALUES('2016-03-04',54404,53473,65);
INSERT INTO "submissions" VALUES('2016-03-04',61533,79722,45);
INSERT INTO "submissions" VALUES('2016-03-05',72852,20703,0);
INSERT INTO "submissions" VALUES('2016-03-05',74546,38289,0);
INSERT INTO "submissions" VALUES('2016-03-05',76487,62529,0);
INSERT INTO "submissions" VALUES('2016-03-05',82439,36396,10);
INSERT INTO "submissions" VALUES('2016-03-05',9006,36396,40);
INSERT INTO "submissions" VALUES('2016-03-06',90404,20703,0);

-- Tabla con las IDs y nombres de los hackers
CREATE TABLE hackers (hacker_id integer, name string);
INSERT INTO "hackers" VALUES(15758,'Rose');
INSERT INTO "hackers" VALUES(20703,'Angela');
INSERT INTO "hackers" VALUES(36396,'Frank');
INSERT INTO "hackers" VALUES(38289,'Patrick');
INSERT INTO "hackers" VALUES(44065,'Lisa');
INSERT INTO "hackers" VALUES(53473,'Kimberly');
INSERT INTO "hackers" VALUES(62529,'Bonnie');
INSERT INTO "hackers" VALUES(79722,'Michael');

-- Consulta para encontrar para cada fecha de un ejercicio, cuantos hackers mandaron un ejercicio cada día, el ID dek hacker que más ejercicios envío ese día y su nombre
SELECT submission_date , (SELECT COUNT(DISTINCT hacker_id)  
                          FROM submissions s2  
                          WHERE s2.submission_date = s1.submission_date 
                          AND (SELECT COUNT(DISTINCT s3.submission_date) 
                               FROM submissions s3 
                               WHERE s3.hacker_id = s2.hacker_id 
                               AND s3.submission_date < s1.submission_date) = dateDIFF(s1.submission_date , '2016-03-01')),
                         (SELECT hacker_id 
                          FROM submissions s2 
                          WHERE s2.submission_date = s1.submission_date 
                          GROUP BY hacker_id 
                          ORDER BY COUNT(submission_id) DESC, hacker_id 
                          LIMIT 1) AS id_n,
                         (SELECT name 
                          FROM hackers 
                          WHERE hacker_id = id_n)
FROM (SELECT DISTINCT submission_date 
      FROM submissions) AS s1
GROUP BY submission_date
;
