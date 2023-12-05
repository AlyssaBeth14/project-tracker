CREATE TABLE students (
    github VARCHAR(30) PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30)
);

INSERT INTO students
(github, first_name, last_name)
VALUES 
('jhacks', 'Jane', 'Hacker'),
('sdevelops', 'Sarah', 'Developer');

SELECT last_name FROM students;

SELECT github, first_name FROM students;

SELECT * FROM students WHERE first_name = 'Sarah';

SELECT * FROM students WHERE github = 'sdevelops';

SELECT first_name, last_name FROM students WHERE github = 'jhacks';

CREATE TABLE projects (
    title VARCHAR(30) PRIMARY KEY,
    description TEXT,
    max_grade INTEGER
);

INSERT INTO projects
(title, description, max_grade)
VALUES
('Markov', 'Tweets generated from Markov chains', 50),
('Blockly', 'Programmatic Logic Puzzle Game', 100);

INSERT INTO projects
(title, description, max_grade)
VALUES
('Bluey', 'An analysis of blue cones', 75),
('Finders Keepers', 'A Locating Game', 90),
('What Do', 'A filter for noxious messages', 100);

SELECT title, max_grade FROM projects WHERE max_grade > 50;

SELECT title, max_grade FROM projects WHERE max_grade > 10 AND max_grade <60;

SELECT title, max_grade FROM projects WHERE max_grade > 75 OR max_grade < 25;

SELECT * FROM projects ORDER BY max_grade;

CREATE TABLE grades (
id SERIAL PRIMARY KEY,
student_github VARCHAR(30) REFERENCES students(github),
project_title VARCHAR(30) REFERENCES projects(title),
grade INT
);

INSERT INTO grades
(student_github, project_title, grade)
VALUES
('jhacks', 'Markov', 10),
('jhacks', 'Blockly', 2),
('sdevelops', 'Markov', 50),
('sdevelops', 'Blockly', 100);


INSERT INTO grades
(student_github, project_title, grade)
VALUES
('jhacks', 'What Do', 15),
('jhacks', 'Finders Keepers', 20),
('sdevelops', 'What Do', 50),
('sdevelops', 'Bluey', 70);

SELECT first_name, last_name 
FROM students
WHERE github = 'jhacks';

SELECT project_title, grade
FROM grades
WHERE student_github = 'jhacks';

SELECT title, max_grade
FROM projects;

SELECT *
FROM students
JOIN grades ON (students.github = grades.student_github);

SELECT students.first_name, students.last_name, grades.project_title, grades.grade
FROM students
JOIN grades ON (students.github = grades.student_github);

SELECT *
FROM students
  JOIN grades ON (students.github = grades.student_github)
  JOIN projects ON (grades.project_title = projects.title)
  WHERE github = 'jhacks';

SELECT students.first_name, students.last_name, grades.project_title, grades.grade, projects.max_grade
FROM students
  JOIN grades ON (students.github = grades.student_github)
  JOIN projects ON (grades.project_title = projects.title);
