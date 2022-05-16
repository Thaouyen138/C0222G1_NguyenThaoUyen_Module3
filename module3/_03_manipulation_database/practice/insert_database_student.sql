USE management_student;

INSERT INTO class
VALUES 
(1, 'A1', '2008-12-20', 1),
(2, 'A2', '2008-12-22', 1),
(3, 'B3', current_date, 0);

INSERT INTO student
VALUES
(1,'Hung', '0912113113', 1, 1),
(2,'Hoa',0123123233, 1, 1),
(3,'Manh', '0123123123', 0, 2);

INSERT INTO subjects
VALUES 
(1, 'CF', 5, 1),
(2, 'C', 6, 1),
(3, 'HDJ', 5, 1),
(4, 'RDBMS', 10, 1);

INSERT INTO mark
VALUES
(1,4, 1, 8, 1),
(2,2, 2, 10, 1),
(3,1, 1, 12, 1);