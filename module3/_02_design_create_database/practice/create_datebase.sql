CREATE DATABASE management_test_score;

USE management_test_score;

CREATE TABLE student(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name_student VARCHAR(50),
	date_of_birth DATE, 
	class VARCHAR(50),
	gt VARCHAR(50)
);

CREATE TABLE subjects(
id_subject INT AUTO_INCREMENT PRIMARY KEY,
name_subject VARCHAR(50)
);

CREATE TABLE points(
id INT,
id_subject INT,
score_test INT, 
date_test DATE
);

CREATE TABLE teacher(
id_teacher INT AUTO_INCREMENT PRIMARY KEY,
name_teacher VARCHAR(20),
phone VARCHAR(13)
);

ALTER TABLE subjects ADD id_teacher INT;
ALTER TABLE subjects ADD CONSTRAINT FK_idteacher FOREIGN KEY(id_teacher) REFERENCES teacher(id_teacher);