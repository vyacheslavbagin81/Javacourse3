CREATE
DATABASE skypro;
\c
skypro;
CREATE TABLE employee
(
    id         BIGSERIAL   NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name  VARCHAR(50) NOT NULL,
    gender     VARCHAR(6)  NOT NULL,
    age        INT         NOT NULL
);
INSERT INTO employee(first_name, last_name, gender, age)
VALUES ('Иван', 'Иванов', 'муж', 33);
INSERT INTO employee(first_name, last_name, gender, age)
VALUES ('Альбина', 'Андропова', 'жен', 23);
INSERT INTO employee(first_name, last_name, gender, age)
VALUES ('Кирил', 'Кирилов', 'муж', 28);

SELECT *
FROM employee;

UPDATE employee
SET first_name = 'Петр',
    last_name  = 'Петров',
    age        = 38
WHERE id = 1;

SELECT *
FROM employee;

DELETE
FROM employee
WHERE id = 1;

SELECT *
FROM employee;

INSERT INTO employee(first_name, last_name, gender, age)
VALUES ('Иван', 'Иванов', 'муж', 33);
INSERT INTO employee(first_name, last_name, gender, age)
VALUES ('Марина', 'Маринина', 'жен', 20);
INSERT INTO employee(first_name, last_name, gender, age)
VALUES ('Петр', 'Петров', 'муж', 38);

SELECT first_name AS Имя, last_name AS Фамилия
FROM employee;

SELECT *
FROM employee
WHERE age < 30
   OR age > 50;

SELECT *
FROM employee
WHERE age BETWEEN 30
          AND 50;

SELECT *
FROM employee
ORDER BY last_name DESC;

SELECT first_name AS Имя, last_name AS Фамилия
FROM employee
WHERE char_length(first_name) > 4;

UPDATE employee
SET first_name = 'Петр'
WHERE id = 4;

UPDATE employee
SET first_name = 'Марина'
WHERE id = 2;

SELECT first_name, SUM(age)
FROM employee
GROUP BY first_name;

SELECT first_name, MIN(age)
FROM employee
GROUP BY first_name;

WITH Dubl AS (SELECT first_name, COUNT(age) AS COUNT
FROM employee
GROUP BY first_name
HAVING COUNT (*) > 1)
SELECT first_name, MIN(age)
FROM employee
GROUP BY first_name
HAVING first_name IN (SELECT first_name FROM Dubl);

CREATE TABLE citi
(
    citi_id   BIGSERIAL   NOT NULL PRIMARY KEY,
    citi_name VARCHAR(60) NOT NULL
);

INSERT INTO citi (citi_name)
VALUES ('Москва');
INSERT INTO citi (citi_name)
VALUES ('Казань');
INSERT INTO citi (citi_name)
VALUES ('Волгоград');
INSERT INTO citi (citi_name)
VALUES ('Псков');

ALTER TABLE employee
    ADD COLUMN citi_id INT REFERENCES citi (citi_id);

UPDATE employee
SET citi_id = 1
WHERE id = 2;
UPDATE employee
SET citi_id = 1
WHERE id = 3;
UPDATE employee
SET citi_id = 2
WHERE id = 4;
UPDATE employee
SET citi_id = 3
WHERE id = 5;
UPDATE employee
SET citi_id = 5
WHERE id = 6;

SELECT employee.first_name, employee.last_name, citi.citi_name
FROM employee
         INNER JOIN citi
                    ON employee.id = citi.citi_id;

SELECT citi.citi_name, employee.first_name, employee.last_name
FROM employee
         RIGHT JOIN citi
                    ON employee.id = citi.citi_id;

SELECT employee.first_name, employee.last_name, citi.citi_name
FROM employee
         FULL JOIN citi
                   ON employee.id = citi.citi_id;

SELECT employee.first_name, citi.citi_name
FROM employee
         CROSS JOIN citi
    ON employee.id = citi.citi_id;

SELECT citi_name FROM citi
WHERE NOT EXISTS(SELECT citi_id
    FROM employee
    WHERE citi.citi_id = employee.citi_id);