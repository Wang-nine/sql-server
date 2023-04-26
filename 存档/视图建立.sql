GO
--建立学生信息视图，便于查看以及搜索
CREATE VIEW StudentInfo
AS 
SELECT DISTINCT 
	Student.SNO,
	SName,
	MajorID,
	ClassID,
	CourseID,
	Grade,
	IsResit
FROM
	Student, StudentGrade
WHERE
	Student.SNO = StudentGrade.SNO;
GO



GO
--建立课程信息视图，便于查看以及搜索
CREATE VIEW CourseInfo
AS 
SELECT DISTINCT
	Rules.MajorID,
	Course.CourseID,
	CourseName,
	CourseNature,
	CourseSchedule,
	CourseCredit
FROM
	Course, Rules
WHERE
	Course.CourseID = Rules.CourseID;
GO



GO
--建立教师信息视图
--可以直接查询老师教学哪些班级哪些课
CREATE VIEW TeacherInfo
AS 
SELECT DISTINCT 
	Teacher.TeacherID,
	TeacherName,
	ClassID
	CourseID,
	CourseName
FROM
	Teacher, Teach, Course
WHERE
	Teach.TeacherID = Teacher.TeacherID AND
	Teach.CourseID = Course.CourseID;
GO



GO
--建立学生选课信息视图，较为全面，即学生的成绩单
--此视图基于学生信息视图建立
CREATE VIEW Transcript
AS
SELECT
	SNO,
	SName, 
	CourseName, 
	CourseNature, 
	CourseSchedule,
	CourseCredit, 
	Grade,
	IsResit
FROM 
	StudentInfo, CourseInfo
WHERE
	StudentInfo.CourseID = CourseInfo.CourseID AND
	StudentInfo.MajorID = CourseInfo.MajorID;
GO



GO
--建立学生必修课挂科视图
--便于查询
CREATE VIEW RequiredCredit
AS
SELECT
	SNO,
	SName,
	SUM(CourseCredit) 'RequiredFail'
FROM 
	Transcript
WHERE
	CourseNature = '必修' AND
	IsResit = '是' AND
	Grade < 60
GROUP BY SNO, SName;
GO



GO
--建立学生选修课挂科视图
--便于查询
CREATE VIEW ElectiveCredit
AS
SELECT
	SNO,
	SName,
	SUM(CourseCredit) 'ElectiveFail'
FROM 
	Transcript
WHERE
	CourseNature = '选修' AND
	IsResit = '是' AND
	Grade < 60
GROUP BY SNO, SName;
GO