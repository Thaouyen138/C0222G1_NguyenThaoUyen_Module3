USE management_student;

SELECT * FROM student;
SELECT * FROM mark;


SELECT s.student_id, s.student_name, avg(mark) FROM mark m
JOIN student s on s.student_id = m.student_id
GROUP BY s.student_id, s.student_name;

SELECT s.student_id, s.student_name, avg(mark) FROM mark m
JOIN student s on s.student_id = m.student_id
GROUP BY s.student_id, s.student_name
HAVING AVG(mark)<15;

SELECT s.student_id, s.student_name, avg(mark) FROM mark m
JOIN student s on s.student_id = m.student_id
GROUP BY s.student_id, s.student_name
HAVING AVG(mark) >= ALL (SELECT AVG(mark) FROM mark GROUP BY mark.student_id);