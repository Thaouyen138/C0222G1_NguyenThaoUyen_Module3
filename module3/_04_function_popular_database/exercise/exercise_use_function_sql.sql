USE management_student;

SELECT * FROM subjects s
WHERE  credit =  (SELECT MAX(credit) FROM subjects s);

SELECT s.sub_id,s.sub_name,s.credit,s.stt FROM mark m
JOIN subjects s on s.sub_id=m.sub_id
WHERE mark=(SELECT MAX(mark) FROM mark);

SELECT * FROM student;

SELECT s.student_id, s.student_name , m.mark FROM mark m
JOIN student s ON s.student_id=m.student_id  ORDER BY mark DESC;