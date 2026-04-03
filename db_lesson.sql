CREATE TABLE departments (
  department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

 INSERT INTO departments (name) 
 VALUES 
 ('営業'),
 ('開発'),
 ('経理'),
 ('人事'),
 ('情報システム');

INSERT INTO people(name, email, department_id, age, gender)
VALUES
 ('田苗ゆう', 'tanae@gizumo.jp', 2, 35, 1),
 ('角田だいき', 'kakuta@gizumo.jp', 2, 45, 1),
 ('花はな', 'hana@gizumo.jp', 2, 30, 2),
 ('むつてつお', 'mutu@gizumo.jp', 2, 40, 1),
 ('道玄さか', 'dougen@gizumo.jp', 5, 50, 1);

INSERT INTO reports(person_id,content)
VALUES
(4,'db_lesson_日報'),
(12,'git_lesson_日報'),
(13,'pc_lesson_日報'),
(14,'HTML_lesson_日報'),
(15,'CSS_lesson_日報'),
(1,'JS_lesson_日報'),
(2,'sass_lesson_日報'),
(3,'react_lesson_日報'),
(7,'jQuery_lesson_日報'),
(9,'PHP_lesson_日報');

DELETE FROM reports WHERE report_id =1;

UPDATE people SET department_id = 1 WHERE person_id = 2;

-- Q5
SELECT * FROM people 
WHERE gender = 1
ORDER BY age DESC;

-- -- Q6
-- SELECT
--   `name`, `email`, `age`
--   カラム名name,email,ageのレコードを取得する
-- FROM
--   `people`
--   peopleというテーブルから
-- WHERE
--   `department_id` = 1
--   カラム名department_idが1のレコードを
-- ORDER BY
--   `created_at`;
--   created_atのレコードを昇順で

-- Q7
SELECT name FROM people
 WHERE
  age BETWEEN 20 AND 29 AND gender = 2 
 OR
  age BETWEEN 40 AND 49 AND gender = 1;

-- Q8
SELECT * FROM people 
WHERE department_id = 1
ORDER BY age ASC;

-- Q9
SELECT AVG(age) AS average_age FROM people
WHERE department_id = 2 AND gender = 2;

-- Q10
SELECT
  people.name, people.department_id, content
FROM
  people
INNER JOIN
  reports ON
 people.person_id = reports.person_id
INNER JOIN 
 departments ON
 people.department_id = departments.department_id;

Q11
SELECT 
 name, content
FROM 
 people 
LEFT JOIN
 reports ON 
 people.person_id = reports.person_id
 WHERE reports.person_id IS NULL; 
 
