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
