CREATE DATABASE management_student;

USE management_student;

CREATE TABLE class
(
	class_id INT 					NOT NULL AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(60)	 		NOT NULL,
    start_date DATETIME				NOT NULL,
    stt BIT DEFAULT 1
);

CREATE TABLE student
(
	student_id 	 INT 				NOT NULL AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(30)		NOT NULL,
    phone 		 VARCHAR(50),
    stt			 BIT DEFAULT 1,
    class_id	 INT 				NOT NULL,
    FOREIGN KEY(class_id) REFERENCES class(class_id)
);

CREATE TABLE subjects (
    sub_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_name VARCHAR(30) NOT NULL,
    credit TINYINT NOT NULL DEFAULT '1',
    CHECK (credit >= 1),
    stt BIT DEFAULT 1
);
    
CREATE TABLE mark(
	mark_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_id INT NOT NULL UNIQUE KEY,
    student_id INT NOT NULL UNIQUE KEY,
    mark FLOAT DEFAULT"0",
    CHECK(0<mark >100),
    exam_times TINYINT DEFAULT "1",
    FOREIGN KEY(sub_id) REFERENCES subjects(sub_id),
    FOREIGN KEY(student_id) REFERENCES student(student_id)
);