--功能2
--按学号、姓名、专业三种方式查询学生基本信息
--先录入一位学生，姓名为我自己，学号为2022999
INSERT
INTO Student(SNO, SName, Ssex, SBirth, MajorID, ClassID)
VALUES (2022999, '王振华', '男', '2002/1/7', 'CS001', '202201');

--按照学号查询
SELECT *
FROM Student
WHERE SNO='2022999';

--按照姓名查询
SELECT *
FROM Student
WHERE SNO='2022999';

--按照专业查询
SELECT *
FROM Student
WHERE MajorID='CS001';

--删除录入学生
delete
FROM Student
WHERE SNO='2022999';