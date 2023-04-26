--功能3
--录入一位学生一门课的成绩
--先录入一位学生，姓名为我自己，学号为2022999
INSERT
INTO Student(SNO, SName, Ssex, SBirth, MajorID, ClassID)
VALUES (2022999, '王振华', '男', '2002/1/7', 'CS001', '202201');


--录入一位学生一门课的成绩
INSERT
INTO StudentGrade(SNO, CourseID, Grade, IsResit)
VALUES (2022999, 'HA2113001', 100, '否');


--查询是否正确录入课程信息
SELECT *
FROM Student,StudentGrade
WHERE Student.SNO=StudentGrade.SNO and StudentGrade.SNO=2022999;


--删除插入的学生信息
--删除学生成绩
DELETE
FROM StudentGrade
WHERE SNO='2022999';

--删除录入学生
DELETE
FROM Student
WHERE SNO='2022999';