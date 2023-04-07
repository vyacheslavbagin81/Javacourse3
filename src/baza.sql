CREATE DATABASE skypro;
\c skypro;
CREATE TABLE employee(
                         id BIGSERIAL NOT NULL PRIMARY KEY,
                         first_name VARCHAR(50) NOT NULL,
                         last_name VARCHAR(50) NOT NULL,
                         gender VARCHAR(6) NOT NULL,
                         age INT NOT NULL
);
INSERT INTO employee(
    first_name, last_name, gender, age
) VALUES ('Иван', 'Иванов','муж',33);
INSERT INTO employee(
    first_name, last_name, gender, age
) VALUES ('Альбина', 'Андропова','жен',23);
INSERT INTO employee(
    first_name, last_name, gender, age
) VALUES ('Кирил', 'Кирилов','муж',28);

SELECT * FROM employee;

UPDATE employee SET first_name = 'Петр',
                    last_name = 'Петров',
                    age = 38
WHERE id = 1;

SELECT * FROM employee;

DELETE FROM employee WHERE id = 1;

SELECT * FROM employee;