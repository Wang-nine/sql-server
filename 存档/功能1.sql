--功能1
--录入一位学生，应包含学号、姓名、性别、出生年月、班级等信息
INSERT
INTO Student(SNO, SName, Ssex, SBirth, MajorID, ClassID)
VALUES (2022999, '王振华', '男', '2002/1/7', 'CS001', '202201');

--查询该学生是否被成功录入
SELECT *
FROM Student
WHERE SNO='2022999';

--删除录入学生
DELETE
FROM Student
WHERE SNO='2022999';