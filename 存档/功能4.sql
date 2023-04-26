--功能4
--查询一位学生所修的课程、性质（必修或选修）、学期、学分及成绩；
--从视图查询较为方便
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
	StudentInfo.SNO = '2022001' AND
	StudentInfo.CourseID = CourseInfo.CourseID AND
	StudentInfo.MajorID = CourseInfo.MajorID;


--查询他的必修课平均成绩、所有课程平均成绩（平均成绩应按学分加权）
--必修课平均成绩
SELECT
	SNO,
	SName,
	CONVERT(DECIMAL(10, 2), SUM(Grade*CourseCredit)*1.0/SUM(CourseCredit)) '必修课平均成绩'
FROM
	StudentInfo, CourseInfo
WHERE
	StudentInfo.SNO = '2022001' AND
	CourseNature = '必修' AND
	StudentInfo.CourseID = CourseInfo.CourseID AND
	StudentInfo.MajorID = CourseInfo.MajorID
GROUP BY SNO, SName;

--所有课程平均成绩
SELECT
	SNO,
	SName,
	CONVERT(DECIMAL(10, 2), SUM(Grade*CourseCredit)*1.0/SUM(CourseCredit)) '平均成绩'
FROM
	StudentInfo, CourseInfo
WHERE
	StudentInfo.SNO = '2022001' AND
	StudentInfo.CourseID = CourseInfo.CourseID AND
	StudentInfo.MajorID = CourseInfo.MajorID
GROUP BY SNO, SName;