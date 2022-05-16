USE management_student;

SELECT * FROM student;
SELECT * FROM student WHERE student_name LIKE 'h%';

SELECT * FROM class;
SELECT * FROM class WHERE month(start_date) = 12;

SELECT * FROM subjects;
SELECT * FROM subjects WHERE credit BETWEEN 3 AND 5;

UPDATE student SET class_id = 2 WHERE student_name='Hung';

SELECT * FROM mark;
SELECT student_id,sub_id,mark FROM mark ORDER BY mark;
