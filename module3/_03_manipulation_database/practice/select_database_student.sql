USE management_student;

SELECT* FROM student;
SELECT* FROM class;
SELECT* FROM student LEFT JOIN class ON student.class_id = class.class_id;
SELECT* FROM mark RIGHT JOIN student ON student.student_id = mark.student_id;
SELECT*FROM mark;
SELECT* FROM student WHERE stt=TRUE;

SELECT* FROM subjects;

SELECT* FROM subjects WHERE credit>5;

