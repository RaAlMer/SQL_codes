/*
https://www.hackerrank.com/challenges/placements/problem
*/

-- Crear tabla students
CREATE TABLE students
    (id INT,
    name VARCHAR(50));
INSERT INTO students
VALUES (1, 'Ashley'),
       (2, 'Samantha'),
       (3, 'Elisa'),
       (4, 'Scarlet');

-- Crear tabla friends
CREATE TABLE friends
    (id INT,
    friend_id INT);
INSERT INTO friends
VALUES (1,2),
       (2,3),
       (3,4),
       (4,1);

-- Crear tabla packages
CREATE TABLE packages
    (id INT,
    salary FLOAT(4,2));
INSERT INTO packages
VALUES (1, 15.20),
       (2, 10.06),
       (3, 11.55),
       (4, 12.12);

-- Consulta para obtener los nombres de los estudiantes cuyos mejores amigos tienen mayor salario que ellos, ordenados por el salario de sus mejores amigos
SELECT s.name
FROM students AS s
INNER JOIN friends AS f
ON s.id = f.id
INNER JOIN packages AS p1
ON s.id = p1.id
INNER JOIN packages AS p2
ON f.friend_id = p2.id
WHERE p2.salary > p1.salary
ORDER BY p2.salary
;
